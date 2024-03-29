USE [master]
GO
/****** Object:  Database [QLTHPT1]    Script Date: 11/30/2014 10:54:19 PM ******/
CREATE DATABASE [QLTHPT1] ON  PRIMARY 
( NAME = N'QLTHPT1', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.TRUNGDUC\MSSQL\DATA\QLTHPT1.mdf' , SIZE = 4352KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLTHPT1_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.TRUNGDUC\MSSQL\DATA\QLTHPT1_log.LDF' , SIZE = 4672KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLTHPT1] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLTHPT1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLTHPT1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLTHPT1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLTHPT1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLTHPT1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLTHPT1] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLTHPT1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLTHPT1] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLTHPT1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLTHPT1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLTHPT1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLTHPT1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLTHPT1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLTHPT1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLTHPT1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLTHPT1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLTHPT1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLTHPT1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLTHPT1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLTHPT1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLTHPT1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLTHPT1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLTHPT1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLTHPT1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLTHPT1] SET RECOVERY FULL 
GO
ALTER DATABASE [QLTHPT1] SET  MULTI_USER 
GO
ALTER DATABASE [QLTHPT1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLTHPT1] SET DB_CHAINING OFF 
GO
USE [QLTHPT1]
GO
/****** Object:  StoredProcedure [dbo].[Get_Diem_MaHocSinh_MaMonHoc]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_Diem_MaHocSinh_MaMonHoc]
@MaHocSinh nvarchar(50),
@MaMonHoc int
AS
BEGIN
SELECT Round((((DM_1 + DM_2 + D15_1 + D15_2 +D15_3 + (D1T_1 + D1T_2)*2 + DThi *3))/12),2) FROM BANGDIEM 
	WHERE MaHocSinh=@MaHocSinh AND MaMonHoc =@MaMonHoc
END
--Get_Diem_MaHocSinh_MaMonHoc 'HS001',1
GO
/****** Object:  StoredProcedure [dbo].[Init_Database]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Init_Database]
as
BEGIN
	DECLARE @Sql NVARCHAR(500) DECLARE @Cursor CURSOR
	SET @Cursor = CURSOR FAST_FORWARD FOR
	SELECT DISTINCT sql = 'ALTER TABLE [' + tc2.TABLE_NAME + '] DROP [' + rc1.CONSTRAINT_NAME + ']'
	FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS rc1
	LEFT JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc2 ON tc2.CONSTRAINT_NAME =rc1.CONSTRAINT_NAME
	OPEN @Cursor FETCH NEXT FROM @Cursor INTO @Sql
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
	Exec SP_EXECUTESQL @Sql
	FETCH NEXT FROM @Cursor INTO @Sql
	END
	CLOSE @Cursor DEALLOCATE @Cursor
	EXEC sp_MSForEachTable 'DROP TABLE ?'
END





GO
/****** Object:  StoredProcedure [dbo].[LoadHS_Nam_Ky_Khoi_Lop]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[LoadHS_Nam_Ky_Khoi_Lop] 
@Nam nvarchar(50),
@Ky nvarchar(50),
@Khoi nvarchar(50),
@Lop nvarchar(50)
AS
BEGIN
SELECT hs.MaHocSinh,hs.TenHocSinh FROM HOCSINH hs
	INNER JOIN BANGDIEM bd ON bd.MaHocSinh = hs.MaHocSinh
	INNER JOIN HOCKY hk ON hk.MaHK = bd.MaHK
	INNER JOIN DSLOP l ON l.MaLop = bd.Malop
	INNER JOIN KHOILOP kl ON kl.MaKhoi = l.MaKhoi
	INNER JOIN NAMHOC nh ON hs.MaNamHoc = nh.MaNamHoc
WHERE hk.TenHK = @Ky AND nh.TenNamHoc=@Nam
AND kl.TenKhoi=@Khoi AND l.TenLop=@Lop
GROUP BY hs.MaHocSinh,hs.TenHocSinh
END

GO
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_BANGDIEM_Add*/
CREATE PROCEDURE [dbo].[sproc_BANGDIEM_Add]
	@MaHocSinh varchar(10) OUTPUT
	,@MaMonHoc varchar(10)
	,@DM_1 real
	,@DM_2 real
	,@D15_1 real
	,@D15_2 real
	,@D15_3 real
	,@D1T_1 real
	,@D1T_2 real
	,@Malop int
	,@MaHK int
	,@DThi real

AS

	INSERT INTO [BANGDIEM]
	(
		[MaHocSinh],
		[MaMonHoc],
		[DM_1],
		[DM_2],
		[D15_1],
		[D15_2],
		[D15_3],
		[D1T_1],
		[D1T_2],
		[Malop],
		[MaHK],
		[DThi]
	)
	VALUES
	(
		@MaHocSinh,
		@MaMonHoc,
		@DM_1,
		@DM_2,
		@D15_1,
		@D15_2,
		@D15_3,
		@D1T_1,
		@D1T_2,
		@Malop,
		@MaHK,
		@DThi
	)


GO
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_BANGDIEM_Delete*/
CREATE PROCEDURE [dbo].[sproc_BANGDIEM_Delete]
	@MaHocSinh varchar(10)
AS
DELETE
FROM
	[BANGDIEM]
WHERE
	[MaHocSinh] = @MaHocSinh


GO
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_BANGDIEM_Get*/
CREATE PROCEDURE [dbo].[sproc_BANGDIEM_Get]
AS
SELECT
	--[MaHocSinh],
	--[MaMonHoc],
	--[DM_1],
	--[DM_2],
	--[D15_1],
	--[D15_2],
	--[D15_3],
	--[D1T_1],
	--[D1T_2],
	--[Malop],
	--[MaHK],
	--[DThi]

*
FROM
	[BANGDIEM]


GO
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_GetByHKVaLop]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_BANGDIEM_GetByHKVaLop]
@Mahk int,
@MaLop int
AS
SELECT
	hs.MaHocSinh,
	hs.TenHocSinh,
	hs.NgaySinh,
	d.D15_1,
	d.D15_2,
	d.D15_3,
	d.DM_1,
	d.DM_2,
	d.DThi,
	d.D1T_1,
	d.D1T_2,
	m.TenMonHoc
FROM
	[BANGDIEM] d, HOCSINH hs, HOCKY hk, DSLOP l,MONHOC m
WHERE
	d.MaHocSinh = hs.MaHocSinh and
	d.MaHK = hk.MaHK and 
	d.Malop = l.MaLop and
	d.MaMonHoc = m.MaMonHoc and
	d.MaHK = @Mahk and
	d.Malop = @MaLop
	
GO
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_GetByMaHocSinh]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_BANGDIEM_GetByMaHocSinh]
@MaHocSinh nvarchar(50),
@MaHK int,
@MaMonHoc int
AS
SELECT
	db.MaHocSinh,
	TenHocSinh,
	[DM_1],
	[DM_2],
	[D15_1],
	[D15_2],
	[D15_3],
	[D1T_1],
	[D1T_2],
	[Malop],
	[MaHK],
	[DThi]


FROM
	[BANGDIEM] db,MONHOC mh,HOCSINH hs
WHERE
db.MaMonHoc = mh.MaMonHoc and
db.MaHocSinh = hs.MaHocSinh and MaHK = @MaHK
	and db.MaMonHoc= @MaMonHoc and
	TenHocSinh like '%'+@MaHocSinh+'%'

GO
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_GetByMaHocSinh3]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_BANGDIEM_GetByMaHocSinh3]
@MaHocSinh varchar(10),
@MaHK int,
@MaLop int,
@MaMon int
AS
SELECT
	[DM_1],
	[DM_2],
	[D15_1],
	[D15_2],
	[D15_3],
	[D1T_1],
	[D1T_2],
	[DThi]


FROM
	[BANGDIEM],MONHOC
WHERE
MONHOC.MaMonHoc = BANGDIEM.MaMonHoc and
	[MaHocSinh] = @MaHocSinh
	and MaHK = @MaHK
	and Malop = @MaLop and BANGDIEM.MaMonHoc = @MaMon
GO
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_GetByMaHocSinhTraCuu]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_BANGDIEM_GetByMaHocSinhTraCuu]
@MaHocSinh varchar(10),
@MaHK int,
@MaLop int
AS
SELECT
	TenHocSinh,
	TenMonHoc,
	[DM_1],
	[DM_2],
	[D15_1],
	[D15_2],
	[D15_3],
	[D1T_1],
	[D1T_2],
	[DThi],
	MaHK,
	Malop,
	HeSo

FROM
	[BANGDIEM] bd,MONHOC mh, HOCSINH hs
WHERE
hs.MaHocSinh = bd.MaHocSinh and
mh.MaMonHoc = bd.MaMonHoc and
	bd.[MaHocSinh] = @MaHocSinh
	and MaHK = @MaHK
	and Malop = @MaLop
GO
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_GetByMaMon]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sproc_BANGDIEM_GetByMaMon]
@MaMon varchar(10)
AS
SELECT
	--[MaHocSinh],
	--[MaMonHoc],
	--[DM_1],
	--[DM_2],
	--[D15_1],
	--[D15_2],
	--[D15_3],
	--[D15_4],
	--[D1T_1],
	--[D1T_2],
	--[DThi]

*
FROM
	[BANGDIEM]
Where 
MaMonHoc =@MaMon


GO
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_GetByMaMonHKByHS]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sproc_BANGDIEM_GetByMaMonHKByHS]
	@MaMonHoc int,
	@MaHK int,
	@MaHocSinh int
	AS
	SELECT
MaHocSinh	
	FROM
		[BANGDIEM] 
	Where 

	MaMonHoc = @MaMonHoc
	and MaHK = @MaHK
	and MaHocSinh = @MaHocSinh
GO
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_GetByMaMonVaLopVaHK]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_BANGDIEM_GetByMaMonVaLopVaHK]
	@MaMonHoc varchar(10),
	@MaLop int,
	@MaHK int
	AS
	SELECT
		d.[MaHocSinh],
		TenHocSinh,
		TenMonHoc,
		NgaySinh,
		[DM_1],
		[DM_2],
		[D15_1],
		[D15_2],
		[D15_3],
		[D1T_1],
		[D1T_2],
		[DThi]
	
	FROM
		[BANGDIEM] d,HOCSINH hs, MONHOC m
	Where 
	m.MaMonHoc = d.MaMonHoc and
	d.MaHocSinh = hs.MaHocSinh and
	d.MaMonHoc = @MaMonHoc
	and d.Malop = @MaLop
	and MaHK = @MaHK
GO
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_GetByMaMonVaLopVaHKByHS]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sproc_BANGDIEM_GetByMaMonVaLopVaHKByHS]
	@MaMonHoc int,
	@MaLop int,
	@MaHK int,
	@MaHocSinh int
	AS
	SELECT
		[DM_1],
		[DM_2],
		[D15_1],
		[D15_2],
		[D15_3],
		[D1T_1],
		[D1T_2],
		[DThi]
	
	FROM
		[BANGDIEM] 
	Where 

	MaMonHoc = @MaMonHoc
	and Malop = @MaLop
	and MaHK = @MaHK
	and MaHocSinh = @MaHocSinh
GO
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_BANGDIEM_GetCount*/
CREATE PROCEDURE [dbo].[sproc_BANGDIEM_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[BANGDIEM]


GO
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_GetPaged]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_BANGDIEM_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_BANGDIEM_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	varchar(10)
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [MaHocSinh]
FROM [BANGDIEM]


-- query out
SELECT *
FROM [BANGDIEM]
WHERE [MaHocSinh]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index



GO
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_GetTotalDiem]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_BANGDIEM_GetTotalDiem]
@MaHocSinh varchar(10)
AS
SELECT
	m.TenMonHoc, ROUND(((d.D15_1 + d.D15_2 + d.D15_3 + d.D1T_1 *2 + d.D1T_2 * 2 + d.DM_1 + d.DM_2 + d.DThi * 3) / 12) ,2) as 'Tong'
FROM
	[BANGDIEM] d ,MONHOC m 
	where 
	d.MaMonHoc = m.MaMonHoc
and MaHocSinh = @MaHocSinh

GO
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_BANGDIEM_Update]
	@MaMonHoc int,
	@DM_1 real,
	@DM_2 real,
	@D15_1 real,
	@D15_2 real,
	@D15_3 real,
	@D1T_1 real,
	@D1T_2 real,
	@Malop int,
	@MaHK int,
	@DThi real,
	@MaHocSinh varchar(10)

AS
UPDATE [BANGDIEM]
SET
	[DM_1] = @DM_1,
	[DM_2] = @DM_2,
	[D15_1] = @D15_1,
	[D15_2] = @D15_2,
	[D15_3] = @D15_3,
	[D1T_1] = @D1T_1,
	[D1T_2] = @D1T_2,
	[Malop] = @Malop,
	[MaHK] = @MaHK,
	[DThi] = @DThi
WHERE
	[MaHocSinh] = @MaHocSinh
	and MaMonHoc =@MaMonHoc
GO
/****** Object:  StoredProcedure [dbo].[sproc_BANNER_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_BANNER_Add*/
CREATE PROCEDURE [dbo].[sproc_BANNER_Add]
	@TenBanner nvarchar(50),
	@Link nchar(100),
	@MoTa nvarchar(500)
AS

	INSERT INTO [BANNER]
	(
		[TenBanner],
		[Link],
		[MoTa]
	)
	VALUES
	(
		@TenBanner,
		@Link,
		@MoTa
	)


GO
/****** Object:  StoredProcedure [dbo].[sproc_BANNER_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_BANNER_Delete]
	@TenBanner varchar(15)
AS
DELETE
FROM
	[BANNER]
WHERE
	[TenBanner] = @TenBanner



GO
/****** Object:  StoredProcedure [dbo].[sproc_BANNER_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_BANNER_Get*/
CREATE PROCEDURE [dbo].[sproc_BANNER_Get]
AS
SELECT
	--[TenBanner],
	--[Link],
	--[MoTa]

*
FROM
	[BANNER]


GO
/****** Object:  StoredProcedure [dbo].[sproc_BANNER_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_BANNER_GetCount*/
CREATE PROCEDURE [dbo].[sproc_BANNER_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[BANNER]


GO
/****** Object:  StoredProcedure [dbo].[sproc_BANNER_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_BANNER_Update]
	@TenBanner varchar(15),
	@Link varchar(50),
	@MoTa nvarchar(500)
	
AS
UPDATE [BANNER]
SET
	
	[Link] = @Link,
	[MoTa] = @MoTa
	
WHERE
	[TenBanner] = @TenBanner



GO
/****** Object:  StoredProcedure [dbo].[sproc_CHUYENLOP_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_CHUYENLOP_Add*/
CREATE PROCEDURE [dbo].[sproc_CHUYENLOP_Add]
	@TuLop varchar(15) OUTPUT
	,@DenLop varchar(15)
	,@NgayChuyen datetime
	,@LyDoChuyen nvarchar(250)
	,@ChuyenBangDiem bit
	,@MaHocSinh varchar(10)

AS

	INSERT INTO [CHUYENLOP]
	(
		[TuLop],
		[DenLop],
		[NgayChuyen],
		[LyDoChuyen],
		[ChuyenBangDiem],
		[MaHocSinh]
	)
	VALUES
	(
		@TuLop,
		@DenLop,
		@NgayChuyen,
		@LyDoChuyen,
		@ChuyenBangDiem,
		@MaHocSinh
	)


GO
/****** Object:  StoredProcedure [dbo].[sproc_CHUYENLOP_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_CHUYENLOP_Delete*/
CREATE PROCEDURE [dbo].[sproc_CHUYENLOP_Delete]
	@TuLop varchar(15)
AS
DELETE
FROM
	[CHUYENLOP]
WHERE
	[TuLop] = @TuLop


GO
/****** Object:  StoredProcedure [dbo].[sproc_CHUYENLOP_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_CHUYENLOP_Get*/
CREATE PROCEDURE [dbo].[sproc_CHUYENLOP_Get]
AS
SELECT
	--[TuLop],
	--[DenLop],
	--[NgayChuyen],
	--[LyDoChuyen],
	--[ChuyenBangDiem],
	--[MaHocSinh]

*
FROM
	[CHUYENLOP]


GO
/****** Object:  StoredProcedure [dbo].[sproc_CHUYENLOP_GetByTuLop]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_CHUYENLOP_GetByTuLop*/
CREATE PROCEDURE [dbo].[sproc_CHUYENLOP_GetByTuLop]
@TuLop varchar(15)
AS
SELECT
	--[TuLop],
	--[DenLop],
	--[NgayChuyen],
	--[LyDoChuyen],
	--[ChuyenBangDiem],
	--[MaHocSinh]

*
FROM
	[CHUYENLOP]
WHERE
	[TuLop] = @TuLop


GO
/****** Object:  StoredProcedure [dbo].[sproc_CHUYENLOP_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_CHUYENLOP_GetCount*/
CREATE PROCEDURE [dbo].[sproc_CHUYENLOP_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[CHUYENLOP]


GO
/****** Object:  StoredProcedure [dbo].[sproc_CHUYENLOP_GetPaged]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_CHUYENLOP_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_CHUYENLOP_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	varchar(15)
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [TuLop]
FROM [CHUYENLOP]


-- query out
SELECT *
FROM [CHUYENLOP]
WHERE [TuLop]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index



GO
/****** Object:  StoredProcedure [dbo].[sproc_CHUYENLOP_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_CHUYENLOP_Update*/
CREATE PROCEDURE [dbo].[sproc_CHUYENLOP_Update]
	@DenLop varchar(15),
	@NgayChuyen datetime,
	@LyDoChuyen nvarchar(250),
	@ChuyenBangDiem bit,
	@MaHocSinh varchar(10),
	@TuLop varchar(15)

AS
UPDATE [CHUYENLOP]
SET
	[DenLop] = @DenLop,
	[NgayChuyen] = @NgayChuyen,
	[LyDoChuyen] = @LyDoChuyen,
	[ChuyenBangDiem] = @ChuyenBangDiem,
	[MaHocSinh] = @MaHocSinh
WHERE
	[TuLop] = @TuLop


GO
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_DSLOP_Add]
	@MaLop int OUTPUT
	,@TenLop nvarchar(50)
	,@MaKhoi int
	,@SiSo int
	,@MoTaKhac nvarchar(500)

AS

	INSERT INTO [DSLOP]
	(
		[TenLop],
		[MaKhoi],
		[SiSo],
		[MoTaKhac]
	)
	VALUES
	(
		@TenLop,
		@MaKhoi,
		@SiSo,
		@MoTaKhac
	)
	SELECT
		@MaLop = @@Identity
GO
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_DSLOP_Delete*/
CREATE PROCEDURE [dbo].[sproc_DSLOP_Delete]
	@MaLop int
AS
DELETE
FROM
	[DSLOP]
WHERE
	[MaLop] = @MaLop


GO
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_DSLOP_Get*/
CREATE PROCEDURE [dbo].[sproc_DSLOP_Get]
AS
SELECT
	--[MaLop],
	--[TenLop],
	--[MaKhoi],
	--[SiSo],
	--[MaGiaoVien],
	--[MoTaKhac]

*
FROM
	[DSLOP]


GO
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_GetByMaKhoi]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_DSLOP_GetByMaKhoi]
@MaKhoi int
AS
SELECT
	--[MaLop],
	--[TenLop],
	--[MaKhoi],
	--[SiSo],
	--[MaGiaoVien],
	--[MoTaKhac]

*
FROM
	[DSLOP]
WHERE
	[MaKhoi] = @MaKhoi

GO
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_GetByMaKhoiGV]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_DSLOP_GetByMaKhoiGV]
@MaKhoi varchar(15),
@MaGiaoVien varchar(10)
AS
SELECT
	DSLoP.[MaLop],
	[TenLop],
	[MaKhoi],
	[SiSo],
	[MoTaKhac]
FROM
	[DSLOP],PHANCONG
WHERE
	PHANCONG.MaLop = DSLOP.MaLop and
	[MaKhoi] = @MaKhoi
	and MaGiaoVien = @MaGiaoVien
GO
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_GetByMaKhoiKtra]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_DSLOP_GetByMaKhoiKtra]
@MaKhoi int,
@TenLop nvarchar(50)
AS
SELECT
	[MaLop],
	[TenLop]
FROM
	[DSLOP] ds , KHOILOP k
WHERE
k.MaKhoi = ds.MaKhoi and
	ds.[MaKhoi] = @MaKhoi
	and TenLop like '%'+@TenLop+'%'
GO
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_GetByMaKhoiXem]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_DSLOP_GetByMaKhoiXem]
@MaKhoi int
AS
SELECT
	[MaLop],
	[TenLop],
	k.TenKhoi,
	[SiSo],
	[MoTaKhac]
FROM
	[DSLOP] ds , KHOILOP k
WHERE
k.MaKhoi = ds.MaKhoi and
	ds.[MaKhoi] = @MaKhoi
GO
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_GetByMaLop]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_DSLOP_GetByMaLop*/
CREATE PROCEDURE [dbo].[sproc_DSLOP_GetByMaLop]
@MaLop int
AS
SELECT
	--[MaLop],
	--[TenLop],
	--[MaKhoi],
	--[SiSo],
	--[MaGiaoVien],
	--[MoTaKhac]

*
FROM
	[DSLOP]
WHERE
	[MaLop] = @MaLop


GO
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_GetByMaLop1]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create PROCEDURE [dbo].[sproc_DSLOP_GetByMaLop1]
@MaLop int
AS
SELECT top 1
	
	[TenLop]
	
FROM
	[DSLOP]
WHERE
	[MaLop] = @MaLop


GO
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_DSLOP_GetCount*/
CREATE PROCEDURE [dbo].[sproc_DSLOP_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[DSLOP]


GO
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_GetPaged]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_DSLOP_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_DSLOP_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [MaLop]
FROM [DSLOP]


-- query out
SELECT *
FROM [DSLOP]
WHERE [MaLop]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index



GO
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_DSLOP_Update]
	@TenLop nvarchar(50),
	@MaKhoi int,
	@SiSo int,
	@MoTaKhac nvarchar(500),
	@MaLop int

AS
UPDATE [DSLOP]
SET
	[TenLop] = @TenLop,
	[MaKhoi] = @MaKhoi,
	[SiSo] = @SiSo,
	[MoTaKhac] = @MoTaKhac
WHERE
	[MaLop] = @MaLop
GO
/****** Object:  StoredProcedure [dbo].[sproc_GIAOVIEN_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_GIAOVIEN_Add]
	@MaGiaoVien varchar(10) 
	,@TenGiaoVien nvarchar(50)
	,@NgaySinh datetime
	,@GioiTinh nvarchar(10)
	,@DiaChi nvarchar(200)
	,@SoDienThoai nchar(20)
	,@ChuNhiem bit
	,@MaMon int

AS

	INSERT INTO [GIAOVIEN]
	(
		[MaGiaoVien],
		[TenGiaoVien],
		[NgaySinh],
		[GioiTinh],
		[DiaChi],
		[SoDienThoai],
		[ChuNhiem],
		[MaMon]
	)
	VALUES
	(
		@MaGiaoVien,
		@TenGiaoVien,
		@NgaySinh,
		@GioiTinh,
		@DiaChi,
		@SoDienThoai,
		@ChuNhiem,
		@MaMon
	)
GO
/****** Object:  StoredProcedure [dbo].[sproc_GIAOVIEN_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_GIAOVIEN_Delete*/
CREATE PROCEDURE [dbo].[sproc_GIAOVIEN_Delete]
	@MaGiaoVien varchar(10)
AS
DELETE
FROM
	[GIAOVIEN]
WHERE
	[MaGiaoVien] = @MaGiaoVien


GO
/****** Object:  StoredProcedure [dbo].[sproc_GIAOVIEN_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_GIAOVIEN_Get*/
CREATE PROCEDURE [dbo].[sproc_GIAOVIEN_Get]
AS
SELECT
	--[MaGiaoVien],
	--[TenGiaoVien],
	--[NgaySinh],
	--[GioiTinh],
	--[DiaChi],
	--[SoDienThoai],
	--[ChuNhiem],
	--[MaTo]

*
FROM
	[GIAOVIEN]


GO
/****** Object:  StoredProcedure [dbo].[sproc_GIAOVIEN_GetByMaGiaoVien]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_GIAOVIEN_GetByMaGiaoVien*/
CREATE PROCEDURE [dbo].[sproc_GIAOVIEN_GetByMaGiaoVien]
@MaGiaoVien varchar(10)
AS
SELECT
	--[MaGiaoVien],
	--[TenGiaoVien],
	--[NgaySinh],
	--[GioiTinh],
	--[DiaChi],
	--[SoDienThoai],
	--[ChuNhiem],
	--[MaTo]

*
FROM
	[GIAOVIEN]
WHERE
	[MaGiaoVien] = @MaGiaoVien


GO
/****** Object:  StoredProcedure [dbo].[sproc_GIAOVIEN_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_GIAOVIEN_GetCount*/
CREATE PROCEDURE [dbo].[sproc_GIAOVIEN_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[GIAOVIEN]


GO
/****** Object:  StoredProcedure [dbo].[sproc_GIAOVIEN_GetPaged]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_GIAOVIEN_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_GIAOVIEN_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	varchar(10)
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [MaGiaoVien]
FROM [GIAOVIEN]


-- query out
SELECT *
FROM [GIAOVIEN]
WHERE [MaGiaoVien]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index



GO
/****** Object:  StoredProcedure [dbo].[sproc_GIAOVIEN_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_GIAOVIEN_Update]
	@TenGiaoVien nvarchar(50),
	@NgaySinh datetime,
	@GioiTinh nvarchar(10),
	@DiaChi nvarchar(200),
	@SoDienThoai nchar(20),
	@ChuNhiem bit,
	@MaMon int,
	@MaGiaoVien varchar(10)

AS
UPDATE [GIAOVIEN]
SET
	[TenGiaoVien] = @TenGiaoVien,
	[NgaySinh] = @NgaySinh,
	[GioiTinh] = @GioiTinh,
	[DiaChi] = @DiaChi,
	[SoDienThoai] = @SoDienThoai,
	[ChuNhiem] = @ChuNhiem,
	[MaMon] = @MaMon
WHERE
	[MaGiaoVien] = @MaGiaoVien

GO
/****** Object:  StoredProcedure [dbo].[sproc_HANHKIEM_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_HANHKIEM_Add]
	@MaHS varchar(10),
	@MaLop int,
	@MaHK int,
	@NgayNghiCoPhep int,
	@NgayNghiKoPhep int,
	@SoLanKyLuat int,
	@HanhKiem nvarchar(20)
AS

	INSERT INTO [HANHKIEM]
	(
		[MaHS],
		[MaLop],
		[MaHK],
		[NgayNghiCoPhep],
		[NgayNghiKoPhep],
		[SoLanKyLuat],
		[HanhKiem]
	)
	VALUES
	(
		@MaHS,
		@MaLop,
		@MaHK,
		@NgayNghiCoPhep,
		@NgayNghiKoPhep,
		@SoLanKyLuat,
		@HanhKiem
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_HANHKIEM_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sproc_HANHKIEM_Delete]
	@MaHS varchar(10)
AS

	delete from HANHKIEM
	where MaHS = @MaHS
GO
/****** Object:  StoredProcedure [dbo].[sproc_HANHKIEM_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HANHKIEM_Get*/
CREATE PROCEDURE [dbo].[sproc_HANHKIEM_Get]
AS
SELECT
	--[MaHS],
	--[MaLop],
	--[MaHK],
	--[NgayNghiCoPhep],
	--[NgayNghiKoPhep],
	--[SoLanKyLuat],
	--[HanhKiem]

*
FROM
	[HANHKIEM]


GO
/****** Object:  StoredProcedure [dbo].[sproc_HANHKIEM_GetByMaHSVaHK]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sproc_HANHKIEM_GetByMaHSVaHK]
@MaHocSinh varchar(10),
@MaHK int
AS
SELECT MaHS
FROM
	[HANHKIEM] hk
	where  hk.MaHS = @MaHocSinh and MaHK = @MaHK
GO
/****** Object:  StoredProcedure [dbo].[sproc_HANHKIEM_GetByMaLopVaHK]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sproc_HANHKIEM_GetByMaLopVaHK]
@MaLop int,
@MaHK int
AS
SELECT
	[MaHS],
	TenHocSinh,
	[NgayNghiCoPhep],
	[NgayNghiKoPhep],
	[SoLanKyLuat],
	[HanhKiem]


FROM
	[HANHKIEM] hk , HOCSINH hs, DSLOP l
	where hk.MaLop = l.MaLop and
	hk.MaHS = hs.MaHocSinh
	and hk.MaLop = @MaLop and MaHK = @MaHK
GO
/****** Object:  StoredProcedure [dbo].[sproc_HANHKIEM_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HANHKIEM_GetCount*/
CREATE PROCEDURE [dbo].[sproc_HANHKIEM_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[HANHKIEM]


GO
/****** Object:  StoredProcedure [dbo].[sproc_HANHKIEM_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sproc_HANHKIEM_Update]
	@MaHS varchar(10),
	@MaLop int,
	@MaHK int,
	@NgayNghiCoPhep int,
	@NgayNghiKoPhep int,
	@SoLanKyLuat int,
	@HanhKiem nvarchar(20)
AS

	update [HANHKIEM]
	set
	[MaLop]=	@MaLop,
	[MaHK]=	@MaHK,
	[NgayNghiCoPhep]	=@NgayNghiCoPhep,
	[NgayNghiKoPhep]=	@NgayNghiKoPhep,
	[SoLanKyLuat]	=@SoLanKyLuat,
	[HanhKiem]	=@HanhKiem

where [MaHS]	=@MaHS
GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCKY_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HOCKY_Add*/
CREATE PROCEDURE [dbo].[sproc_HOCKY_Add]
	@MaHK int OUTPUT
	,@TenHK nvarchar(50)
	,@TuNgay datetime
	,@DenNgay datetime

AS

	INSERT INTO [HOCKY]
	(
		[TenHK],
		[TuNgay],
		[DenNgay]
	)
	VALUES
	(
		@TenHK,
		@TuNgay,
		@DenNgay
	)
	SELECT
		@MaHK = @@Identity



GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCKY_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HOCKY_Delete*/
CREATE PROCEDURE [dbo].[sproc_HOCKY_Delete]
	@MaHK int
AS
DELETE
FROM
	[HOCKY]
WHERE
	[MaHK] = @MaHK


GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCKY_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HOCKY_Get*/
CREATE PROCEDURE [dbo].[sproc_HOCKY_Get]
AS
SELECT
	--[MaHK],
	--[TenHK],
	--[TuNgay],
	--[DenNgay]

*
FROM
	[HOCKY]


GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCKY_GetByMaHK]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HOCKY_GetByMaHK*/
CREATE PROCEDURE [dbo].[sproc_HOCKY_GetByMaHK]
@MaHK int
AS
SELECT
	--[MaHK],
	--[TenHK],
	--[TuNgay],
	--[DenNgay]

*
FROM
	[HOCKY]
WHERE
	[MaHK] = @MaHK


GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCKY_GetByMaNamHoc]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create PROCEDURE [dbo].[sproc_HOCKY_GetByMaNamHoc]
@MaNamHoc varchar(15)
AS
SELECT
	--[MaHK],
	--[TenHK],
	--[MaNamHoc],
	--[TuNgay],
	--[DenNgay]

*
FROM
	[HOCKY]
WHERE
	[MaNamHoc] = @MaNamHoc



GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCKY_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HOCKY_GetCount*/
CREATE PROCEDURE [dbo].[sproc_HOCKY_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[HOCKY]


GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCKY_GetList1]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_HOCKY_GetList1]

AS
SELECT
	[MaHK],
	[TenHK],
	hk.[MaNamHoc],
	[TuNgay],
	[DenNgay],
	nh.TenNamHoc

	
FROM
	[HOCKY] hk, NAMHOC nh
WHERE
	hk.MaNamHoc  = nh.MaNamHoc

GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCKY_GetPaged]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HOCKY_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_HOCKY_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [MaHK]
FROM [HOCKY]


-- query out
SELECT *
FROM [HOCKY]
WHERE [MaHK]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index



GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCKY_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HOCKY_Update*/
CREATE PROCEDURE [dbo].[sproc_HOCKY_Update]
	@TenHK nvarchar(50),
	@TuNgay datetime,
	@DenNgay datetime,
	@MaHK int

AS
UPDATE [HOCKY]
SET
	[TenHK] = @TenHK,
	[TuNgay] = @TuNgay,
	[DenNgay] = @DenNgay
WHERE
	[MaHK] = @MaHK


GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCSINH_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_HOCSINH_Add]
	@MaHocSinh varchar(10) 
	,@TenHocSinh nvarchar(50)
	,@Email nvarchar(50)
	,@GioiTinh nvarchar(5)
	,@NgaySinh datetime
	,@NoiSinh nvarchar(100)
	,@DiaChi nvarchar(100)
	,@NgayNhapHoc datetime
	,@HoTenBo nvarchar(30)
	,@HoTenMe nvarchar(30)
	,@Anh nchar(10)
	,@NgheBo nchar(10)
	,@NgheMe nchar(10)
	,@NgayVaoDoan datetime
	,@TrangThai nvarchar(30)
	,@MaNamHoc int
	,@SoDienThoaiNha nchar(20)

AS

	INSERT INTO [HOCSINH]
	(
		[MaHocSinh],
		[TenHocSinh],
		[Email],
		[GioiTinh],
		[NgaySinh],
		[NoiSinh],
		[DiaChi],
		[NgayNhapHoc],
		[HoTenBo],
		[HoTenMe],
		[Anh],
		[NgheBo],
		[NgheMe],
		[NgayVaoDoan],
		[TrangThai],
		[MaNamHoc],
		[SoDienThoaiNha]
	)
	VALUES
	(
		@MaHocSinh,
		@TenHocSinh,
		@Email,
		@GioiTinh,
		@NgaySinh,
		@NoiSinh,
		@DiaChi,
		@NgayNhapHoc,
		@HoTenBo,
		@HoTenMe,
		@Anh,
		@NgheBo,
		@NgheMe,
		@NgayVaoDoan,
		@TrangThai,
		@MaNamHoc,
		@SoDienThoaiNha
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCSINH_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HOCSINH_Delete*/
CREATE PROCEDURE [dbo].[sproc_HOCSINH_Delete]
	@MaHocSinh varchar(10)
AS
DELETE
FROM
	[HOCSINH]
WHERE
	[MaHocSinh] = @MaHocSinh


GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCSINH_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HOCSINH_Get*/
CREATE PROCEDURE [dbo].[sproc_HOCSINH_Get]
AS
SELECT
	--[MaHocSinh],
	--[MaLop],
	--[TenHocSinh],
	--[Email],
	--[GioiTinh],
	--[NgaySinh],
	--[NoiSinh],
	--[DiaChi],
	--[NgayNhapHoc],
	--[HoTenBo],
	--[HoTenMe],
	--[Anh],
	--[NgheBo],
	--[NgheMe],
	--[NgayVaoDoan],
	--[TrangThai],
	--[MaNamHoc],
	--[SoDienThoaiNha]

*
FROM
	[HOCSINH]


GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCSINH_GetByMaHocSinh]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_HOCSINH_GetByMaHocSinh]
@MaHocSinh nvarchar(50)
AS
SELECT
	--[MaHocSinh],
	--[MaLop],
	--[TenHocSinh],
	--[Email],
	--[GioiTinh],
	--[NgaySinh],
	--[NoiSinh],
	--[DiaChi],
	--[NgayNhapHoc],
	--[HoTenBo],
	--[HoTenMe],
	--[Anh],
	--[NgheBo],
	--[NgheMe],
	--[NgayVaoDoan],
	--[TrangThai],
	--[MaNamHoc],
	--[SoDienThoaiNha]

*
FROM
	[HOCSINH]
