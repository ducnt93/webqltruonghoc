using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using System.Transactions;
using System.Data.Common;


namespace QLTHPT1.DataAccess
{
    public class SqlHelper
    {

        public SqlHelper()
        {
        }

        #region private methods
        private static object CheckValue(object value)
        {
            if (value == null)
            {
                return DBNull.Value;
            }
            return value;
        }
        private static SqlConnection GetTransactionSqlConnection(string connectionString)
        {
            LocalDataStoreSlot namedDataSlot = Thread.GetNamedDataSlot("ConnectionDictionary");
            Dictionary<string, SqlConnection> data = (Dictionary<string, SqlConnection>)Thread.GetData(namedDataSlot);
            if (data == null)
            {
                data = new Dictionary<string, SqlConnection>();
                Thread.SetData(namedDataSlot, data);
            }
            SqlConnection connection = null;
            if (data.ContainsKey(connectionString))
            {
                return data[connectionString];
            }
            connection = new SqlConnection(connectionString);
            data.Add(connectionString, connection);
            Transaction.Current.TransactionCompleted += new TransactionCompletedEventHandler(Current_TransactionCompleted);
            return connection;
        }
        private static void Current_TransactionCompleted(object sender, TransactionEventArgs e)
        {
            Dictionary<string, SqlConnection> data = (Dictionary<string, SqlConnection>)Thread.GetData(Thread.GetNamedDataSlot("ConnectionDictionary"));
            if (data != null)
            {
                foreach (SqlConnection connection in data.Values)
                {
                    if ((connection != null) && (connection.State != ConnectionState.Closed))
                    {
                        connection.Close();
                    }
                }
                data.Clear();
            }
            Thread.FreeNamedDataSlot("ConnectionDictionary");
        }

        private static SqlCommand CreateCommand(SqlConnection connection, CommandType commandType, string commandText)
        {
            if ((connection != null) && (connection.State == ConnectionState.Closed))
            {
                connection.Open();
            }
            using (SqlCommand command = new SqlCommand())
            {
                command.Connection = connection;
                command.CommandText = commandText;
                command.CommandType = commandType;
                return command;
            }
        }

        private static SqlCommand CreateCommand(SqlConnection connection, CommandType commandType, string commandText, params object[] values)
        {
            if ((connection != null) && (connection.State == ConnectionState.Closed))
            {
                connection.Open();
            }
            using (SqlCommand command = new SqlCommand())
            {
                command.Connection = connection;
                command.CommandText = commandText;
                command.CommandType = commandType;
                if ((values == null) || (values.Length == 0))
                {
                    for (int j = 0; j < command.Parameters.Count; j++)
                    {
                        command.Parameters[j].Value = DBNull.Value;
                    }
                    return command;
                }
                command.Parameters.AddRange(values);
                return command;
            }
        }

        private static DataSet CreateDataSet(SqlCommand command)
        {
            using (SqlDataAdapter adapter = new SqlDataAdapter(command))
            {
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet);
                return dataSet;
            }
        }

        private static DataTable CreateDataTable(SqlCommand command)
        {
            using (SqlDataAdapter adapter = new SqlDataAdapter(command))
            {
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                return dataTable;
            }
        }
        #endregion
        
        #region public methods
        public static DataSet ExecuteDataSet(string connectionString, CommandType commandType, string commandText)
        {
            return ExecuteDataSet(connectionString, commandType, commandText, (DbParameter[])null);
        }

        public static DataSet ExecuteDataSet(string connectionString, CommandType commandType, string commandText, params DbParameter[] parameters)
        {
            if (Transaction.Current == null)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = CreateCommand(connection, commandType, commandText, parameters))
                    {
                        return CreateDataSet(command);
                    }
                }
            }
            using (SqlCommand command2 = CreateCommand(GetTransactionSqlConnection(connectionString), commandType, commandText, parameters))
            {
                return CreateDataSet(command2);
            }
        }

        public static void ExecuteNonQuery(string connectionString, CommandType commandType, string commandText)
        {
            ExecuteNonQuery(connectionString, commandType, commandText, (DbParameter[])null);
        }

        public static void ExecuteNonQuery(string connectionString, CommandType commandType, string commandText, params DbParameter[] parameters)
        {
            if (Transaction.Current == null)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = CreateCommand(connection, commandType, commandText, parameters))
                    {
                        command.ExecuteNonQuery();
                    }
                    return;
                }
            }
            using (SqlCommand command2 = CreateCommand(GetTransactionSqlConnection(connectionString), commandType, commandText, parameters))
            {
                command2.ExecuteNonQuery();
            }
        }

        public static IDataReader ExecuteReader(string connectionString, CommandType commandType, string commandText)
        {
            return ExecuteReader(connectionString, commandType, commandText, (DbParameter[])null);
        }

        public static IDataReader ExecuteReader(string connectionString, CommandType commandType, string commandText, params DbParameter[] parameters)
        {
            if (Transaction.Current == null)
            {
                SqlConnection connection = new SqlConnection(connectionString);
                using (SqlCommand command = CreateCommand(connection, commandType, commandText, parameters))
                {
                    return command.ExecuteReader(CommandBehavior.CloseConnection);
                }
            }
            using (SqlCommand command2 = CreateCommand(GetTransactionSqlConnection(connectionString), commandType, commandText, parameters))
            {
                return command2.ExecuteReader();
            }
        }

        public static object ExecuteScalar(string connectionString, CommandType commandType, string commandText, params DbParameter[] parameters)
        {
            if (Transaction.Current == null)
            {
                SqlConnection connection = new SqlConnection(connectionString);
                using (SqlCommand command = CreateCommand(connection, commandType, commandText, parameters))
                {
                    return command.ExecuteScalar();
                }
            }
            using (SqlCommand command2 = CreateCommand(GetTransactionSqlConnection(connectionString), commandType, commandText, parameters))
            {
                return command2.ExecuteScalar();
            }
        }

        #endregion

        #region TrungPQ_Conn
        public static string _connString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        public static DataTable SelectTableSP(string storedProcedure)
        {
            DataTable val = new DataTable();
            SqlConnection sqlConn = new SqlConnection(_connString);
            sqlConn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sqlConn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = storedProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(val);
            da.Dispose();
            cmd.Dispose();
            sqlConn.Close();
            sqlConn.Dispose();
            return val;
        }
        public static DataTable SelectTableSP(string storedProcedure, library_Parameter[] param)
        {

            DataTable val = new DataTable();
            SqlConnection sqlConn = new SqlConnection(_connString);
            sqlConn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sqlConn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = storedProcedure;
            for (int i = 0; i < param.Length; i++)
                cmd.Parameters.Add(new SqlParameter(param[i].ParameterName, param[i].Value));

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(val);
            da.Dispose();
            cmd.Dispose();
            sqlConn.Close();
            sqlConn.Dispose();
            return val;
        }
        public class library_Parameter
        {
            public library_Parameter()
            { }
            private object _val;
            private string _paramterName;
            private bool _nText = false;
            public library_Parameter(string parameterName, object val)
            {
                _paramterName = parameterName;
                _val = val;
            }
            public string ParameterName
            {
                get
                {
                    return _paramterName;
                }
                set
                {
                    _paramterName = value;
                }
            }
            public object Value
            {
                get
                {
                    return _val;
                }
                set
                {
                    _val = value;
                }
            }
            public bool NText
            {
                get { return _nText; }
                set { _nText = value; }
            }
        }
        #endregion
    }
}
