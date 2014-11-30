using System;
using System.Collections.Generic;
using System.Text;
using System.Security.Cryptography;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Web;

namespace QLTHPT1.DataAccess
{
    public class HamXuLy
    {

        public static string EncodeTo64(string toEncode)
        {
            var toEncodeAsBytes = Encoding.ASCII.GetBytes(toEncode);
            var returnValue = System.Convert.ToBase64String(toEncodeAsBytes);
            return returnValue;
        }
        public static string MaHoa(string pass)
        {
            MD5 md5hash = new MD5CryptoServiceProvider();
            UTF8Encoding encoder = new UTF8Encoding();
            byte[] hashBytes;
            hashBytes = md5hash.ComputeHash(encoder.GetBytes(pass));
            return BitConverter.ToString(hashBytes);
        }

        public static string RandomString(int length, bool LowerString, bool Number)
        {
            Random AppRandom = new Random((int)DateTime.Now.Ticks);
            string str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            if (Number)
            {
                str = str + "0123456789";
            }
            if (LowerString)
            {
                str = str + "abcdefghijklmnopqrstuvwxyz";
            }
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < length; i++)
            {
                int r = AppRandom.Next(0, str.Length);
                sb.Append(str.Substring(r, 1));
            }
            return sb.ToString();
        }
        public static string ConverIntToString(int number)
        {
            if (number == 1)
                return "true";
            return "false";
        }

        public static string ConvertTrueFalse(string bol)
        {
            string _bool = bol.Trim().ToLower();
            if (_bool == "true")
                return "false";
            else
                if (_bool == "false")
                    return "true";
            return "";
        }
        public static string RemoveHtml(string text)
        {
            if (text.IndexOf("<p>") == 0)
            {
                text = text.Remove(0, 3);
            }
            if (text.IndexOf("<p") == 0)
            {
                text = text.Remove(0, 2);
                text = text.Remove(0, text.IndexOf("<"));
            }
            if (text.LastIndexOf("</p>") == text.Length - 4)
            {
                text = text.Substring(0, text.LastIndexOf("</p>"));
            }
            return text;
        }
        public static float ToFloat(object obj)
        {
            try
            {
                float rs = float.Parse(obj.ToString());
                if (rs < 0) return 0;
                return rs;
            }
            catch
            {
                return 0;
            }
        }
        public static string ToString(object obj)
        {
            try
            {
                return Convert.ToString(obj);
            }
            catch
            {
                return "";
            }
        }
        public static DateTime ToDateTime(object obj)
        {
            try
            {
                return Convert.ToDateTime(obj);
            }
            catch
            {
                return Convert.ToDateTime("1/1/2009");
            }
        }
        public static int ToInt(object obj)
        {
            try
            {
                return Convert.ToInt32(obj);
            }
            catch
            {
                return 0;
            }
        }
       
    }
}