WHERE
	[MaHocSinh] like '%'+@MaHocSinh+'%' or TenHocSinh like '%'+@MaHocSinh+'%'
GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCSINH_GetByMaLop]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sproc_HOCSINH_GetByMaLop]
@MaLop varchar(10)
AS
SELECT
	--[MaHocSinh],
	--[MaLop],
	--[TenHocSinh],
	--[Email],
	--[GioiTinh],
	--[NgaySinh],
	--[NoiSinh],
	--[DiaChi],
	--[NgayNhapHoc],
	--[HoTenBo],
	--[HoTenMe],
	--[Anh],
	--[NgheBo],
	--[NgheMe],
	--[NgayVaoTruong],
	--[TrangThai],
	--[SoDienThoaiNha]

*
FROM
	[HOCSINH]
WHERE
	MaLop = @MaLop


GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCSINH_GetByMaNamHoc]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sproc_HOCSINH_GetByMaNamHoc]
@MaNamHoc int
AS
SELECT

*
FROM
	[HOCSINH]
WHERE
	MaNamHoc = @MaNamHoc

GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCSINH_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HOCSINH_GetCount*/
CREATE PROCEDURE [dbo].[sproc_HOCSINH_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[HOCSINH]


GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCSINH_GetPaged]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HOCSINH_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_HOCSINH_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	varchar(10)
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [MaHocSinh]
FROM [HOCSINH]


-- query out
SELECT *
FROM [HOCSINH]
WHERE [MaHocSinh]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index



GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCSINH_GetTenByMaHS]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sproc_HOCSINH_GetTenByMaHS]
@MaHocSinh varchar(10)
AS
SELECT
	
	[TenHocSinh]

FROM
	[HOCSINH]
WHERE
	[MaHocSinh] = @MaHocSinh

GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCSINH_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_HOCSINH_Update]
	
	@TenHocSinh nvarchar(50),
	@Email nvarchar(50),
	@GioiTinh nvarchar(5),
	@NgaySinh datetime,
	@NoiSinh nvarchar(100),
	@DiaChi nvarchar(100),
	@NgayNhapHoc datetime,
	@HoTenBo nvarchar(30),
	@HoTenMe nvarchar(30),
	@Anh nchar(10),
	@NgheBo nchar(10),
	@NgheMe nchar(10),
	@NgayVaoDoan datetime,
	@TrangThai nvarchar(30),
	@MaNamHoc int,
	@SoDienThoaiNha nchar(20),
	@MaHocSinh varchar(10)

AS
UPDATE [HOCSINH]
SET
	[TenHocSinh] = @TenHocSinh,
	[Email] = @Email,
	[GioiTinh] = @GioiTinh,
	[NgaySinh] = @NgaySinh,
	[NoiSinh] = @NoiSinh,
	[DiaChi] = @DiaChi,
	[NgayNhapHoc] = @NgayNhapHoc,
	[HoTenBo] = @HoTenBo,
	[HoTenMe] = @HoTenMe,
	[Anh] = @Anh,
	[NgheBo] = @NgheBo,
	[NgheMe] = @NgheMe,
	[NgayVaoDoan] = @NgayVaoDoan,
	[TrangThai] = @TrangThai,
	[MaNamHoc] = @MaNamHoc,
	[SoDienThoaiNha] = @SoDienThoaiNha
WHERE
	[MaHocSinh] = @MaHocSinh
GO
/****** Object:  StoredProcedure [dbo].[sproc_KHENTHUONG_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_KHENTHUONG_Add]
	@KhoiHoc int,
	@HocSinh varchar(10),
	@Lop int,
	@HinhThucKhen nvarchar(50),
	@NgayKhen datetime,
	@NoiDungKhen nvarchar(500)
AS

	INSERT INTO [KHENTHUONG]
	(
		KhoiHoc,
		[HocSinh],
		[Lop],
		[HinhThucKhen],
		[NgayKhen],
		[NoiDungKhen]
	)
	VALUES
	(
		@KhoiHoc,
		@HocSinh,
		@Lop,
		@HinhThucKhen,
		@NgayKhen,
		@NoiDungKhen
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_KHENTHUONG_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_KHENTHUONG_Delete]
	
	@HocSinh nvarchar(30)

AS

	delete 
	from KHENTHUONG
	where HocSinh = @HocSinh

GO
/****** Object:  StoredProcedure [dbo].[sproc_KHENTHUONG_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_KHENTHUONG_Get]
AS
SELECT
*
FROM
	[KHENTHUONG]


GO
/****** Object:  StoredProcedure [dbo].[sproc_KHENTHUONG_GetByHS]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sproc_KHENTHUONG_GetByHS]
@MaHocSinh varchar(10)
AS
SELECT
HocSinh
FROM KHENTHUONG
where HocSinh = @MaHocSinh
	
GO
/****** Object:  StoredProcedure [dbo].[sproc_KHENTHUONG_GetByLop]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_KHENTHUONG_GetByLop]
@Lop nvarchar(50)
AS
SELECT
	HocSinh,
	[TenHocSinh],
	[HinhThucKhen],
	[NoiDungKhen],
	[NgayKhen],
	[NoiDungKhen]
FROM
	[KHENTHUONG]kt, HOCSINH hs
	where 
	kt.HocSinh = hs.MaHocSinh and
	Lop = @Lop
GO
/****** Object:  StoredProcedure [dbo].[sproc_KHENTHUONG_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_KHENTHUONG_GetCount*/
CREATE PROCEDURE [dbo].[sproc_KHENTHUONG_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[KHENTHUONG]


GO
/****** Object:  StoredProcedure [dbo].[sproc_KHENTHUONG_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_KHENTHUONG_Update]
	@KhoiHoc int,
	@HocSinh varchar(10),
	@Lop int,
	@HinhThucKhen nvarchar(50),
	@NgayKhen datetime,
	@NoiDungKhen nvarchar(500)
AS

	Update [KHENTHUONG]
	set KhoiHoc  =@KhoiHoc,
	Lop = @Lop,
	NoiDungKhen  = @NoiDungKhen,
	NgayKhen =@NgayKhen,
	HinhThucKhen =@HinhThucKhen

	where 
		HocSinh = @HocSinh
GO
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_KHOILOP_Add*/
CREATE PROCEDURE [dbo].[sproc_KHOILOP_Add]
	@MaKhoi int OUTPUT
	,@MaNamHoc int
	,@TenKhoi nvarchar(50)

AS

	INSERT INTO [KHOILOP]
	(
		[MaNamHoc],
		[TenKhoi]
	)
	VALUES
	(
		@MaNamHoc,
		@TenKhoi
	)
	SELECT
		@MaKhoi = @@Identity



GO
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_KHOILOP_Delete*/
CREATE PROCEDURE [dbo].[sproc_KHOILOP_Delete]
	@MaKhoi int
AS
DELETE
FROM
	[KHOILOP]
WHERE
	[MaKhoi] = @MaKhoi


GO
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_KHOILOP_Get*/
CREATE PROCEDURE [dbo].[sproc_KHOILOP_Get]
AS
SELECT
	--[MaKhoi],
	--[MaNamHoc],
	--[TenKhoi]

*
FROM
	[KHOILOP]


GO
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_Get1]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sproc_KHOILOP_Get1]
AS
SELECT
hk.MaKhoi,hk.TenKhoi,nh.TenNamHoc
FROM
	[KHOILOP] hk, NAMHOC nh
	where hk.MaNamHoc = nh.MaNamHoc

GO
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_GetByMaKhoi]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_KHOILOP_GetByMaKhoi*/
CREATE PROCEDURE [dbo].[sproc_KHOILOP_GetByMaKhoi]
@MaKhoi int
AS
SELECT
	--[MaKhoi],
	--[MaNamHoc],
	--[TenKhoi]

*
FROM
	[KHOILOP]
WHERE
	[MaKhoi] = @MaKhoi


GO
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_GetByMaKy]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_KHOILOP_GetByMaKy]
@MaNamHoc varchar(15)
AS
SELECT
	--[MaKhoi],
	--[TenKhoi],
	--[MaHocKy]

*
FROM
	[KHOILOP]
WHERE
	MaNamHoc = @MaNamHoc

GO
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_GetByMaNamHoc]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROCEDURE [dbo].[sproc_KHOILOP_GetByMaNamHoc]
@MaNamHoc varchar(15)
AS
SELECT
	--[MaKhoi],
	--[TenKhoi],
	--[MaHocKy]

*
FROM
	[KHOILOP]
WHERE
	MaNamHoc = @MaNamHoc

GO
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_GetByMaNH]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[sproc_KHOILOP_GetByMaNH]
@MaNamHoc varchar(15)
AS
SELECT
kh.MaKhoi, kh.TenKhoi, nh.TenNamHoc
FROM
	[KHOILOP] kh , NAMHOC nh
WHERE
kh.MaNamHoc = nh.MaNamHoc and
	kh.MaNamHoc = @MaNamHoc

GO
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_KHOILOP_GetCount*/
CREATE PROCEDURE [dbo].[sproc_KHOILOP_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[KHOILOP]


GO
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_GetPaged]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_KHOILOP_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_KHOILOP_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [MaKhoi]
FROM [KHOILOP]


-- query out
SELECT *
FROM [KHOILOP]
WHERE [MaKhoi]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index



GO
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_KHOILOP_Update*/
CREATE PROCEDURE [dbo].[sproc_KHOILOP_Update]
	@MaNamHoc int,
	@TenKhoi nvarchar(50),
	@MaKhoi int

AS
UPDATE [KHOILOP]
SET
	[MaNamHoc] = @MaNamHoc,
	[TenKhoi] = @TenKhoi
WHERE
	[MaKhoi] = @MaKhoi


GO
/****** Object:  StoredProcedure [dbo].[sproc_KYLUAT_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_KYLUAT_Add]
	@KhoiHoc nvarchar(50),
	@Lop nvarchar(50),
	@HocSinh nvarchar(50),
	@HinhThucKyLuat nvarchar(50),
	@NgayKyLuat nvarchar(50),
	@NoiDung nvarchar(500)
AS

	INSERT INTO [KYLUAT]
	(
		[KhoiHoc],
		[Lop],
		[HocSinh],
		[HinhThucKyLuat],
		[NgayKyLuat],
		[NoiDung]
	)
	VALUES
	(
		@KhoiHoc,
		@Lop,
		@HocSinh,
		@HinhThucKyLuat,
		@NgayKyLuat,
		@NoiDung
	)


GO
/****** Object:  StoredProcedure [dbo].[sproc_KYLUAT_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_KYLUAT_Delete]

	@HocSinh nvarchar(50)

AS

	delete 
	from KYLUAT
	where HocSinh = @HocSinh

GO
/****** Object:  StoredProcedure [dbo].[sproc_KYLUAT_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_KYLUAT_Get*/
CREATE PROCEDURE [dbo].[sproc_KYLUAT_Get]
AS
SELECT
	--[KhoiHoc],
	--[Lop],
	--[TenHocSinh],
	--[HinhThucKyLuat],
	--[NgayKyLuat],
	--[NoiDung]

*
FROM
	[KYLUAT]


GO
/****** Object:  StoredProcedure [dbo].[sproc_KYLUAT_GetByLop]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_KYLUAT_GetByLop]
@Lop nvarchar(50)
AS
SELECT
	 HocSinh,
	[TenHocSinh],
	[HinhThucKyLuat],
	[NgayKyLuat],
	[NoiDung]
FROM
	[KYLUAT] kl, HOCSINH hs
	where Lop = @Lop
	and kl.HocSinh = hs.MaHocSinh
GO
/****** Object:  StoredProcedure [dbo].[sproc_KYLUAT_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_KYLUAT_GetCount*/
CREATE PROCEDURE [dbo].[sproc_KYLUAT_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[KYLUAT]


GO
/****** Object:  StoredProcedure [dbo].[sproc_KYLUAT_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_KYLUAT_Update]
	@KhoiHoc int,
	@HocSinh varchar(10),
	@Lop int,
	@HinhThucKyLuat nvarchar(50),
	@NgayKyLuat datetime,
	@NoiDung nvarchar(500)
AS

	Update [KYLUAT]
	set KhoiHoc  =@KhoiHoc,
	Lop = @Lop,
	NoiDung  = @NoiDung,
	NgayKyLuat = @NgayKyLuat,
	HinhThucKyLuat = @HinhThucKyLuat

	where 
		HocSinh = @HocSinh

GO
/****** Object:  StoredProcedure [dbo].[sproc_LOAINGUOIDUNG_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_LOAINGUOIDUNG_Add]
	@MaND int 
	,@MaLoaiND varchar(10)
	,@MaGiaoVien varchar(10)
	,@TenLoaiND nvarchar(30)

AS

	INSERT INTO [LOAINGUOIDUNG]
	(
		[MaLoaiND],
		[MaND],
		[MaGiaoVien],
		[TenLoaiND]
	)
	VALUES
	(
		@MaLoaiND,
		@MaND,
		@MaGiaoVien,
		@TenLoaiND
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_LOAINGUOIDUNG_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_LOAINGUOIDUNG_Delete*/
CREATE PROCEDURE [dbo].[sproc_LOAINGUOIDUNG_Delete]
	@MaND int
AS
DELETE
FROM
	[LOAINGUOIDUNG]
WHERE
	[MaND] = @MaND


GO
/****** Object:  StoredProcedure [dbo].[sproc_LOAINGUOIDUNG_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_LOAINGUOIDUNG_Get*/
CREATE PROCEDURE [dbo].[sproc_LOAINGUOIDUNG_Get]
AS
SELECT
	--[MaLoaiND],
	--[MaND],
	--[MaGiaoVien],
	--[TenLoaiND]

*
FROM
	[LOAINGUOIDUNG]


GO
/****** Object:  StoredProcedure [dbo].[sproc_LOAINGUOIDUNG_GetByMaLoaiND]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_LOAINGUOIDUNG_GetByMaLoaiND*/
CREATE PROCEDURE [dbo].[sproc_LOAINGUOIDUNG_GetByMaLoaiND]
@MaLoaiND varchar(10)
AS
SELECT
	--[MaLoaiND],
	--[TenLoaiND]

*
FROM
	[LOAINGUOIDUNG]
WHERE
	[MaLoaiND] = @MaLoaiND


GO
/****** Object:  StoredProcedure [dbo].[sproc_LOAINGUOIDUNG_GetByMaND]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_LOAINGUOIDUNG_GetByMaND*/
CREATE PROCEDURE [dbo].[sproc_LOAINGUOIDUNG_GetByMaND]
@MaND int
AS
SELECT
	--[MaLoaiND],
	--[MaND],
	--[MaGiaoVien],
	--[TenLoaiND]

*
FROM
	[LOAINGUOIDUNG]
WHERE
	[MaND] = @MaND


GO
/****** Object:  StoredProcedure [dbo].[sproc_LOAINGUOIDUNG_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_LOAINGUOIDUNG_GetCount*/
CREATE PROCEDURE [dbo].[sproc_LOAINGUOIDUNG_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[LOAINGUOIDUNG]


GO
/****** Object:  StoredProcedure [dbo].[sproc_LOAINGUOIDUNG_GetPaged]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_LOAINGUOIDUNG_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_LOAINGUOIDUNG_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [MaND]
FROM [LOAINGUOIDUNG]


-- query out
SELECT *
FROM [LOAINGUOIDUNG]
WHERE [MaND]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index



GO
/****** Object:  StoredProcedure [dbo].[sproc_LOAINGUOIDUNG_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_LOAINGUOIDUNG_Update]
	@MaLoaiND varchar(10),
	@MaGiaoVien varchar(10),
	@TenLoaiND nvarchar(30),
	@MaND int

AS
UPDATE [LOAINGUOIDUNG]
SET
	[MaLoaiND] = @MaLoaiND,
	[TenLoaiND] = @TenLoaiND
WHERE
	[MaND] = @MaND and
	MaGiaoVien = @MaGiaoVien
GO
/****** Object:  StoredProcedure [dbo].[sproc_MENU_HS_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MENU_HS_Add*/
CREATE PROCEDURE [dbo].[sproc_MENU_HS_Add]
	@ID int OUTPUT
	,@Ten nvarchar(50)

AS

	INSERT INTO [MENU_HS]
	(
		[Ten]
	)
	VALUES
	(
		@Ten
	)
	SELECT
		@ID = @@Identity




GO
/****** Object:  StoredProcedure [dbo].[sproc_MENU_HS_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MENU_HS_Delete*/
CREATE PROCEDURE [dbo].[sproc_MENU_HS_Delete]
	@ID int
AS
DELETE
FROM
	[MENU_HS]
WHERE
	[ID] = @ID



GO
/****** Object:  StoredProcedure [dbo].[sproc_MENU_HS_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MENU_HS_Get*/
CREATE PROCEDURE [dbo].[sproc_MENU_HS_Get]
AS
SELECT
	--[ID],
	--[Ten]

*
FROM
	[MENU_HS]



GO
/****** Object:  StoredProcedure [dbo].[sproc_MENU_HS_GetByID]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MENU_HS_GetByID*/
CREATE PROCEDURE [dbo].[sproc_MENU_HS_GetByID]
@ID int
AS
SELECT
	--[ID],
	--[Ten]

*
FROM
	[MENU_HS]
WHERE
	[ID] = @ID



GO
/****** Object:  StoredProcedure [dbo].[sproc_MENU_HS_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MENU_HS_GetCount*/
CREATE PROCEDURE [dbo].[sproc_MENU_HS_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[MENU_HS]



GO
/****** Object:  StoredProcedure [dbo].[sproc_MENU_HS_GetPaged]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MENU_HS_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_MENU_HS_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [ID]
FROM [MENU_HS]


-- query out
SELECT *
FROM [MENU_HS]
WHERE [ID]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index




GO
/****** Object:  StoredProcedure [dbo].[sproc_MENU_HS_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MENU_HS_Update*/
CREATE PROCEDURE [dbo].[sproc_MENU_HS_Update]
	@Ten nvarchar(50),
	@ID int

AS
UPDATE [MENU_HS]
SET
	[Ten] = @Ten
WHERE
	[ID] = @ID



GO
/****** Object:  StoredProcedure [dbo].[sproc_MONHOC_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_MONHOC_Add]
	
	@MaTo varchar(10)
	,@TenMonHoc nvarchar(50)
	,@SoTiet int
	,@HeSo int

AS

	INSERT INTO [MONHOC]
	(
	
		[MaTo],
		[TenMonHoc],
		[SoTiet],
		[HeSo]
	)
	VALUES
	(
		
		@MaTo,
		@TenMonHoc,
		@SoTiet,
		@HeSo
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_MONHOC_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MONHOC_Delete*/
CREATE PROCEDURE [dbo].[sproc_MONHOC_Delete]
	@MaMonHoc varchar(10)
AS
DELETE
FROM
	[MONHOC]
WHERE
	[MaMonHoc] = @MaMonHoc


GO
/****** Object:  StoredProcedure [dbo].[sproc_MONHOC_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MONHOC_Get*/
CREATE PROCEDURE [dbo].[sproc_MONHOC_Get]
AS
SELECT
	--[MaMonHoc],
	--[MaGiaoVien],
	--[TenMonHoc],
	--[SoTiet],
	--[HeSo]

*
FROM
	[MONHOC]


GO
/****** Object:  StoredProcedure [dbo].[sproc_MONHOC_GetByMaMonHoc]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MONHOC_GetByMaMonHoc*/
CREATE PROCEDURE [dbo].[sproc_MONHOC_GetByMaMonHoc]
@MaMonHoc varchar(10)
AS
SELECT
	--[MaMonHoc],
	--[MaGiaoVien],
	--[TenMonHoc],
	--[SoTiet],
	--[HeSo]

*
FROM
	[MONHOC]
WHERE
	[MaMonHoc] = @MaMonHoc


GO
/****** Object:  StoredProcedure [dbo].[sproc_MONHOC_GetByMaTo]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sproc_MONHOC_GetByMaTo]
@MaTo nvarchar(15)
AS
SELECT
*
FROM
	MONHOC
WHERE
	MaTo = @MaTo
GO
/****** Object:  StoredProcedure [dbo].[sproc_MONHOC_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MONHOC_GetCount*/
CREATE PROCEDURE [dbo].[sproc_MONHOC_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[MONHOC]


GO
/****** Object:  StoredProcedure [dbo].[sproc_MONHOC_GetListByMaMon]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sproc_MONHOC_GetListByMaMon]
@MaMon varchar(10)
AS
SELECT
	--[MaMonHoc],
	--[MaGiaoVien],
	--[TenMonHoc],
	--[SoTiet],
	--[HeSo]

*
FROM
	[MONHOC]
WHERE
	MaMonHoc = @MaMon
GO
/****** Object:  StoredProcedure [dbo].[sproc_MONHOC_GetPaged]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MONHOC_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_MONHOC_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	varchar(10)
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [MaMonHoc]
FROM [MONHOC]


-- query out
SELECT *
FROM [MONHOC]
WHERE [MaMonHoc]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index



GO
/****** Object:  StoredProcedure [dbo].[sproc_MONHOC_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_MONHOC_Update]
	@MaTo varchar(10),
	@TenMonHoc nvarchar(50),
	@SoTiet int,
	@HeSo int,
	@MaMonHoc varchar(10)

AS
UPDATE [MONHOC]
SET
	[MaTo] = @MaTo,
	[TenMonHoc] = @TenMonHoc,
	[SoTiet] = @SoTiet,
	[HeSo] = @HeSo
WHERE
	[MaMonHoc] = @MaMonHoc
GO
/****** Object:  StoredProcedure [dbo].[sproc_NAMHOC_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NAMHOC_Add*/
CREATE PROCEDURE [dbo].[sproc_NAMHOC_Add]
	@MaNamHoc int OUTPUT
	,@TenNamHoc nvarchar(30)

AS

	INSERT INTO [NAMHOC]
	(
		[TenNamHoc]
	)
	VALUES
	(
		@TenNamHoc
	)
	SELECT
		@MaNamHoc = @@Identity



GO
/****** Object:  StoredProcedure [dbo].[sproc_NAMHOC_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NAMHOC_Delete*/
CREATE PROCEDURE [dbo].[sproc_NAMHOC_Delete]
	@MaNamHoc int
AS
DELETE
FROM
	[NAMHOC]
WHERE
	[MaNamHoc] = @MaNamHoc


GO
/****** Object:  StoredProcedure [dbo].[sproc_NAMHOC_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NAMHOC_Get*/
CREATE PROCEDURE [dbo].[sproc_NAMHOC_Get]
AS
SELECT
	--[MaNamHoc],
	--[TenNamHoc]

*
FROM
	[NAMHOC]


GO
/****** Object:  StoredProcedure [dbo].[sproc_NAMHOC_GetByMaNamHoc]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NAMHOC_GetByMaNamHoc*/
CREATE PROCEDURE [dbo].[sproc_NAMHOC_GetByMaNamHoc]
@MaNamHoc int
AS
SELECT
	--[MaNamHoc],
	--[TenNamHoc]

*
FROM
	[NAMHOC]
WHERE
	[MaNamHoc] = @MaNamHoc


GO
/****** Object:  StoredProcedure [dbo].[sproc_NAMHOC_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NAMHOC_GetCount*/
CREATE PROCEDURE [dbo].[sproc_NAMHOC_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[NAMHOC]


GO
/****** Object:  StoredProcedure [dbo].[sproc_NAMHOC_GetPaged]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NAMHOC_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_NAMHOC_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [MaNamHoc]
FROM [NAMHOC]


-- query out
SELECT *
FROM [NAMHOC]
WHERE [MaNamHoc]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index



GO
/****** Object:  StoredProcedure [dbo].[sproc_NAMHOC_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NAMHOC_Update*/
CREATE PROCEDURE [dbo].[sproc_NAMHOC_Update]
	@TenNamHoc nvarchar(30),
	@MaNamHoc int

AS
UPDATE [NAMHOC]
SET
	[TenNamHoc] = @TenNamHoc
WHERE
	[MaNamHoc] = @MaNamHoc


GO
/****** Object:  StoredProcedure [dbo].[sproc_NHATRUONG_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NHATRUONG_Add*/
CREATE PROCEDURE [dbo].[sproc_NHATRUONG_Add]
	@MaTruong nvarchar(6),
	@TenTruong nvarchar(200),
	@DienThoai nchar(20),
	@Email nvarchar(50),
	@DiaChi nvarchar(200),
	@NgayLap datetime,
	@AnhDaiDien nchar(100),
	@HieuTruong nvarchar(30),
	@Website nchar(100)
AS

	INSERT INTO [NHATRUONG]
	(
		[MaTruong],
		[TenTruong],
		[DienThoai],
		[Email],
		[DiaChi],
		[NgayLap],
		[AnhDaiDien],
		[HieuTruong],
		[Website]
	)
	VALUES
	(
		@MaTruong,
		@TenTruong,
		@DienThoai,
		@Email,
		@DiaChi,
		@NgayLap,
		@AnhDaiDien,
		@HieuTruong,
		@Website
	)


GO
/****** Object:  StoredProcedure [dbo].[sproc_NHATRUONG_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NHATRUONG_Get*/
CREATE PROCEDURE [dbo].[sproc_NHATRUONG_Get]
AS
SELECT
	--[MaTruong],
	--[TenTruong],
	--[DienThoai],
	--[Email],
	--[DiaChi],
	--[NgayLap],
	--[AnhDaiDien],
	--[HieuTruong],
	--[Website]

*
FROM
	[NHATRUONG]


GO
/****** Object:  StoredProcedure [dbo].[sproc_NHATRUONG_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NHATRUONG_GetCount*/
CREATE PROCEDURE [dbo].[sproc_NHATRUONG_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[NHATRUONG]


GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANCONG_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PHANCONG_Add*/
CREATE PROCEDURE [dbo].[sproc_PHANCONG_Add]
	@STT int OUTPUT
	,@MaMonHoc int
	,@MaLop int
	,@MaGiaoVien varchar(10)

AS

	INSERT INTO [PHANCONG]
	(
		[MaMonHoc],
		[MaLop],
		[MaGiaoVien]
	)
	VALUES
	(
		@MaMonHoc,
		@MaLop,
		@MaGiaoVien
	)
	SELECT
		@STT = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANCONG_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PHANCONG_Delete*/
CREATE PROCEDURE [dbo].[sproc_PHANCONG_Delete]
	@STT int
AS
DELETE
FROM
	[PHANCONG]
WHERE
	[STT] = @STT

GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANCONG_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PHANCONG_Get*/
CREATE PROCEDURE [dbo].[sproc_PHANCONG_Get]
AS
SELECT
	--[STT],
	--[MaMonHoc],
	--[MaLop],
	--[MaGiaoVien]

*
FROM
	[PHANCONG]

GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANCONG_GetByMaLop]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_PHANCONG_GetByMaLop]
@MaLop int
AS
SELECT
	--[STT],
	--[MaLop],
	--[MaHocSinh]

*
FROM
	PHANCONG
WHERE
	MaLop = @MaLop
GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANCONG_GetBySTT]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PHANCONG_GetBySTT*/
CREATE PROCEDURE [dbo].[sproc_PHANCONG_GetBySTT]
@STT int
AS
SELECT
	--[STT],
	--[MaMonHoc],
	--[MaLop],
	--[MaGiaoVien]

*
FROM
	[PHANCONG]
WHERE
	[STT] = @STT

GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANCONG_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PHANCONG_GetCount*/
CREATE PROCEDURE [dbo].[sproc_PHANCONG_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[PHANCONG]

GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANCONG_GetPaged]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PHANCONG_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_PHANCONG_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [STT]
FROM [PHANCONG]


-- query out
SELECT *
FROM [PHANCONG]
WHERE [STT]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANCONG_GetXem]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_PHANCONG_GetXem]
@MaLop int
AS
SELECT
	[STT],
	TenGiaoVien,
	TenLop,
	TenMonHoc
FROM
	[PHANCONG] pc, GIAOVIEN gv, MONHOC mh, DSLOP l
	where pc.MaGiaoVien = gv.MaGiaoVien and pc.MaMonHoc = mh.MaMonHoc and pc.MaLop = l.MaLop
	and pc.MaLop =@MaLop
GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANCONG_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PHANCONG_Update*/
CREATE PROCEDURE [dbo].[sproc_PHANCONG_Update]
	@MaMonHoc int,
	@MaLop int,
	@MaGiaoVien varchar(10),
	@STT int

AS
UPDATE [PHANCONG]
SET
	[MaMonHoc] = @MaMonHoc,
	[MaLop] = @MaLop,
	[MaGiaoVien] = @MaGiaoVien
WHERE
	[STT] = @STT

GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANLOP_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PHANLOP_Add*/
CREATE PROCEDURE [dbo].[sproc_PHANLOP_Add]
	@STT int OUTPUT
	,@MaLop int
	,@MaHocSinh varchar(10)

AS

	INSERT INTO [PHANLOP]
	(
		[MaLop],
		[MaHocSinh]
	)
	VALUES
	(
		@MaLop,
		@MaHocSinh
	)
	SELECT
		@STT = @@Identity


GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANLOP_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PHANLOP_Delete*/
CREATE PROCEDURE [dbo].[sproc_PHANLOP_Delete]
	@STT int
AS
DELETE
FROM
	[PHANLOP]
WHERE
	[STT] = @STT

GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANLOP_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_PHANLOP_Get]
AS
SELECT

	hs.[MaHocSinh],
	hs.TenHocSinh,
	l.TenLop


FROM
	[PHANLOP] pl, HOCSINH hs , DSLOP l
	where 
	pl.MaLop = l.MaLop and pl.MaHocSinh = hs.MaHocSinh

GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANLOP_GetByMaLop]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_PHANLOP_GetByMaLop]
@MaLop int
AS
SELECT
	pl.MaHocSinh,
	TenHocSinh
FROM
	[PHANLOP] pl, HOCSINH hs
WHERE
	pl.MaHocSinh = hs.MaHocSinh and
	MaLop = @MaLop
GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANLOP_GetBySTT]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PHANLOP_GetBySTT*/
CREATE PROCEDURE [dbo].[sproc_PHANLOP_GetBySTT]
@STT int
AS
SELECT
	--[STT],
	--[MaLop],
	--[MaHocSinh]

*
FROM
	[PHANLOP]
WHERE
	[STT] = @STT

GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANLOP_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PHANLOP_GetCount*/
CREATE PROCEDURE [dbo].[sproc_PHANLOP_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[PHANLOP]

GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANLOP_GetDSPL]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_PHANLOP_GetDSPL]
@MaLop int
AS
SELECT
	--[STT],
	--[MaLop],
	pl.STT,pl.[MaHocSinh], hs.TenHocSinh , l.TenLop
FROM
	[PHANLOP] pl , HOCSINH hs , DSLOP l 
WHERE
hs.MaHocSinh = pl.MaHocSinh and
pl.MaLop = l.MaLop and

	pl.MaLop = @MaLop
GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANLOP_GetHS]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_PHANLOP_GetHS]
@MaHocSinh varchar(10)
AS
SELECT
	--[STT],
	--[MaLop],
	--[MaHocSinh]

*
FROM
	[PHANLOP]
WHERE
	MaHocSinh = @MaHocSinh
GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANLOP_GetPaged]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PHANLOP_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_PHANLOP_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [STT]
FROM [PHANLOP]


-- query out
SELECT *
FROM [PHANLOP]
WHERE [STT]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANLOP_GetTTByMaLop]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_PHANLOP_GetTTByMaLop]
@MaLop int
AS
SELECT
	--[STT],
	--[MaLop],
	pl.[MaHocSinh], hs.TenHocSinh
FROM
	[PHANLOP] pl , HOCSINH hs 
WHERE
hs.MaHocSinh = pl.MaHocSinh and

	MaLop = @MaLop
GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANLOP_GetTTHSByMaLop]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sproc_PHANLOP_GetTTHSByMaLop]
@MaLop int
AS
SELECT
	--[STT],
	--[MaLop],
	pl.[MaHocSinh], hs.TenHocSinh,hs.NgaySinh,hs.GioiTinh,hs.DiaChi
FROM
	[PHANLOP] pl , HOCSINH hs 
WHERE
hs.MaHocSinh = pl.MaHocSinh and
	MaLop = @MaLop
GO
/****** Object:  StoredProcedure [dbo].[sproc_PHANLOP_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_PHANLOP_Update*/
CREATE PROCEDURE [dbo].[sproc_PHANLOP_Update]
	@MaLop int,
	@MaHocSinh varchar(10),
	@STT int

AS
UPDATE [PHANLOP]
SET
	[MaLop] = @MaLop,
	[MaHocSinh] = @MaHocSinh
WHERE
	[STT] = @STT

GO
/****** Object:  StoredProcedure [dbo].[sproc_QUANTRI_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_QUANTRI_Add]
	@MaND int 
	,@TenDNhap varchar(30)
	,@MatKhau varchar(35)
	,@TrangThai bit

AS

	INSERT INTO [QUANTRI]
	(
		[TenDNhap],
		[MatKhau],
		[TrangThai]
	)
	VALUES
	(
		@TenDNhap,
		@MatKhau,
		@TrangThai
	)
	SELECT
		@MaND = @@Identity

GO
/****** Object:  StoredProcedure [dbo].[sproc_QUANTRI_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_QUANTRI_Delete*/
CREATE PROCEDURE [dbo].[sproc_QUANTRI_Delete]
	@MaND int
AS
DELETE
FROM
	[QUANTRI]
WHERE
	[MaND] = @MaND


GO
/****** Object:  StoredProcedure [dbo].[sproc_QUANTRI_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_QUANTRI_Get*/
CREATE PROCEDURE [dbo].[sproc_QUANTRI_Get]
AS
SELECT
	--[MaND],
	--[TenDNhap],
	--[MatKhau],
	--[TrangThai]

*
FROM
	[QUANTRI]


GO
/****** Object:  StoredProcedure [dbo].[sproc_QUANTRI_GetByMaND]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_QUANTRI_GetByMaND*/
CREATE PROCEDURE [dbo].[sproc_QUANTRI_GetByMaND]
@MaND int
AS
SELECT
	--[MaND],
	--[TenDNhap],
	--[MatKhau],
	--[TrangThai]

*
FROM
	[QUANTRI]
WHERE
	[MaND] = @MaND


GO
/****** Object:  StoredProcedure [dbo].[sproc_QUANTRI_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_QUANTRI_GetCount*/
CREATE PROCEDURE [dbo].[sproc_QUANTRI_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[QUANTRI]


GO
/****** Object:  StoredProcedure [dbo].[sproc_QUANTRI_GetPaged]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_QUANTRI_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_QUANTRI_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [MaND]
FROM [QUANTRI]


-- query out
SELECT *
FROM [QUANTRI]
WHERE [MaND]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index



GO
/****** Object:  StoredProcedure [dbo].[sproc_QUANTRI_GetTT]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_QUANTRI_GetTT]
AS
SELECT
	[QUANTRI].MaND,
	[TenDNhap],
	[MatKhau],
	[TrangThai],
	GIAOVIEN.MaGiaoVien,
	GIAOVIEN.TenGiaoVien,
	LOAINGUOIDUNG.MaLoaiND,
	GIAOVIEN.ChuNhiem,
	GIAOVIEN.MaMon

FROM
	[QUANTRI],GIAOVIEN, LOAINGUOIDUNG
	where QUANTRI.MaND = LOAINGUOIDUNG.MaND and GIAOVIEN.MaGiaoVien = LOAINGUOIDUNG.MaGiaoVien
GO
/****** Object:  StoredProcedure [dbo].[sproc_QUANTRI_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_QUANTRI_Update*/
CREATE PROCEDURE [dbo].[sproc_QUANTRI_Update]
	@TenDNhap varchar(30),
	@MatKhau varchar(35),
	@TrangThai bit,
	@MaND int

AS
UPDATE [QUANTRI]
SET
	[TenDNhap] = @TenDNhap,
	[MatKhau] = @MatKhau,
	[TrangThai] = @TrangThai
WHERE
	[MaND] = @MaND


GO
/****** Object:  StoredProcedure [dbo].[sproc_THOIKHOABIEU_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_THOIKHOABIEU_Add]
	 @MaLop int
	,@Tiet1 nvarchar(30)
	,@Tiet2 nvarchar(30)
	,@Tiet3 nvarchar(30)
	,@Tiet4 nvarchar(30)
	,@Tiet5 nvarchar(30)
	,@TuNgay datetime
	,@DenNgay datetime
	,@MaHK int,
	@TenThu nvarchar(50)

AS

	INSERT INTO [THOIKHOABIEU]
	(
	
		[MaLop],
		[Tiet1],
		[Tiet2],
		[Tiet3],
		[Tiet4],
		[Tiet5],
		[TuNgay],
		[DenNgay],
		[MaHK],
		TenThu
	)
	VALUES
	(
		@MaLop,
		@Tiet1,
		@Tiet2,
		@Tiet3,
		@Tiet4,
		@Tiet5,
		@TuNgay,
		@DenNgay,
		@MaHK,
		@TenThu
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_THOIKHOABIEU_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_THOIKHOABIEU_Delete*/
CREATE PROCEDURE [dbo].[sproc_THOIKHOABIEU_Delete]
	@MaTKB int
AS
DELETE
FROM
	[THOIKHOABIEU]
WHERE
	[MaTKB] = @MaTKB


GO
/****** Object:  StoredProcedure [dbo].[sproc_THOIKHOABIEU_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_THOIKHOABIEU_Get*/
CREATE PROCEDURE [dbo].[sproc_THOIKHOABIEU_Get]
AS
SELECT
	--[MaTKB],
	--[MaLop],
	--[Tiet1],
	--[Tiet2],
	--[Tiet3],
	--[Tiet4],
	--[Tiet5],
	--[TuNgay],
	--[DenNgay],
	--[MaHK]

*
FROM
	[THOIKHOABIEU]


GO
/****** Object:  StoredProcedure [dbo].[sproc_THOIKHOABIEU_GetByMaLopVaHK]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sproc_THOIKHOABIEU_GetByMaLopVaHK]
@MaLop int,
@MaHK int 
AS
SELECT
	--[MaTKB],
	--[MaLop],
	--[Tiet1],
	--[Tiet2],
	--[Tiet3],
	--[Tiet4],
	--[Tiet5],
	--[TuNgay],
	--[DenNgay],
	--[MaHK]

*
FROM
	[THOIKHOABIEU]
WHERE
	[MaLop] = @MaLop and
	MaHK = @MaHK

GO
/****** Object:  StoredProcedure [dbo].[sproc_THOIKHOABIEU_GetByMaTKB]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_THOIKHOABIEU_GetByMaTKB*/
CREATE PROCEDURE [dbo].[sproc_THOIKHOABIEU_GetByMaTKB]
@MaTKB varchar(15)
AS
SELECT
	--[MaTKB],
	--[MaLop],
	--[Tiet1],
	--[Tiet2],
	--[Tiet3],
	--[Tiet4],
	--[Tiet5],
	--[TuNgay],
	--[DenNgay],
	--[MaHK]

*
FROM
	[THOIKHOABIEU]
WHERE
	[MaTKB] = @MaTKB


GO
/****** Object:  StoredProcedure [dbo].[sproc_THOIKHOABIEU_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_THOIKHOABIEU_GetCount*/
CREATE PROCEDURE [dbo].[sproc_THOIKHOABIEU_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[THOIKHOABIEU]


GO
/****** Object:  StoredProcedure [dbo].[sproc_THOIKHOABIEU_GetPaged]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_THOIKHOABIEU_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_THOIKHOABIEU_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	varchar(15)
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [MaTKB]
FROM [THOIKHOABIEU]


-- query out
SELECT *
FROM [THOIKHOABIEU]
WHERE [MaTKB]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index



GO
/****** Object:  StoredProcedure [dbo].[sproc_THOIKHOABIEU_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_THOIKHOABIEU_Update]
	@MaLop int,
	@Tiet1 nvarchar(30),
	@Tiet2 nvarchar(30),
	@Tiet3 nvarchar(30),
	@Tiet4 nvarchar(30),
	@Tiet5 nvarchar(30),
	@TuNgay datetime,
	@DenNgay datetime,
	@MaHK int,
	@MaTKB varchar(15),
	@TenThu nvarchar(50)

AS
UPDATE [THOIKHOABIEU]
SET
	[MaLop] = @MaLop,
	[Tiet1] = @Tiet1,
	[Tiet2] = @Tiet2,
	[Tiet3] = @Tiet3,
	[Tiet4] = @Tiet4,
	[Tiet5] = @Tiet5,
	[TuNgay] = @TuNgay,
	[DenNgay] = @DenNgay,
	[MaHK] = @MaHK,
	TenThu = @TenThu
WHERE
	[MaTKB] = @MaTKB
GO
/****** Object:  StoredProcedure [dbo].[sproc_TINTUC_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_TINTUC_Add*/
CREATE PROCEDURE [dbo].[sproc_TINTUC_Add]
	@MaTinTuc int OUTPUT
	,@TieuDeTin nvarchar(500)
	,@NoiDungTin ntext
	,@MotaNgan ntext
	,@NgayDangTin datetime

AS

	INSERT INTO [TINTUC]
	(
		[TieuDeTin],
		[NoiDungTin],
		[MotaNgan],
		[NgayDangTin]
	)
	VALUES
	(
		@TieuDeTin,
		@NoiDungTin,
		@MotaNgan,
		@NgayDangTin
	)
	SELECT
		@MaTinTuc = @@Identity



GO
/****** Object:  StoredProcedure [dbo].[sproc_TINTUC_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_TINTUC_Delete*/
CREATE PROCEDURE [dbo].[sproc_TINTUC_Delete]
	@MaTinTuc int
AS
DELETE
FROM
	[TINTUC]
WHERE
	[MaTinTuc] = @MaTinTuc


GO
/****** Object:  StoredProcedure [dbo].[sproc_TINTUC_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_TINTUC_Get*/
CREATE PROCEDURE [dbo].[sproc_TINTUC_Get]
AS
SELECT
	--[MaTinTuc],
	--[TieuDeTin],
	--[NoiDungTin],
	--[MotaNgan],
	--[NgayDangTin]

*
FROM
	[TINTUC]


GO
/****** Object:  StoredProcedure [dbo].[sproc_TINTUC_GetByMaTinTuc]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_TINTUC_GetByMaTinTuc*/
CREATE PROCEDURE [dbo].[sproc_TINTUC_GetByMaTinTuc]
@MaTinTuc int
AS
SELECT
	--[MaTinTuc],
	--[TieuDeTin],
	--[NoiDungTin],
	--[MotaNgan],
	--[NgayDangTin]

*
FROM
	[TINTUC]
WHERE
	[MaTinTuc] = @MaTinTuc


GO
/****** Object:  StoredProcedure [dbo].[sproc_TINTUC_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_TINTUC_GetCount*/
CREATE PROCEDURE [dbo].[sproc_TINTUC_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[TINTUC]


GO
/****** Object:  StoredProcedure [dbo].[sproc_TINTUC_GetPaged]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_TINTUC_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_TINTUC_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [MaTinTuc]
FROM [TINTUC]


-- query out
SELECT *
FROM [TINTUC]
WHERE [MaTinTuc]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index



GO
/****** Object:  StoredProcedure [dbo].[sproc_TINTUC_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_TINTUC_Update*/
CREATE PROCEDURE [dbo].[sproc_TINTUC_Update]
	@TieuDeTin nvarchar(500),
	@NoiDungTin ntext,
	@MotaNgan ntext,
	@NgayDangTin datetime,
	@MaTinTuc int

AS
UPDATE [TINTUC]
SET
	[TieuDeTin] = @TieuDeTin,
	[NoiDungTin] = @NoiDungTin,
	[MotaNgan] = @MotaNgan,
	[NgayDangTin] = @NgayDangTin
WHERE
	[MaTinTuc] = @MaTinTuc


GO
/****** Object:  StoredProcedure [dbo].[sproc_TOBOMON_Add]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_TOBOMON_Add]
	@MaTo int
	,@TenToBoMon nvarchar(100)
	,@MoTa nvarchar(200)

AS

	INSERT INTO [TOBOMON]
	(
		[TenToBoMon],
		[MoTa]
	)
	VALUES
	(
		@TenToBoMon,
		@MoTa
	)
	SELECT
		@MaTo = @@Identity

GO
/****** Object:  StoredProcedure [dbo].[sproc_TOBOMON_Delete]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_TOBOMON_Delete*/
CREATE PROCEDURE [dbo].[sproc_TOBOMON_Delete]
	@MaTo int
AS
DELETE
FROM
	[TOBOMON]
WHERE
	[MaTo] = @MaTo


GO
/****** Object:  StoredProcedure [dbo].[sproc_TOBOMON_Get]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_TOBOMON_Get*/
CREATE PROCEDURE [dbo].[sproc_TOBOMON_Get]
AS
SELECT
	--[MaTo],
	--[MaLoaiND],
	--[TenToBoMon],
	--[MoTa]

*
FROM
	[TOBOMON]


GO
/****** Object:  StoredProcedure [dbo].[sproc_TOBOMON_GetByMaTo]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_TOBOMON_GetByMaTo*/
CREATE PROCEDURE [dbo].[sproc_TOBOMON_GetByMaTo]
@MaTo int
AS
SELECT
	--[MaTo],
	--[MaLoaiND],
	--[TenToBoMon],
	--[MoTa]

*
FROM
	[TOBOMON]
WHERE
	[MaTo] = @MaTo


GO
/****** Object:  StoredProcedure [dbo].[sproc_TOBOMON_GetCount]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_TOBOMON_GetCount*/
CREATE PROCEDURE [dbo].[sproc_TOBOMON_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[TOBOMON]


GO
/****** Object:  StoredProcedure [dbo].[sproc_TOBOMON_GetPaged]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_TOBOMON_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_TOBOMON_GetPaged]
	@RecPerPage INT,
	@PageIndex INT
AS

DECLARE @FirstRec INT
DECLARE @LastRec INT

SET @FirstRec = (@PageIndex - 1)*@RecPerPage + 1
SET @LastRec = @PageIndex *@RecPerPage 

-- create temp table to paging
CREATE TABLE #tmp_paging_index
(
	recID		INT IDENTITY(1,1) NOT NULL,
	messageID	int
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [MaTo]
FROM [TOBOMON]


-- query out
SELECT *
FROM [TOBOMON]
WHERE [MaTo]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index



GO
/****** Object:  StoredProcedure [dbo].[sproc_TOBOMON_Update]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_TOBOMON_Update]
	@TenToBoMon nvarchar(100),
	@MoTa nvarchar(200),
	@MaTo int

AS
UPDATE [TOBOMON]
SET
	[TenToBoMon] = @TenToBoMon,
	[MoTa] = @MoTa
WHERE
	[MaTo] = @MaTo
GO
/****** Object:  UserDefinedFunction [dbo].[fnChuyenKhongDau]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnChuyenKhongDau](@strInput NVARCHAR(50)) 
RETURNS NVARCHAR(50)
AS
BEGIN     
    IF @strInput IS NULL RETURN @strInput
    IF @strInput = '' RETURN @strInput
    DECLARE @RT NVARCHAR(50)
    DECLARE @SIGN_CHARS NCHAR(136)
    DECLARE @UNSIGN_CHARS NCHAR (136)

    SET @SIGN_CHARS       = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệếìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵýĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ'+NCHAR(272)+ NCHAR(208)
    SET @UNSIGN_CHARS =     N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeeeiiiiiooooooooooooooouuuuuuuuuuyyyyyAADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD'

    DECLARE @COUNTER int
    DECLARE @COUNTER1 int
    SET @COUNTER = 1
 
    WHILE (@COUNTER <=LEN(@strInput))
    BEGIN   
      SET @COUNTER1 = 1
      --Tim trong chuoi mau
       WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1)
       BEGIN
     IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) )
     BEGIN           
          IF @COUNTER=1
              SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1)                   
          ELSE
              SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER)    
              BREAK         
               END
             SET @COUNTER1 = @COUNTER1 +1
       END
      --Tim tiep
       SET @COUNTER = @COUNTER +1
    END
    RETURN @strInput
END






GO
/****** Object:  Table [dbo].[BANGDIEM]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BANGDIEM](
	[MaHocSinh] [varchar](10) NOT NULL,
	[MaMonHoc] [int] NOT NULL,
	[DM_1] [real] NOT NULL,
	[DM_2] [real] NOT NULL,
	[D15_1] [real] NOT NULL,
	[D15_2] [real] NOT NULL,
	[D15_3] [real] NOT NULL,
	[D1T_1] [real] NOT NULL,
	[D1T_2] [real] NOT NULL,
	[Malop] [int] NOT NULL,
	[MaHK] [int] NOT NULL,
	[DThi] [real] NOT NULL,
 CONSTRAINT [PK_BANGDIEM_1] PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC,
	[MaMonHoc] ASC,
	[Malop] ASC,
	[MaHK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BANNER]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANNER](
	[TenBanner] [nvarchar](50) NOT NULL,
	[Link] [nchar](100) NOT NULL,
	[MoTa] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHUYENLOP]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHUYENLOP](
	[TuLop] [varchar](15) NOT NULL,
	[DenLop] [varchar](15) NOT NULL,
	[NgayChuyen] [datetime] NOT NULL,
	[LyDoChuyen] [nvarchar](500) NULL,
	[ChuyenBangDiem] [bit] NULL,
	[MaHocSinh] [varchar](10) NOT NULL,
 CONSTRAINT [PK_CHUYENLOP] PRIMARY KEY CLUSTERED 
(
	[TuLop] ASC,
	[DenLop] ASC,
	[NgayChuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DSLOP]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DSLOP](
	[MaLop] [int] IDENTITY(1,1) NOT NULL,
	[TenLop] [nvarchar](50) NOT NULL,
	[MaKhoi] [int] NOT NULL,
	[SiSo] [int] NOT NULL,
	[MoTaKhac] [nvarchar](500) NULL,
 CONSTRAINT [PK_LOP] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GIAOVIEN]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GIAOVIEN](
	[MaGiaoVien] [varchar](10) NOT NULL,
	[TenGiaoVien] [nvarchar](50) NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[GioiTinh] [nvarchar](10) NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[SoDienThoai] [nchar](20) NOT NULL,
	[ChuNhiem] [bit] NOT NULL,
	[MaMon] [int] NOT NULL,
 CONSTRAINT [PK_GIAOVIEN] PRIMARY KEY CLUSTERED 
(
	[MaGiaoVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HANHKIEM]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HANHKIEM](
	[MaHS] [varchar](10) NOT NULL,
	[MaLop] [int] NOT NULL,
	[MaHK] [int] NOT NULL,
	[NgayNghiCoPhep] [int] NULL,
	[NgayNghiKoPhep] [int] NULL,
	[SoLanKyLuat] [int] NULL,
	[HanhKiem] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_HANHKIEM] PRIMARY KEY CLUSTERED 
(
	[MaHS] ASC,
	[MaLop] ASC,
	[MaHK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HOCKY]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCKY](
	[MaHK] [int] IDENTITY(1,1) NOT NULL,
	[TenHK] [nvarchar](50) NOT NULL,
	[TuNgay] [datetime] NOT NULL,
	[DenNgay] [datetime] NOT NULL,
 CONSTRAINT [PK_HOCKY] PRIMARY KEY CLUSTERED 
(
	[MaHK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOCSINH]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HOCSINH](
	[MaHocSinh] [varchar](10) NOT NULL,
	[TenHocSinh] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](5) NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[NoiSinh] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[NgayNhapHoc] [datetime] NOT NULL,
	[HoTenBo] [nvarchar](30) NULL,
	[HoTenMe] [nvarchar](30) NULL,
	[Anh] [nchar](10) NULL,
	[NgheBo] [nvarchar](50) NULL,
	[NgheMe] [nvarchar](50) NULL,
	[NgayVaoDoan] [datetime] NOT NULL,
	[TrangThai] [nvarchar](30) NOT NULL,
	[MaNamHoc] [int] NULL,
	[SoDienThoaiNha] [nchar](20) NULL,
 CONSTRAINT [PK_HOCSINH] PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHENTHUONG]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHENTHUONG](
	[KhoiHoc] [int] NOT NULL,
	[HocSinh] [varchar](10) NOT NULL,
	[Lop] [int] NOT NULL,
	[HinhThucKhen] [nvarchar](50) NOT NULL,
	[NgayKhen] [datetime] NOT NULL,
	[NoiDungKhen] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_KHENTHUONG] PRIMARY KEY CLUSTERED 
(
	[KhoiHoc] ASC,
	[HocSinh] ASC,
	[Lop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHOILOP]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOILOP](
	[MaKhoi] [int] IDENTITY(1,1) NOT NULL,
	[MaNamHoc] [int] NOT NULL,
	[TenKhoi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_KHOILOP] PRIMARY KEY CLUSTERED 
(
	[MaKhoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KYLUAT]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KYLUAT](
	[KhoiHoc] [int] NOT NULL,
	[Lop] [int] NOT NULL,
	[HocSinh] [varchar](10) NOT NULL,
	[HinhThucKyLuat] [nvarchar](50) NOT NULL,
	[NgayKyLuat] [datetime] NOT NULL,
	[NoiDung] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_KYLUAT] PRIMARY KEY CLUSTERED 
(
	[KhoiHoc] ASC,
	[Lop] ASC,
	[HocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOAINGUOIDUNG]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOAINGUOIDUNG](
	[MaLoaiND] [varchar](10) NOT NULL,
	[MaND] [int] NOT NULL,
	[MaGiaoVien] [varchar](10) NOT NULL,
	[TenLoaiND] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_LOAINGUOIDUNG] PRIMARY KEY CLUSTERED 
(
	[MaND] ASC,
	[MaGiaoVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MONHOC]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MONHOC](
	[MaMonHoc] [int] IDENTITY(1,1) NOT NULL,
	[MaTo] [int] NOT NULL,
	[TenMonHoc] [nvarchar](50) NOT NULL,
	[SoTiet] [int] NOT NULL,
	[HeSo] [int] NOT NULL,
 CONSTRAINT [PK_MONHOC] PRIMARY KEY CLUSTERED 
(
	[MaMonHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NAMHOC]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NAMHOC](
	[MaNamHoc] [int] IDENTITY(1,1) NOT NULL,
	[TenNamHoc] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_NAMHOC] PRIMARY KEY CLUSTERED 
(
	[MaNamHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHATRUONG]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHATRUONG](
	[MaTruong] [nvarchar](6) NOT NULL,
	[TenTruong] [nvarchar](200) NOT NULL,
	[DienThoai] [nchar](20) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[NgayLap] [datetime] NULL,
	[AnhDaiDien] [nchar](100) NULL,
	[HieuTruong] [nvarchar](30) NOT NULL,
	[Website] [nchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHANCONG]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHANCONG](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[MaMonHoc] [int] NOT NULL,
	[MaLop] [int] NOT NULL,
	[MaGiaoVien] [varchar](10) NOT NULL,
 CONSTRAINT [PK_PHANCONG] PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHANLOP]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHANLOP](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[MaLop] [int] NOT NULL,
	[MaHocSinh] [varchar](10) NOT NULL,
 CONSTRAINT [PK_PHANLOP] PRIMARY KEY CLUSTERED 
(
	[STT] ASC,
	[MaLop] ASC,
	[MaHocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QUANTRI]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QUANTRI](
	[MaND] [int] IDENTITY(1,1) NOT NULL,
	[TenDNhap] [varchar](30) NOT NULL,
	[MatKhau] [varchar](100) NOT NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_NGUOIDUNG] PRIMARY KEY CLUSTERED 
(
	[MaND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[THOIKHOABIEU]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THOIKHOABIEU](
	[MaTKB] [int] IDENTITY(1,1) NOT NULL,
	[TenThu] [nvarchar](50) NULL,
	[MaLop] [int] NOT NULL,
	[Tiet1] [nvarchar](30) NOT NULL,
	[Tiet2] [nvarchar](30) NOT NULL,
	[Tiet3] [nvarchar](30) NULL,
	[Tiet4] [nvarchar](30) NULL,
	[Tiet5] [nvarchar](30) NULL,
	[TuNgay] [datetime] NULL,
	[DenNgay] [datetime] NULL,
	[MaHK] [int] NOT NULL,
 CONSTRAINT [PK_THOIKHOABIEU_1] PRIMARY KEY CLUSTERED 
(
	[MaTKB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TINTUC]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TINTUC](
	[MaTinTuc] [int] IDENTITY(1,1) NOT NULL,
	[TieuDeTin] [nvarchar](500) NOT NULL,
	[NoiDungTin] [nvarchar](max) NULL,
	[MotaNgan] [ntext] NULL,
	[NgayDangTin] [datetime] NULL,
 CONSTRAINT [PK_TINTUC] PRIMARY KEY CLUSTERED 
(
	[MaTinTuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TOBOMON]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOBOMON](
	[MaTo] [int] IDENTITY(1,1) NOT NULL,
	[TenToBoMon] [nvarchar](100) NOT NULL,
	[MoTa] [nvarchar](200) NULL,
 CONSTRAINT [PK_TOBOMON] PRIMARY KEY CLUSTERED 
(
	[MaTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Xemhstheolop]    Script Date: 11/30/2014 10:54:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Xemhstheolop]
as
select MaHocSinh, hs.TenHocSinh, hs.NgaySinh, hs.GioiTinh,hs.DiaChi,l.TenLop
from HOCSINH hs, DSLOP l
where hs.MaLop = l.MaLop

GO
INSERT [dbo].[BANGDIEM] ([MaHocSinh], [MaMonHoc], [DM_1], [DM_2], [D15_1], [D15_2], [D15_3], [D1T_1], [D1T_2], [Malop], [MaHK], [DThi]) VALUES (N'HS001', 1, 8, 8, 9, 6, 7, 5, 5, 4, 1, 9)
INSERT [dbo].[BANGDIEM] ([MaHocSinh], [MaMonHoc], [DM_1], [DM_2], [D15_1], [D15_2], [D15_3], [D1T_1], [D1T_2], [Malop], [MaHK], [DThi]) VALUES (N'HS001', 1, 7, 7, 7, 5, 7, 4, 6, 4, 2, 10)
INSERT [dbo].[BANGDIEM] ([MaHocSinh], [MaMonHoc], [DM_1], [DM_2], [D15_1], [D15_2], [D15_3], [D1T_1], [D1T_2], [Malop], [MaHK], [DThi]) VALUES (N'HS001', 4, 8, 8, 9, 6, 7, 6, 5, 4, 1, 9)
INSERT [dbo].[BANGDIEM] ([MaHocSinh], [MaMonHoc], [DM_1], [DM_2], [D15_1], [D15_2], [D15_3], [D1T_1], [D1T_2], [Malop], [MaHK], [DThi]) VALUES (N'HS001', 4, 5, 8, 9, 5, 3, 9, 8, 4, 2, 9)
INSERT [dbo].[BANGDIEM] ([MaHocSinh], [MaMonHoc], [DM_1], [DM_2], [D15_1], [D15_2], [D15_3], [D1T_1], [D1T_2], [Malop], [MaHK], [DThi]) VALUES (N'HS002', 1, 9, 8, 9, 9, 9, 9, 8, 4, 1, 6)
INSERT [dbo].[BANGDIEM] ([MaHocSinh], [MaMonHoc], [DM_1], [DM_2], [D15_1], [D15_2], [D15_3], [D1T_1], [D1T_2], [Malop], [MaHK], [DThi]) VALUES (N'HS002', 4, 9, 8, 10, 10, 10, 10, 6, 4, 1, 10)
INSERT [dbo].[BANGDIEM] ([MaHocSinh], [MaMonHoc], [DM_1], [DM_2], [D15_1], [D15_2], [D15_3], [D1T_1], [D1T_2], [Malop], [MaHK], [DThi]) VALUES (N'HS014', 4, 9, 4, 9, 9, 6, 7, 3, 5, 1, 7)
INSERT [dbo].[BANGDIEM] ([MaHocSinh], [MaMonHoc], [DM_1], [DM_2], [D15_1], [D15_2], [D15_3], [D1T_1], [D1T_2], [Malop], [MaHK], [DThi]) VALUES (N'HS015', 1, 6, 6, 6, 6, 6, 6, 6, 6, 1, 9)
INSERT [dbo].[BANGDIEM] ([MaHocSinh], [MaMonHoc], [DM_1], [DM_2], [D15_1], [D15_2], [D15_3], [D1T_1], [D1T_2], [Malop], [MaHK], [DThi]) VALUES (N'HS015', 3, 8, 9, 7, 8, 9, 8, 9, 6, 1, 10)
INSERT [dbo].[BANGDIEM] ([MaHocSinh], [MaMonHoc], [DM_1], [DM_2], [D15_1], [D15_2], [D15_3], [D1T_1], [D1T_2], [Malop], [MaHK], [DThi]) VALUES (N'HS015', 4, 9, 9, 9, 9, 9, 9, 9, 6, 1, 9)
INSERT [dbo].[BANGDIEM] ([MaHocSinh], [MaMonHoc], [DM_1], [DM_2], [D15_1], [D15_2], [D15_3], [D1T_1], [D1T_2], [Malop], [MaHK], [DThi]) VALUES (N'HS018', 1, 9, 9, 8, 7, 4, 5, 7, 6, 1, 6)
INSERT [dbo].[BANGDIEM] ([MaHocSinh], [MaMonHoc], [DM_1], [DM_2], [D15_1], [D15_2], [D15_3], [D1T_1], [D1T_2], [Malop], [MaHK], [DThi]) VALUES (N'HS018', 4, 8, 9, 6, 5, 4, 7, 5, 6, 1, 9)
INSERT [dbo].[BANNER] ([TenBanner], [Link], [MoTa]) VALUES (N'1', N'anh1.jpg                                                                                            ', N'')
INSERT [dbo].[BANNER] ([TenBanner], [Link], [MoTa]) VALUES (N'2', N'anh2.jpg                                                                                            ', N'')
INSERT [dbo].[BANNER] ([TenBanner], [Link], [MoTa]) VALUES (N'3', N'anh3.jpg                                                                                            ', N'')
INSERT [dbo].[BANNER] ([TenBanner], [Link], [MoTa]) VALUES (N'4', N'anh4.jpg                                                                                            ', N'')
INSERT [dbo].[BANNER] ([TenBanner], [Link], [MoTa]) VALUES (N'5', N'anh5.jpg                                                                                            ', N'')
INSERT [dbo].[BANNER] ([TenBanner], [Link], [MoTa]) VALUES (N'6', N'anh6.jpg                                                                                            ', N'')
INSERT [dbo].[BANNER] ([TenBanner], [Link], [MoTa]) VALUES (N'7', N'anh7.jpg                                                                                            ', N'')
SET IDENTITY_INSERT [dbo].[DSLOP] ON 

INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (4, N'Lớp 10A1', 1, 32, N'Lớp chọn')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (5, N'Lớp 10A2', 1, 35, N'Lớp thường')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (6, N'Lớp 10A4', 1, 33, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (7, N'Lớp 10A5', 1, 32, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (8, N'Lớp 10A6', 1, 31, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (9, N'Lớp 10A7', 1, 34, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (10, N'Lớp 10A8', 1, 35, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (11, N'Lớp 10A9', 1, 36, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (12, N'Lớp 10A10', 1, 33, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (13, N'Lớp 11A1', 2, 32, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (14, N'Lớp 11A2', 2, 34, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (15, N'Lớp 11A3', 2, 31, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (16, N'Lớp 12A1', 3, 32, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (17, N'Lớp 12A2', 3, 34, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (18, N'Lớp 12A3', 3, 31, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (19, N'Lớp 12A4', 3, 32, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (20, N'Lớp 12A5', 3, 34, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (21, N'Lớp 12A6', 3, 31, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (22, N'Lớp 12A7', 3, 32, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (23, N'Lớp 12A8', 3, 34, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (24, N'Lớp 12A9', 3, 31, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (25, N'Lớp 10A4', 4, 33, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (26, N'Lớp 10A5', 4, 32, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (27, N'Lớp 10A6', 4, 31, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (28, N'Lớp 10A7', 4, 34, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (29, N'Lớp 10A8', 4, 35, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (30, N'Lớp 10A9', 4, 36, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (31, N'Lớp 10A10', 4, 33, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (32, N'Lớp 11A1', 5, 32, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (33, N'Lớp 11A2', 5, 34, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (34, N'Lớp 11A3', 5, 31, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (35, N'Lớp 11A4', 5, 32, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (36, N'Lớp 12A1', 6, 32, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (37, N'Lớp 12A2', 6, 34, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (38, N'Lớp 12A3', 6, 31, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (39, N'Lớp 12A4', 6, 32, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (40, N'Lớp 12A5', 6, 34, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (41, N'Lớp 12A6', 6, 31, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (42, N'Lớp 12A7', 6, 32, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (43, N'Lớp 12A8', 6, 34, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (44, N'Lớp 12A9', 6, 31, N'')
INSERT [dbo].[DSLOP] ([MaLop], [TenLop], [MaKhoi], [SiSo], [MoTaKhac]) VALUES (48, N'Lớp 10A11', 1, 34, N'rewrwer')
SET IDENTITY_INSERT [dbo].[DSLOP] OFF
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'Admin', N'Nguyễn Trung Đức', CAST(0x00007DCE00000000 AS DateTime), N'Nam', N'Sóc sơn - Hà nội', N'01166565656         ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV001', N'Nguyễn Mạnh Trí', CAST(0x000081A100000000 AS DateTime), N'Nam', N'Sóc sơn - Hà nội', N'0595999898          ', 1, 4)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV002', N'Nguyễn văn trường', CAST(0x0000768B00000000 AS DateTime), N'Nam', N'Hà nội', N'0999898989          ', 1, 2)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV003', N'Phạm quang trung', CAST(0x00007C4000000000 AS DateTime), N'Nam', N'Yên Bái', N'0645465466          ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV004', N'Nguyễn Văn An', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV005', N'Nguyễn Văn Ánh', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV006', N'Nguyễn Văn Bình', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV007', N'Nguyễn Văn Cường', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV008', N'Nguyễn Văn Nam', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV009', N'Nguyễn Văn Hải', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 2)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV010', N'Nguyễn Văn Hậu', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV011', N'Nguyễn Văn Quyền', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV012', N'Nguyễn Văn Tấn', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV013', N'Nguyễn Văn Quốc', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV014', N'Nguyễn Văn Toản', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 2)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV015', N'Nguyễn Văn Đức', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV016', N'Nguyễn Văn Trí', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV017', N'Nguyễn Văn Tiến', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV018', N'Nguyễn Văn Quân', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV019', N'Nguyễn Văn Dũng', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV020', N'Nguyễn Văn Thắng', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 2)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV021', N'Nguyễn Văn Lợi', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV022', N'Nguyễn Văn Mỹ', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV023', N'Nguyễn Văn Trường', CAST(0x00007F1B00000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0978978555          ', 1, 1)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV024', N'Phạm Hồng Tuấn', CAST(0x0000724700000000 AS DateTime), N'Nam', N'Phố cổ - Hội An - Hà Nội', N'0981533332          ', 1, 2)
INSERT [dbo].[GIAOVIEN] ([MaGiaoVien], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [ChuNhiem], [MaMon]) VALUES (N'GV025', N'Nguyễn Phú Trọng', CAST(0x0000806800000000 AS DateTime), N'Nam', N'Cầu giấy - Hà nội', N'0987754545          ', 0, 1)
INSERT [dbo].[HANHKIEM] ([MaHS], [MaLop], [MaHK], [NgayNghiCoPhep], [NgayNghiKoPhep], [SoLanKyLuat], [HanhKiem]) VALUES (N'HS001', 4, 1, 3, 3, 4, N'Khá')
INSERT [dbo].[HANHKIEM] ([MaHS], [MaLop], [MaHK], [NgayNghiCoPhep], [NgayNghiKoPhep], [SoLanKyLuat], [HanhKiem]) VALUES (N'HS001', 4, 2, 2, 2, 1, N'Tốt')
INSERT [dbo].[HANHKIEM] ([MaHS], [MaLop], [MaHK], [NgayNghiCoPhep], [NgayNghiKoPhep], [SoLanKyLuat], [HanhKiem]) VALUES (N'HS002', 4, 1, 1, 1, 1, N'Tốt')
INSERT [dbo].[HANHKIEM] ([MaHS], [MaLop], [MaHK], [NgayNghiCoPhep], [NgayNghiKoPhep], [SoLanKyLuat], [HanhKiem]) VALUES (N'HS002', 4, 2, 3, 1, 4, N'Tốt')
SET IDENTITY_INSERT [dbo].[HOCKY] ON 

INSERT [dbo].[HOCKY] ([MaHK], [TenHK], [TuNgay], [DenNgay]) VALUES (1, N'Học kỳ 1', CAST(0x0000A2C700000000 AS DateTime), CAST(0x0000A34200000000 AS DateTime))
INSERT [dbo].[HOCKY] ([MaHK], [TenHK], [TuNgay], [DenNgay]) VALUES (2, N'Học kỳ 2', CAST(0x0000A3A100000000 AS DateTime), CAST(0x0000A2A600000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[HOCKY] OFF
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [Email], [GioiTinh], [NgaySinh], [NoiSinh], [DiaChi], [NgayNhapHoc], [HoTenBo], [HoTenMe], [Anh], [NgheBo], [NgheMe], [NgayVaoDoan], [TrangThai], [MaNamHoc], [SoDienThoaiNha]) VALUES (N'HS001', N'Nguyễn văn an', N'anhtrung@gmail.com', N'Nữ', CAST(0x0000873700000000 AS DateTime), N'Hà nội', N'Hà nội', CAST(0x00009C9E00000000 AS DateTime), N'Nguyễn văn bình', N'Nguyễn thị lý', N'HS001.jpg ', N'Công nhân ', N'Làm ruộng ', CAST(0x00009A3600000000 AS DateTime), N'Đang học', 1, N'0465656565          ')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [Email], [GioiTinh], [NgaySinh], [NoiSinh], [DiaChi], [NgayNhapHoc], [HoTenBo], [HoTenMe], [Anh], [NgheBo], [NgheMe], [NgayVaoDoan], [TrangThai], [MaNamHoc], [SoDienThoaiNha]) VALUES (N'HS002', N'Nguyễn thị hoài', N'a', N'Nữ', CAST(0x0000861D00000000 AS DateTime), N'Hải phòng', N'Hải phòng', CAST(0x00009CBE00000000 AS DateTime), N'Nguyễn Tuấn tú', N'Nguyễn thị trà', N'HS002.jpg ', N'Công nhân ', N'Công nhân ', CAST(0x00009BA500000000 AS DateTime), N'Đang học', 1, N'0565456465          ')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [Email], [GioiTinh], [NgaySinh], [NoiSinh], [DiaChi], [NgayNhapHoc], [HoTenBo], [HoTenMe], [Anh], [NgheBo], [NgheMe], [NgayVaoDoan], [TrangThai], [MaNamHoc], [SoDienThoaiNha]) VALUES (N'HS003', N'Nguyễn trung dũng', N'abc@gmail.com', N'Nam', CAST(0x0000A30000000000 AS DateTime), N'Phú thọ', N'Phú thọ', CAST(0x0000A30500000000 AS DateTime), N'Nguyễn trung đức', N'Nguyễn thị an', N'HS003.jpg ', N'Làm ruộng ', N'làm ruộng ', CAST(0x0000A30100000000 AS DateTime), N'Đang học', 1, N'24040045040         ')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [Email], [GioiTinh], [NgaySinh], [NoiSinh], [DiaChi], [NgayNhapHoc], [HoTenBo], [HoTenMe], [Anh], [NgheBo], [NgheMe], [NgayVaoDoan], [TrangThai], [MaNamHoc], [SoDienThoaiNha]) VALUES (N'HS008', N'Đức', N'd', N'Nam', CAST(0x0000A30700000000 AS DateTime), N'd', N'Hà nội', CAST(0x0000A30500000000 AS DateTime), N'd', N'd', N'2.jpg     ', N'd         ', N'd         ', CAST(0x0000A30200000000 AS DateTime), N'Đang học', 1, N'111111              ')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [Email], [GioiTinh], [NgaySinh], [NoiSinh], [DiaChi], [NgayNhapHoc], [HoTenBo], [HoTenMe], [Anh], [NgheBo], [NgheMe], [NgayVaoDoan], [TrangThai], [MaNamHoc], [SoDienThoaiNha]) VALUES (N'HS010', N'Hùng', N'sâs', N'Nam', CAST(0x0000A30700000000 AS DateTime), N's', N'Phú thọ', CAST(0x0000A30500000000 AS DateTime), N'sa', N's', N'anh2.jpg  ', N'sa        ', N'á         ', CAST(0x0000A30200000000 AS DateTime), N'Đang học', 1, N'232323              ')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [Email], [GioiTinh], [NgaySinh], [NoiSinh], [DiaChi], [NgayNhapHoc], [HoTenBo], [HoTenMe], [Anh], [NgheBo], [NgheMe], [NgayVaoDoan], [TrangThai], [MaNamHoc], [SoDienThoaiNha]) VALUES (N'HS011', N'Đức', N'd', N'Nam', CAST(0x0000A30700000000 AS DateTime), N'd', N'd', CAST(0x0000A30500000000 AS DateTime), N's', N's', N'anh2.jpg  ', N's         ', N's         ', CAST(0x0000A30200000000 AS DateTime), N'Đang học', 1, N'54545               ')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [Email], [GioiTinh], [NgaySinh], [NoiSinh], [DiaChi], [NgayNhapHoc], [HoTenBo], [HoTenMe], [Anh], [NgheBo], [NgheMe], [NgayVaoDoan], [TrangThai], [MaNamHoc], [SoDienThoaiNha]) VALUES (N'HS012', N'Hoàng Thắng', N'ád', N'Nam', CAST(0x0000A30700000000 AS DateTime), N'ád', N'd', CAST(0x0000A30500000000 AS DateTime), N'sad', N'ád', N'2.jpg     ', N'sad       ', N'ád        ', CAST(0x0000A30200000000 AS DateTime), N'Đang học', 1, N'232131              ')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [Email], [GioiTinh], [NgaySinh], [NoiSinh], [DiaChi], [NgayNhapHoc], [HoTenBo], [HoTenMe], [Anh], [NgheBo], [NgheMe], [NgayVaoDoan], [TrangThai], [MaNamHoc], [SoDienThoaiNha]) VALUES (N'HS014', N'Huỳnh Trung Đức', N'anhtrungduc1993@gmail.com', N'Nam', CAST(0x0000A30700000000 AS DateTime), N'Hà Nội', N'Đông Xuân', CAST(0x0000A30500000000 AS DateTime), N'Nguyễn Phú Trọng', N'Huỳnh Thủy Tiên', N'2.jpg     ', N'Công chức ', N'Công chức ', CAST(0x0000A30200000000 AS DateTime), N'Đang học', 1, N'01516556465         ')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [Email], [GioiTinh], [NgaySinh], [NoiSinh], [DiaChi], [NgayNhapHoc], [HoTenBo], [HoTenMe], [Anh], [NgheBo], [NgheMe], [NgayVaoDoan], [TrangThai], [MaNamHoc], [SoDienThoaiNha]) VALUES (N'HS015', N'Hoàng Văn Minh', N'hoangminh@gmail.com', N'Nam', CAST(0x0000A32400000000 AS DateTime), N'Đông Anh ', N'Đông Anh', CAST(0x0000A32A00000000 AS DateTime), N'Nguyễn Văn Hiếu', N'Nguyễn Thị Nguyệt', N'anh2.jpg  ', N'Công nhân ', N'Công Nhân ', CAST(0x0000A33900000000 AS DateTime), N'Đang học', 1, N'0984545454          ')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [Email], [GioiTinh], [NgaySinh], [NoiSinh], [DiaChi], [NgayNhapHoc], [HoTenBo], [HoTenMe], [Anh], [NgheBo], [NgheMe], [NgayVaoDoan], [TrangThai], [MaNamHoc], [SoDienThoaiNha]) VALUES (N'HS018', N'Hoàng Văn Thúy', N'ad', N'Nữ', CAST(0x0000A32300000000 AS DateTime), N'Hải Dương', N'Hà Nội', CAST(0x0000A31A00000000 AS DateTime), N'Anh', N'Hoa', N'HS018.jpg ', N'CN        ', N'LR        ', CAST(0x0000A32200000000 AS DateTime), N'Đang học', 1, N'123456              ')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [Email], [GioiTinh], [NgaySinh], [NoiSinh], [DiaChi], [NgayNhapHoc], [HoTenBo], [HoTenMe], [Anh], [NgheBo], [NgheMe], [NgayVaoDoan], [TrangThai], [MaNamHoc], [SoDienThoaiNha]) VALUES (N'HS019', N'Phạm Hùng', N's', N'Nam', CAST(0x0000A32300000000 AS DateTime), N's', N's', CAST(0x0000A32300000000 AS DateTime), N's', N's', N'          ', N's         ', N's         ', CAST(0x0000A32200000000 AS DateTime), N'Đang học', 1, N'2                   ')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [Email], [GioiTinh], [NgaySinh], [NoiSinh], [DiaChi], [NgayNhapHoc], [HoTenBo], [HoTenMe], [Anh], [NgheBo], [NgheMe], [NgayVaoDoan], [TrangThai], [MaNamHoc], [SoDienThoaiNha]) VALUES (N'HS020', N'Văn Hiêu', N'x', N'Nam', CAST(0x0000A32B00000000 AS DateTime), N'x', N'x', CAST(0x0000A33100000000 AS DateTime), N'x', N'x', N'          ', N'x         ', N'x         ', CAST(0x0000A33B00000000 AS DateTime), N'Đang học', 1, N'32                  ')
INSERT [dbo].[HOCSINH] ([MaHocSinh], [TenHocSinh], [Email], [GioiTinh], [NgaySinh], [NoiSinh], [DiaChi], [NgayNhapHoc], [HoTenBo], [HoTenMe], [Anh], [NgheBo], [NgheMe], [NgayVaoDoan], [TrangThai], [MaNamHoc], [SoDienThoaiNha]) VALUES (N'HS031', N'56u', N'dá ', N'Nam', CAST(0x0000A32300000000 AS DateTime), N'd', N'd', CAST(0x0000A31D00000000 AS DateTime), N'd', N'd', N'2.jpg     ', N'd         ', N'd         ', CAST(0x0000A33A00000000 AS DateTime), N'Đang học', 1, N'34343               ')
INSERT [dbo].[KHENTHUONG] ([KhoiHoc], [HocSinh], [Lop], [HinhThucKhen], [NgayKhen], [NoiDungKhen]) VALUES (1, N'HS001', 4, N'32232323', CAST(0x0000A32300000000 AS DateTime), N'asdadasdsa ')
INSERT [dbo].[KHENTHUONG] ([KhoiHoc], [HocSinh], [Lop], [HinhThucKhen], [NgayKhen], [NoiDungKhen]) VALUES (1, N'HS002', 4, N'Giấy khen', CAST(0x0000A32200000000 AS DateTime), N'Đạt danh hiệu học sinh tiên tiến')
INSERT [dbo].[KHENTHUONG] ([KhoiHoc], [HocSinh], [Lop], [HinhThucKhen], [NgayKhen], [NoiDungKhen]) VALUES (1, N'HS003', 4, N'Giấy khen', CAST(0x0000A37E00000000 AS DateTime), N'Học sinh tiên tiến 1')
INSERT [dbo].[KHENTHUONG] ([KhoiHoc], [HocSinh], [Lop], [HinhThucKhen], [NgayKhen], [NoiDungKhen]) VALUES (1, N'HS008', 4, N'k', CAST(0x0000A33900000000 AS DateTime), N'k')
INSERT [dbo].[KHENTHUONG] ([KhoiHoc], [HocSinh], [Lop], [HinhThucKhen], [NgayKhen], [NoiDungKhen]) VALUES (1, N'HS011', 4, N'sa', CAST(0x0000A32300000000 AS DateTime), N'ds')
INSERT [dbo].[KHENTHUONG] ([KhoiHoc], [HocSinh], [Lop], [HinhThucKhen], [NgayKhen], [NoiDungKhen]) VALUES (1, N'HS019', 4, N'qewqewqewq', CAST(0x0000A32300000000 AS DateTime), N'ds')
SET IDENTITY_INSERT [dbo].[KHOILOP] ON 

INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (1, 1, N'Khối 10')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (2, 1, N'Khối 11')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (3, 1, N'Khối 12')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (4, 2, N'Khối 10')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (5, 2, N'Khối 11')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (6, 2, N'Khối 12')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (7, 3, N'Khối 10')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (8, 3, N'Khối 11')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (9, 3, N'Khối 12')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (10, 4, N'Khối 10')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (11, 4, N'Khối 11')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (13, 5, N'Khối 10')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (14, 5, N'Khối 11')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (15, 5, N'Khối 12')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (16, 6, N'Khối 10')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (17, 6, N'Khối 11')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (18, 6, N'Khối 12')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (19, 7, N'Khối 10')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (20, 7, N'Khối 11')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (23, 7, N'Khối 12')
INSERT [dbo].[KHOILOP] ([MaKhoi], [MaNamHoc], [TenKhoi]) VALUES (24, 4, N'Khối 12')
SET IDENTITY_INSERT [dbo].[KHOILOP] OFF
INSERT [dbo].[KYLUAT] ([KhoiHoc], [Lop], [HocSinh], [HinhThucKyLuat], [NgayKyLuat], [NoiDung]) VALUES (1, 4, N'HS003', N'Phạt ds', CAST(0x00009C1D00000000 AS DateTime), N'dsdsd')
INSERT [dbo].[KYLUAT] ([KhoiHoc], [Lop], [HocSinh], [HinhThucKyLuat], [NgayKyLuat], [NoiDung]) VALUES (1, 4, N'HS010', N'sdsdsds', CAST(0x000085CA00000000 AS DateTime), N'sdsdsd')
INSERT [dbo].[KYLUAT] ([KhoiHoc], [Lop], [HocSinh], [HinhThucKyLuat], [NgayKyLuat], [NoiDung]) VALUES (1, 4, N'HS015', N'Phạt', CAST(0x0000A32500000000 AS DateTime), N'Đi học muộn')
INSERT [dbo].[LOAINGUOIDUNG] ([MaLoaiND], [MaND], [MaGiaoVien], [TenLoaiND]) VALUES (N'GV', 12, N'GV025', N'Giáo Viên')
INSERT [dbo].[LOAINGUOIDUNG] ([MaLoaiND], [MaND], [MaGiaoVien], [TenLoaiND]) VALUES (N'Admin', 13, N'Admin', N'Ban giám hiệu')
INSERT [dbo].[LOAINGUOIDUNG] ([MaLoaiND], [MaND], [MaGiaoVien], [TenLoaiND]) VALUES (N'GV', 14, N'GV001', N'Giáo viên chủ nhiệm')
SET IDENTITY_INSERT [dbo].[MONHOC] ON 

INSERT [dbo].[MONHOC] ([MaMonHoc], [MaTo], [TenMonHoc], [SoTiet], [HeSo]) VALUES (1, 2, N'GDCD', 46, 1)
INSERT [dbo].[MONHOC] ([MaMonHoc], [MaTo], [TenMonHoc], [SoTiet], [HeSo]) VALUES (2, 1, N'Hóa học', 45, 1)
INSERT [dbo].[MONHOC] ([MaMonHoc], [MaTo], [TenMonHoc], [SoTiet], [HeSo]) VALUES (3, 1, N'Vật lý', 32, 1)
INSERT [dbo].[MONHOC] ([MaMonHoc], [MaTo], [TenMonHoc], [SoTiet], [HeSo]) VALUES (4, 1, N'Toán', 60, 2)
INSERT [dbo].[MONHOC] ([MaMonHoc], [MaTo], [TenMonHoc], [SoTiet], [HeSo]) VALUES (5, 2, N'Văn', 60, 2)
INSERT [dbo].[MONHOC] ([MaMonHoc], [MaTo], [TenMonHoc], [SoTiet], [HeSo]) VALUES (6, 2, N'Địa', 45, 1)
INSERT [dbo].[MONHOC] ([MaMonHoc], [MaTo], [TenMonHoc], [SoTiet], [HeSo]) VALUES (7, 3, N'Công nghệ', 45, 1)
INSERT [dbo].[MONHOC] ([MaMonHoc], [MaTo], [TenMonHoc], [SoTiet], [HeSo]) VALUES (8, 3, N'GDQP', 20, 1)
INSERT [dbo].[MONHOC] ([MaMonHoc], [MaTo], [TenMonHoc], [SoTiet], [HeSo]) VALUES (9, 1, N'Thể dục', 45, 1)
INSERT [dbo].[MONHOC] ([MaMonHoc], [MaTo], [TenMonHoc], [SoTiet], [HeSo]) VALUES (11, 1, N'Hóa', 55, 1)
INSERT [dbo].[MONHOC] ([MaMonHoc], [MaTo], [TenMonHoc], [SoTiet], [HeSo]) VALUES (13, 2, N'Lịch sử', 43, 1)
SET IDENTITY_INSERT [dbo].[MONHOC] OFF
SET IDENTITY_INSERT [dbo].[NAMHOC] ON 

INSERT [dbo].[NAMHOC] ([MaNamHoc], [TenNamHoc]) VALUES (1, N'2000-2003')
INSERT [dbo].[NAMHOC] ([MaNamHoc], [TenNamHoc]) VALUES (2, N'2003-2006')
INSERT [dbo].[NAMHOC] ([MaNamHoc], [TenNamHoc]) VALUES (3, N'2006-2009')
INSERT [dbo].[NAMHOC] ([MaNamHoc], [TenNamHoc]) VALUES (4, N'2009-2012')
INSERT [dbo].[NAMHOC] ([MaNamHoc], [TenNamHoc]) VALUES (5, N'2012-2015')
INSERT [dbo].[NAMHOC] ([MaNamHoc], [TenNamHoc]) VALUES (6, N'2015-2018')
INSERT [dbo].[NAMHOC] ([MaNamHoc], [TenNamHoc]) VALUES (7, N'2018-2020')
SET IDENTITY_INSERT [dbo].[NAMHOC] OFF
SET IDENTITY_INSERT [dbo].[PHANCONG] ON 

INSERT [dbo].[PHANCONG] ([STT], [MaMonHoc], [MaLop], [MaGiaoVien]) VALUES (2, 4, 4, N'GV001')
INSERT [dbo].[PHANCONG] ([STT], [MaMonHoc], [MaLop], [MaGiaoVien]) VALUES (28, 2, 4, N'GV025')
SET IDENTITY_INSERT [dbo].[PHANCONG] OFF
SET IDENTITY_INSERT [dbo].[PHANLOP] ON 

INSERT [dbo].[PHANLOP] ([STT], [MaLop], [MaHocSinh]) VALUES (1, 4, N'HS001')
INSERT [dbo].[PHANLOP] ([STT], [MaLop], [MaHocSinh]) VALUES (2, 4, N'HS002')
INSERT [dbo].[PHANLOP] ([STT], [MaLop], [MaHocSinh]) VALUES (3, 5, N'HS003')
INSERT [dbo].[PHANLOP] ([STT], [MaLop], [MaHocSinh]) VALUES (5, 5, N'HS010')
INSERT [dbo].[PHANLOP] ([STT], [MaLop], [MaHocSinh]) VALUES (6, 5, N'HS011')
INSERT [dbo].[PHANLOP] ([STT], [MaLop], [MaHocSinh]) VALUES (8, 6, N'HS014')
INSERT [dbo].[PHANLOP] ([STT], [MaLop], [MaHocSinh]) VALUES (9, 6, N'HS015')
INSERT [dbo].[PHANLOP] ([STT], [MaLop], [MaHocSinh]) VALUES (10, 6, N'HS018')
INSERT [dbo].[PHANLOP] ([STT], [MaLop], [MaHocSinh]) VALUES (11, 6, N'HS019')
INSERT [dbo].[PHANLOP] ([STT], [MaLop], [MaHocSinh]) VALUES (12, 7, N'HS031')
INSERT [dbo].[PHANLOP] ([STT], [MaLop], [MaHocSinh]) VALUES (15, 5, N'HS008')
SET IDENTITY_INSERT [dbo].[PHANLOP] OFF
SET IDENTITY_INSERT [dbo].[QUANTRI] ON 

INSERT [dbo].[QUANTRI] ([MaND], [TenDNhap], [MatKhau], [TrangThai]) VALUES (12, N'chieu', N'MQ==', 1)
INSERT [dbo].[QUANTRI] ([MaND], [TenDNhap], [MatKhau], [TrangThai]) VALUES (13, N'admin', N'MQ==', 1)
INSERT [dbo].[QUANTRI] ([MaND], [TenDNhap], [MatKhau], [TrangThai]) VALUES (14, N'User', N'MQ==', 1)
SET IDENTITY_INSERT [dbo].[QUANTRI] OFF
SET IDENTITY_INSERT [dbo].[THOIKHOABIEU] ON 

INSERT [dbo].[THOIKHOABIEU] ([MaTKB], [TenThu], [MaLop], [Tiet1], [Tiet2], [Tiet3], [Tiet4], [Tiet5], [TuNgay], [DenNgay], [MaHK]) VALUES (1, N'Thứ 2', 4, N'Toán', N'Lý ', N'Hóa', N'Anh', N'Sinh', CAST(0x00009BA400000000 AS DateTime), CAST(0x00009C2000000000 AS DateTime), 1)
INSERT [dbo].[THOIKHOABIEU] ([MaTKB], [TenThu], [MaLop], [Tiet1], [Tiet2], [Tiet3], [Tiet4], [Tiet5], [TuNgay], [DenNgay], [MaHK]) VALUES (2, N'Thứ 3', 4, N'Sinh', N'Sử', N'Toán', N'Anh', N'Địa ', CAST(0x00009BA400000000 AS DateTime), CAST(0x00009C2000000000 AS DateTime), 1)
INSERT [dbo].[THOIKHOABIEU] ([MaTKB], [TenThu], [MaLop], [Tiet1], [Tiet2], [Tiet3], [Tiet4], [Tiet5], [TuNgay], [DenNgay], [MaHK]) VALUES (3, N'Thứ 4', 4, N'Anh', N'Văn', N'Sinh ', N'Công nghệ', N'Sử', CAST(0x00009BA400000000 AS DateTime), CAST(0x00009C2000000000 AS DateTime), 1)
INSERT [dbo].[THOIKHOABIEU] ([MaTKB], [TenThu], [MaLop], [Tiet1], [Tiet2], [Tiet3], [Tiet4], [Tiet5], [TuNgay], [DenNgay], [MaHK]) VALUES (13, N'Thứ 5', 4, N'as', N'aeee', N'aee', N'aeee', N'aee', CAST(0x0000A31B00000000 AS DateTime), CAST(0x0000A33200000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[THOIKHOABIEU] OFF
SET IDENTITY_INSERT [dbo].[TINTUC] ON 

INSERT [dbo].[TINTUC] ([MaTinTuc], [TieuDeTin], [NoiDungTin], [MotaNgan], [NgayDangTin]) VALUES (1, N'<b>Thành tích</b>', N'<div class="span-13 contentcolumn">
<h3 class="breakcolumn">
<a title="Trang" nhất="" href="/"><img src="/themes/ThaiHoa/images/icons/home.png" alt="Trang nhất"></a>
<span class="breakcolumn">»</span>
<a href="/index.php?language=vi&amp;nv=news" title="Tin Tức">Tin Tức</a>
<span class="breakcolumn">»</span>
<a href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong" title="Thông tin nhà trường">Thông tin nhà trường</a>
</h3>
<div class="news_column" style="padding:0 !important;margin:0 !important;">
<div id="news_detail">
<h1>MỘT SỐ THÀNH TÍCH TRƯỜNG THPT CẦU GIẤY</h1>
<span class="time">Thứ tư - 26/03/2014  17:04</span>
<div class="control">
<ul>
<li>
<a class="sendmail" title="Gửi bài viết qua email" href="javascript:void(0);" onclick="NewWindow(''/index.php?language=vi&amp;nv=news&amp;op=sendmail/Thong-tin-nha-truong/MOT-SO-THANH-TICH-TRUONG-THPT-CAU-GIAY-48'','''',''500'',''400'',''no'');return false"></a>
</li>
<li>
<a class="print" title="In ra" href="javascript: void(0)" onclick="NewWindow(''/index.php?language=vi&amp;nv=news&amp;op=print/Thong-tin-nha-truong/MOT-SO-THANH-TICH-TRUONG-THPT-CAU-GIAY-48'','''',''840'',''768'',''yes'');return false"></a>
</li>
<li>
<a class="savefile" title="Lưu bài viết này" href="/index.php?language=vi&amp;nv=news&amp;op=savefile/Thong-tin-nha-truong/MOT-SO-THANH-TICH-TRUONG-THPT-CAU-GIAY-48"></a>
</li>
</ul>
</div>
<div style="clear: both;"></div>
<div id="hometext">
Trường THPT Cầu Giấy được thành lập ngày 29/4/2007. Theo biên chế được phòng Tổ chức Cán bộ và lãnh đạo Sở Giáo dục và Đào tạo Hà Nội duyệt trường đã kiện toàn được đội ngũ CB-GV- CNV ngay trong những ngày đầu thành lập. Đến năm 2013-2014 trường có 99 CB-GV- CNV, trong đó có 51,28% đạt trên chuẩn
</div>
<div class="bodytext"><p style="text-align: justify;"> &nbsp; &nbsp; &nbsp;Trường THPT Cầu Giấy được thành lập ngày 29/4/2007. Theo biên chế được phòng Tổ chức Cán bộ và lãnh đạo Sở Giáo dục và Đào tạo Hà Nội duyệt trường đã kiện toàn được đội ngũ CB-GV- CNV ngay trong những ngày đầu thành lập. Đến năm 2013-2014 trường có 99 CB-GV- CNV, trong đó có 51,28% đạt trên chuẩn</p><p> <strong>I.&nbsp;&nbsp;</strong><strong>Về công tác giảng dạy của giáo viên</strong></p><p> &nbsp; &nbsp; Nhà trường luôn chú trọng, tập trung chỉ đạo công tác giảng dạy của giáo viên. Đội ngũ giáo viên năng động, sáng tạo, linh hoạt trong đổi mới phương pháp giảng dạy, trong công tác kiểm tra đánh giá học sinh. Tích cực ứng dụng công nghệ thông tin trong giảng dạy, với tiêu chí mỗi giờ dạy học đều đem đến cho học sinh hứng thú, phát huy tính tích cực chủ động, sáng tạo của các em.</p><p> Trong mỗi năm học, tất cả các tổ bộ môn đều thực hiện các chuyên đề có chất lượng cao, có ý nghĩa thiết thực đối với việc nâng cao chất lượng dạy và học</p><p> Dù mới chỉ thành lập được 7 năm nhưng năm nào Trường THPT Cầu Giấy cũng được vinh danh trong các đợt thi giáo viên dạy giỏi&nbsp; của thành phố:</p><p> &nbsp;</p><table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 403px;" width="403"> <tbody> <tr> <td style="width:76px;"> <p align="center"> <strong>Năm học</strong></p> </td> <td style="width:64px;"> <p align="center"> <strong>Số giải</strong></p> </td> <td style="width:152px;"> <p align="center"> <strong>Môn</strong></p> </td> <td style="width:111px;"> <p align="center"> <strong>Đạt giải</strong></p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2007-2008</p> </td> <td style="width:64px;"> <p align="center"> 02</p> </td> <td style="width:152px;"> <p> Toán, Địa lý</p> </td> <td style="width:111px;"> <p> 2 giải nhì</p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2008-2009</p> </td> <td style="width:64px;"> <p align="center"> 01</p> </td> <td style="width:152px;"> <p> Hóa học</p> </td> <td style="width:111px;"> <p> 1 giải ba</p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2009-2010</p> </td> <td style="width:64px;"> <p align="center"> 01</p> </td> <td style="width:152px;"> <p> Thể dục</p> </td> <td style="width:111px;"> <p> 1 giải KK</p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2010-2011</p> </td> <td style="width:64px;"> <p align="center"> 01</p> </td> <td style="width:152px;"> <p> Văn</p> </td> <td style="width:111px;"> <p> 1 giải nhì</p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2011-2012</p> </td> <td style="width:64px;"> <p align="center"> 01</p> </td> <td style="width:152px;"> <p> Địa lý</p> </td> <td style="width:111px;"> <p> 1 giải nhất</p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2012-2013</p> </td> <td style="width:64px;"> <p align="center"> 01</p> </td> <td style="width:152px;"> <p> Hóa học</p> </td> <td style="width:111px;"> <p> 1 giải ba</p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2013-2014</p> </td> <td style="width:64px;"> <p align="center"> 03</p> </td> <td style="width:152px;"> <p> -&nbsp;&nbsp;&nbsp; Sinh học, Thể dục</p> <p> - Tích hợp trong giảng dạy</p> <p> (bộ môn Ngữ văn)</p> </td> <td style="width:111px;"> <p> -&nbsp; Vừa dự thi cấp TP</p> <p> - Đang dự thi vòng quốc gia</p> </td> </tr> </tbody></table><div style="clear:both;"> &nbsp;</div><p> &nbsp;</p><p> Không chỉ tham gia tích cực trong các đợt thi GVG, các đồng chí CB-GV trong trường còn tích cực thi đua lập nhiều thành tích và đã được cấp trên ghi nhận:</p><p style="margin-left:.5in;"> *) Hai đ/c được nhận bằng khen của Thủ tướng Chính phủ:</p><p style="margin-left:1.0in;"> +) Đ/c Nguyễn Đức Hải</p><p style="margin-left:1.0in;"> +) &nbsp;Đ/c Nghiêm Chí Thành</p><p style="margin-left:.5in;"> *) Hai đ/c được nhận bằng khen của Bộ Giáo dục &amp; Đào tạo:</p><p style="margin-left:67.5pt;"> +) Đ/c Lê Thị Hồng</p><p style="margin-left:67.5pt;"> +) Đ/c Nguyễn Thị Liên</p><p style="margin-left:67.5pt;"> +) 104 lượt CSTĐCS</p><p> <strong>* T</strong><strong>ập thể</strong></p><p> Năm học nào cũng có các tổ chuyên môn được công nhận tổ lao động tiên tiến cấp thành phố</p><table align="center" border="1" cellpadding="0" cellspacing="0" style="width:521px;" width="521"> <tbody> <tr> <td rowspan="2" style="width:91px;"> <p align="center"> <strong>Năm học</strong></p> </td> <td colspan="2" style="width:225px;"> <p align="center"> <strong>Tổ LĐTT</strong></p> </td> <td colspan="2" style="width:204px;"> <p align="center"> <strong>Tổ LĐXS</strong></p> </td> </tr> <tr> <td style="width:109px;"> <p align="center"> <strong>Số lượng</strong></p> </td> <td style="width:116px;"> <p align="center"> <strong>Tên tổ CM</strong></p> </td> <td style="width:102px;"> <p align="center"> <strong>Số lượng</strong></p> </td> <td style="width:102px;"> <p align="center"> <strong>Tên tổ CM</strong></p> </td> </tr> <tr> <td style="width:91px;"> <p align="center"> 2008-2009</p> </td> <td style="width:109px;"> <p align="center"> 03</p> </td> <td style="width:116px;"> <p style="text-align: center;"> Toán-Tin,</p> <p style="text-align: center;"> Hóa-Sinh,</p> <p style="text-align: center;"> Lý-Kỹ thuật</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> </tr> <tr> <td style="width:91px;"> <p style="text-align: center;"> 2009-2010</p> </td> <td style="width:109px;"> <p style="text-align: center;"> 01</p> </td> <td style="width:116px;"> <p style="text-align: center;"> Toán-Tin</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> </tr> <tr> <td style="width:91px;"> <p style="text-align: center;"> 2010-2011</p> </td> <td style="width:109px;"> <p style="text-align: center;"> 02</p> </td> <td style="width:116px;"> <p style="text-align: center;"> Hóa-Sinh,</p> <p style="text-align: center;"> Ngữ văn</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> </tr> <tr> <td style="width:91px;"> <p style="text-align: center;"> 2011-2012</p> </td> <td style="width:109px;"> <p style="text-align: center;"> 02</p> </td> <td style="width:116px;"> <p style="text-align: center;"> Ngữ văn,</p> <p style="text-align: center;"> Tổng hợp</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> </tr> <tr> <td style="width:91px;"> <p style="text-align: center;"> 2012-2013</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:109px;"> <p style="text-align: center;"> 02</p> </td> <td style="width:116px;"> <p style="text-align: center;"> Hóa-Sinh,</p> <p style="text-align: center;"> Ngữ văn</p> </td> <td style="width:102px;"> <p> &nbsp;</p> </td> <td style="width:102px;"> <p> &nbsp;</p> </td> </tr> </tbody></table><p> <strong>II.&nbsp;</strong><strong>Về hoạt động giáo dục học sinh</strong></p><p> <strong><em>*) </em></strong><strong><em>Kết quả xếp loại đạo đức:</em></strong></p><table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 500px;" width="584"> <tbody> <tr> <td style="width:87px;"> <p style="text-align: center;"> <strong>Năm học</strong></p> </td> <td style="width:101px;"> <p style="text-align: center;"> <strong>2007-2008</strong></p> </td> <td style="width:90px;"> <p style="text-align: center;"> <strong>2008-2009</strong></p> </td> <td style="width:78px;"> <p style="text-align: center;"> <strong>2009-2010</strong></p> </td> <td style="width:72px;"> <p style="text-align: center;"> <strong>2010-2011</strong></p> </td> <td style="width:78px;"> <p style="text-align: center;"> <strong>2011-2012</strong></p> </td> <td style="width:78px;"> <p style="text-align: center;"> <strong>2012-2013</strong></p> </td> </tr> <tr> <td style="width:87px;"> <p style="text-align: center;"> Hạnh kiểm Khá-tốt</p> </td> <td style="width:101px;"> <p style="text-align: center;"> &nbsp;389 HS</p> <p style="text-align: center;"> (91,5%)</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:90px;"> <p style="text-align: center;"> 819 HS</p> <p style="text-align: center;"> (97,5%)</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:78px;"> <p style="text-align: center;"> 1297 HS</p> <p style="text-align: center;"> (97,1%)</p> </td> <td style="width:72px;"> <p style="text-align: center;"> 1321HS</p> <p style="text-align: center;"> (97,1%)</p> </td> <td style="width:78px;"> <p style="text-align: center;"> 1455 HS</p> <p style="text-align: center;"> (98,4%)</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:78px;"> <p style="text-align: center;"> 1429 HS&nbsp;</p> <p style="text-align: center;"> (98,4 %)</p> <p> &nbsp;</p> </td> </tr> </tbody></table><div style="clear:both;"> &nbsp;</div><p> &nbsp;</p><p> <strong>*) <em>Về học tập</em></strong></p><p style="margin-left:.75in;"> <strong><em>- </em></strong><strong><em>Kết quả thi HSG</em></strong></p><table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 500px;" width="599"> <tbody> <tr> <td style="width:55px;"> <p style="text-align: center;"> <strong>Năm học</strong></p> </td> <td style="width:80px;"> <p style="text-align: center;"> <strong>2007-2008</strong></p> </td> <td style="width:76px;"> <p style="text-align: center;"> <strong>2008-2009</strong></p> </td> <td style="width:76px;"> <p style="text-align: center;"> <strong>2009-2010</strong></p> </td> <td style="width:69px;"> <p style="text-align: center;"> <strong>2010-2011</strong></p> </td> <td style="width:79px;"> <p style="text-align: center;"> <strong>2011-2012</strong></p> </td> <td style="width:80px;"> <p style="text-align: center;"> <strong>2012-2013</strong></p> </td> <td style="width:84px;"> <p style="text-align: center;"> <strong>2013-2014</strong></p> </td> </tr> <tr> <td style="width:55px;"> <p style="text-align: center;"> HSG TP</p> </td> <td style="width:80px;"> <p style="text-align: center;"> Chưa có HS tham gia</p> </td> <td style="width:76px;"> <p style="text-align: center;"> Chưa có HS tham gia</p> </td> <td style="width:76px;"> <p style="text-align: center;"> 6</p> </td> <td style="width:69px;"> <p style="text-align: center;"> 9</p> </td> <td style="width:79px;"> <p style="text-align: center;"> 6</p> </td> <td style="width:80px;"> <p style="text-align: center;"> 11</p> </td> <td style="width:84px;"> <p style="text-align: center;"> 11</p> <p style="text-align: center;"> (4 nhì,</p> <p style="text-align: center;"> 1ba)</p> </td> </tr> <tr> <td style="width:55px;"> <p style="text-align: center;"> HSG cụm</p> </td> <td style="width:80px;"> <p style="text-align: center;"> 13 giải (Tỷ lệ 30,9%)</p> </td> <td style="width:76px;"> <p style="text-align: center;"> 35 giải (Tỷ lệ 41,2%)</p> </td> <td style="width:76px;"> <p style="text-align: center;"> 49 giải (Tỷ lệ 59,7%)</p> </td> <td style="width:69px;"> <p style="text-align: center;"> 62 giải (Tỷ lệ 67,4%)</p> </td> <td style="width:79px;"> <p style="text-align: center;"> 46 giải (Tỷ lệ 56,1%)</p> </td> <td style="width:80px;"> <p style="text-align: center;"> 48 giải (Tỷ lệ 55,1%)</p> </td> <td style="width:84px;"> <p style="text-align: center;"> Đang tham dự</p> </td> </tr> </tbody></table><div style="clear:both;"> &nbsp;</div><p style="margin-left:.75in;"> &nbsp;</p><p style="margin-left:.75in;"> -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><em>Kết quả xếp loại học lực:</em></strong></p><p> Kết quả học tập của học sinh tiến bộ theo từng năm học:</p><table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 500px;" width="608"> <tbody> <tr> <td style="width:87px;"> <p style="text-align: center;"> <strong>Năm học</strong></p> </td> <td style="width:87px;"> <p style="text-align: center;"> <strong>2007-2008</strong></p> </td> <td style="width:87px;"> <p style="text-align: center;"> <strong>2008-2009</strong></p> </td> <td style="width:88px;"> <p style="text-align: center;"> <strong>2009-2010</strong></p> </td> <td style="width:79px;"> <p style="text-align: center;"> <strong>2010-2011</strong></p> </td> <td style="width:100px;"> <p style="text-align: center;"> <strong>2011-2012</strong></p> </td> <td style="width:80px;"> <p style="text-align: center;"> <strong>2012-2013</strong></p> </td> </tr> <tr> <td style="width:87px;height:105px;"> <p style="text-align: center;"> Khá-Giỏi</p> </td> <td style="width:87px;height:105px;"> <p style="text-align: center;"> 197</p> <p style="text-align: center;"> (46,4%)</p> </td> <td style="width:87px;height:105px;"> <p style="text-align: center;"> 555</p> <p style="text-align: center;"> (66,4%)</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:88px;height:105px;"> <p style="text-align: center;"> 916</p> <p style="text-align: center;"> (68,6%)</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:79px;height:105px;"> <p style="text-align: center;"> 1001</p> <p style="text-align: center;"> (73,6%)</p> </td> <td style="width:100px;height:105px;"> <p style="text-align: center;"> 1087</p> <p style="text-align: center;"> (73,5%)</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:80px;height:105px;"> <p style="text-align: center;"> 1157&nbsp;</p> <p style="text-align: center;"> (79,7 %)</p> </td> </tr> </tbody></table><div style="clear:both;"> &nbsp;</div><p> &nbsp;</p><p> <strong><em>* Hoạt động ngoại khóa</em></strong></p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Từ năm 2011 đến nay nhà trường kết hợp với hội phụ huynh trường thành lập các câu lạc bộ: Toán, Lý, Hóa, Văn, câu lạc bộ thể thao (bóng bàn, bóng chuyền, cầu lông, dance-sport), hoạt động vào chiều thứ tư hàng tuần lôi cuốn được nhiều học sinh tham gia góp phần hướng tới mục tiêu giáo dục toàn diện cho học sinh.). Học sinh trong CLB Lý tham gia hội thi “Tên lửa nước” đã đạt 01giải nhất, 01 giải khuyến khích cấp thành phố(năm 2012), được Trung ương Đoàn tặng bằng khen trong fesstival sáng tạo trẻ thủ đô.</p><p> <em><strong>*) Câu lạc bộ Vật lý, Hóa học:</strong></em>&nbsp;Đã có bốn đề tài dự thi NCKH Itel ISEF và được giải khuyến khích cấp thành phố <em>“Máy kéo rèm tự động”, Thùng rác thông minh”</em> (năm 2012-2013), <em>“Giá sách dành cho người khuyết tật tay”, “Xử lý nước nhiễm Asen bằng phương pháp oxi hóa – khử”</em> (năm 2013-2014).</p><p> <em><strong>*) Câu lạc bộ văn nghệ - thể thao:</strong></em>&nbsp;Thành tích bên Đoàn và tổ Thể dục</p><p style="margin-left:31.5pt;"> - Các hoạt động giao lưu trong giờ chào cờ đầu tuần được tổ chức thường xuyên với nhiều nội dung phục vụ học tập, sinh hoạt bổ ích.</p><p style="margin-left:31.5pt;"> - Trong các ngày lễ lớn giáo viên – học sinh cùng tham gia các hoạt động văn nghệ, thể thao...</p><p style="margin-left:31.5pt;"> - Năm nào cũng tổ chức cho học sinh toàn trường đi dã ngoại một ngày vui vẻ, bổ ích và an toàn.</p><p style="margin-left:31.5pt;"> - Hàng năm nhà trường tổ chức cho HSG toàn diện, HSG cụm và cán bộ lớp, cán bộ Đoàn tiêu biểu thăm quan tại một số di tích lịch sử: Thành cổ Quảng Trị, Nghĩa trang Trường Sơn, Cố đô Hoa lư, Sơn Tây, Hải Phòng …vào đầu năm học.</p><p> Các hoạt động trên đã góp phần giáo dục cho học sinh truyền thống “<em>uống nước nhớ nguồn</em>” và ý thức trân trọng, gìn giữ những di tích lịch sử văn hóa của dân tộc.</p><p> <strong>III.&nbsp;</strong><strong>KHEN THƯỞNG TẬP THỂ TRƯỜNG</strong></p><p> Sau 3 năm thành lập trường đã được công nhận Trường chuẩn Quốc gia</p><p> <strong>1. Danh hiệu thi đua</strong></p><table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 615px;" width="615"> <tbody> <tr> <td style="width:49px;"> <p style="text-align: center;"> <strong>Năm học</strong></p> </td> <td style="width:173px;"> <p style="text-align: center;"> <strong>Danh hiệu thi đua</strong></p> </td> <td style="width:392px;"> <p style="text-align: center;"> &nbsp;</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2007-2008</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Tập thể lao động tiên tiến</p> </td> <td style="width:392px;"> <p style="text-align: center;"> Quyết định số 6465/QĐ-SGD&amp;ĐT, ngày 28/7/2008</p> <p style="text-align: center;"> Sở GD$ ĐT Hà nội</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2008-2009</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Tập thể lao động tiên tiến</p> </td> <td style="width:392px;"> <p style="text-align: center;"> Quyết định số 6465/QĐ-SGD&amp;ĐT, ngày 22/7/2009</p> <p style="text-align: center;"> Sở GD$ ĐT Hà nội</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2009-2010</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Tập thể lao động xuất sắc</p> </td> <td style="width:392px;"> <p style="text-align: center;"> Quyết định số 3902/QĐ- UBND, ngày 10/8/2010.</p> <p style="text-align: center;"> Chủ tịch UBND thành phố Hà Nội</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2010-2011</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Tập thể lao động xuất sắc</p> </td> <td style="width:392px;"> <p style="text-align: center;"> Quyết định số 3660/QĐ-UBND, ngày 10/8/2011</p> <p style="text-align: center;"> Chủ tịch UBND thành phố Hà Nội</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2011-2012</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Tập thể lao động xuất sắc</p> </td> <td style="width:392px;"> <p style="text-align: center;"> Quyết định số 3577/QĐ-UBND, ngày 8/8/2012</p> <p style="text-align: center;"> Chủ tịch UBND thành phố Hà Nội</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2011-2012</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Cờ thi đua xuất sắc</p> </td> <td style="width:392px;"> <p style="text-align: center;"> Quyết định số 3577/QĐ-BGDĐT ngày 8/8/2012</p> <p style="text-align: center;"> Bộ trưởng Bộ GD&amp;ĐT</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2012-2013</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Tập thể lao động xuất sắc</p> </td> <td style="width:392px;"> <p style="text-align: center;"> &nbsp;</p> </td> </tr> </tbody></table><div style="clear: both; text-align: center;"> &nbsp;</div><p> &nbsp;</p><p> <strong>2. &nbsp;Khen thưởng</strong></p><p> &nbsp;</p><table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 644px;" width="644"> <tbody> <tr> <td style="width:58px;"> <p align="center"> <strong>Năm học</strong></p> </td> <td style="width:299px;"> <p align="center"> <strong>Hình thức khen thưởng</strong></p> </td> <td style="width:287px;"> <p align="center"> &nbsp;</p> </td> </tr> <tr> <td style="width:58px;"> <p align="center"> 2010-2011</p> </td> <td style="width:299px;"> <p align="center"> Bằng khen của Bộ GD&amp;ĐT</p> </td> <td style="width:287px;"> <p align="center"> Quyết định số 5483/QĐ-BGDĐT</p> <p align="center"> ngày 4/11/2011 Bộ GD&amp;ĐT</p> </td> </tr> <tr> <td rowspan="3" style="width:58px;"> <p align="center"> 2011-2012</p> </td> <td style="width:299px;"> <p align="center"> Giấy khen “Mỗi thầy cô giáo là tấm gương đạo đúc tự học và sáng tạo”</p> </td> <td style="width:287px;"> <p align="center"> Quyết định số 3468/QĐ-SGDĐT</p> <p align="center"> ngày 1/3/2013 Sở GD&amp;ĐT</p> </td> </tr> <tr> <td style="width:299px;height:84px;"> <p align="center"> Bằng khen của Bộ Giáo dục và Đào tạo về công tác giáo dục thể chất và Hội khỏe phù đổng 2008-2012.</p> </td> <td style="width:287px;height:84px;"> <p> &nbsp;</p> <p align="center"> Quyết định số 2746/QĐ/-BGDĐT</p> <p align="center"> Bộ GD&amp;ĐT</p> <p> &nbsp;</p> </td> </tr> <tr> <td style="width:299px;height:78px;"> <p align="center"> Cờ thi đua xuất sắc về TDTT năm 2012</p> <p align="center"> &nbsp;</p> </td> <td style="width:287px;height:78px;"> <p align="center"> Sở Văn hóa Thể thao và Du lịch tặng</p> <p> &nbsp;</p> </td> </tr> <tr> <td style="width:58px;height:78px;"> <p align="center"> 2012-2013</p> </td> <td style="width:299px;height:78px;"> <p align="center"> Bằng khen của thủ tướng chính phủ</p> <p> &nbsp;</p> </td> <td style="width:287px;height:78px;"> <p align="center"> Quyết định số 2047/QĐ-TTg, ngày 6/11/2013 của Thủ tướng Chính phủ</p> </td> </tr> </tbody></table><div style="clear:both;"> &nbsp;</div><p> &nbsp;</p><p> &nbsp;</p><p> &nbsp;</p></div>
<p style="text-align: right;">
<strong>Tác giả bài viết: </strong>Đinh Thị Nga - Thư ký hội đồng
</p>
</div>
<form id="form3B" action="">
<div class="clearfix">
<div id="stringrating">Tổng số điểm của bài viết là: 0 trong 0 đánh giá</div>
<div style="padding: 5px;">
<input class="hover-star" type="radio" value="1" title="bài viết rất kém"><input class="hover-star" type="radio" value="2" title="bài viết kém"><input class="hover-star" type="radio" value="3" title="bài viết đạt"><input class="hover-star" type="radio" value="4" title="bài viết tốt"><input class="hover-star" type="radio" value="5" title="bài viết rất tốt"><span id="hover-test" style="margin: 0 0 0 20px;">Click để đánh giá bài viết</span>
</div>
</div>
</form>
<script type="text/javascript">
//<![CDATA[
var sr = 0;
$(''.hover-star'').rating({
focus: function(value, link){
var tip = $(''#hover-test'');
if (sr != 2) {
tip[0].data = tip[0].data || tip.html();
tip.html(link.title || ''value: '' + value);
sr = 1;
}
},
blur: function(value, link){
var tip = $(''#hover-test'');
if (sr != 2) {
$(''#hover-test'').html(tip[0].data || '''');
sr = 1;
}
},
callback: function(value, link){
if (sr == 1) {
sr = 2;
$(''.hover-star'').rating(''disable'');
sendrating(''48'', value, ''ded52eb51db35f950bcbf05e8e2f358d'');
}
}
});
$(''.hover-star'').rating(''select'', ''-1'');
//]]>
</script>
<div class="keywords">
<strong>Từ khóa: </strong>
<a title="n/a" href="/index.php?language=vi&amp;nv=news&amp;op=search&amp;q=n%26%23x002F%3Ba&amp;mod=all"><em>n/a</em></a>
</div>
<div id="idcomment">
<ul class="control">
<li>
<a onclick="nv_show_hidden(''showcomment'',2);" href="javascript:void(0);"><img src="/themes/ThaiHoa/images/news/comment.png" alt="Show comment"><strong>Xem phản hồi</strong></a>
</li>
<li>
-- <a onclick="nv_show_hidden(''formcomment'',2);" href="javascript:void(0);"><img alt="Add comment" src="/themes/ThaiHoa/images/news/comment_add.png"><strong>Gửi phản hồi</strong></a>
</li>
</ul>
<div class="clearfix"></div>
<div id="showcomment">
<div class="page"></div></div>
<div id="formcomment">
<a title="Đăng nhập" href="/index.php?language=vi&amp;nv=users&amp;op=login&amp;nv_redirect=aHR0cDovL3RocHRjYXVnaWF5LmVkdS52bi9pbmRleC5waHA_bGFuZ3VhZ2U9dmkmbnY9bmV3cyZvcD1UaG9uZy10aW4tbmhhLXRydW9uZy9NT1QtU08tVEhBTkgtVElDSC1UUlVPTkctVEhQVC1DQVUtR0lBWS00OCNmb3JtY29tbWVudA,,">Bạn cần đăng nhập thành viên để sử dụng chức năng này</a>
</div>
</div>
<div class="clear"></div>
<p>
<strong>Những tin cũ hơn</strong>
</p>
<ul class="related">
<li>
<a title="HƯỚNG DẪN SKKN NĂM HỌC 2011-2012" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/HUONG-DAN-SKKN-NAM-HOC-2011-2012-41">HƯỚNG DẪN SKKN NĂM HỌC 2011-2012</a>
<span class="date">(09/05/2012)</span>
</li>
<li>
<a title="BẢN TỰ ĐÁNH GIÁ XẾP LOẠI" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/BAN-TU-DANH-GIA-XEP-LOAI-40">BẢN TỰ ĐÁNH GIÁ XẾP LOẠI</a>
<span class="date">(09/05/2012)</span>
</li>
<li>
<a title="THÔNG TƯ SỐ 58 VỀ BAN HÀNH QUY CHẾ ĐÁNH GIÁ VÀ XẾP LOẠI HỌC SINH" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/THONG-TU-SO-58-VE-BAN-HANH-QUY-CHE-DANH-GIA-VA-XEP-LOAI-HOC-SINH-36">THÔNG TƯ SỐ 58 VỀ BAN HÀNH QUY CHẾ ĐÁNH GIÁ VÀ XẾP LOẠI HỌC SINH</a>
<span class="date">(13/12/2011)</span>
</li>
<li>
<a title="HƯỚNG DẪN CÔNG TÁC TĐ-KT (Công văn số 3517/SGD&amp;ĐT-VP của Sở Giáo dục và Đào tạo Hà Nội)" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/HUONG-DAN-CONG-TAC-TD-KT-Cong-van-so-3517SGDDT-VP-cua-So-Giao-duc-va-Dao-tao-Ha-Noi-34">HƯỚNG DẪN CÔNG TÁC TĐ-KT (Công văn số 3517/SGD&amp;ĐT-VP của Sở Giáo dục và Đào tạo Hà Nội)</a>
<span class="date">(25/05/2011)</span>
</li>
<li>
<a title="TRƯỜNG THPT CẦU GIẤY VÀ CÔNG TÁC TUYỂN SINH" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/TRUONG-THPT-CAU-GIAY-VA-CONG-TAC-TUYEN-SINH-23">TRƯỜNG THPT CẦU GIẤY VÀ CÔNG TÁC TUYỂN SINH</a>
<span class="date">(18/04/2011)</span>
</li>
<li>
<a title="MỘT SỐ LƯU Ý KHI COI THI" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/MOT-SO-LUU-Y-KHI-COI-THI-21">MỘT SỐ LƯU Ý KHI COI THI</a>
<span class="date">(14/04/2011)</span>
</li>
<li>
<a title="HỒ SƠ ĐỀ NGHỊ XÉT TẶNG KNC" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/HO-SO-DE-NGHI-XET-TANG-KNC-20">HỒ SƠ ĐỀ NGHỊ XÉT TẶNG KNC</a>
<span class="date">(13/04/2011)</span>
</li>
<li>
<a title="XÉT TẶNG KỶ NIỆM CHƯƠNG" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/XET-TANG-KY-NIEM-CHUONG-19">XÉT TẶNG KỶ NIỆM CHƯƠNG</a>
<span class="date">(13/04/2011)</span>
</li>
<li>
<a title="QUY ĐỊNH CHUẨN NGHỀ NGHIỆP" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/QUY-DINH-CHUAN-NGHE-NGHIEP-18">QUY ĐỊNH CHUẨN NGHỀ NGHIỆP</a>
<span class="date">(13/04/2011)</span>
</li>
<li>
<a title="THÔNG TƯ SỐ 05" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/THONG-TU-SO-05-17">THÔNG TƯ SỐ 05</a>
<span class="date">(13/04/2011)</span>
</li>
</ul>
</div>
&nbsp;
</div>', N'Trường THPT Cầu Giấy được thành lập ngày 29/4/2007. Theo biên chế được phòng Tổ chức Cán bộ và lãnh đạo Sở Giáo dục và Đào tạo Hà Nội duyệt trường đã kiện toàn được đội ngũ CB-GV- CNV ngay trong những ngày đầu thành lập. Đến năm 2013-2014 trường có 99 CB-GV- CNV, trong đó có 51,28% đạt trên chuẩn', CAST(0x0000A0C300000000 AS DateTime))
INSERT [dbo].[TINTUC] ([MaTinTuc], [TieuDeTin], [NoiDungTin], [MotaNgan], [NgayDangTin]) VALUES (2, N'Tuyên dương', N'<div class="span-13 contentcolumn">
<h3 class="breakcolumn">
<a title="Trang" nhất="" href="/"><img src="/themes/ThaiHoa/images/icons/home.png" alt="Trang nhất"></a>
<span class="breakcolumn">»</span>
<a href="/index.php?language=vi&amp;nv=news" title="Tin Tức">Tin Tức</a>
<span class="breakcolumn">»</span>
<a href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong" title="Thông tin nhà trường">Thông tin nhà trường</a>
</h3>
<div class="news_column" style="padding:0 !important;margin:0 !important;">
<div id="news_detail">
<h1>MỘT SỐ THÀNH TÍCH TRƯỜNG THPT CẦU GIẤY</h1>
<span class="time">Thứ tư - 26/03/2014  17:04</span>
<div class="control">
<ul>
<li>
<a class="sendmail" title="Gửi bài viết qua email" href="javascript:void(0);" onclick="NewWindow(''/index.php?language=vi&amp;nv=news&amp;op=sendmail/Thong-tin-nha-truong/MOT-SO-THANH-TICH-TRUONG-THPT-CAU-GIAY-48'','''',''500'',''400'',''no'');return false"></a>
</li>
<li>
<a class="print" title="In ra" href="javascript: void(0)" onclick="NewWindow(''/index.php?language=vi&amp;nv=news&amp;op=print/Thong-tin-nha-truong/MOT-SO-THANH-TICH-TRUONG-THPT-CAU-GIAY-48'','''',''840'',''768'',''yes'');return false"></a>
</li>
<li>
<a class="savefile" title="Lưu bài viết này" href="/index.php?language=vi&amp;nv=news&amp;op=savefile/Thong-tin-nha-truong/MOT-SO-THANH-TICH-TRUONG-THPT-CAU-GIAY-48"></a>
</li>
</ul>
</div>
<div style="clear: both;"></div>
<div id="hometext">
Trường THPT Cầu Giấy được thành lập ngày 29/4/2007. Theo biên chế được phòng Tổ chức Cán bộ và lãnh đạo Sở Giáo dục và Đào tạo Hà Nội duyệt trường đã kiện toàn được đội ngũ CB-GV- CNV ngay trong những ngày đầu thành lập. Đến năm 2013-2014 trường có 99 CB-GV- CNV, trong đó có 51,28% đạt trên chuẩn
</div>
<div class="bodytext"><p style="text-align: justify;"> &nbsp; &nbsp; &nbsp;Trường THPT Cầu Giấy được thành lập ngày 29/4/2007. Theo biên chế được phòng Tổ chức Cán bộ và lãnh đạo Sở Giáo dục và Đào tạo Hà Nội duyệt trường đã kiện toàn được đội ngũ CB-GV- CNV ngay trong những ngày đầu thành lập. Đến năm 2013-2014 trường có 99 CB-GV- CNV, trong đó có 51,28% đạt trên chuẩn</p><p> <strong>I.&nbsp;&nbsp;</strong><strong>Về công tác giảng dạy của giáo viên</strong></p><p> &nbsp; &nbsp; Nhà trường luôn chú trọng, tập trung chỉ đạo công tác giảng dạy của giáo viên. Đội ngũ giáo viên năng động, sáng tạo, linh hoạt trong đổi mới phương pháp giảng dạy, trong công tác kiểm tra đánh giá học sinh. Tích cực ứng dụng công nghệ thông tin trong giảng dạy, với tiêu chí mỗi giờ dạy học đều đem đến cho học sinh hứng thú, phát huy tính tích cực chủ động, sáng tạo của các em.</p><p> Trong mỗi năm học, tất cả các tổ bộ môn đều thực hiện các chuyên đề có chất lượng cao, có ý nghĩa thiết thực đối với việc nâng cao chất lượng dạy và học</p><p> Dù mới chỉ thành lập được 7 năm nhưng năm nào Trường THPT Cầu Giấy cũng được vinh danh trong các đợt thi giáo viên dạy giỏi&nbsp; của thành phố:</p><p> &nbsp;</p><table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 403px;" width="403"> <tbody> <tr> <td style="width:76px;"> <p align="center"> <strong>Năm học</strong></p> </td> <td style="width:64px;"> <p align="center"> <strong>Số giải</strong></p> </td> <td style="width:152px;"> <p align="center"> <strong>Môn</strong></p> </td> <td style="width:111px;"> <p align="center"> <strong>Đạt giải</strong></p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2007-2008</p> </td> <td style="width:64px;"> <p align="center"> 02</p> </td> <td style="width:152px;"> <p> Toán, Địa lý</p> </td> <td style="width:111px;"> <p> 2 giải nhì</p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2008-2009</p> </td> <td style="width:64px;"> <p align="center"> 01</p> </td> <td style="width:152px;"> <p> Hóa học</p> </td> <td style="width:111px;"> <p> 1 giải ba</p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2009-2010</p> </td> <td style="width:64px;"> <p align="center"> 01</p> </td> <td style="width:152px;"> <p> Thể dục</p> </td> <td style="width:111px;"> <p> 1 giải KK</p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2010-2011</p> </td> <td style="width:64px;"> <p align="center"> 01</p> </td> <td style="width:152px;"> <p> Văn</p> </td> <td style="width:111px;"> <p> 1 giải nhì</p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2011-2012</p> </td> <td style="width:64px;"> <p align="center"> 01</p> </td> <td style="width:152px;"> <p> Địa lý</p> </td> <td style="width:111px;"> <p> 1 giải nhất</p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2012-2013</p> </td> <td style="width:64px;"> <p align="center"> 01</p> </td> <td style="width:152px;"> <p> Hóa học</p> </td> <td style="width:111px;"> <p> 1 giải ba</p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2013-2014</p> </td> <td style="width:64px;"> <p align="center"> 03</p> </td> <td style="width:152px;"> <p> -&nbsp;&nbsp;&nbsp; Sinh học, Thể dục</p> <p> - Tích hợp trong giảng dạy</p> <p> (bộ môn Ngữ văn)</p> </td> <td style="width:111px;"> <p> -&nbsp; Vừa dự thi cấp TP</p> <p> - Đang dự thi vòng quốc gia</p> </td> </tr> </tbody></table><div style="clear:both;"> &nbsp;</div><p> &nbsp;</p><p> Không chỉ tham gia tích cực trong các đợt thi GVG, các đồng chí CB-GV trong trường còn tích cực thi đua lập nhiều thành tích và đã được cấp trên ghi nhận:</p><p style="margin-left:.5in;"> *) Hai đ/c được nhận bằng khen của Thủ tướng Chính phủ:</p><p style="margin-left:1.0in;"> +) Đ/c Nguyễn Đức Hải</p><p style="margin-left:1.0in;"> +) &nbsp;Đ/c Nghiêm Chí Thành</p><p style="margin-left:.5in;"> *) Hai đ/c được nhận bằng khen của Bộ Giáo dục &amp; Đào tạo:</p><p style="margin-left:67.5pt;"> +) Đ/c Lê Thị Hồng</p><p style="margin-left:67.5pt;"> +) Đ/c Nguyễn Thị Liên</p><p style="margin-left:67.5pt;"> +) 104 lượt CSTĐCS</p><p> <strong>* T</strong><strong>ập thể</strong></p><p> Năm học nào cũng có các tổ chuyên môn được công nhận tổ lao động tiên tiến cấp thành phố</p><table align="center" border="1" cellpadding="0" cellspacing="0" style="width:521px;" width="521"> <tbody> <tr> <td rowspan="2" style="width:91px;"> <p align="center"> <strong>Năm học</strong></p> </td> <td colspan="2" style="width:225px;"> <p align="center"> <strong>Tổ LĐTT</strong></p> </td> <td colspan="2" style="width:204px;"> <p align="center"> <strong>Tổ LĐXS</strong></p> </td> </tr> <tr> <td style="width:109px;"> <p align="center"> <strong>Số lượng</strong></p> </td> <td style="width:116px;"> <p align="center"> <strong>Tên tổ CM</strong></p> </td> <td style="width:102px;"> <p align="center"> <strong>Số lượng</strong></p> </td> <td style="width:102px;"> <p align="center"> <strong>Tên tổ CM</strong></p> </td> </tr> <tr> <td style="width:91px;"> <p align="center"> 2008-2009</p> </td> <td style="width:109px;"> <p align="center"> 03</p> </td> <td style="width:116px;"> <p style="text-align: center;"> Toán-Tin,</p> <p style="text-align: center;"> Hóa-Sinh,</p> <p style="text-align: center;"> Lý-Kỹ thuật</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> </tr> <tr> <td style="width:91px;"> <p style="text-align: center;"> 2009-2010</p> </td> <td style="width:109px;"> <p style="text-align: center;"> 01</p> </td> <td style="width:116px;"> <p style="text-align: center;"> Toán-Tin</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> </tr> <tr> <td style="width:91px;"> <p style="text-align: center;"> 2010-2011</p> </td> <td style="width:109px;"> <p style="text-align: center;"> 02</p> </td> <td style="width:116px;"> <p style="text-align: center;"> Hóa-Sinh,</p> <p style="text-align: center;"> Ngữ văn</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> </tr> <tr> <td style="width:91px;"> <p style="text-align: center;"> 2011-2012</p> </td> <td style="width:109px;"> <p style="text-align: center;"> 02</p> </td> <td style="width:116px;"> <p style="text-align: center;"> Ngữ văn,</p> <p style="text-align: center;"> Tổng hợp</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> </tr> <tr> <td style="width:91px;"> <p style="text-align: center;"> 2012-2013</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:109px;"> <p style="text-align: center;"> 02</p> </td> <td style="width:116px;"> <p style="text-align: center;"> Hóa-Sinh,</p> <p style="text-align: center;"> Ngữ văn</p> </td> <td style="width:102px;"> <p> &nbsp;</p> </td> <td style="width:102px;"> <p> &nbsp;</p> </td> </tr> </tbody></table><p> <strong>II.&nbsp;</strong><strong>Về hoạt động giáo dục học sinh</strong></p><p> <strong><em>*) </em></strong><strong><em>Kết quả xếp loại đạo đức:</em></strong></p><table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 500px;" width="584"> <tbody> <tr> <td style="width:87px;"> <p style="text-align: center;"> <strong>Năm học</strong></p> </td> <td style="width:101px;"> <p style="text-align: center;"> <strong>2007-2008</strong></p> </td> <td style="width:90px;"> <p style="text-align: center;"> <strong>2008-2009</strong></p> </td> <td style="width:78px;"> <p style="text-align: center;"> <strong>2009-2010</strong></p> </td> <td style="width:72px;"> <p style="text-align: center;"> <strong>2010-2011</strong></p> </td> <td style="width:78px;"> <p style="text-align: center;"> <strong>2011-2012</strong></p> </td> <td style="width:78px;"> <p style="text-align: center;"> <strong>2012-2013</strong></p> </td> </tr> <tr> <td style="width:87px;"> <p style="text-align: center;"> Hạnh kiểm Khá-tốt</p> </td> <td style="width:101px;"> <p style="text-align: center;"> &nbsp;389 HS</p> <p style="text-align: center;"> (91,5%)</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:90px;"> <p style="text-align: center;"> 819 HS</p> <p style="text-align: center;"> (97,5%)</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:78px;"> <p style="text-align: center;"> 1297 HS</p> <p style="text-align: center;"> (97,1%)</p> </td> <td style="width:72px;"> <p style="text-align: center;"> 1321HS</p> <p style="text-align: center;"> (97,1%)</p> </td> <td style="width:78px;"> <p style="text-align: center;"> 1455 HS</p> <p style="text-align: center;"> (98,4%)</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:78px;"> <p style="text-align: center;"> 1429 HS&nbsp;</p> <p style="text-align: center;"> (98,4 %)</p> <p> &nbsp;</p> </td> </tr> </tbody></table><div style="clear:both;"> &nbsp;</div><p> &nbsp;</p><p> <strong>*) <em>Về học tập</em></strong></p><p style="margin-left:.75in;"> <strong><em>- </em></strong><strong><em>Kết quả thi HSG</em></strong></p><table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 500px;" width="599"> <tbody> <tr> <td style="width:55px;"> <p style="text-align: center;"> <strong>Năm học</strong></p> </td> <td style="width:80px;"> <p style="text-align: center;"> <strong>2007-2008</strong></p> </td> <td style="width:76px;"> <p style="text-align: center;"> <strong>2008-2009</strong></p> </td> <td style="width:76px;"> <p style="text-align: center;"> <strong>2009-2010</strong></p> </td> <td style="width:69px;"> <p style="text-align: center;"> <strong>2010-2011</strong></p> </td> <td style="width:79px;"> <p style="text-align: center;"> <strong>2011-2012</strong></p> </td> <td style="width:80px;"> <p style="text-align: center;"> <strong>2012-2013</strong></p> </td> <td style="width:84px;"> <p style="text-align: center;"> <strong>2013-2014</strong></p> </td> </tr> <tr> <td style="width:55px;"> <p style="text-align: center;"> HSG TP</p> </td> <td style="width:80px;"> <p style="text-align: center;"> Chưa có HS tham gia</p> </td> <td style="width:76px;"> <p style="text-align: center;"> Chưa có HS tham gia</p> </td> <td style="width:76px;"> <p style="text-align: center;"> 6</p> </td> <td style="width:69px;"> <p style="text-align: center;"> 9</p> </td> <td style="width:79px;"> <p style="text-align: center;"> 6</p> </td> <td style="width:80px;"> <p style="text-align: center;"> 11</p> </td> <td style="width:84px;"> <p style="text-align: center;"> 11</p> <p style="text-align: center;"> (4 nhì,</p> <p style="text-align: center;"> 1ba)</p> </td> </tr> <tr> <td style="width:55px;"> <p style="text-align: center;"> HSG cụm</p> </td> <td style="width:80px;"> <p style="text-align: center;"> 13 giải (Tỷ lệ 30,9%)</p> </td> <td style="width:76px;"> <p style="text-align: center;"> 35 giải (Tỷ lệ 41,2%)</p> </td> <td style="width:76px;"> <p style="text-align: center;"> 49 giải (Tỷ lệ 59,7%)</p> </td> <td style="width:69px;"> <p style="text-align: center;"> 62 giải (Tỷ lệ 67,4%)</p> </td> <td style="width:79px;"> <p style="text-align: center;"> 46 giải (Tỷ lệ 56,1%)</p> </td> <td style="width:80px;"> <p style="text-align: center;"> 48 giải (Tỷ lệ 55,1%)</p> </td> <td style="width:84px;"> <p style="text-align: center;"> Đang tham dự</p> </td> </tr> </tbody></table><div style="clear:both;"> &nbsp;</div><p style="margin-left:.75in;"> &nbsp;</p><p style="margin-left:.75in;"> -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><em>Kết quả xếp loại học lực:</em></strong></p><p> Kết quả học tập của học sinh tiến bộ theo từng năm học:</p><table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 500px;" width="608"> <tbody> <tr> <td style="width:87px;"> <p style="text-align: center;"> <strong>Năm học</strong></p> </td> <td style="width:87px;"> <p style="text-align: center;"> <strong>2007-2008</strong></p> </td> <td style="width:87px;"> <p style="text-align: center;"> <strong>2008-2009</strong></p> </td> <td style="width:88px;"> <p style="text-align: center;"> <strong>2009-2010</strong></p> </td> <td style="width:79px;"> <p style="text-align: center;"> <strong>2010-2011</strong></p> </td> <td style="width:100px;"> <p style="text-align: center;"> <strong>2011-2012</strong></p> </td> <td style="width:80px;"> <p style="text-align: center;"> <strong>2012-2013</strong></p> </td> </tr> <tr> <td style="width:87px;height:105px;"> <p style="text-align: center;"> Khá-Giỏi</p> </td> <td style="width:87px;height:105px;"> <p style="text-align: center;"> 197</p> <p style="text-align: center;"> (46,4%)</p> </td> <td style="width:87px;height:105px;"> <p style="text-align: center;"> 555</p> <p style="text-align: center;"> (66,4%)</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:88px;height:105px;"> <p style="text-align: center;"> 916</p> <p style="text-align: center;"> (68,6%)</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:79px;height:105px;"> <p style="text-align: center;"> 1001</p> <p style="text-align: center;"> (73,6%)</p> </td> <td style="width:100px;height:105px;"> <p style="text-align: center;"> 1087</p> <p style="text-align: center;"> (73,5%)</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:80px;height:105px;"> <p style="text-align: center;"> 1157&nbsp;</p> <p style="text-align: center;"> (79,7 %)</p> </td> </tr> </tbody></table><div style="clear:both;"> &nbsp;</div><p> &nbsp;</p><p> <strong><em>* Hoạt động ngoại khóa</em></strong></p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Từ năm 2011 đến nay nhà trường kết hợp với hội phụ huynh trường thành lập các câu lạc bộ: Toán, Lý, Hóa, Văn, câu lạc bộ thể thao (bóng bàn, bóng chuyền, cầu lông, dance-sport), hoạt động vào chiều thứ tư hàng tuần lôi cuốn được nhiều học sinh tham gia góp phần hướng tới mục tiêu giáo dục toàn diện cho học sinh.). Học sinh trong CLB Lý tham gia hội thi “Tên lửa nước” đã đạt 01giải nhất, 01 giải khuyến khích cấp thành phố(năm 2012), được Trung ương Đoàn tặng bằng khen trong fesstival sáng tạo trẻ thủ đô.</p><p> <em><strong>*) Câu lạc bộ Vật lý, Hóa học:</strong></em>&nbsp;Đã có bốn đề tài dự thi NCKH Itel ISEF và được giải khuyến khích cấp thành phố <em>“Máy kéo rèm tự động”, Thùng rác thông minh”</em> (năm 2012-2013), <em>“Giá sách dành cho người khuyết tật tay”, “Xử lý nước nhiễm Asen bằng phương pháp oxi hóa – khử”</em> (năm 2013-2014).</p><p> <em><strong>*) Câu lạc bộ văn nghệ - thể thao:</strong></em>&nbsp;Thành tích bên Đoàn và tổ Thể dục</p><p style="margin-left:31.5pt;"> - Các hoạt động giao lưu trong giờ chào cờ đầu tuần được tổ chức thường xuyên với nhiều nội dung phục vụ học tập, sinh hoạt bổ ích.</p><p style="margin-left:31.5pt;"> - Trong các ngày lễ lớn giáo viên – học sinh cùng tham gia các hoạt động văn nghệ, thể thao...</p><p style="margin-left:31.5pt;"> - Năm nào cũng tổ chức cho học sinh toàn trường đi dã ngoại một ngày vui vẻ, bổ ích và an toàn.</p><p style="margin-left:31.5pt;"> - Hàng năm nhà trường tổ chức cho HSG toàn diện, HSG cụm và cán bộ lớp, cán bộ Đoàn tiêu biểu thăm quan tại một số di tích lịch sử: Thành cổ Quảng Trị, Nghĩa trang Trường Sơn, Cố đô Hoa lư, Sơn Tây, Hải Phòng …vào đầu năm học.</p><p> Các hoạt động trên đã góp phần giáo dục cho học sinh truyền thống “<em>uống nước nhớ nguồn</em>” và ý thức trân trọng, gìn giữ những di tích lịch sử văn hóa của dân tộc.</p><p> <strong>III.&nbsp;</strong><strong>KHEN THƯỞNG TẬP THỂ TRƯỜNG</strong></p><p> Sau 3 năm thành lập trường đã được công nhận Trường chuẩn Quốc gia</p><p> <strong>1. Danh hiệu thi đua</strong></p><table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 615px;" width="615"> <tbody> <tr> <td style="width:49px;"> <p style="text-align: center;"> <strong>Năm học</strong></p> </td> <td style="width:173px;"> <p style="text-align: center;"> <strong>Danh hiệu thi đua</strong></p> </td> <td style="width:392px;"> <p style="text-align: center;"> &nbsp;</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2007-2008</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Tập thể lao động tiên tiến</p> </td> <td style="width:392px;"> <p style="text-align: center;"> Quyết định số 6465/QĐ-SGD&amp;ĐT, ngày 28/7/2008</p> <p style="text-align: center;"> Sở GD$ ĐT Hà nội</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2008-2009</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Tập thể lao động tiên tiến</p> </td> <td style="width:392px;"> <p style="text-align: center;"> Quyết định số 6465/QĐ-SGD&amp;ĐT, ngày 22/7/2009</p> <p style="text-align: center;"> Sở GD$ ĐT Hà nội</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2009-2010</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Tập thể lao động xuất sắc</p> </td> <td style="width:392px;"> <p style="text-align: center;"> Quyết định số 3902/QĐ- UBND, ngày 10/8/2010.</p> <p style="text-align: center;"> Chủ tịch UBND thành phố Hà Nội</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2010-2011</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Tập thể lao động xuất sắc</p> </td> <td style="width:392px;"> <p style="text-align: center;"> Quyết định số 3660/QĐ-UBND, ngày 10/8/2011</p> <p style="text-align: center;"> Chủ tịch UBND thành phố Hà Nội</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2011-2012</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Tập thể lao động xuất sắc</p> </td> <td style="width:392px;"> <p style="text-align: center;"> Quyết định số 3577/QĐ-UBND, ngày 8/8/2012</p> <p style="text-align: center;"> Chủ tịch UBND thành phố Hà Nội</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2011-2012</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Cờ thi đua xuất sắc</p> </td> <td style="width:392px;"> <p style="text-align: center;"> Quyết định số 3577/QĐ-BGDĐT ngày 8/8/2012</p> <p style="text-align: center;"> Bộ trưởng Bộ GD&amp;ĐT</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2012-2013</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Tập thể lao động xuất sắc</p> </td> <td style="width:392px;"> <p style="text-align: center;"> &nbsp;</p> </td> </tr> </tbody></table><div style="clear: both; text-align: center;"> &nbsp;</div><p> &nbsp;</p><p> <strong>2. &nbsp;Khen thưởng</strong></p><p> &nbsp;</p><table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 644px;" width="644"> <tbody> <tr> <td style="width:58px;"> <p align="center"> <strong>Năm học</strong></p> </td> <td style="width:299px;"> <p align="center"> <strong>Hình thức khen thưởng</strong></p> </td> <td style="width:287px;"> <p align="center"> &nbsp;</p> </td> </tr> <tr> <td style="width:58px;"> <p align="center"> 2010-2011</p> </td> <td style="width:299px;"> <p align="center"> Bằng khen của Bộ GD&amp;ĐT</p> </td> <td style="width:287px;"> <p align="center"> Quyết định số 5483/QĐ-BGDĐT</p> <p align="center"> ngày 4/11/2011 Bộ GD&amp;ĐT</p> </td> </tr> <tr> <td rowspan="3" style="width:58px;"> <p align="center"> 2011-2012</p> </td> <td style="width:299px;"> <p align="center"> Giấy khen “Mỗi thầy cô giáo là tấm gương đạo đúc tự học và sáng tạo”</p> </td> <td style="width:287px;"> <p align="center"> Quyết định số 3468/QĐ-SGDĐT</p> <p align="center"> ngày 1/3/2013 Sở GD&amp;ĐT</p> </td> </tr> <tr> <td style="width:299px;height:84px;"> <p align="center"> Bằng khen của Bộ Giáo dục và Đào tạo về công tác giáo dục thể chất và Hội khỏe phù đổng 2008-2012.</p> </td> <td style="width:287px;height:84px;"> <p> &nbsp;</p> <p align="center"> Quyết định số 2746/QĐ/-BGDĐT</p> <p align="center"> Bộ GD&amp;ĐT</p> <p> &nbsp;</p> </td> </tr> <tr> <td style="width:299px;height:78px;"> <p align="center"> Cờ thi đua xuất sắc về TDTT năm 2012</p> <p align="center"> &nbsp;</p> </td> <td style="width:287px;height:78px;"> <p align="center"> Sở Văn hóa Thể thao và Du lịch tặng</p> <p> &nbsp;</p> </td> </tr> <tr> <td style="width:58px;height:78px;"> <p align="center"> 2012-2013</p> </td> <td style="width:299px;height:78px;"> <p align="center"> Bằng khen của thủ tướng chính phủ</p> <p> &nbsp;</p> </td> <td style="width:287px;height:78px;"> <p align="center"> Quyết định số 2047/QĐ-TTg, ngày 6/11/2013 của Thủ tướng Chính phủ</p> </td> </tr> </tbody></table><div style="clear:both;"> &nbsp;</div><p> &nbsp;</p><p> &nbsp;</p><p> &nbsp;</p></div>
<p style="text-align: right;">
<strong>Tác giả bài viết: </strong>Đinh Thị Nga - Thư ký hội đồng
</p>
</div>
<form id="form3B" action="">
<div class="clearfix">
<div id="stringrating">Tổng số điểm của bài viết là: 0 trong 0 đánh giá</div>
<div style="padding: 5px;">
<input class="hover-star" type="radio" value="1" title="bài viết rất kém"><input class="hover-star" type="radio" value="2" title="bài viết kém"><input class="hover-star" type="radio" value="3" title="bài viết đạt"><input class="hover-star" type="radio" value="4" title="bài viết tốt"><input class="hover-star" type="radio" value="5" title="bài viết rất tốt"><span id="hover-test" style="margin: 0 0 0 20px;">Click để đánh giá bài viết</span>
</div>
</div>
</form>
<script type="text/javascript">
//<![CDATA[
var sr = 0;
$(''.hover-star'').rating({
focus: function(value, link){
var tip = $(''#hover-test'');
if (sr != 2) {
tip[0].data = tip[0].data || tip.html();
tip.html(link.title || ''value: '' + value);
sr = 1;
}
},
blur: function(value, link){
var tip = $(''#hover-test'');
if (sr != 2) {
$(''#hover-test'').html(tip[0].data || '''');
sr = 1;
}
},
callback: function(value, link){
if (sr == 1) {
sr = 2;
$(''.hover-star'').rating(''disable'');
sendrating(''48'', value, ''ded52eb51db35f950bcbf05e8e2f358d'');
}
}
});
$(''.hover-star'').rating(''select'', ''-1'');
//]]>
</script>
<div class="keywords">
<strong>Từ khóa: </strong>
<a title="n/a" href="/index.php?language=vi&amp;nv=news&amp;op=search&amp;q=n%26%23x002F%3Ba&amp;mod=all"><em>n/a</em></a>
</div>
<div id="idcomment">
<ul class="control">
<li>
<a onclick="nv_show_hidden(''showcomment'',2);" href="javascript:void(0);"><img src="/themes/ThaiHoa/images/news/comment.png" alt="Show comment"><strong>Xem phản hồi</strong></a>
</li>
<li>
-- <a onclick="nv_show_hidden(''formcomment'',2);" href="javascript:void(0);"><img alt="Add comment" src="/themes/ThaiHoa/images/news/comment_add.png"><strong>Gửi phản hồi</strong></a>
</li>
</ul>
<div class="clearfix"></div>
<div id="showcomment">
<div class="page"></div></div>
<div id="formcomment">
<a title="Đăng nhập" href="/index.php?language=vi&amp;nv=users&amp;op=login&amp;nv_redirect=aHR0cDovL3RocHRjYXVnaWF5LmVkdS52bi9pbmRleC5waHA_bGFuZ3VhZ2U9dmkmbnY9bmV3cyZvcD1UaG9uZy10aW4tbmhhLXRydW9uZy9NT1QtU08tVEhBTkgtVElDSC1UUlVPTkctVEhQVC1DQVUtR0lBWS00OCNmb3JtY29tbWVudA,,">Bạn cần đăng nhập thành viên để sử dụng chức năng này</a>
</div>
</div>
<div class="clear"></div>
<p>
<strong>Những tin cũ hơn</strong>
</p>
<ul class="related">
<li>
<a title="HƯỚNG DẪN SKKN NĂM HỌC 2011-2012" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/HUONG-DAN-SKKN-NAM-HOC-2011-2012-41">HƯỚNG DẪN SKKN NĂM HỌC 2011-2012</a>
<span class="date">(09/05/2012)</span>
</li>
<li>
<a title="BẢN TỰ ĐÁNH GIÁ XẾP LOẠI" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/BAN-TU-DANH-GIA-XEP-LOAI-40">BẢN TỰ ĐÁNH GIÁ XẾP LOẠI</a>
<span class="date">(09/05/2012)</span>
</li>
<li>
<a title="THÔNG TƯ SỐ 58 VỀ BAN HÀNH QUY CHẾ ĐÁNH GIÁ VÀ XẾP LOẠI HỌC SINH" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/THONG-TU-SO-58-VE-BAN-HANH-QUY-CHE-DANH-GIA-VA-XEP-LOAI-HOC-SINH-36">THÔNG TƯ SỐ 58 VỀ BAN HÀNH QUY CHẾ ĐÁNH GIÁ VÀ XẾP LOẠI HỌC SINH</a>
<span class="date">(13/12/2011)</span>
</li>
<li>
<a title="HƯỚNG DẪN CÔNG TÁC TĐ-KT (Công văn số 3517/SGD&amp;ĐT-VP của Sở Giáo dục và Đào tạo Hà Nội)" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/HUONG-DAN-CONG-TAC-TD-KT-Cong-van-so-3517SGDDT-VP-cua-So-Giao-duc-va-Dao-tao-Ha-Noi-34">HƯỚNG DẪN CÔNG TÁC TĐ-KT (Công văn số 3517/SGD&amp;ĐT-VP của Sở Giáo dục và Đào tạo Hà Nội)</a>
<span class="date">(25/05/2011)</span>
</li>
<li>
<a title="TRƯỜNG THPT CẦU GIẤY VÀ CÔNG TÁC TUYỂN SINH" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/TRUONG-THPT-CAU-GIAY-VA-CONG-TAC-TUYEN-SINH-23">TRƯỜNG THPT CẦU GIẤY VÀ CÔNG TÁC TUYỂN SINH</a>
<span class="date">(18/04/2011)</span>
</li>
<li>
<a title="MỘT SỐ LƯU Ý KHI COI THI" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/MOT-SO-LUU-Y-KHI-COI-THI-21">MỘT SỐ LƯU Ý KHI COI THI</a>
<span class="date">(14/04/2011)</span>
</li>
<li>
<a title="HỒ SƠ ĐỀ NGHỊ XÉT TẶNG KNC" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/HO-SO-DE-NGHI-XET-TANG-KNC-20">HỒ SƠ ĐỀ NGHỊ XÉT TẶNG KNC</a>
<span class="date">(13/04/2011)</span>
</li>
<li>
<a title="XÉT TẶNG KỶ NIỆM CHƯƠNG" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/XET-TANG-KY-NIEM-CHUONG-19">XÉT TẶNG KỶ NIỆM CHƯƠNG</a>
<span class="date">(13/04/2011)</span>
</li>
<li>
<a title="QUY ĐỊNH CHUẨN NGHỀ NGHIỆP" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/QUY-DINH-CHUAN-NGHE-NGHIEP-18">QUY ĐỊNH CHUẨN NGHỀ NGHIỆP</a>
<span class="date">(13/04/2011)</span>
</li>
<li>
<a title="THÔNG TƯ SỐ 05" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/THONG-TU-SO-05-17">THÔNG TƯ SỐ 05</a>
<span class="date">(13/04/2011)</span>
</li>
</ul>
</div>
&nbsp;
</div>', N'Trường THPT Cầu Giấy được thành lập ngày 29/4/2007. Theo biên chế được phòng Tổ chức Cán bộ và lãnh đạo Sở Giáo dục và Đào tạo Hà Nội duyệt trường đã kiện toàn được đội ngũ CB-GV- CNV ngay trong những ngày đầu thành lập. Đến năm 2013-2014 trường có 99 CB-GV- CNV, trong đó có 51,28% đạt trên chuẩn', CAST(0x0000A0C300000000 AS DateTime))
INSERT [dbo].[TINTUC] ([MaTinTuc], [TieuDeTin], [NoiDungTin], [MotaNgan], [NgayDangTin]) VALUES (3, N'Công tác', N'<div class="span-13 contentcolumn">
<h3 class="breakcolumn">
<a title="Trang" nhất="" href="/"><img src="/themes/ThaiHoa/images/icons/home.png" alt="Trang nhất"></a>
<span class="breakcolumn">»</span>
<a href="/index.php?language=vi&amp;nv=news" title="Tin Tức">Tin Tức</a>
<span class="breakcolumn">»</span>
<a href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong" title="Thông tin nhà trường">Thông tin nhà trường</a>
</h3>
<div class="news_column" style="padding:0 !important;margin:0 !important;">
<div id="news_detail">
<h1>MỘT SỐ THÀNH TÍCH TRƯỜNG THPT CẦU GIẤY</h1>
<span class="time">Thứ tư - 26/03/2014  17:04</span>
<div class="control">
<ul>
<li>
<a class="sendmail" title="Gửi bài viết qua email" href="javascript:void(0);" onclick="NewWindow(''/index.php?language=vi&amp;nv=news&amp;op=sendmail/Thong-tin-nha-truong/MOT-SO-THANH-TICH-TRUONG-THPT-CAU-GIAY-48'','''',''500'',''400'',''no'');return false"></a>
</li>
<li>
<a class="print" title="In ra" href="javascript: void(0)" onclick="NewWindow(''/index.php?language=vi&amp;nv=news&amp;op=print/Thong-tin-nha-truong/MOT-SO-THANH-TICH-TRUONG-THPT-CAU-GIAY-48'','''',''840'',''768'',''yes'');return false"></a>
</li>
<li>
<a class="savefile" title="Lưu bài viết này" href="/index.php?language=vi&amp;nv=news&amp;op=savefile/Thong-tin-nha-truong/MOT-SO-THANH-TICH-TRUONG-THPT-CAU-GIAY-48"></a>
</li>
</ul>
</div>
<div style="clear: both;"></div>
<div id="hometext">
Trường THPT Cầu Giấy được thành lập ngày 29/4/2007. Theo biên chế được phòng Tổ chức Cán bộ và lãnh đạo Sở Giáo dục và Đào tạo Hà Nội duyệt trường đã kiện toàn được đội ngũ CB-GV- CNV ngay trong những ngày đầu thành lập. Đến năm 2013-2014 trường có 99 CB-GV- CNV, trong đó có 51,28% đạt trên chuẩn
</div>
<div class="bodytext"><p style="text-align: justify;"> &nbsp; &nbsp; &nbsp;Trường THPT Cầu Giấy được thành lập ngày 29/4/2007. Theo biên chế được phòng Tổ chức Cán bộ và lãnh đạo Sở Giáo dục và Đào tạo Hà Nội duyệt trường đã kiện toàn được đội ngũ CB-GV- CNV ngay trong những ngày đầu thành lập. Đến năm 2013-2014 trường có 99 CB-GV- CNV, trong đó có 51,28% đạt trên chuẩn</p><p> <strong>I.&nbsp;&nbsp;</strong><strong>Về công tác giảng dạy của giáo viên</strong></p><p> &nbsp; &nbsp; Nhà trường luôn chú trọng, tập trung chỉ đạo công tác giảng dạy của giáo viên. Đội ngũ giáo viên năng động, sáng tạo, linh hoạt trong đổi mới phương pháp giảng dạy, trong công tác kiểm tra đánh giá học sinh. Tích cực ứng dụng công nghệ thông tin trong giảng dạy, với tiêu chí mỗi giờ dạy học đều đem đến cho học sinh hứng thú, phát huy tính tích cực chủ động, sáng tạo của các em.</p><p> Trong mỗi năm học, tất cả các tổ bộ môn đều thực hiện các chuyên đề có chất lượng cao, có ý nghĩa thiết thực đối với việc nâng cao chất lượng dạy và học</p><p> Dù mới chỉ thành lập được 7 năm nhưng năm nào Trường THPT Cầu Giấy cũng được vinh danh trong các đợt thi giáo viên dạy giỏi&nbsp; của thành phố:</p><p> &nbsp;</p><table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 403px;" width="403"> <tbody> <tr> <td style="width:76px;"> <p align="center"> <strong>Năm học</strong></p> </td> <td style="width:64px;"> <p align="center"> <strong>Số giải</strong></p> </td> <td style="width:152px;"> <p align="center"> <strong>Môn</strong></p> </td> <td style="width:111px;"> <p align="center"> <strong>Đạt giải</strong></p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2007-2008</p> </td> <td style="width:64px;"> <p align="center"> 02</p> </td> <td style="width:152px;"> <p> Toán, Địa lý</p> </td> <td style="width:111px;"> <p> 2 giải nhì</p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2008-2009</p> </td> <td style="width:64px;"> <p align="center"> 01</p> </td> <td style="width:152px;"> <p> Hóa học</p> </td> <td style="width:111px;"> <p> 1 giải ba</p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2009-2010</p> </td> <td style="width:64px;"> <p align="center"> 01</p> </td> <td style="width:152px;"> <p> Thể dục</p> </td> <td style="width:111px;"> <p> 1 giải KK</p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2010-2011</p> </td> <td style="width:64px;"> <p align="center"> 01</p> </td> <td style="width:152px;"> <p> Văn</p> </td> <td style="width:111px;"> <p> 1 giải nhì</p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2011-2012</p> </td> <td style="width:64px;"> <p align="center"> 01</p> </td> <td style="width:152px;"> <p> Địa lý</p> </td> <td style="width:111px;"> <p> 1 giải nhất</p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2012-2013</p> </td> <td style="width:64px;"> <p align="center"> 01</p> </td> <td style="width:152px;"> <p> Hóa học</p> </td> <td style="width:111px;"> <p> 1 giải ba</p> </td> </tr> <tr> <td style="width:76px;"> <p align="center"> 2013-2014</p> </td> <td style="width:64px;"> <p align="center"> 03</p> </td> <td style="width:152px;"> <p> -&nbsp;&nbsp;&nbsp; Sinh học, Thể dục</p> <p> - Tích hợp trong giảng dạy</p> <p> (bộ môn Ngữ văn)</p> </td> <td style="width:111px;"> <p> -&nbsp; Vừa dự thi cấp TP</p> <p> - Đang dự thi vòng quốc gia</p> </td> </tr> </tbody></table><div style="clear:both;"> &nbsp;</div><p> &nbsp;</p><p> Không chỉ tham gia tích cực trong các đợt thi GVG, các đồng chí CB-GV trong trường còn tích cực thi đua lập nhiều thành tích và đã được cấp trên ghi nhận:</p><p style="margin-left:.5in;"> *) Hai đ/c được nhận bằng khen của Thủ tướng Chính phủ:</p><p style="margin-left:1.0in;"> +) Đ/c Nguyễn Đức Hải</p><p style="margin-left:1.0in;"> +) &nbsp;Đ/c Nghiêm Chí Thành</p><p style="margin-left:.5in;"> *) Hai đ/c được nhận bằng khen của Bộ Giáo dục &amp; Đào tạo:</p><p style="margin-left:67.5pt;"> +) Đ/c Lê Thị Hồng</p><p style="margin-left:67.5pt;"> +) Đ/c Nguyễn Thị Liên</p><p style="margin-left:67.5pt;"> +) 104 lượt CSTĐCS</p><p> <strong>* T</strong><strong>ập thể</strong></p><p> Năm học nào cũng có các tổ chuyên môn được công nhận tổ lao động tiên tiến cấp thành phố</p><table align="center" border="1" cellpadding="0" cellspacing="0" style="width:521px;" width="521"> <tbody> <tr> <td rowspan="2" style="width:91px;"> <p align="center"> <strong>Năm học</strong></p> </td> <td colspan="2" style="width:225px;"> <p align="center"> <strong>Tổ LĐTT</strong></p> </td> <td colspan="2" style="width:204px;"> <p align="center"> <strong>Tổ LĐXS</strong></p> </td> </tr> <tr> <td style="width:109px;"> <p align="center"> <strong>Số lượng</strong></p> </td> <td style="width:116px;"> <p align="center"> <strong>Tên tổ CM</strong></p> </td> <td style="width:102px;"> <p align="center"> <strong>Số lượng</strong></p> </td> <td style="width:102px;"> <p align="center"> <strong>Tên tổ CM</strong></p> </td> </tr> <tr> <td style="width:91px;"> <p align="center"> 2008-2009</p> </td> <td style="width:109px;"> <p align="center"> 03</p> </td> <td style="width:116px;"> <p style="text-align: center;"> Toán-Tin,</p> <p style="text-align: center;"> Hóa-Sinh,</p> <p style="text-align: center;"> Lý-Kỹ thuật</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> </tr> <tr> <td style="width:91px;"> <p style="text-align: center;"> 2009-2010</p> </td> <td style="width:109px;"> <p style="text-align: center;"> 01</p> </td> <td style="width:116px;"> <p style="text-align: center;"> Toán-Tin</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> </tr> <tr> <td style="width:91px;"> <p style="text-align: center;"> 2010-2011</p> </td> <td style="width:109px;"> <p style="text-align: center;"> 02</p> </td> <td style="width:116px;"> <p style="text-align: center;"> Hóa-Sinh,</p> <p style="text-align: center;"> Ngữ văn</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> </tr> <tr> <td style="width:91px;"> <p style="text-align: center;"> 2011-2012</p> </td> <td style="width:109px;"> <p style="text-align: center;"> 02</p> </td> <td style="width:116px;"> <p style="text-align: center;"> Ngữ văn,</p> <p style="text-align: center;"> Tổng hợp</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:102px;"> <p style="text-align: center;"> &nbsp;</p> </td> </tr> <tr> <td style="width:91px;"> <p style="text-align: center;"> 2012-2013</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:109px;"> <p style="text-align: center;"> 02</p> </td> <td style="width:116px;"> <p style="text-align: center;"> Hóa-Sinh,</p> <p style="text-align: center;"> Ngữ văn</p> </td> <td style="width:102px;"> <p> &nbsp;</p> </td> <td style="width:102px;"> <p> &nbsp;</p> </td> </tr> </tbody></table><p> <strong>II.&nbsp;</strong><strong>Về hoạt động giáo dục học sinh</strong></p><p> <strong><em>*) </em></strong><strong><em>Kết quả xếp loại đạo đức:</em></strong></p><table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 500px;" width="584"> <tbody> <tr> <td style="width:87px;"> <p style="text-align: center;"> <strong>Năm học</strong></p> </td> <td style="width:101px;"> <p style="text-align: center;"> <strong>2007-2008</strong></p> </td> <td style="width:90px;"> <p style="text-align: center;"> <strong>2008-2009</strong></p> </td> <td style="width:78px;"> <p style="text-align: center;"> <strong>2009-2010</strong></p> </td> <td style="width:72px;"> <p style="text-align: center;"> <strong>2010-2011</strong></p> </td> <td style="width:78px;"> <p style="text-align: center;"> <strong>2011-2012</strong></p> </td> <td style="width:78px;"> <p style="text-align: center;"> <strong>2012-2013</strong></p> </td> </tr> <tr> <td style="width:87px;"> <p style="text-align: center;"> Hạnh kiểm Khá-tốt</p> </td> <td style="width:101px;"> <p style="text-align: center;"> &nbsp;389 HS</p> <p style="text-align: center;"> (91,5%)</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:90px;"> <p style="text-align: center;"> 819 HS</p> <p style="text-align: center;"> (97,5%)</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:78px;"> <p style="text-align: center;"> 1297 HS</p> <p style="text-align: center;"> (97,1%)</p> </td> <td style="width:72px;"> <p style="text-align: center;"> 1321HS</p> <p style="text-align: center;"> (97,1%)</p> </td> <td style="width:78px;"> <p style="text-align: center;"> 1455 HS</p> <p style="text-align: center;"> (98,4%)</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:78px;"> <p style="text-align: center;"> 1429 HS&nbsp;</p> <p style="text-align: center;"> (98,4 %)</p> <p> &nbsp;</p> </td> </tr> </tbody></table><div style="clear:both;"> &nbsp;</div><p> &nbsp;</p><p> <strong>*) <em>Về học tập</em></strong></p><p style="margin-left:.75in;"> <strong><em>- </em></strong><strong><em>Kết quả thi HSG</em></strong></p><table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 500px;" width="599"> <tbody> <tr> <td style="width:55px;"> <p style="text-align: center;"> <strong>Năm học</strong></p> </td> <td style="width:80px;"> <p style="text-align: center;"> <strong>2007-2008</strong></p> </td> <td style="width:76px;"> <p style="text-align: center;"> <strong>2008-2009</strong></p> </td> <td style="width:76px;"> <p style="text-align: center;"> <strong>2009-2010</strong></p> </td> <td style="width:69px;"> <p style="text-align: center;"> <strong>2010-2011</strong></p> </td> <td style="width:79px;"> <p style="text-align: center;"> <strong>2011-2012</strong></p> </td> <td style="width:80px;"> <p style="text-align: center;"> <strong>2012-2013</strong></p> </td> <td style="width:84px;"> <p style="text-align: center;"> <strong>2013-2014</strong></p> </td> </tr> <tr> <td style="width:55px;"> <p style="text-align: center;"> HSG TP</p> </td> <td style="width:80px;"> <p style="text-align: center;"> Chưa có HS tham gia</p> </td> <td style="width:76px;"> <p style="text-align: center;"> Chưa có HS tham gia</p> </td> <td style="width:76px;"> <p style="text-align: center;"> 6</p> </td> <td style="width:69px;"> <p style="text-align: center;"> 9</p> </td> <td style="width:79px;"> <p style="text-align: center;"> 6</p> </td> <td style="width:80px;"> <p style="text-align: center;"> 11</p> </td> <td style="width:84px;"> <p style="text-align: center;"> 11</p> <p style="text-align: center;"> (4 nhì,</p> <p style="text-align: center;"> 1ba)</p> </td> </tr> <tr> <td style="width:55px;"> <p style="text-align: center;"> HSG cụm</p> </td> <td style="width:80px;"> <p style="text-align: center;"> 13 giải (Tỷ lệ 30,9%)</p> </td> <td style="width:76px;"> <p style="text-align: center;"> 35 giải (Tỷ lệ 41,2%)</p> </td> <td style="width:76px;"> <p style="text-align: center;"> 49 giải (Tỷ lệ 59,7%)</p> </td> <td style="width:69px;"> <p style="text-align: center;"> 62 giải (Tỷ lệ 67,4%)</p> </td> <td style="width:79px;"> <p style="text-align: center;"> 46 giải (Tỷ lệ 56,1%)</p> </td> <td style="width:80px;"> <p style="text-align: center;"> 48 giải (Tỷ lệ 55,1%)</p> </td> <td style="width:84px;"> <p style="text-align: center;"> Đang tham dự</p> </td> </tr> </tbody></table><div style="clear:both;"> &nbsp;</div><p style="margin-left:.75in;"> &nbsp;</p><p style="margin-left:.75in;"> -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><em>Kết quả xếp loại học lực:</em></strong></p><p> Kết quả học tập của học sinh tiến bộ theo từng năm học:</p><table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 500px;" width="608"> <tbody> <tr> <td style="width:87px;"> <p style="text-align: center;"> <strong>Năm học</strong></p> </td> <td style="width:87px;"> <p style="text-align: center;"> <strong>2007-2008</strong></p> </td> <td style="width:87px;"> <p style="text-align: center;"> <strong>2008-2009</strong></p> </td> <td style="width:88px;"> <p style="text-align: center;"> <strong>2009-2010</strong></p> </td> <td style="width:79px;"> <p style="text-align: center;"> <strong>2010-2011</strong></p> </td> <td style="width:100px;"> <p style="text-align: center;"> <strong>2011-2012</strong></p> </td> <td style="width:80px;"> <p style="text-align: center;"> <strong>2012-2013</strong></p> </td> </tr> <tr> <td style="width:87px;height:105px;"> <p style="text-align: center;"> Khá-Giỏi</p> </td> <td style="width:87px;height:105px;"> <p style="text-align: center;"> 197</p> <p style="text-align: center;"> (46,4%)</p> </td> <td style="width:87px;height:105px;"> <p style="text-align: center;"> 555</p> <p style="text-align: center;"> (66,4%)</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:88px;height:105px;"> <p style="text-align: center;"> 916</p> <p style="text-align: center;"> (68,6%)</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:79px;height:105px;"> <p style="text-align: center;"> 1001</p> <p style="text-align: center;"> (73,6%)</p> </td> <td style="width:100px;height:105px;"> <p style="text-align: center;"> 1087</p> <p style="text-align: center;"> (73,5%)</p> <p style="text-align: center;"> &nbsp;</p> </td> <td style="width:80px;height:105px;"> <p style="text-align: center;"> 1157&nbsp;</p> <p style="text-align: center;"> (79,7 %)</p> </td> </tr> </tbody></table><div style="clear:both;"> &nbsp;</div><p> &nbsp;</p><p> <strong><em>* Hoạt động ngoại khóa</em></strong></p><p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Từ năm 2011 đến nay nhà trường kết hợp với hội phụ huynh trường thành lập các câu lạc bộ: Toán, Lý, Hóa, Văn, câu lạc bộ thể thao (bóng bàn, bóng chuyền, cầu lông, dance-sport), hoạt động vào chiều thứ tư hàng tuần lôi cuốn được nhiều học sinh tham gia góp phần hướng tới mục tiêu giáo dục toàn diện cho học sinh.). Học sinh trong CLB Lý tham gia hội thi “Tên lửa nước” đã đạt 01giải nhất, 01 giải khuyến khích cấp thành phố(năm 2012), được Trung ương Đoàn tặng bằng khen trong fesstival sáng tạo trẻ thủ đô.</p><p> <em><strong>*) Câu lạc bộ Vật lý, Hóa học:</strong></em>&nbsp;Đã có bốn đề tài dự thi NCKH Itel ISEF và được giải khuyến khích cấp thành phố <em>“Máy kéo rèm tự động”, Thùng rác thông minh”</em> (năm 2012-2013), <em>“Giá sách dành cho người khuyết tật tay”, “Xử lý nước nhiễm Asen bằng phương pháp oxi hóa – khử”</em> (năm 2013-2014).</p><p> <em><strong>*) Câu lạc bộ văn nghệ - thể thao:</strong></em>&nbsp;Thành tích bên Đoàn và tổ Thể dục</p><p style="margin-left:31.5pt;"> - Các hoạt động giao lưu trong giờ chào cờ đầu tuần được tổ chức thường xuyên với nhiều nội dung phục vụ học tập, sinh hoạt bổ ích.</p><p style="margin-left:31.5pt;"> - Trong các ngày lễ lớn giáo viên – học sinh cùng tham gia các hoạt động văn nghệ, thể thao...</p><p style="margin-left:31.5pt;"> - Năm nào cũng tổ chức cho học sinh toàn trường đi dã ngoại một ngày vui vẻ, bổ ích và an toàn.</p><p style="margin-left:31.5pt;"> - Hàng năm nhà trường tổ chức cho HSG toàn diện, HSG cụm và cán bộ lớp, cán bộ Đoàn tiêu biểu thăm quan tại một số di tích lịch sử: Thành cổ Quảng Trị, Nghĩa trang Trường Sơn, Cố đô Hoa lư, Sơn Tây, Hải Phòng …vào đầu năm học.</p><p> Các hoạt động trên đã góp phần giáo dục cho học sinh truyền thống “<em>uống nước nhớ nguồn</em>” và ý thức trân trọng, gìn giữ những di tích lịch sử văn hóa của dân tộc.</p><p> <strong>III.&nbsp;</strong><strong>KHEN THƯỞNG TẬP THỂ TRƯỜNG</strong></p><p> Sau 3 năm thành lập trường đã được công nhận Trường chuẩn Quốc gia</p><p> <strong>1. Danh hiệu thi đua</strong></p><table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 615px;" width="615"> <tbody> <tr> <td style="width:49px;"> <p style="text-align: center;"> <strong>Năm học</strong></p> </td> <td style="width:173px;"> <p style="text-align: center;"> <strong>Danh hiệu thi đua</strong></p> </td> <td style="width:392px;"> <p style="text-align: center;"> &nbsp;</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2007-2008</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Tập thể lao động tiên tiến</p> </td> <td style="width:392px;"> <p style="text-align: center;"> Quyết định số 6465/QĐ-SGD&amp;ĐT, ngày 28/7/2008</p> <p style="text-align: center;"> Sở GD$ ĐT Hà nội</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2008-2009</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Tập thể lao động tiên tiến</p> </td> <td style="width:392px;"> <p style="text-align: center;"> Quyết định số 6465/QĐ-SGD&amp;ĐT, ngày 22/7/2009</p> <p style="text-align: center;"> Sở GD$ ĐT Hà nội</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2009-2010</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Tập thể lao động xuất sắc</p> </td> <td style="width:392px;"> <p style="text-align: center;"> Quyết định số 3902/QĐ- UBND, ngày 10/8/2010.</p> <p style="text-align: center;"> Chủ tịch UBND thành phố Hà Nội</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2010-2011</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Tập thể lao động xuất sắc</p> </td> <td style="width:392px;"> <p style="text-align: center;"> Quyết định số 3660/QĐ-UBND, ngày 10/8/2011</p> <p style="text-align: center;"> Chủ tịch UBND thành phố Hà Nội</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2011-2012</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Tập thể lao động xuất sắc</p> </td> <td style="width:392px;"> <p style="text-align: center;"> Quyết định số 3577/QĐ-UBND, ngày 8/8/2012</p> <p style="text-align: center;"> Chủ tịch UBND thành phố Hà Nội</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2011-2012</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Cờ thi đua xuất sắc</p> </td> <td style="width:392px;"> <p style="text-align: center;"> Quyết định số 3577/QĐ-BGDĐT ngày 8/8/2012</p> <p style="text-align: center;"> Bộ trưởng Bộ GD&amp;ĐT</p> </td> </tr> <tr> <td style="width:49px;"> <p style="text-align: center;"> 2012-2013</p> </td> <td style="width:173px;"> <p style="text-align: center;"> Tập thể lao động xuất sắc</p> </td> <td style="width:392px;"> <p style="text-align: center;"> &nbsp;</p> </td> </tr> </tbody></table><div style="clear: both; text-align: center;"> &nbsp;</div><p> &nbsp;</p><p> <strong>2. &nbsp;Khen thưởng</strong></p><p> &nbsp;</p><table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 644px;" width="644"> <tbody> <tr> <td style="width:58px;"> <p align="center"> <strong>Năm học</strong></p> </td> <td style="width:299px;"> <p align="center"> <strong>Hình thức khen thưởng</strong></p> </td> <td style="width:287px;"> <p align="center"> &nbsp;</p> </td> </tr> <tr> <td style="width:58px;"> <p align="center"> 2010-2011</p> </td> <td style="width:299px;"> <p align="center"> Bằng khen của Bộ GD&amp;ĐT</p> </td> <td style="width:287px;"> <p align="center"> Quyết định số 5483/QĐ-BGDĐT</p> <p align="center"> ngày 4/11/2011 Bộ GD&amp;ĐT</p> </td> </tr> <tr> <td rowspan="3" style="width:58px;"> <p align="center"> 2011-2012</p> </td> <td style="width:299px;"> <p align="center"> Giấy khen “Mỗi thầy cô giáo là tấm gương đạo đúc tự học và sáng tạo”</p> </td> <td style="width:287px;"> <p align="center"> Quyết định số 3468/QĐ-SGDĐT</p> <p align="center"> ngày 1/3/2013 Sở GD&amp;ĐT</p> </td> </tr> <tr> <td style="width:299px;height:84px;"> <p align="center"> Bằng khen của Bộ Giáo dục và Đào tạo về công tác giáo dục thể chất và Hội khỏe phù đổng 2008-2012.</p> </td> <td style="width:287px;height:84px;"> <p> &nbsp;</p> <p align="center"> Quyết định số 2746/QĐ/-BGDĐT</p> <p align="center"> Bộ GD&amp;ĐT</p> <p> &nbsp;</p> </td> </tr> <tr> <td style="width:299px;height:78px;"> <p align="center"> Cờ thi đua xuất sắc về TDTT năm 2012</p> <p align="center"> &nbsp;</p> </td> <td style="width:287px;height:78px;"> <p align="center"> Sở Văn hóa Thể thao và Du lịch tặng</p> <p> &nbsp;</p> </td> </tr> <tr> <td style="width:58px;height:78px;"> <p align="center"> 2012-2013</p> </td> <td style="width:299px;height:78px;"> <p align="center"> Bằng khen của thủ tướng chính phủ</p> <p> &nbsp;</p> </td> <td style="width:287px;height:78px;"> <p align="center"> Quyết định số 2047/QĐ-TTg, ngày 6/11/2013 của Thủ tướng Chính phủ</p> </td> </tr> </tbody></table><div style="clear:both;"> &nbsp;</div><p> &nbsp;</p><p> &nbsp;</p><p> &nbsp;</p></div>
<p style="text-align: right;">
<strong>Tác giả bài viết: </strong>Đinh Thị Nga - Thư ký hội đồng
</p>
</div>
<form id="form3B" action="">
<div class="clearfix">
<div id="stringrating">Tổng số điểm của bài viết là: 0 trong 0 đánh giá</div>
<div style="padding: 5px;">
<input class="hover-star" type="radio" value="1" title="bài viết rất kém"><input class="hover-star" type="radio" value="2" title="bài viết kém"><input class="hover-star" type="radio" value="3" title="bài viết đạt"><input class="hover-star" type="radio" value="4" title="bài viết tốt"><input class="hover-star" type="radio" value="5" title="bài viết rất tốt"><span id="hover-test" style="margin: 0 0 0 20px;">Click để đánh giá bài viết</span>
</div>
</div>
</form>
<script type="text/javascript">
//<![CDATA[
var sr = 0;
$(''.hover-star'').rating({
focus: function(value, link){
var tip = $(''#hover-test'');
if (sr != 2) {
tip[0].data = tip[0].data || tip.html();
tip.html(link.title || ''value: '' + value);
sr = 1;
}
},
blur: function(value, link){
var tip = $(''#hover-test'');
if (sr != 2) {
$(''#hover-test'').html(tip[0].data || '''');
sr = 1;
}
},
callback: function(value, link){
if (sr == 1) {
sr = 2;
$(''.hover-star'').rating(''disable'');
sendrating(''48'', value, ''ded52eb51db35f950bcbf05e8e2f358d'');
}
}
});
$(''.hover-star'').rating(''select'', ''-1'');
//]]>
</script>
<div class="keywords">
<strong>Từ khóa: </strong>
<a title="n/a" href="/index.php?language=vi&amp;nv=news&amp;op=search&amp;q=n%26%23x002F%3Ba&amp;mod=all"><em>n/a</em></a>
</div>
<div id="idcomment">
<ul class="control">
<li>
<a onclick="nv_show_hidden(''showcomment'',2);" href="javascript:void(0);"><img src="/themes/ThaiHoa/images/news/comment.png" alt="Show comment"><strong>Xem phản hồi</strong></a>
</li>
<li>
-- <a onclick="nv_show_hidden(''formcomment'',2);" href="javascript:void(0);"><img alt="Add comment" src="/themes/ThaiHoa/images/news/comment_add.png"><strong>Gửi phản hồi</strong></a>
</li>
</ul>
<div class="clearfix"></div>
<div id="showcomment">
<div class="page"></div></div>
<div id="formcomment">
<a title="Đăng nhập" href="/index.php?language=vi&amp;nv=users&amp;op=login&amp;nv_redirect=aHR0cDovL3RocHRjYXVnaWF5LmVkdS52bi9pbmRleC5waHA_bGFuZ3VhZ2U9dmkmbnY9bmV3cyZvcD1UaG9uZy10aW4tbmhhLXRydW9uZy9NT1QtU08tVEhBTkgtVElDSC1UUlVPTkctVEhQVC1DQVUtR0lBWS00OCNmb3JtY29tbWVudA,,">Bạn cần đăng nhập thành viên để sử dụng chức năng này</a>
</div>
</div>
<div class="clear"></div>
<p>
<strong>Những tin cũ hơn</strong>
</p>
<ul class="related">
<li>
<a title="HƯỚNG DẪN SKKN NĂM HỌC 2011-2012" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/HUONG-DAN-SKKN-NAM-HOC-2011-2012-41">HƯỚNG DẪN SKKN NĂM HỌC 2011-2012</a>
<span class="date">(09/05/2012)</span>
</li>
<li>
<a title="BẢN TỰ ĐÁNH GIÁ XẾP LOẠI" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/BAN-TU-DANH-GIA-XEP-LOAI-40">BẢN TỰ ĐÁNH GIÁ XẾP LOẠI</a>
<span class="date">(09/05/2012)</span>
</li>
<li>
<a title="THÔNG TƯ SỐ 58 VỀ BAN HÀNH QUY CHẾ ĐÁNH GIÁ VÀ XẾP LOẠI HỌC SINH" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/THONG-TU-SO-58-VE-BAN-HANH-QUY-CHE-DANH-GIA-VA-XEP-LOAI-HOC-SINH-36">THÔNG TƯ SỐ 58 VỀ BAN HÀNH QUY CHẾ ĐÁNH GIÁ VÀ XẾP LOẠI HỌC SINH</a>
<span class="date">(13/12/2011)</span>
</li>
<li>
<a title="HƯỚNG DẪN CÔNG TÁC TĐ-KT (Công văn số 3517/SGD&amp;ĐT-VP của Sở Giáo dục và Đào tạo Hà Nội)" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/HUONG-DAN-CONG-TAC-TD-KT-Cong-van-so-3517SGDDT-VP-cua-So-Giao-duc-va-Dao-tao-Ha-Noi-34">HƯỚNG DẪN CÔNG TÁC TĐ-KT (Công văn số 3517/SGD&amp;ĐT-VP của Sở Giáo dục và Đào tạo Hà Nội)</a>
<span class="date">(25/05/2011)</span>
</li>
<li>
<a title="TRƯỜNG THPT CẦU GIẤY VÀ CÔNG TÁC TUYỂN SINH" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/TRUONG-THPT-CAU-GIAY-VA-CONG-TAC-TUYEN-SINH-23">TRƯỜNG THPT CẦU GIẤY VÀ CÔNG TÁC TUYỂN SINH</a>
<span class="date">(18/04/2011)</span>
</li>
<li>
<a title="MỘT SỐ LƯU Ý KHI COI THI" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/MOT-SO-LUU-Y-KHI-COI-THI-21">MỘT SỐ LƯU Ý KHI COI THI</a>
<span class="date">(14/04/2011)</span>
</li>
<li>
<a title="HỒ SƠ ĐỀ NGHỊ XÉT TẶNG KNC" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/HO-SO-DE-NGHI-XET-TANG-KNC-20">HỒ SƠ ĐỀ NGHỊ XÉT TẶNG KNC</a>
<span class="date">(13/04/2011)</span>
</li>
<li>
<a title="XÉT TẶNG KỶ NIỆM CHƯƠNG" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/XET-TANG-KY-NIEM-CHUONG-19">XÉT TẶNG KỶ NIỆM CHƯƠNG</a>
<span class="date">(13/04/2011)</span>
</li>
<li>
<a title="QUY ĐỊNH CHUẨN NGHỀ NGHIỆP" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/QUY-DINH-CHUAN-NGHE-NGHIEP-18">QUY ĐỊNH CHUẨN NGHỀ NGHIỆP</a>
<span class="date">(13/04/2011)</span>
</li>
<li>
<a title="THÔNG TƯ SỐ 05" href="/index.php?language=vi&amp;nv=news&amp;op=Thong-tin-nha-truong/THONG-TU-SO-05-17">THÔNG TƯ SỐ 05</a>
<span class="date">(13/04/2011)</span>
</li>
</ul>
</div>
&nbsp;
</div>', N'Trường THPT Cầu Giấy được thành lập ngày 29/4/2007. Theo biên chế được phòng Tổ chức Cán bộ và lãnh đạo Sở Giáo dục và Đào tạo Hà Nội duyệt trường đã kiện toàn được đội ngũ CB-GV- CNV ngay trong những ngày đầu thành lập. Đến năm 2013-2014 trường có 99 CB-GV- CNV, trong đó có 51,28% đạt trên chuẩn', CAST(0x0000A0C300000000 AS DateTime))
INSERT [dbo].[TINTUC] ([MaTinTuc], [TieuDeTin], [NoiDungTin], [MotaNgan], [NgayDangTin]) VALUES (4, N'Thành tích khác', N'Trường THPT Cầu Giấy được thành lập ngày 29/4/2007. Theo biên chế được phòng Tổ chức Cán bộ và lãnh đạo Sở Giáo dục và Đào tạo Hà Nội duyệt trường đã kiện toàn được đội ngũ CB-GV- CNV ngay trong những ngày đầu thành lập. Đến năm 2013-2014 trường có 99 CB-GV- CNV, trong đó có 51,28% đạt trên chuẩn
     Trường THPT Cầu Giấy được thành lập ngày 29/4/2007. Theo biên chế được phòng Tổ chức Cán bộ và lãnh đạo Sở Giáo dục và Đào tạo Hà Nội duyệt trường đã kiện toàn được đội ngũ CB-GV- CNV ngay trong những ngày đầu thành lập. Đến năm 2013-2014 trường có 99 CB-GV- CNV, trong đó có 51,28% đạt trên chuẩn
I.  Về công tác giảng dạy của giáo viên
    Nhà trường luôn chú trọng, tập trung chỉ đạo công tác giảng dạy của giáo viên. Đội ngũ giáo viên năng động, sáng tạo, linh hoạt trong đổi mới phương pháp giảng dạy, trong công tác kiểm tra đánh giá học sinh. Tích cực ứng dụng công nghệ thông tin trong giảng dạy, với tiêu chí mỗi giờ dạy học đều đem đến cho học sinh hứng thú, phát huy tính tích cực chủ động, sáng tạo của các em.
Trong mỗi năm học, tất cả các tổ bộ môn đều thực hiện các chuyên đề có chất lượng cao, có ý nghĩa thiết thực đối với việc nâng cao chất lượng dạy và học
Dù mới chỉ thành lập được 7 năm nhưng năm nào Trường THPT Cầu Giấy cũng được vinh danh trong các đợt thi giáo viên dạy giỏi  của thành phố:
 
Năm học
Số giải
Môn
Đạt giải
2007-2008
02
Toán, Địa lý
2 giải nhì
2008-2009
01
Hóa học
1 giải ba
2009-2010
01
Thể dục
1 giải KK
2010-2011
01
Văn
1 giải nhì
2011-2012
01
Địa lý
1 giải nhất
2012-2013
01
Hóa học
1 giải ba
2013-2014
03
-    Sinh học, Thể dục
- Tích hợp trong giảng dạy
(bộ môn Ngữ văn)
-  Vừa dự thi cấp TP
- Đang dự thi vòng quốc gia
 
 
Không chỉ tham gia tích cực trong các đợt thi GVG, các đồng chí CB-GV trong trường còn tích cực thi đua lập nhiều thành tích và đã được cấp trên ghi nhận:
*) Hai đ/c được nhận bằng khen của Thủ tướng Chính phủ:
+) Đ/c Nguyễn Đức Hải
+)  Đ/c Nghiêm Chí Thành
*) Hai đ/c được nhận bằng khen của Bộ Giáo dục & Đào tạo:
+) Đ/c Lê Thị Hồng
+) Đ/c Nguyễn Thị Liên
+) 104 lượt CSTĐCS
* Tập thể
Năm học nào cũng có các tổ chuyên môn được công nhận tổ lao động tiên tiến cấp thành phố
Năm học
Tổ LĐTT
Tổ LĐXS
Số lượng
Tên tổ CM
Số lượng
Tên tổ CM
2008-2009
03
Toán-Tin,
Hóa-Sinh,
Lý-Kỹ thuật
 
 
2009-2010
01
Toán-Tin
 
 
2010-2011
02
Hóa-Sinh,
Ngữ văn
 
 
2011-2012
02
Ngữ văn,
Tổng hợp
 
 
2012-2013
 
02
Hóa-Sinh,
Ngữ văn
 
 
II. Về hoạt động giáo dục học sinh
*) Kết quả xếp loại đạo đức:
Năm học
2007-2008
2008-2009
2009-2010
2010-2011
2011-2012
2012-2013
Hạnh kiểm Khá-tốt
 389 HS
(91,5%)
 
819 HS
(97,5%)
 
1297 HS
(97,1%)
1321HS
(97,1%)
1455 HS
(98,4%)
 
1429 HS 
(98,4 %)
 
 
 
*) Về học tập
- Kết quả thi HSG
Năm học
2007-2008
2008-2009
2009-2010
2010-2011
2011-2012
2012-2013
2013-2014
HSG TP
Chưa có HS tham gia
Chưa có HS tham gia
6
9
6
11
11
(4 nhì,
1ba)
HSG cụm
13 giải (Tỷ lệ 30,9%)
35 giải (Tỷ lệ 41,2%)
49 giải (Tỷ lệ 59,7%)
62 giải (Tỷ lệ 67,4%)
46 giải (Tỷ lệ 56,1%)
48 giải (Tỷ lệ 55,1%)
Đang tham dự
 
 
-         Kết quả xếp loại học lực:
Kết quả học tập của học sinh tiến bộ theo từng năm học:
Năm học
2007-2008
2008-2009
2009-2010
2010-2011
2011-2012
2012-2013
Khá-Giỏi
197
(46,4%)
555
(66,4%)
 
916
(68,6%)
 
1001
(73,6%)
1087
(73,5%)
 
1157 
(79,7 %)
 
 
* Hoạt động ngoại khóa
         Từ năm 2011 đến nay nhà trường kết hợp với hội phụ huynh trường thành lập các câu lạc bộ: Toán, Lý, Hóa, Văn, câu lạc bộ thể thao (bóng bàn, bóng chuyền, cầu lông, dance-sport), hoạt động vào chiều thứ tư hàng tuần lôi cuốn được nhiều học sinh tham gia góp phần hướng tới mục tiêu giáo dục toàn diện cho học sinh.). Học sinh trong CLB Lý tham gia hội thi “Tên lửa nước” đã đạt 01giải nhất, 01 giải khuyến khích cấp thành phố(năm 2012), được Trung ương Đoàn tặng bằng khen trong fesstival sáng tạo trẻ thủ đô.
*) Câu lạc bộ Vật lý, Hóa học: Đã có bốn đề tài dự thi NCKH Itel ISEF và được giải khuyến khích cấp thành phố “Máy kéo rèm tự động”, Thùng rác thông minh” (năm 2012-2013), “Giá sách dành cho người khuyết tật tay”, “Xử lý nước nhiễm Asen bằng phương pháp oxi hóa – khử” (năm 2013-2014).
*) Câu lạc bộ văn nghệ - thể thao: Thành tích bên Đoàn và tổ Thể dục
- Các hoạt động giao lưu trong giờ chào cờ đầu tuần được tổ chức thường xuyên với nhiều nội dung phục vụ học tập, sinh hoạt bổ ích.
- Trong các ngày lễ lớn giáo viên – học sinh cùng tham gia các hoạt động văn nghệ, thể thao...
- Năm nào cũng tổ chức cho học sinh toàn trường đi dã ngoại một ngày vui vẻ, bổ ích và an toàn.
- Hàng năm nhà trường tổ chức cho HSG toàn diện, HSG cụm và cán bộ lớp, cán bộ Đoàn tiêu biểu thăm quan tại một số di tích lịch sử: Thành cổ Quảng Trị, Nghĩa trang Trường Sơn, Cố đô Hoa lư, Sơn Tây, Hải Phòng …vào đầu năm học.
Các hoạt động trên đã góp phần giáo dục cho học sinh truyền thống “uống nước nhớ nguồn” và ý thức trân trọng, gìn giữ những di tích lịch sử văn hóa của dân tộc.
III. KHEN THƯỞNG TẬP THỂ TRƯỜNG
Sau 3 năm thành lập trường đã được công nhận Trường chuẩn Quốc gia
1. Danh hiệu thi đua
Năm học
Danh hiệu thi đua
 
2007-2008
Tập thể lao động tiên tiến
Quyết định số 6465/QĐ-SGD&ĐT, ngày 28/7/2008
Sở GD$ ĐT Hà nội
2008-2009
Tập thể lao động tiên tiến
Quyết định số 6465/QĐ-SGD&ĐT, ngày 22/7/2009
Sở GD$ ĐT Hà nội
2009-2010
Tập thể lao động xuất sắc
Quyết định số 3902/QĐ- UBND, ngày 10/8/2010.
Chủ tịch UBND thành phố Hà Nội
2010-2011
Tập thể lao động xuất sắc
Quyết định số 3660/QĐ-UBND, ngày 10/8/2011
Chủ tịch UBND thành phố Hà Nội
2011-2012
Tập thể lao động xuất sắc
Quyết định số 3577/QĐ-UBND, ngày 8/8/2012
Chủ tịch UBND thành phố Hà Nội
2011-2012
Cờ thi đua xuất sắc
Quyết định số 3577/QĐ-BGDĐT ngày 8/8/2012
Bộ trưởng Bộ GD&ĐT
2012-2013
Tập thể lao động xuất sắc
 
 
 
2.  Khen thưởng
 
Năm học
Hình thức khen thưởng
 
2010-2011
Bằng khen của Bộ GD&ĐT
Quyết định số 5483/QĐ-BGDĐT
ngày 4/11/2011 Bộ GD&ĐT
2011-2012
Giấy khen “Mỗi thầy cô giáo là tấm gương đạo đúc tự học và sáng tạo”
Quyết định số 3468/QĐ-SGDĐT
ngày 1/3/2013 Sở GD&ĐT
Bằng khen của Bộ Giáo dục và Đào tạo về công tác giáo dục thể chất và Hội khỏe phù đổng 2008-2012.
 
Quyết định số 2746/QĐ/-BGDĐT
Bộ GD&ĐT
 
Cờ thi đua xuất sắc về TDTT năm 2012
 
Sở Văn hóa Thể thao và Du lịch tặng
 
2012-2013
Bằng khen của thủ tướng chính phủ
 
Quyết định số 2047/QĐ-TTg, ngày 6/11/2013 của Thủ tướng Chính phủ', N'Trường THPT Cầu Giấy được thành lập ngày 29/4/2007. Theo biên chế được phòng Tổ chức Cán bộ và lãnh đạo Sở Giáo dục và Đào tạo Hà Nội duyệt trường đã kiện toàn được đội ngũ CB-GV- CNV ngay trong những ngày đầu thành lập. Đến năm 2013-2014 trường có 99 CB-GV- CNV, trong đó có 51,28% đạt trên chuẩn', CAST(0x0000A0C300000000 AS DateTime))
INSERT [dbo].[TINTUC] ([MaTinTuc], [TieuDeTin], [NoiDungTin], [MotaNgan], [NgayDangTin]) VALUES (5, N'Giới thiệu', N'1. Về cơ cấu tổ chức
          Tổ văn hiện có 11 cô giáo do cô Phạm Thị Xuyến làm tổ trưởng, Cô Hoàng Tố Nga làm tổ phó. Hầu hết đội ngũ giáo viên trong tổ đạt trình độ trên chuẩn, trong đó có 1 cô đạt trình độ Tiến sĩ ( cô Phạm Thị Xuyến ), 8 cô giáo có trình độ Thạc sĩ ( cô Hoàng Tố Nga, cô Cấn Thị Hồng Liên, cô Bùi Thùy Linh, cô Nguyễn Thị Huệ Tâm, cô Lê Thị Anh, cô Phạm Thị Thu Huyền, cô Nguyễn Thị Phương, cô Hoàng Thị Hiền ), một cô giáo đang theo học khóa đào tạo thạc sĩ tại trường Đaị học Sư phạm Hà Nội ( cô Đàm Thị Phương Thu ), một cô giáo có trình độ Cử nhân ( cô Trần Hoàng Châu Hà )
2. Một số hoạt động cơ bản của tổ Ngữ văn
          Được sự quan tâm chỉ đạo của Ban giám hiệu, Chi bộ nhà trường, tổ Văn đồng hành nhịp bước cùng với sự trưởng thành lớn mạnh của nhà trường, luôn chủ động sáng tạo trong các hoạt động giáo dục thực hiện xuất sắc mọi nhiệm vụ nhà trường giao phó. Ngay từ đầu năm học, dựa vào đặc điểm của nhà trường, tình hình học sinh và các nhiệm vụ trọng tâm của Sở, của ngành, tổ đã lập kế hoạch hoạt động và mục tiêu phấn đấu cụ thể chi tiết. Kế hoạch này được thông qua tổ, để các thành viên trong tổ góp ý sửa đổi và hoàn thiện đảm
bảo tính thống nhất  trong cả tổ. Kế hoạch sau đó được giao đến tận tay từng thành viên để các thành viên trong tổ chủ động thực hiện. Bên cạnh các buổi sinh hoạt chuyên môn định kì hàng tháng, mỗi học kì tổ lại tổ chức một buổi sinh hoạt chuyên đề chuyên sâu nhằm tạo ra một diễn đàn để các thành viên trong tổ trao đổi và học hỏi kinh nghiệm, giúp đỡ lẫn nhau trong công tác giảng dạy. Tổ đã tích cực tham gia hưởng ứng các phong trào thi đua của trường của Sở và của ngành như: Tham gia các đợt thao giảng, tham gia bồi dưỡng
học sinh giỏi, tham gia phong trào đổi mới phương pháp dạy học, đổi mới phương pháp kiểm tra đánh giá, tích hợp tư tưởng đạo đức Hồ Chí Minh vào trong giảng dạy môn văn, tích hợp liên môn....
          Nhằm tạo ra một sân chơi bổ ích, lí thú, phát huy năng khiếu, khả năng sáng tạo, bồi dưỡng tình yêu văn học của học sinh, Câu lạc bộ văn học đã được thành lập do cô Đàm Thị Phương Thu làm chủ nhiệm. Qua hai năm hoạt động, CLB đã thu hút học sinh  tham gia đông đảo, đặc biệt là học sinh các lớp ban D. CLB đã tạo điều kiện  cho học sinh tiếp cận với sáng tác, phê bình văn học và một số loại hình sân khấu. Bên cạnh đó CLB mời các nhà thơ, giảng viên đại học về nói chuyện văn chương như nhà thơ Phan Thị Thanh Nhàn, Tiến sĩ Chu Văn Sơn...., tổ chức cho các thành viên CLB về thăm quê hương của nhà văn Nam Cao, Nguyễn Khuyến, bảo tàng Quân đội...........
3. Thành tích đạt được:
          - Về sáng kiến kinh nghiệm: Hầu hết các thành viên trong tổ tham gia viết sáng kiến kinh nghiệm, nhiều sáng kiến kinh nghiệm được xếp loại của sở, trong đó có 2 sáng kiến  được xếp loại B ( sáng kiến của cô Lê Thị Anh, cô Phạm Thị Xuyến )
          - Về giáo viên giỏi cấp thành phố: cô Lê Thị Anh Giải nhì tích hợp tư tưởng đạo đức Hồ Chí Minh vào trong giảng dạy môn văn, cô Bùi Thùy Linh giải nhì tích hợp liên môn vào trong giảng dạy môn văn và tiếp tục  dự thi cấp quốc gia
          - Về học sinh giỏi: nhiều giải trong đó có 1 giải nhì, 1 giải 3 cấp thành phố, 1 giải  nhất 2 giải nhì, một giải 3 cấp cụm và nhiều giải khuyến khích. Đặc biệt đề tài tích hợp liên môn để giải quyết một vấn đề văn học cụ thể đã được lọt vào vòng quốc gia
 
          - Thành tích chung của tổ: 3 năm liền đạt danh hiệu tổ Lao động tiên tiến. Năm học 2013 - 2014 đề nghị tặng danh hiệu Tổ lao động tiên tiến xuất sắc', N'1. Về cơ cấu tổ chức
          Tổ văn hiện có 11 cô giáo do cô Phạm Thị Xuyến làm tổ trưởng, Cô Hoàng Tố Nga làm tổ phó. Hầu hết đội ngũ giáo viên trong tổ đạt trình độ trên chuẩn, trong đó có 1 cô đạt trình độ Tiến sĩ ( cô Phạm Thị Xuyến ), 8 cô giáo có trình độ Thạc sĩ ( cô Hoàng Tố Nga, cô Cấn Thị Hồng Liên, cô Bùi Thùy Linh, cô Nguyễn Thị Huệ Tâm, cô Lê Thị Anh, cô Phạm Thị Thu Huyền, cô Nguyễn Thị Phương, cô Hoàng Thị Hiền ), một cô giáo đang theo học khóa đào tạo thạc sĩ tại trường Đaị học Sư phạm Hà Nội ( cô Đàm Thị Phương Thu ), một cô giáo có trình độ Cử nhân ( cô Trần Hoàng Châu Hà )', CAST(0x00009FEC00000000 AS DateTime))
INSERT [dbo].[TINTUC] ([MaTinTuc], [TieuDeTin], [NoiDungTin], [MotaNgan], [NgayDangTin]) VALUES (6, N'Trao đổi nghiệp vụ', N'<div class="bodytext"><p style="text-align: justify;"> Ở trường THPT hiện nay, GVCN có vị trí, vai trò vô cùng quan trọng. GVCN là cầu nối giữa Ban Giám hiệu, giữa tổ chức trong, ngoài trường học, giữa giáo viên bộ môn với tập thể học sinh lớp chủ nhiệm. Nói một cách khác GVCN là người đại diện hai phía: một mặt đại diện cho các lực lượng giáo dục của nhà trường, mặt khác đại diện cho tập thể học sinh. Như chúng ta đã biết: Tập thể học sinh là một bộ phận của tập thể nhà trường. Mỗi tập thể học sinh vững mạnh thì nhà trường sẽ vững mạnh. Do đó việc xây dựng tập thể học sinh trở thành một tổ ấm thực sự mà trong đó mọi thành viên đều đồng lòng quyết tâm phấn đấu là một nội dung công tác quan trọng của người GVCN. Với kinh nghiệm và uy tín của mình khi xác định rõ vị trí vai trò quan trọng trong công tác chủ nhiệm. Bất kỳ GVCN nào đều có khả năng biến đổi những chủ trương kế hoạch đào tạo của nhà trường thành chương trình hành động của tập thể lớp và của mỗi học sinh.</p><p style="text-align: justify;"> Với kinh nghiệm nhiều năm liên tục làm chủ nhiệm lớp, bản thân tôi nhận thấy để làm tốt công tác chủ nhiệm lớp, điều đầu tiên người GVCN phải có tấm lòng biết cảm thông, chia sẽ những khó khăn của các em. GVCN biết giải quyết thấu đáo những nguyện vọng của học sinh. Trong lớp học thầy cô phải đóng vai trò như người anh, người chị, người cha, người mẹ thứ hai biết yêu thương, quan tâm và hiểu được mọi tâm tư nguyện vọng của học sinh để các em có thể tin tưởng, nhờ cậy được. GVCN cũng phải nắm được đặc điểm hoàn cảnh, năng lực hoạt động, năng khiếu của từng học sinh để phát huy trí tuệ tập thể. Đồng thời GVCN phải nắm bắt mọi sự việc xảy ra trong lớp học để có hướng xử lý kịp thời. Đặc biệt với học sinh cá biệt hay những em thiếu cha, vắng mẹ, thiếu sự quan tâm của gia đình thì sự ân cần, cảm thông từ thầy cô chủ nhiệm có sức cảm hóa rất mạnh.</p><p style="text-align: justify;"> Để học sinh đạt được sự chủ động, tích cực, GVCN phải xây dựng một Ban cán sự lớp đầy nhiệt huyết, tự tin đoàn kết, chọn học sinh học lực từ khá trở lên có uy tín, có khả năng điều khiển mọi hoạt động của lớp. Với những em cán bộ lớp chưa thực sự gương mẫu, thiếu trách nhiệm, thích lạm dụng quyền lực, luôn &quot;ra oai&quot;, coi thường bạn bè, chỉ dùng mệnh lệnh...thì GVCN phải khéo léo, tế nhị hướng dẫn các em có thái độ đúng, tránh phê bình thô bạo cứng nhắc, làm mất uy tín danh dự của cán bộ lớp, khiến các em có thể nảy sinh những hành vi tiêu cực, có hại phong trào tự quản của lớp.</p><p style="text-align: justify;"> Bên cạnh việc xây dựng đội ngũ cán bộ lớp gương mẫu, có uy tín thì GVCN cần lập sơ đồ, sắp xếp tổ chức vị trí học sinh trong lớp phù hợp. Cụ thể, học sinh yếu kém, chậm tiến ngồi trước để thường xuyên được quan tâm, những học sinh khá và cán bộ lớp ngồi sau. Những học sinh “đặc biệt” về học lực hoặc về ý thức, nên xếp cùng những học sinh có lực học khá, ý thức tốt để các em kèm cặp giúp đỡ lẫn nhau.</p><p style="text-align: justify;"> Cụ thể: mỗi em yếu kém nhất được phân công một bạn giúp đỡ: thường xuyên kiểm tra việc chuẩn bị bài, học bài của bạn vào giờ truy bài đầu buổi học. Thậm chí, nếu các em chưa tự học và làm bài trước khi đến lớp thì phải tận dụng, tranh thủ giờ ra chơi xem lại bài cũ… Bằng cách đó lớp tôi chủ nhiệm (lớp B) các em đã có ý thức học bài và làm bài tập, hạn chế nhiều hiện tượng không thuộc bài trước khi đến lớp.</p><p style="text-align: justify;"> GVCN cần rèn tính sắp xếp đồ dùng học tập cho các em gọn gàng ngăn nắp, tạo cho học sinh nề nếp thói quen trước khi ra chơi cất đồ dùng sách vở môn đã học vào cặp, lấy sách vở, đồ dùng môn học tiếp để trên bàn… tạo sự nghiêm túc, giảm thời gian ổn định tổ chức ngay đầu giờ mỗi tiết học.</p><p style="text-align: justify;"> Để giáo dục tính tự giác, phê bình và tự phê bình, mỗi học sinh trong lớp có 1 cuốn sổ theo dõi và tự cập nhật thường xuyên những ưu, khuyết điểm trong việc thực hiện nề nếp hàng ngày. Ngoài ra, tổ trưởng, lớp trưởng có sổ theo dõi thi đua để báo cáo trong giờ sinh hoạt lớp, để việc nhận xét, khen, chê đánh giá được chính xác.</p><p style="text-align: justify;"> Hàng tuần GVCN tổ chức giờ sinh hoạt có chất lượng. Với tinh thần tự quản, nội dung giờ sinh hoạt thường diễn ra thật vui vẻ thoải mái, lớp trưởng mời các tổ trưởng báo cáo đánh giá xếp loại của từng thành viên trong tổ, rồi cho lớp tự do góp ý, lớp trưởng nhận xét tổng kết thi đua trong tuần, biểu dương những bạn có điểm thi đua cao, nhắc nhở bạn điểm thi đua còn thấp (điểm thi đua của từng học sinh trong lớp được ghi, lưu trong bảng theo dõi nề nếp cuối lớp), và triển khai kế hoạch trong tuần tới.</p><p style="text-align: justify;"> Để khích lệ các em, hàng tháng tôi phát động thi đua dựa trên kế hoạch của Đoàn đội, đồng thời bản thân tôi thường gắn theo những ngày đặc biệt trong năm như: Rằm tháng 8, tết Nôel, tết nguyên đán, 26/3; 01/6 để phát động thi đua có tặng quà, khen thưởng cho những em có sự cố gắng nỗ lực trong rèn luyện đạo đức cũng như học tập.</p><p style="text-align: justify;"> Một trong những giải pháp để làm tốt công tác chủ nhiệm lớp là GVCN cần phối kết hợp chặt chẽ với PHHS, gắn trách nhiệm cha mẹ với con em mình bằng ký xác nhận hàng ngày vào cuối phần làm bài tập của học sinh, phân công các đại diện PHHS theo khu vực để thường xuyên nắm bắt tình hình học tập tu dưỡng của con em.</p><p style="text-align: justify;"> Một giải pháp mà bản thân tôi thấy có hiệu quả đó là giáo dục cho các em trong hoạt động tập thể trong và ngoài nhà trường: vui chơi, tham quan du lịch,&nbsp; tìm hiểu thực tế...Qua đó tạo sự gần gũi, gắn bó, hiểu biết thêm giữa giáo viên và học sinh, xoá đi những khoảng cách, tạo cho học sinh tâm trạng coi lớp học là ngôi nhà yên ấm, thân thiện để các em học tập, sinh hoạt rèn luyện và vui chơi trong tình yêu thương.</p><p style="text-align: justify;"> Muốn duy trì thành quả giáo dục, cần có sự phối hợp chặt chẽ giữa các phong trào khác, cần sự hỗ trợ của tổ chức Đoàn Đội trong nhà trường. Đoàn Đội cần tổ chức nhiều những hoạt động ngoài giờ lên lớp bổ ích cho các em. Đặc biệt giờ chào cờ đầu tuần, thay cho việc phê bình nặng nề thì mỗi tháng tổng phụ trách Đội tổ chức cho các em sinh hoạt tập thể hái hoa dân chủ với những chủ đề gần gũi, giúp các em tự tin, có điều kiện giao lưu, thêm sự hiểu biết xã hội… hoặc biểu dương gương điển hình tiêu biểu trong học tập…Việc làm đó kịp thời động viên khích lệ, tạo không khí vui vẻ, thân thiện, tạo thêm động lực cho các em thi đua phấn đấu.</p><p style="text-align: justify;"> Việc giáo dục phát triển nhân cách học sinh là nhu cầu cần thiết bởi bản chất của quá trình giáo dục là tổ chức toàn bộ cuộc sống, hoạt động và học tập của học sinh, tạo điều kiện thuận lợi để tiềm năng của học sinh được phát triển dưới sự giáo dục của GVCN.</p><p style="text-align: justify;"> Vì vậy tôi nhận thấy công tác GVCN rất cần sự phối hợp chặt chẽ giữa các tổ chức của nhà trường, cha mẹ học sinh, cần sự quan tâm lãnh đạo của các cấp uỷ chính quyền, các đoàn thể nhân dân địa phương để tạo sức mạnh đồng bộ toàn xã hội cùng giáo dục thế hệ trẻ.</p></div>
</div>', N'Với kinh nghiệm nhiều năm liên tục làm chủ nhiệm lớp, bản thân tôi nhận thấy để làm tốt công tác chủ nhiệm lớp, điều đầu tiên người giáo viên chủ nhiệm (GVCN) phải có tấm lòng biết cảm thông, chia sẽ những khó khăn của các em.', CAST(0x00009FEC00000000 AS DateTime))
INSERT [dbo].[TINTUC] ([MaTinTuc], [TieuDeTin], [NoiDungTin], [MotaNgan], [NgayDangTin]) VALUES (7, N'Đổi mới cách giảng dạy', N'<div class="bodytext"><p style="text-align: justify;"> Ở trường THPT hiện nay, GVCN có vị trí, vai trò vô cùng quan trọng. GVCN là cầu nối giữa Ban Giám hiệu, giữa tổ chức trong, ngoài trường học, giữa giáo viên bộ môn với tập thể học sinh lớp chủ nhiệm. Nói một cách khác GVCN là người đại diện hai phía: một mặt đại diện cho các lực lượng giáo dục của nhà trường, mặt khác đại diện cho tập thể học sinh. Như chúng ta đã biết: Tập thể học sinh là một bộ phận của tập thể nhà trường. Mỗi tập thể học sinh vững mạnh thì nhà trường sẽ vững mạnh. Do đó việc xây dựng tập thể học sinh trở thành một tổ ấm thực sự mà trong đó mọi thành viên đều đồng lòng quyết tâm phấn đấu là một nội dung công tác quan trọng của người GVCN. Với kinh nghiệm và uy tín của mình khi xác định rõ vị trí vai trò quan trọng trong công tác chủ nhiệm. Bất kỳ GVCN nào đều có khả năng biến đổi những chủ trương kế hoạch đào tạo của nhà trường thành chương trình hành động của tập thể lớp và của mỗi học sinh.</p><p style="text-align: justify;"> Với kinh nghiệm nhiều năm liên tục làm chủ nhiệm lớp, bản thân tôi nhận thấy để làm tốt công tác chủ nhiệm lớp, điều đầu tiên người GVCN phải có tấm lòng biết cảm thông, chia sẽ những khó khăn của các em. GVCN biết giải quyết thấu đáo những nguyện vọng của học sinh. Trong lớp học thầy cô phải đóng vai trò như người anh, người chị, người cha, người mẹ thứ hai biết yêu thương, quan tâm và hiểu được mọi tâm tư nguyện vọng của học sinh để các em có thể tin tưởng, nhờ cậy được. GVCN cũng phải nắm được đặc điểm hoàn cảnh, năng lực hoạt động, năng khiếu của từng học sinh để phát huy trí tuệ tập thể. Đồng thời GVCN phải nắm bắt mọi sự việc xảy ra trong lớp học để có hướng xử lý kịp thời. Đặc biệt với học sinh cá biệt hay những em thiếu cha, vắng mẹ, thiếu sự quan tâm của gia đình thì sự ân cần, cảm thông từ thầy cô chủ nhiệm có sức cảm hóa rất mạnh.</p><p style="text-align: justify;"> Để học sinh đạt được sự chủ động, tích cực, GVCN phải xây dựng một Ban cán sự lớp đầy nhiệt huyết, tự tin đoàn kết, chọn học sinh học lực từ khá trở lên có uy tín, có khả năng điều khiển mọi hoạt động của lớp. Với những em cán bộ lớp chưa thực sự gương mẫu, thiếu trách nhiệm, thích lạm dụng quyền lực, luôn &quot;ra oai&quot;, coi thường bạn bè, chỉ dùng mệnh lệnh...thì GVCN phải khéo léo, tế nhị hướng dẫn các em có thái độ đúng, tránh phê bình thô bạo cứng nhắc, làm mất uy tín danh dự của cán bộ lớp, khiến các em có thể nảy sinh những hành vi tiêu cực, có hại phong trào tự quản của lớp.</p><p style="text-align: justify;"> Bên cạnh việc xây dựng đội ngũ cán bộ lớp gương mẫu, có uy tín thì GVCN cần lập sơ đồ, sắp xếp tổ chức vị trí học sinh trong lớp phù hợp. Cụ thể, học sinh yếu kém, chậm tiến ngồi trước để thường xuyên được quan tâm, những học sinh khá và cán bộ lớp ngồi sau. Những học sinh “đặc biệt” về học lực hoặc về ý thức, nên xếp cùng những học sinh có lực học khá, ý thức tốt để các em kèm cặp giúp đỡ lẫn nhau.</p><p style="text-align: justify;"> Cụ thể: mỗi em yếu kém nhất được phân công một bạn giúp đỡ: thường xuyên kiểm tra việc chuẩn bị bài, học bài của bạn vào giờ truy bài đầu buổi học. Thậm chí, nếu các em chưa tự học và làm bài trước khi đến lớp thì phải tận dụng, tranh thủ giờ ra chơi xem lại bài cũ… Bằng cách đó lớp tôi chủ nhiệm (lớp B) các em đã có ý thức học bài và làm bài tập, hạn chế nhiều hiện tượng không thuộc bài trước khi đến lớp.</p><p style="text-align: justify;"> GVCN cần rèn tính sắp xếp đồ dùng học tập cho các em gọn gàng ngăn nắp, tạo cho học sinh nề nếp thói quen trước khi ra chơi cất đồ dùng sách vở môn đã học vào cặp, lấy sách vở, đồ dùng môn học tiếp để trên bàn… tạo sự nghiêm túc, giảm thời gian ổn định tổ chức ngay đầu giờ mỗi tiết học.</p><p style="text-align: justify;"> Để giáo dục tính tự giác, phê bình và tự phê bình, mỗi học sinh trong lớp có 1 cuốn sổ theo dõi và tự cập nhật thường xuyên những ưu, khuyết điểm trong việc thực hiện nề nếp hàng ngày. Ngoài ra, tổ trưởng, lớp trưởng có sổ theo dõi thi đua để báo cáo trong giờ sinh hoạt lớp, để việc nhận xét, khen, chê đánh giá được chính xác.</p><p style="text-align: justify;"> Hàng tuần GVCN tổ chức giờ sinh hoạt có chất lượng. Với tinh thần tự quản, nội dung giờ sinh hoạt thường diễn ra thật vui vẻ thoải mái, lớp trưởng mời các tổ trưởng báo cáo đánh giá xếp loại của từng thành viên trong tổ, rồi cho lớp tự do góp ý, lớp trưởng nhận xét tổng kết thi đua trong tuần, biểu dương những bạn có điểm thi đua cao, nhắc nhở bạn điểm thi đua còn thấp (điểm thi đua của từng học sinh trong lớp được ghi, lưu trong bảng theo dõi nề nếp cuối lớp), và triển khai kế hoạch trong tuần tới.</p><p style="text-align: justify;"> Để khích lệ các em, hàng tháng tôi phát động thi đua dựa trên kế hoạch của Đoàn đội, đồng thời bản thân tôi thường gắn theo những ngày đặc biệt trong năm như: Rằm tháng 8, tết Nôel, tết nguyên đán, 26/3; 01/6 để phát động thi đua có tặng quà, khen thưởng cho những em có sự cố gắng nỗ lực trong rèn luyện đạo đức cũng như học tập.</p><p style="text-align: justify;"> Một trong những giải pháp để làm tốt công tác chủ nhiệm lớp là GVCN cần phối kết hợp chặt chẽ với PHHS, gắn trách nhiệm cha mẹ với con em mình bằng ký xác nhận hàng ngày vào cuối phần làm bài tập của học sinh, phân công các đại diện PHHS theo khu vực để thường xuyên nắm bắt tình hình học tập tu dưỡng của con em.</p><p style="text-align: justify;"> Một giải pháp mà bản thân tôi thấy có hiệu quả đó là giáo dục cho các em trong hoạt động tập thể trong và ngoài nhà trường: vui chơi, tham quan du lịch,&nbsp; tìm hiểu thực tế...Qua đó tạo sự gần gũi, gắn bó, hiểu biết thêm giữa giáo viên và học sinh, xoá đi những khoảng cách, tạo cho học sinh tâm trạng coi lớp học là ngôi nhà yên ấm, thân thiện để các em học tập, sinh hoạt rèn luyện và vui chơi trong tình yêu thương.</p><p style="text-align: justify;"> Muốn duy trì thành quả giáo dục, cần có sự phối hợp chặt chẽ giữa các phong trào khác, cần sự hỗ trợ của tổ chức Đoàn Đội trong nhà trường. Đoàn Đội cần tổ chức nhiều những hoạt động ngoài giờ lên lớp bổ ích cho các em. Đặc biệt giờ chào cờ đầu tuần, thay cho việc phê bình nặng nề thì mỗi tháng tổng phụ trách Đội tổ chức cho các em sinh hoạt tập thể hái hoa dân chủ với những chủ đề gần gũi, giúp các em tự tin, có điều kiện giao lưu, thêm sự hiểu biết xã hội… hoặc biểu dương gương điển hình tiêu biểu trong học tập…Việc làm đó kịp thời động viên khích lệ, tạo không khí vui vẻ, thân thiện, tạo thêm động lực cho các em thi đua phấn đấu.</p><p style="text-align: justify;"> Việc giáo dục phát triển nhân cách học sinh là nhu cầu cần thiết bởi bản chất của quá trình giáo dục là tổ chức toàn bộ cuộc sống, hoạt động và học tập của học sinh, tạo điều kiện thuận lợi để tiềm năng của học sinh được phát triển dưới sự giáo dục của GVCN.</p><p style="text-align: justify;"> Vì vậy tôi nhận thấy công tác GVCN rất cần sự phối hợp chặt chẽ giữa các tổ chức của nhà trường, cha mẹ học sinh, cần sự quan tâm lãnh đạo của các cấp uỷ chính quyền, các đoàn thể nhân dân địa phương để tạo sức mạnh đồng bộ toàn xã hội cùng giáo dục thế hệ trẻ.</p></div>
</div>', N'Với kinh nghiệm nhiều năm liên tục làm chủ nhiệm lớp, bản thân tôi nhận thấy để làm tốt công tác chủ nhiệm lớp, điều đầu tiên người giáo viên chủ nhiệm (GVCN) phải có tấm lòng biết cảm thông, chia sẽ những khó khăn của các em.', CAST(0x0000A12500000000 AS DateTime))
INSERT [dbo].[TINTUC] ([MaTinTuc], [TieuDeTin], [NoiDungTin], [MotaNgan], [NgayDangTin]) VALUES (8, N'Công tác chủ nhiệm', N'<div class="bodytext"><p style="text-align: justify;"> Ở trường THPT hiện nay, GVCN có vị trí, vai trò vô cùng quan trọng. GVCN là cầu nối giữa Ban Giám hiệu, giữa tổ chức trong, ngoài trường học, giữa giáo viên bộ môn với tập thể học sinh lớp chủ nhiệm. Nói một cách khác GVCN là người đại diện hai phía: một mặt đại diện cho các lực lượng giáo dục của nhà trường, mặt khác đại diện cho tập thể học sinh. Như chúng ta đã biết: Tập thể học sinh là một bộ phận của tập thể nhà trường. Mỗi tập thể học sinh vững mạnh thì nhà trường sẽ vững mạnh. Do đó việc xây dựng tập thể học sinh trở thành một tổ ấm thực sự mà trong đó mọi thành viên đều đồng lòng quyết tâm phấn đấu là một nội dung công tác quan trọng của người GVCN. Với kinh nghiệm và uy tín của mình khi xác định rõ vị trí vai trò quan trọng trong công tác chủ nhiệm. Bất kỳ GVCN nào đều có khả năng biến đổi những chủ trương kế hoạch đào tạo của nhà trường thành chương trình hành động của tập thể lớp và của mỗi học sinh.</p><p style="text-align: justify;"> Với kinh nghiệm nhiều năm liên tục làm chủ nhiệm lớp, bản thân tôi nhận thấy để làm tốt công tác chủ nhiệm lớp, điều đầu tiên người GVCN phải có tấm lòng biết cảm thông, chia sẽ những khó khăn của các em. GVCN biết giải quyết thấu đáo những nguyện vọng của học sinh. Trong lớp học thầy cô phải đóng vai trò như người anh, người chị, người cha, người mẹ thứ hai biết yêu thương, quan tâm và hiểu được mọi tâm tư nguyện vọng của học sinh để các em có thể tin tưởng, nhờ cậy được. GVCN cũng phải nắm được đặc điểm hoàn cảnh, năng lực hoạt động, năng khiếu của từng học sinh để phát huy trí tuệ tập thể. Đồng thời GVCN phải nắm bắt mọi sự việc xảy ra trong lớp học để có hướng xử lý kịp thời. Đặc biệt với học sinh cá biệt hay những em thiếu cha, vắng mẹ, thiếu sự quan tâm của gia đình thì sự ân cần, cảm thông từ thầy cô chủ nhiệm có sức cảm hóa rất mạnh.</p><p style="text-align: justify;"> Để học sinh đạt được sự chủ động, tích cực, GVCN phải xây dựng một Ban cán sự lớp đầy nhiệt huyết, tự tin đoàn kết, chọn học sinh học lực từ khá trở lên có uy tín, có khả năng điều khiển mọi hoạt động của lớp. Với những em cán bộ lớp chưa thực sự gương mẫu, thiếu trách nhiệm, thích lạm dụng quyền lực, luôn &quot;ra oai&quot;, coi thường bạn bè, chỉ dùng mệnh lệnh...thì GVCN phải khéo léo, tế nhị hướng dẫn các em có thái độ đúng, tránh phê bình thô bạo cứng nhắc, làm mất uy tín danh dự của cán bộ lớp, khiến các em có thể nảy sinh những hành vi tiêu cực, có hại phong trào tự quản của lớp.</p><p style="text-align: justify;"> Bên cạnh việc xây dựng đội ngũ cán bộ lớp gương mẫu, có uy tín thì GVCN cần lập sơ đồ, sắp xếp tổ chức vị trí học sinh trong lớp phù hợp. Cụ thể, học sinh yếu kém, chậm tiến ngồi trước để thường xuyên được quan tâm, những học sinh khá và cán bộ lớp ngồi sau. Những học sinh “đặc biệt” về học lực hoặc về ý thức, nên xếp cùng những học sinh có lực học khá, ý thức tốt để các em kèm cặp giúp đỡ lẫn nhau.</p><p style="text-align: justify;"> Cụ thể: mỗi em yếu kém nhất được phân công một bạn giúp đỡ: thường xuyên kiểm tra việc chuẩn bị bài, học bài của bạn vào giờ truy bài đầu buổi học. Thậm chí, nếu các em chưa tự học và làm bài trước khi đến lớp thì phải tận dụng, tranh thủ giờ ra chơi xem lại bài cũ… Bằng cách đó lớp tôi chủ nhiệm (lớp B) các em đã có ý thức học bài và làm bài tập, hạn chế nhiều hiện tượng không thuộc bài trước khi đến lớp.</p><p style="text-align: justify;"> GVCN cần rèn tính sắp xếp đồ dùng học tập cho các em gọn gàng ngăn nắp, tạo cho học sinh nề nếp thói quen trước khi ra chơi cất đồ dùng sách vở môn đã học vào cặp, lấy sách vở, đồ dùng môn học tiếp để trên bàn… tạo sự nghiêm túc, giảm thời gian ổn định tổ chức ngay đầu giờ mỗi tiết học.</p><p style="text-align: justify;"> Để giáo dục tính tự giác, phê bình và tự phê bình, mỗi học sinh trong lớp có 1 cuốn sổ theo dõi và tự cập nhật thường xuyên những ưu, khuyết điểm trong việc thực hiện nề nếp hàng ngày. Ngoài ra, tổ trưởng, lớp trưởng có sổ theo dõi thi đua để báo cáo trong giờ sinh hoạt lớp, để việc nhận xét, khen, chê đánh giá được chính xác.</p><p style="text-align: justify;"> Hàng tuần GVCN tổ chức giờ sinh hoạt có chất lượng. Với tinh thần tự quản, nội dung giờ sinh hoạt thường diễn ra thật vui vẻ thoải mái, lớp trưởng mời các tổ trưởng báo cáo đánh giá xếp loại của từng thành viên trong tổ, rồi cho lớp tự do góp ý, lớp trưởng nhận xét tổng kết thi đua trong tuần, biểu dương những bạn có điểm thi đua cao, nhắc nhở bạn điểm thi đua còn thấp (điểm thi đua của từng học sinh trong lớp được ghi, lưu trong bảng theo dõi nề nếp cuối lớp), và triển khai kế hoạch trong tuần tới.</p><p style="text-align: justify;"> Để khích lệ các em, hàng tháng tôi phát động thi đua dựa trên kế hoạch của Đoàn đội, đồng thời bản thân tôi thường gắn theo những ngày đặc biệt trong năm như: Rằm tháng 8, tết Nôel, tết nguyên đán, 26/3; 01/6 để phát động thi đua có tặng quà, khen thưởng cho những em có sự cố gắng nỗ lực trong rèn luyện đạo đức cũng như học tập.</p><p style="text-align: justify;"> Một trong những giải pháp để làm tốt công tác chủ nhiệm lớp là GVCN cần phối kết hợp chặt chẽ với PHHS, gắn trách nhiệm cha mẹ với con em mình bằng ký xác nhận hàng ngày vào cuối phần làm bài tập của học sinh, phân công các đại diện PHHS theo khu vực để thường xuyên nắm bắt tình hình học tập tu dưỡng của con em.</p><p style="text-align: justify;"> Một giải pháp mà bản thân tôi thấy có hiệu quả đó là giáo dục cho các em trong hoạt động tập thể trong và ngoài nhà trường: vui chơi, tham quan du lịch,&nbsp; tìm hiểu thực tế...Qua đó tạo sự gần gũi, gắn bó, hiểu biết thêm giữa giáo viên và học sinh, xoá đi những khoảng cách, tạo cho học sinh tâm trạng coi lớp học là ngôi nhà yên ấm, thân thiện để các em học tập, sinh hoạt rèn luyện và vui chơi trong tình yêu thương.</p><p style="text-align: justify;"> Muốn duy trì thành quả giáo dục, cần có sự phối hợp chặt chẽ giữa các phong trào khác, cần sự hỗ trợ của tổ chức Đoàn Đội trong nhà trường. Đoàn Đội cần tổ chức nhiều những hoạt động ngoài giờ lên lớp bổ ích cho các em. Đặc biệt giờ chào cờ đầu tuần, thay cho việc phê bình nặng nề thì mỗi tháng tổng phụ trách Đội tổ chức cho các em sinh hoạt tập thể hái hoa dân chủ với những chủ đề gần gũi, giúp các em tự tin, có điều kiện giao lưu, thêm sự hiểu biết xã hội… hoặc biểu dương gương điển hình tiêu biểu trong học tập…Việc làm đó kịp thời động viên khích lệ, tạo không khí vui vẻ, thân thiện, tạo thêm động lực cho các em thi đua phấn đấu.</p><p style="text-align: justify;"> Việc giáo dục phát triển nhân cách học sinh là nhu cầu cần thiết bởi bản chất của quá trình giáo dục là tổ chức toàn bộ cuộc sống, hoạt động và học tập của học sinh, tạo điều kiện thuận lợi để tiềm năng của học sinh được phát triển dưới sự giáo dục của GVCN.</p><p style="text-align: justify;"> Vì vậy tôi nhận thấy công tác GVCN rất cần sự phối hợp chặt chẽ giữa các tổ chức của nhà trường, cha mẹ học sinh, cần sự quan tâm lãnh đạo của các cấp uỷ chính quyền, các đoàn thể nhân dân địa phương để tạo sức mạnh đồng bộ toàn xã hội cùng giáo dục thế hệ trẻ.</p></div>
</div>', N'Với kinh nghiệm nhiều năm liên tục làm chủ nhiệm lớp, bản thân tôi nhận thấy để làm tốt công tác chủ nhiệm lớp, điều đầu tiên người giáo viên chủ nhiệm (GVCN) phải có tấm lòng biết cảm thông, chia sẽ những khó khăn của các em.', CAST(0x0000A12500000000 AS DateTime))
INSERT [dbo].[TINTUC] ([MaTinTuc], [TieuDeTin], [NoiDungTin], [MotaNgan], [NgayDangTin]) VALUES (9, N'Những sai sót trong giáo dục', N'<div class="bodytext"><p> 1. <strong>Nhầm lẫn mục 3 trong hồ sơ ĐKDT là nguyện vọng 2</strong>: thí sinh cần lưu ý mục 3 trong hồ sơ đăng ký dự thi không dành để đăng ký nguyện vọng 2 mà dành cho các thí sinh có nguyện vọng 1 (NV1) học tại các trường ĐH, CĐ không tổ chức thi tuyển sinh hoặc hệ CĐ của ĐH, sau khi ghi mục 2 phải ghi thêm mục 3 này.</p><p> Thí sinh chú ý khi khai báo hồ sơ ĐKDT thí sinh chỉ khai báo NV1. Các NV2, 3 chỉ khai báo khi thí sinh không trúng tuyển NV1 và đã nhận được Giấy chứng nhận kết quả thi.</p><p> 2. <strong>Nhầm lẫn giữa trường tổ chức thi và không tổ chức thi</strong>:</p><p> Khi đăng ký vào một ngành của trường không tổ chức thi, thí sinh phải nộp hồ sơ thi nhờ một trường có tổ chức thi và theo đúng khối thi (khai báo mục 3).</p><p> Nếu trường thí sinh muốn đăng ký học có tổ chức thi thì thí sinh phải dự thi tại trường đó (hoặc thi cụm) chứ không được thi nhờ một trường khác.</p><p> 3. <strong>Đăng ký sai khối thi hoặc vào các ngành trường tổ chức thi không tuyển sinh.</strong></p><p> Ngoài ra, những <strong>sai sót thí sinh thường gặp trong quá trình dự thi</strong> cũng đã được lưu ý:</p><p> 3.1. Hiểu và khai sai đối tượng được ưu tiên trong tuyển sinh. Đặc biệt là các trường hợp cha mẹ được hưởng chính sách trợ cấp thương tật mà không phải là thương binh hoặc không có Giấy chứng nhận người được hưởng chính sách như thương binh.</p><p> 3.2. Khi nhận được Giấy báo dự thi không kiểm tra kỹ các thông tin để điều chỉnh sai sót trước khi thi hoặc trong ngày tập trung đầu tiên gây phiền phức về sau;</p><p> 3.3. Ghi thiếu thông tin trên giấy thi, đặc biệt là số báo danh và số tờ giấy làm bài;</p><p> 3.4. Không yêu cầu Giám thị ký đủ các chữ ký trên giấy thi và giấy nháp;</p><p> 3.5. Khi thi trắc nghiệm ghi sai mã đề hoặc số báo danh trên phiếu trả lời trắc nghiệm;</p><p> 3.6. Làm cả phần chung và phần riêng của đề thi (dù có thể là vô ý).</p><p> &nbsp;</p></div>
<p style="text-align: right;">
<strong>Tác giả bài viết: </strong>ST
</p>
<p class="copyright">Chú ý&#x3A; Việc đăng lại bài viết trên ở website hoặc các phương tiện truyền thông khác mà không ghi rõ nguồn http&#x3A;&#x002F;&#x002F;thptcaugiay.edu.vn là vi phạm bản quyền</p>
</div>', N'Trong thời gian các thí sinh đang hoàn tất hồ sơ đăng ký dự thi tuyển sinh ĐH, CĐ 2011. Nhiều thí sinh hay mắc các sai sốt, Theo đó, thí sinh trong khi làm hồ sơ đăng ký dự thi, cần chú ý các sai sót thường gặp sau để tránh mắc phải', CAST(0x0000A12500000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[TINTUC] OFF
SET IDENTITY_INSERT [dbo].[TOBOMON] ON 

INSERT [dbo].[TOBOMON] ([MaTo], [TenToBoMon], [MoTa]) VALUES (1, N'Tự nhiên', N'Gồm các môn như toán, lý, hóa,..')
INSERT [dbo].[TOBOMON] ([MaTo], [TenToBoMon], [MoTa]) VALUES (2, N'Xã hội', N'Gồm các bộ môn như văn, anh, sự, địa, sinh...')
INSERT [dbo].[TOBOMON] ([MaTo], [TenToBoMon], [MoTa]) VALUES (3, N'Tự chọn', N'Gồm các môn như hát nhạc, mỹ thuật, thể dục')
SET IDENTITY_INSERT [dbo].[TOBOMON] OFF
ALTER TABLE [dbo].[DSLOP] ADD  CONSTRAINT [DF_DSLOP_MoTaKhac]  DEFAULT (N'') FOR [MoTaKhac]
GO
ALTER TABLE [dbo].[GIAOVIEN] ADD  CONSTRAINT [DF_GIAOVIEN_ChuNhiem]  DEFAULT ((0)) FOR [ChuNhiem]
GO
ALTER TABLE [dbo].[HANHKIEM] ADD  CONSTRAINT [DF_HANHKIEM_NgayNghiCoPhep]  DEFAULT ((0)) FOR [NgayNghiCoPhep]
GO
ALTER TABLE [dbo].[HANHKIEM] ADD  CONSTRAINT [DF_HANHKIEM_NgayNghiKoPhep]  DEFAULT ((0)) FOR [NgayNghiKoPhep]
GO
ALTER TABLE [dbo].[HANHKIEM] ADD  CONSTRAINT [DF_HANHKIEM_SoLanKyLuat]  DEFAULT ((0)) FOR [SoLanKyLuat]
GO
ALTER TABLE [dbo].[HOCSINH] ADD  CONSTRAINT [DF__HOCSINH__NgayNha__15502E78]  DEFAULT (getdate()) FOR [NgayNhapHoc]
GO
ALTER TABLE [dbo].[HOCSINH] ADD  CONSTRAINT [DF_HOCSINH_HoTenBo]  DEFAULT (N'Không có') FOR [HoTenBo]
GO
ALTER TABLE [dbo].[HOCSINH] ADD  CONSTRAINT [DF_HOCSINH_HoTenMe]  DEFAULT (N'Không có') FOR [HoTenMe]
GO
ALTER TABLE [dbo].[HOCSINH] ADD  CONSTRAINT [DF_HOCSINH_Anh]  DEFAULT (N'Không có') FOR [Anh]
GO
ALTER TABLE [dbo].[HOCSINH] ADD  CONSTRAINT [DF_HOCSINH_NgheBo]  DEFAULT (N'Không có') FOR [NgheBo]
GO
ALTER TABLE [dbo].[HOCSINH] ADD  CONSTRAINT [DF_HOCSINH_NgheMe]  DEFAULT (N'Không có') FOR [NgheMe]
GO
ALTER TABLE [dbo].[HOCSINH] ADD  CONSTRAINT [DF_HOCSINH_SoDienThoaiNha]  DEFAULT (N'Không có') FOR [SoDienThoaiNha]
GO
ALTER TABLE [dbo].[QUANTRI] ADD  CONSTRAINT [DF_NGUOIDUNG_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[THOIKHOABIEU] ADD  CONSTRAINT [DF_THOIKHOABIEU_TenThu]  DEFAULT (' ') FOR [TenThu]
GO
ALTER TABLE [dbo].[TOBOMON] ADD  CONSTRAINT [DF_TOBOMON_MoTa]  DEFAULT (N'Không có') FOR [MoTa]
GO
ALTER TABLE [dbo].[BANGDIEM]  WITH CHECK ADD  CONSTRAINT [FK_BANGDIEM_DSLOP] FOREIGN KEY([Malop])
REFERENCES [dbo].[DSLOP] ([MaLop])
GO
ALTER TABLE [dbo].[BANGDIEM] CHECK CONSTRAINT [FK_BANGDIEM_DSLOP]
GO
ALTER TABLE [dbo].[BANGDIEM]  WITH CHECK ADD  CONSTRAINT [FK_BANGDIEM_HOCKY] FOREIGN KEY([MaHK])
REFERENCES [dbo].[HOCKY] ([MaHK])
GO
ALTER TABLE [dbo].[BANGDIEM] CHECK CONSTRAINT [FK_BANGDIEM_HOCKY]
GO
ALTER TABLE [dbo].[BANGDIEM]  WITH CHECK ADD  CONSTRAINT [FK_BANGDIEM_HOCSINH] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HOCSINH] ([MaHocSinh])
GO
ALTER TABLE [dbo].[BANGDIEM] CHECK CONSTRAINT [FK_BANGDIEM_HOCSINH]
GO
ALTER TABLE [dbo].[BANGDIEM]  WITH CHECK ADD  CONSTRAINT [FK_BANGDIEM_MONHOC] FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MONHOC] ([MaMonHoc])
GO
ALTER TABLE [dbo].[BANGDIEM] CHECK CONSTRAINT [FK_BANGDIEM_MONHOC]
GO
ALTER TABLE [dbo].[CHUYENLOP]  WITH CHECK ADD  CONSTRAINT [FK_CHUYENLOP_HOCSINH] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HOCSINH] ([MaHocSinh])
GO
ALTER TABLE [dbo].[CHUYENLOP] CHECK CONSTRAINT [FK_CHUYENLOP_HOCSINH]
GO
ALTER TABLE [dbo].[DSLOP]  WITH CHECK ADD  CONSTRAINT [FK_LOP_KHOILOP] FOREIGN KEY([MaKhoi])
REFERENCES [dbo].[KHOILOP] ([MaKhoi])
GO
ALTER TABLE [dbo].[DSLOP] CHECK CONSTRAINT [FK_LOP_KHOILOP]
GO
ALTER TABLE [dbo].[GIAOVIEN]  WITH CHECK ADD  CONSTRAINT [FK_GIAOVIEN_MONHOC] FOREIGN KEY([MaMon])
REFERENCES [dbo].[MONHOC] ([MaMonHoc])
GO
ALTER TABLE [dbo].[GIAOVIEN] CHECK CONSTRAINT [FK_GIAOVIEN_MONHOC]
GO
ALTER TABLE [dbo].[HANHKIEM]  WITH CHECK ADD  CONSTRAINT [FK_HANHKIEM_DSLOP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[DSLOP] ([MaLop])
GO
ALTER TABLE [dbo].[HANHKIEM] CHECK CONSTRAINT [FK_HANHKIEM_DSLOP]
GO
ALTER TABLE [dbo].[HANHKIEM]  WITH CHECK ADD  CONSTRAINT [FK_HANHKIEM_HOCKY] FOREIGN KEY([MaHK])
REFERENCES [dbo].[HOCKY] ([MaHK])
GO
ALTER TABLE [dbo].[HANHKIEM] CHECK CONSTRAINT [FK_HANHKIEM_HOCKY]
GO
ALTER TABLE [dbo].[HANHKIEM]  WITH CHECK ADD  CONSTRAINT [FK_HANHKIEM_HOCSINH] FOREIGN KEY([MaHS])
REFERENCES [dbo].[HOCSINH] ([MaHocSinh])
GO
ALTER TABLE [dbo].[HANHKIEM] CHECK CONSTRAINT [FK_HANHKIEM_HOCSINH]
GO
ALTER TABLE [dbo].[HOCSINH]  WITH CHECK ADD  CONSTRAINT [FK_HOCSINH_NAMHOC] FOREIGN KEY([MaNamHoc])
REFERENCES [dbo].[NAMHOC] ([MaNamHoc])
GO
ALTER TABLE [dbo].[HOCSINH] CHECK CONSTRAINT [FK_HOCSINH_NAMHOC]
GO
ALTER TABLE [dbo].[KHENTHUONG]  WITH CHECK ADD  CONSTRAINT [FK_KHENTHUONG_DSLOP] FOREIGN KEY([Lop])
REFERENCES [dbo].[DSLOP] ([MaLop])
GO
ALTER TABLE [dbo].[KHENTHUONG] CHECK CONSTRAINT [FK_KHENTHUONG_DSLOP]
GO
ALTER TABLE [dbo].[KHENTHUONG]  WITH CHECK ADD  CONSTRAINT [FK_KHENTHUONG_HOCSINH] FOREIGN KEY([HocSinh])
REFERENCES [dbo].[HOCSINH] ([MaHocSinh])
GO
ALTER TABLE [dbo].[KHENTHUONG] CHECK CONSTRAINT [FK_KHENTHUONG_HOCSINH]
GO
ALTER TABLE [dbo].[KHENTHUONG]  WITH CHECK ADD  CONSTRAINT [FK_KHENTHUONG_KHOILOP] FOREIGN KEY([KhoiHoc])
REFERENCES [dbo].[KHOILOP] ([MaKhoi])
GO
ALTER TABLE [dbo].[KHENTHUONG] CHECK CONSTRAINT [FK_KHENTHUONG_KHOILOP]
GO
ALTER TABLE [dbo].[KHOILOP]  WITH CHECK ADD  CONSTRAINT [FK_KHOILOP_NAMHOC] FOREIGN KEY([MaNamHoc])
REFERENCES [dbo].[NAMHOC] ([MaNamHoc])
GO
ALTER TABLE [dbo].[KHOILOP] CHECK CONSTRAINT [FK_KHOILOP_NAMHOC]
GO
ALTER TABLE [dbo].[KYLUAT]  WITH CHECK ADD  CONSTRAINT [FK_KYLUAT_DSLOP] FOREIGN KEY([Lop])
REFERENCES [dbo].[DSLOP] ([MaLop])
GO
ALTER TABLE [dbo].[KYLUAT] CHECK CONSTRAINT [FK_KYLUAT_DSLOP]
GO
ALTER TABLE [dbo].[KYLUAT]  WITH CHECK ADD  CONSTRAINT [FK_KYLUAT_KHOILOP] FOREIGN KEY([KhoiHoc])
REFERENCES [dbo].[KHOILOP] ([MaKhoi])
GO
ALTER TABLE [dbo].[KYLUAT] CHECK CONSTRAINT [FK_KYLUAT_KHOILOP]
GO
ALTER TABLE [dbo].[LOAINGUOIDUNG]  WITH CHECK ADD  CONSTRAINT [FK_LOAINGUOIDUNG_GIAOVIEN] FOREIGN KEY([MaGiaoVien])
REFERENCES [dbo].[GIAOVIEN] ([MaGiaoVien])
GO
ALTER TABLE [dbo].[LOAINGUOIDUNG] CHECK CONSTRAINT [FK_LOAINGUOIDUNG_GIAOVIEN]
GO
ALTER TABLE [dbo].[LOAINGUOIDUNG]  WITH CHECK ADD  CONSTRAINT [FK_LOAINGUOIDUNG_QUANTRI] FOREIGN KEY([MaND])
REFERENCES [dbo].[QUANTRI] ([MaND])
GO
ALTER TABLE [dbo].[LOAINGUOIDUNG] CHECK CONSTRAINT [FK_LOAINGUOIDUNG_QUANTRI]
GO
ALTER TABLE [dbo].[MONHOC]  WITH CHECK ADD  CONSTRAINT [FK_MONHOC_TOBOMON] FOREIGN KEY([MaTo])
REFERENCES [dbo].[TOBOMON] ([MaTo])
GO
ALTER TABLE [dbo].[MONHOC] CHECK CONSTRAINT [FK_MONHOC_TOBOMON]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [FK_PHANCONG_DSLOP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[DSLOP] ([MaLop])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [FK_PHANCONG_DSLOP]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [FK_PHANCONG_GIAOVIEN] FOREIGN KEY([MaGiaoVien])
REFERENCES [dbo].[GIAOVIEN] ([MaGiaoVien])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [FK_PHANCONG_GIAOVIEN]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [FK_PHANCONG_MONHOC] FOREIGN KEY([MaMonHoc])
REFERENCES [dbo].[MONHOC] ([MaMonHoc])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [FK_PHANCONG_MONHOC]
GO
ALTER TABLE [dbo].[PHANLOP]  WITH CHECK ADD  CONSTRAINT [FK_PHANLOP_DSLOP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[DSLOP] ([MaLop])
GO
ALTER TABLE [dbo].[PHANLOP] CHECK CONSTRAINT [FK_PHANLOP_DSLOP]
GO
ALTER TABLE [dbo].[PHANLOP]  WITH CHECK ADD  CONSTRAINT [FK_PHANLOP_HOCSINH] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HOCSINH] ([MaHocSinh])
GO
ALTER TABLE [dbo].[PHANLOP] CHECK CONSTRAINT [FK_PHANLOP_HOCSINH]
GO
ALTER TABLE [dbo].[THOIKHOABIEU]  WITH CHECK ADD  CONSTRAINT [FK_THOIKHOABIEU_DSLOP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[DSLOP] ([MaLop])
GO
ALTER TABLE [dbo].[THOIKHOABIEU] CHECK CONSTRAINT [FK_THOIKHOABIEU_DSLOP]
GO
ALTER TABLE [dbo].[THOIKHOABIEU]  WITH CHECK ADD  CONSTRAINT [FK_THOIKHOABIEU_HOCKY] FOREIGN KEY([MaHK])
REFERENCES [dbo].[HOCKY] ([MaHK])
GO
ALTER TABLE [dbo].[THOIKHOABIEU] CHECK CONSTRAINT [FK_THOIKHOABIEU_HOCKY]
GO
USE [master]
GO
ALTER DATABASE [QLTHPT1] SET  READ_WRITE 
GO
