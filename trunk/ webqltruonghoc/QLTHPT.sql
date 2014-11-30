USE [QLTHPT1]
GO
/****** Object:  StoredProcedure [dbo].[Init_Database]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_BANGDIEM_Add*/
CREATE PROCEDURE [dbo].[sproc_BANGDIEM_Add]
	@MaHocSinh varchar(10),
	@MaMonHoc varchar(10),
	@DM_1 real,
	@DM_2 real,
	@D15_1 real,
	@D15_2 real,
	@D15_3 real,
	@D15_4 real,
	@D1T_1 real,
	@D1T_2 real,
	@DThi real
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
		[D15_4],
		[D1T_1],
		[D1T_2],
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
		@D15_4,
		@D1T_1,
		@D1T_2,
		@DThi
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
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
	--[D15_4],
	--[D1T_1],
	--[D1T_2],
	--[DThi]

*
FROM
	[BANGDIEM]

GO
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_GetByMaMon]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_BANGDIEM_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_BANNER_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_BANNER_Delete]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_BANNER_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_BANNER_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_BANNER_Update]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_CHUYENLOP_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_CHUYENLOP_Add]
	@TuLop varchar(15) 
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
/****** Object:  StoredProcedure [dbo].[sproc_CHUYENLOP_Delete]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_CHUYENLOP_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_CHUYENLOP_GetByTuLop]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_CHUYENLOP_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_CHUYENLOP_GetPaged]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_CHUYENLOP_Update]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_DSLOP_Add]
	@MaLop varchar(15)
	,@TenLop nvarchar(50)
	,@MaKhoi varchar(15)
	,@SiSo int
	,@MaGiaoVien varchar(10)
	,@MoTaKhac nvarchar(500)

AS

	INSERT INTO [DSLOP]
	(
		[MaLop],
		[TenLop],
		[MaKhoi],
		[SiSo],
		[MaGiaoVien],
		[MoTaKhac]
	)
	VALUES
	(
		@MaLop,
		@TenLop,
		@MaKhoi,
		@SiSo,
		@MaGiaoVien,
		@MoTaKhac
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_Delete]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_DSLOP_Delete*/
CREATE PROCEDURE [dbo].[sproc_DSLOP_Delete]
	@MaLop varchar(15)
AS
DELETE
FROM
	[DSLOP]
WHERE
	[MaLop] = @MaLop

GO
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_GetByMaKhoi]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sproc_DSLOP_GetByMaKhoi]
@MaKhoi varchar(15)
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
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_GetByMaLop]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_DSLOP_GetByMaLop*/
CREATE PROCEDURE [dbo].[sproc_DSLOP_GetByMaLop]
@MaLop varchar(15)
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
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_GetPaged]    Script Date: 4/16/2014 10:35:08 PM ******/
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
	messageID	varchar(15)
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
/****** Object:  StoredProcedure [dbo].[sproc_DSLOP_Update]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_DSLOP_Update*/
CREATE PROCEDURE [dbo].[sproc_DSLOP_Update]
	@TenLop nvarchar(50),
	@MaKhoi varchar(15),
	@SiSo int,
	@MaGiaoVien varchar(10),
	@MoTaKhac nvarchar(500),
	@MaLop varchar(15)

AS
UPDATE [DSLOP]
SET
	[TenLop] = @TenLop,
	[MaKhoi] = @MaKhoi,
	[SiSo] = @SiSo,
	[MaGiaoVien] = @MaGiaoVien,
	[MoTaKhac] = @MoTaKhac
WHERE
	[MaLop] = @MaLop

GO
/****** Object:  StoredProcedure [dbo].[sproc_GIAOVIEN_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
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
	,@MaTo varchar(10)

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
		[MaTo]
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
		@MaTo
	)
GO
/****** Object:  StoredProcedure [dbo].[sproc_GIAOVIEN_Delete]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_GIAOVIEN_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
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
	--[MaTo]

*
FROM
	[GIAOVIEN]

GO
/****** Object:  StoredProcedure [dbo].[sproc_GIAOVIEN_GetByMaGiaoVien]    Script Date: 4/16/2014 10:35:08 PM ******/
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
	--[MaTo]

*
FROM
	[GIAOVIEN]
WHERE
	[MaGiaoVien] = @MaGiaoVien

GO
/****** Object:  StoredProcedure [dbo].[sproc_GIAOVIEN_GetByMaTo]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_GIAOVIEN_GetByMaTo]
@MaTo varchar(15)
AS
SELECT
    --[MaGiaoVien],
	--[TenGiaoVien],
	--[NgaySinh],
	--[GioiTinh],
	--[DiaChi],
	--[SoDienThoai],
	--[MaTo]

*
FROM
	[GIAOVIEN]
WHERE
	[MaTo] = @MaTo

GO
/****** Object:  StoredProcedure [dbo].[sproc_GIAOVIEN_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_GIAOVIEN_GetPaged]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_GIAOVIEN_Update]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_GIAOVIEN_Update*/
CREATE PROCEDURE [dbo].[sproc_GIAOVIEN_Update]
	@TenGiaoVien nvarchar(50),
	@NgaySinh datetime,
	@GioiTinh nvarchar(10),
	@DiaChi nvarchar(200),
	@SoDienThoai nchar(20),
	@MaTo varchar(10),
	@MaGiaoVien varchar(10)

AS
UPDATE [GIAOVIEN]
SET
	[TenGiaoVien] = @TenGiaoVien,
	[NgaySinh] = @NgaySinh,
	[GioiTinh] = @GioiTinh,
	[DiaChi] = @DiaChi,
	[SoDienThoai] = @SoDienThoai,
	[MaTo] = @MaTo
WHERE
	[MaGiaoVien] = @MaGiaoVien

GO
/****** Object:  StoredProcedure [dbo].[sproc_HANHKIEM_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HANHKIEM_Add*/
CREATE PROCEDURE [dbo].[sproc_HANHKIEM_Add]
	@TenHocSinh varchar(10),
	@MaLop varchar(15),
	@MaHK varchar(15),
	@NgayNghiCoPhep tinyint,
	@NgayNghiKoPhep tinyint,
	@SoLanKyLuat tinyint,
	@HanhKiem nvarchar(20)
AS

	INSERT INTO [HANHKIEM]
	(
		[TenHocSinh],
		[MaLop],
		[MaHK],
		[NgayNghiCoPhep],
		[NgayNghiKoPhep],
		[SoLanKyLuat],
		[HanhKiem]
	)
	VALUES
	(
		@TenHocSinh,
		@MaLop,
		@MaHK,
		@NgayNghiCoPhep,
		@NgayNghiKoPhep,
		@SoLanKyLuat,
		@HanhKiem
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_HANHKIEM_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HANHKIEM_Get*/
CREATE PROCEDURE [dbo].[sproc_HANHKIEM_Get]
AS
SELECT
	--[TenHocSinh],
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
/****** Object:  StoredProcedure [dbo].[sproc_HANHKIEM_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_HOCKY_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_HOCKY_Add]
	@MaHK varchar(15)
	,@TenHK nvarchar(50)
	,@MaNamHoc varchar(6)
	,@TuNgay datetime
	,@DenNgay datetime

AS

	INSERT INTO [HOCKY]
	(
		[MaHK],
		[TenHK],
		[MaNamHoc],
		[TuNgay],
		[DenNgay]
	)
	VALUES
	(
		@MaHK,
		@TenHK,
		@MaNamHoc,
		@TuNgay,
		@DenNgay
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCKY_Delete]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HOCKY_Delete*/
CREATE PROCEDURE [dbo].[sproc_HOCKY_Delete]
	@MaHK varchar(15)
AS
DELETE
FROM
	[HOCKY]
WHERE
	[MaHK] = @MaHK

GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCKY_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
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
	--[MaNamHoc],
	--[TuNgay],
	--[DenNgay]

*
FROM
	[HOCKY]

GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCKY_GetByMaHK]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HOCKY_GetByMaHK*/
CREATE PROCEDURE [dbo].[sproc_HOCKY_GetByMaHK]
@MaHK varchar(15)
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
	[MaHK] = @MaHK

GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCKY_GetByMaNamHoc]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_HOCKY_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_HOCKY_GetPaged]    Script Date: 4/16/2014 10:35:08 PM ******/
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
	messageID	varchar(15)
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
/****** Object:  StoredProcedure [dbo].[sproc_HOCKY_Update]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HOCKY_Update*/
CREATE PROCEDURE [dbo].[sproc_HOCKY_Update]
	@TenHK nvarchar(50),
	@MaNamHoc varchar(6),
	@TuNgay datetime,
	@DenNgay datetime,
	@MaHK varchar(15)

AS
UPDATE [HOCKY]
SET
	[TenHK] = @TenHK,
	[MaNamHoc] = @MaNamHoc,
	[TuNgay] = @TuNgay,
	[DenNgay] = @DenNgay
WHERE
	[MaHK] = @MaHK

GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCSINH_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_HOCSINH_Add]
	@MaHocSinh varchar(10)
	,@MaLop varchar(15)
	,@TenHocSinh nvarchar(50)
	,@Email nvarchar(50)
	,@GioiTinh bit
	,@NgaySinh datetime
	,@NoiSinh nvarchar(100)
	,@DiaChi nvarchar(100)
	,@NgayNhapHoc datetime
	,@HoTenBo nvarchar(30)
	,@HoTenMe nvarchar(30)
	,@Anh nchar(10)
	,@NgheBo nchar(10)
	,@NgheMe nchar(10)
	,@NgayVaoTruong datetime
	,@TrangThai nvarchar(30)
	,@SoDienThoaiNha nchar(20)

AS

	INSERT INTO [HOCSINH]
	(
		[MaHocSinh],
		[MaLop],
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
		[NgayVaoTruong],
		[TrangThai],
		[SoDienThoaiNha]
	)
	VALUES
	(
		@MaHocSinh,
		@MaLop,
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
		@NgayVaoTruong,
		@TrangThai,
		@SoDienThoaiNha
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCSINH_Delete]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_HOCSINH_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
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
	--[NgayVaoTruong],
	--[TrangThai],
	--[SoDienThoaiNha]

*
FROM
	[HOCSINH]

GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCSINH_GetByMaHocSinh]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HOCSINH_GetByMaHocSinh*/
CREATE PROCEDURE [dbo].[sproc_HOCSINH_GetByMaHocSinh]
@MaHocSinh varchar(10)
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
	[MaHocSinh] = @MaHocSinh

GO
/****** Object:  StoredProcedure [dbo].[sproc_HOCSINH_GetByMaLop]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_HOCSINH_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_HOCSINH_GetPaged]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_HOCSINH_Update]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_HOCSINH_Update*/
CREATE PROCEDURE [dbo].[sproc_HOCSINH_Update]
	@MaLop varchar(15),
	@TenHocSinh nvarchar(50),
	@Email nvarchar(50),
	@GioiTinh bit,
	@NgaySinh datetime,
	@NoiSinh nvarchar(100),
	@DiaChi nvarchar(100),
	@NgayNhapHoc datetime,
	@HoTenBo nvarchar(30),
	@HoTenMe nvarchar(30),
	@Anh nchar(10),
	@NgheBo nchar(10),
	@NgheMe nchar(10),
	@NgayVaoTruong datetime,
	@TrangThai nvarchar(30),
	@SoDienThoaiNha nchar(20),
	@MaHocSinh varchar(10)

AS
UPDATE [HOCSINH]
SET
	[MaLop] = @MaLop,
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
	[NgayVaoTruong] = @NgayVaoTruong,
	[TrangThai] = @TrangThai,
	[SoDienThoaiNha] = @SoDienThoaiNha
WHERE
	[MaHocSinh] = @MaHocSinh

GO
/****** Object:  StoredProcedure [dbo].[sproc_KHENTHUONG_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_KHENTHUONG_Add*/
CREATE PROCEDURE [dbo].[sproc_KHENTHUONG_Add]
	@TenKhoi nvarchar(50),
	@TenHocSinh nvarchar(30),
	@Lop nvarchar(50),
	@HinhThucKhen nvarchar(50),
	@NoiKhenThuong nvarchar(50),
	@NgayKhen datetime,
	@NoiDungKhen nvarchar(500)
AS

	INSERT INTO [KHENTHUONG]
	(
		[TenKhoi],
		[TenHocSinh],
		[Lop],
		[HinhThucKhen],
		[NoiKhenThuong],
		[NgayKhen],
		[NoiDungKhen]
	)
	VALUES
	(
		@TenKhoi,
		@TenHocSinh,
		@Lop,
		@HinhThucKhen,
		@NoiKhenThuong,
		@NgayKhen,
		@NoiDungKhen
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_KHENTHUONG_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_KHENTHUONG_Get*/
CREATE PROCEDURE [dbo].[sproc_KHENTHUONG_Get]
AS
SELECT
	--[TenKhoi],
	--[TenHocSinh],
	--[Lop],
	--[HinhThucKhen],
	--[NoiKhenThuong],
	--[NgayKhen],
	--[NoiDungKhen]

*
FROM
	[KHENTHUONG]

GO
/****** Object:  StoredProcedure [dbo].[sproc_KHENTHUONG_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_KHOILOP_Add]
	@MaKhoi varchar(15)
	,@TenKhoi nvarchar(50)
	,@MaHocKy varchar(15)

AS

	INSERT INTO [KHOILOP]
	(
		[MaKhoi],
		[TenKhoi],
		[MaHocKy]
	)
	VALUES
	(
		@MaKhoi,
		@TenKhoi,
		@MaHocKy
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_Delete]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_KHOILOP_Delete*/
CREATE PROCEDURE [dbo].[sproc_KHOILOP_Delete]
	@MaKhoi varchar(15)
AS
DELETE
FROM
	[KHOILOP]
WHERE
	[MaKhoi] = @MaKhoi

GO
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_KHOILOP_Get*/
CREATE PROCEDURE [dbo].[sproc_KHOILOP_Get]
AS
SELECT
	--[MaKhoi],
	--[TenKhoi],
	--[MaHocKy]

*
FROM
	[KHOILOP]

GO
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_GetByMaKhoi]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_KHOILOP_GetByMaKhoi*/
CREATE PROCEDURE [dbo].[sproc_KHOILOP_GetByMaKhoi]
@MaKhoi varchar(15)
AS
SELECT
	--[MaKhoi],
	--[TenKhoi],
	--[MaHocKy]

*
FROM
	[KHOILOP]
WHERE
	[MaKhoi] = @MaKhoi

GO
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_GetByMaKy]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sproc_KHOILOP_GetByMaKy]
@MaKy varchar(15)
AS
SELECT
	--[MaKhoi],
	--[TenKhoi],
	--[MaHocKy]

*
FROM
	[KHOILOP]
WHERE
	[MaHocKy] = @MaKy

GO
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_GetPaged]    Script Date: 4/16/2014 10:35:08 PM ******/
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
	messageID	varchar(15)
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
/****** Object:  StoredProcedure [dbo].[sproc_KHOILOP_Update]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_KHOILOP_Update*/
CREATE PROCEDURE [dbo].[sproc_KHOILOP_Update]
	@TenKhoi nvarchar(50),
	@MaHocKy varchar(15),
	@MaKhoi varchar(15)

AS
UPDATE [KHOILOP]
SET
	[TenKhoi] = @TenKhoi,
	[MaHocKy] = @MaHocKy
WHERE
	[MaKhoi] = @MaKhoi

GO
/****** Object:  StoredProcedure [dbo].[sproc_KYLUAT_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_KYLUAT_Add*/
CREATE PROCEDURE [dbo].[sproc_KYLUAT_Add]
	@KhoiHoc nvarchar(50),
	@Lop nvarchar(50),
	@TenHocSinh nvarchar(50),
	@HinhThucKyLuat nvarchar(50),
	@NgayKyLuat nvarchar(50),
	@NoiDung nvarchar(500)
AS

	INSERT INTO [KYLUAT]
	(
		[KhoiHoc],
		[Lop],
		[TenHocSinh],
		[HinhThucKyLuat],
		[NgayKyLuat],
		[NoiDung]
	)
	VALUES
	(
		@KhoiHoc,
		@Lop,
		@TenHocSinh,
		@HinhThucKyLuat,
		@NgayKyLuat,
		@NoiDung
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_KYLUAT_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_KYLUAT_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_LOAINGUOIDUNG_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_LOAINGUOIDUNG_Add]
	@MaLoaiND varchar(10)
	,@TenLoaiND nvarchar(30)

AS

	INSERT INTO [LOAINGUOIDUNG]
	(
		[MaLoaiND],
		[TenLoaiND]
	)
	VALUES
	(
		@MaLoaiND,
		@TenLoaiND
	)
GO
/****** Object:  StoredProcedure [dbo].[sproc_LOAINGUOIDUNG_Delete]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_LOAINGUOIDUNG_Delete*/
CREATE PROCEDURE [dbo].[sproc_LOAINGUOIDUNG_Delete]
	@MaLoaiND varchar(10)
AS
DELETE
FROM
	[LOAINGUOIDUNG]
WHERE
	[MaLoaiND] = @MaLoaiND

GO
/****** Object:  StoredProcedure [dbo].[sproc_LOAINGUOIDUNG_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_LOAINGUOIDUNG_Get*/
CREATE PROCEDURE [dbo].[sproc_LOAINGUOIDUNG_Get]
AS
SELECT
	--[MaLoaiND],
	--[TenLoaiND]

*
FROM
	[LOAINGUOIDUNG]

GO
/****** Object:  StoredProcedure [dbo].[sproc_LOAINGUOIDUNG_GetByMaLoaiND]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_LOAINGUOIDUNG_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_LOAINGUOIDUNG_GetPaged]    Script Date: 4/16/2014 10:35:08 PM ******/
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
	messageID	varchar(10)
)

-- insert temp records
INSERT INTO #tmp_paging_index(messageID)
SELECT [MaLoaiND]
FROM [LOAINGUOIDUNG]


-- query out
SELECT *
FROM [LOAINGUOIDUNG]
WHERE [MaLoaiND]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_LOAINGUOIDUNG_Update]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_LOAINGUOIDUNG_Update*/
CREATE PROCEDURE [dbo].[sproc_LOAINGUOIDUNG_Update]
	@TenLoaiND nvarchar(30),
	@MaLoaiND varchar(10)

AS
UPDATE [LOAINGUOIDUNG]
SET
	[TenLoaiND] = @TenLoaiND
WHERE
	[MaLoaiND] = @MaLoaiND

GO
/****** Object:  StoredProcedure [dbo].[sproc_MENU_HS_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_MENU_HS_Delete]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_MENU_HS_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_MENU_HS_GetByID]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_MENU_HS_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_MENU_HS_GetPaged]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_MENU_HS_Update]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_MONHOC_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_MONHOC_Add]
	@MaMonHoc varchar(10)
	,@MaGiaoVien varchar(10)
	,@TenMonHoc nvarchar(50)
	,@SoTiet int
	,@HeSo int
	,@TrangThai int

AS

	INSERT INTO [MONHOC]
	(
		[MaMonHoc],
		[MaGiaoVien],
		[TenMonHoc],
		[SoTiet],
		[HeSo],
		[TrangThai]
	)
	VALUES
	(
		@MaMonHoc,
		@MaGiaoVien,
		@TenMonHoc,
		@SoTiet,
		@HeSo,
		@TrangThai
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_MONHOC_Delete]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_MONHOC_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
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
	--[HeSo],
	--[TrangThai]

*
FROM
	[MONHOC]

GO
/****** Object:  StoredProcedure [dbo].[sproc_MONHOC_GetByMaMonHoc]    Script Date: 4/16/2014 10:35:08 PM ******/
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
	--[HeSo],
	--[TrangThai]

*
FROM
	[MONHOC]
WHERE
	[MaMonHoc] = @MaMonHoc

GO
/****** Object:  StoredProcedure [dbo].[sproc_MONHOC_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_MONHOC_GetPaged]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_MONHOC_Update]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_MONHOC_Update*/
CREATE PROCEDURE [dbo].[sproc_MONHOC_Update]
	@MaGiaoVien varchar(10),
	@TenMonHoc nvarchar(50),
	@SoTiet int,
	@HeSo int,
	@TrangThai int,
	@MaMonHoc varchar(10)

AS
UPDATE [MONHOC]
SET
	[MaGiaoVien] = @MaGiaoVien,
	[TenMonHoc] = @TenMonHoc,
	[SoTiet] = @SoTiet,
	[HeSo] = @HeSo,
	[TrangThai] = @TrangThai
WHERE
	[MaMonHoc] = @MaMonHoc

GO
/****** Object:  StoredProcedure [dbo].[sproc_NAMHOC_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_NAMHOC_Add]
	@MaNamHoc varchar(6)
	,@TenNamHoc nvarchar(30)

AS

	INSERT INTO [NAMHOC]
	(
		[MaNamHoc],
		[TenNamHoc]
	)
	VALUES
	(
		@MaNamHoc,
		@TenNamHoc
	)
GO
/****** Object:  StoredProcedure [dbo].[sproc_NAMHOC_Delete]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NAMHOC_Delete*/
CREATE PROCEDURE [dbo].[sproc_NAMHOC_Delete]
	@MaNamHoc varchar(6)
AS
DELETE
FROM
	[NAMHOC]
WHERE
	[MaNamHoc] = @MaNamHoc

GO
/****** Object:  StoredProcedure [dbo].[sproc_NAMHOC_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_NAMHOC_GetByMaNamHoc]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NAMHOC_GetByMaNamHoc*/
CREATE PROCEDURE [dbo].[sproc_NAMHOC_GetByMaNamHoc]
@MaNamHoc varchar(6)
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
/****** Object:  StoredProcedure [dbo].[sproc_NAMHOC_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_NAMHOC_GetPaged]    Script Date: 4/16/2014 10:35:08 PM ******/
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
	messageID	varchar(6)
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
/****** Object:  StoredProcedure [dbo].[sproc_NAMHOC_Update]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NAMHOC_Update*/
CREATE PROCEDURE [dbo].[sproc_NAMHOC_Update]
	@TenNamHoc nvarchar(30),
	@MaNamHoc varchar(6)

AS
UPDATE [NAMHOC]
SET
	[TenNamHoc] = @TenNamHoc
WHERE
	[MaNamHoc] = @MaNamHoc

GO
/****** Object:  StoredProcedure [dbo].[sproc_NGUOIDUNG_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_NGUOIDUNG_Add]
	@MaND varchar(10)
	,@MaLoaiND varchar(10)
	,@TenDNhap varchar(30)
	,@MatKhau varchar(35)
	,@TrangThai bit

AS

	INSERT INTO [NGUOIDUNG]
	(
		[MaND],
		[MaLoaiND],
		[TenDNhap],
		[MatKhau],
		[TrangThai]
	)
	VALUES
	(
		@MaND,
		@MaLoaiND,
		@TenDNhap,
		@MatKhau,
		@TrangThai
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_NGUOIDUNG_Delete]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NGUOIDUNG_Delete*/
CREATE PROCEDURE [dbo].[sproc_NGUOIDUNG_Delete]
	@MaND varchar(10)
AS
DELETE
FROM
	[NGUOIDUNG]
WHERE
	[MaND] = @MaND

GO
/****** Object:  StoredProcedure [dbo].[sproc_NGUOIDUNG_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NGUOIDUNG_Get*/
CREATE PROCEDURE [dbo].[sproc_NGUOIDUNG_Get]
AS
SELECT
	--[MaND],
	--[MaLoaiND],
	--[TenDNhap],
	--[MatKhau],
	--[TrangThai]

*
FROM
	[NGUOIDUNG]

GO
/****** Object:  StoredProcedure [dbo].[sproc_NGUOIDUNG_GetByMaND]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NGUOIDUNG_GetByMaND*/
CREATE PROCEDURE [dbo].[sproc_NGUOIDUNG_GetByMaND]
@MaND varchar(10)
AS
SELECT
	--[MaND],
	--[MaLoaiND],
	--[TenDNhap],
	--[MatKhau],
	--[TrangThai]

*
FROM
	[NGUOIDUNG]
WHERE
	[MaND] = @MaND

GO
/****** Object:  StoredProcedure [dbo].[sproc_NGUOIDUNG_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NGUOIDUNG_GetCount*/
CREATE PROCEDURE [dbo].[sproc_NGUOIDUNG_GetCount]
AS
SELECT
	COUNT(*)
FROM
	[NGUOIDUNG]

GO
/****** Object:  StoredProcedure [dbo].[sproc_NGUOIDUNG_GetPaged]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NGUOIDUNG_GetPaged*/
CREATE PROCEDURE [dbo].[sproc_NGUOIDUNG_GetPaged]
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
SELECT [MaND]
FROM [NGUOIDUNG]


-- query out
SELECT *
FROM [NGUOIDUNG]
WHERE [MaND]
IN (
	SELECT messageID 
	FROM #tmp_paging_index 
	WHERE recID >= @FirstRec AND recID <= @LastRec
)
DROP TABLE #tmp_paging_index


GO
/****** Object:  StoredProcedure [dbo].[sproc_NGUOIDUNG_Update]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NGUOIDUNG_Update*/
CREATE PROCEDURE [dbo].[sproc_NGUOIDUNG_Update]
	@MaLoaiND varchar(10),
	@TenDNhap varchar(30),
	@MatKhau varchar(35),
	@TrangThai bit,
	@MaND varchar(10)

AS
UPDATE [NGUOIDUNG]
SET
	[MaLoaiND] = @MaLoaiND,
	[TenDNhap] = @TenDNhap,
	[MatKhau] = @MatKhau,
	[TrangThai] = @TrangThai
WHERE
	[MaND] = @MaND

GO
/****** Object:  StoredProcedure [dbo].[sproc_NHATRUONG_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_NHATRUONG_Add*/
CREATE PROCEDURE [dbo].[sproc_NHATRUONG_Add]
	@MaTruong nvarchar(6),
	@TenTruong nvarchar(200),
	@DienThoai nchar(20),
	@Email nchar(20),
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
/****** Object:  StoredProcedure [dbo].[sproc_NHATRUONG_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_NHATRUONG_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_THOIKHOABIEU_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_THOIKHOABIEU_Add]
	@MaTKB varchar(15)
	,@MaLop varchar(15)
	,@Tiet1 nvarchar(30)
	,@Tiet2 nvarchar(30)
	,@Tiet3 nvarchar(30)
	,@Tiet4 nvarchar(30)
	,@Tiet5 nvarchar(30)

AS

	INSERT INTO [THOIKHOABIEU]
	(
		[MaTKB],
		[MaLop],
		[Tiet1],
		[Tiet2],
		[Tiet3],
		[Tiet4],
		[Tiet5]
	)
	VALUES
	(
		@MaTKB,
		@MaLop,
		@Tiet1,
		@Tiet2,
		@Tiet3,
		@Tiet4,
		@Tiet5
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_THOIKHOABIEU_Delete]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_THOIKHOABIEU_Delete*/
CREATE PROCEDURE [dbo].[sproc_THOIKHOABIEU_Delete]
	@MaTKB varchar(15)
AS
DELETE
FROM
	[THOIKHOABIEU]
WHERE
	[MaTKB] = @MaTKB

GO
/****** Object:  StoredProcedure [dbo].[sproc_THOIKHOABIEU_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
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
	--[Tiet5]

*
FROM
	[THOIKHOABIEU]

GO
/****** Object:  StoredProcedure [dbo].[sproc_THOIKHOABIEU_GetByMaTKB]    Script Date: 4/16/2014 10:35:08 PM ******/
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
	--[Tiet5]

*
FROM
	[THOIKHOABIEU]
WHERE
	[MaTKB] = @MaTKB

GO
/****** Object:  StoredProcedure [dbo].[sproc_THOIKHOABIEU_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_THOIKHOABIEU_GetPaged]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_THOIKHOABIEU_Update]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_THOIKHOABIEU_Update*/
CREATE PROCEDURE [dbo].[sproc_THOIKHOABIEU_Update]
	@MaLop varchar(15),
	@Tiet1 nvarchar(30),
	@Tiet2 nvarchar(30),
	@Tiet3 nvarchar(30),
	@Tiet4 nvarchar(30),
	@Tiet5 nvarchar(30),
	@MaTKB varchar(15)

AS
UPDATE [THOIKHOABIEU]
SET
	[MaLop] = @MaLop,
	[Tiet1] = @Tiet1,
	[Tiet2] = @Tiet2,
	[Tiet3] = @Tiet3,
	[Tiet4] = @Tiet4,
	[Tiet5] = @Tiet5
WHERE
	[MaTKB] = @MaTKB

GO
/****** Object:  StoredProcedure [dbo].[sproc_TINTUC_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_TINTUC_Add*/
CREATE PROCEDURE [dbo].[sproc_TINTUC_Add]
	@TieuDeTin nvarchar(500),
	@NoiDungTin ntext,
	@NgayDangTin datetime
AS

	INSERT INTO [TINTUC]
	(
		[TieuDeTin],
		[NoiDungTin],
		[NgayDangTin]
	)
	VALUES
	(
		@TieuDeTin,
		@NoiDungTin,
		@NgayDangTin
	)

GO
/****** Object:  StoredProcedure [dbo].[sproc_TINTUC_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_TINTUC_Get*/
CREATE PROCEDURE [dbo].[sproc_TINTUC_Get]
AS
SELECT
	--[TieuDeTin],
	--[NoiDungTin],
	--[NgayDangTin]

*
FROM
	[TINTUC]

GO
/****** Object:  StoredProcedure [dbo].[sproc_TINTUC_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_TOBOMON_Add]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_TOBOMON_Add]
	@MaTo varchar(10)
	,@TenToBoMon nvarchar(100)
	,@MaLoaiND varchar(10)
	,@MoTa nvarchar(500)

AS

	INSERT INTO [TOBOMON]
	(
		[MaTo],
		[MaLoaiND],
		[TenToBoMon],
		[MoTa]
	)
	VALUES
	(
		@MaTo,
		@MaLoaiND,
		@TenToBoMon,
		@MoTa
	)
GO
/****** Object:  StoredProcedure [dbo].[sproc_TOBOMON_Delete]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_TOBOMON_Delete*/
CREATE PROCEDURE [dbo].[sproc_TOBOMON_Delete]
	@MaTo varchar(10)
AS
DELETE
FROM
	[TOBOMON]
WHERE
	[MaTo] = @MaTo

GO
/****** Object:  StoredProcedure [dbo].[sproc_TOBOMON_Get]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_TOBOMON_Get*/
CREATE PROCEDURE [dbo].[sproc_TOBOMON_Get]
AS
SELECT
	--[MaTo],
	--[TenToBoMon],
	--[MoTa]

*
FROM
	[TOBOMON]

GO
/****** Object:  StoredProcedure [dbo].[sproc_TOBOMON_GetByMaTo]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_TOBOMON_GetByMaTo*/
CREATE PROCEDURE [dbo].[sproc_TOBOMON_GetByMaTo]
@MaTo varchar(10)
AS
SELECT
	--[MaTo],
	--[TenToBoMon],
	--[MoTa]

*
FROM
	[TOBOMON]
WHERE
	[MaTo] = @MaTo

GO
/****** Object:  StoredProcedure [dbo].[sproc_TOBOMON_GetCount]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sproc_TOBOMON_GetPaged]    Script Date: 4/16/2014 10:35:08 PM ******/
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
	messageID	varchar(10)
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
/****** Object:  StoredProcedure [dbo].[sproc_TOBOMON_Update]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Procedure sproc_TOBOMON_Update*/
CREATE PROCEDURE [dbo].[sproc_TOBOMON_Update]
	@TenToBoMon nvarchar(100),
	@MoTa nvarchar(500),
	@MaTo varchar(10)

AS
UPDATE [TOBOMON]
SET
	[TenToBoMon] = @TenToBoMon,
	[MoTa] = @MoTa
WHERE
	[MaTo] = @MaTo

GO
/****** Object:  UserDefinedFunction [dbo].[fnChuyenKhongDau]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  Table [dbo].[BANGDIEM]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BANGDIEM](
	[MaHocSinh] [varchar](10) NOT NULL,
	[MaMonHoc] [varchar](10) NOT NULL,
	[DM_1] [real] NULL,
	[DM_2] [real] NULL,
	[D15_1] [real] NULL,
	[D15_2] [real] NULL,
	[D15_3] [real] NULL,
	[D1T_1] [real] NULL,
	[D1T_2] [real] NULL,
	[DThi] [real] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BANNER]    Script Date: 4/16/2014 10:35:08 PM ******/
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
/****** Object:  Table [dbo].[CHUYENLOP]    Script Date: 4/16/2014 10:35:08 PM ******/
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
	[LyDoChuyen] [nvarchar](250) NULL,
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
/****** Object:  Table [dbo].[DSLOP]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DSLOP](
	[MaLop] [varchar](15) NOT NULL,
	[TenLop] [nvarchar](50) NOT NULL,
	[MaKhoi] [varchar](15) NOT NULL,
	[SiSo] [int] NOT NULL,
	[MaGiaoVien] [varchar](10) NOT NULL,
	[MoTaKhac] [nvarchar](500) NULL,
 CONSTRAINT [PK_LOP] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GIAOVIEN]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GIAOVIEN](
	[MaGiaoVien] [varchar](10) NOT NULL,
	[TenGiaoVien] [nvarchar](50) NOT NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[SoDienThoai] [nchar](20) NULL,
	[ChuNhiem] [bit] NOT NULL,
	[MaTo] [varchar](10) NULL,
 CONSTRAINT [PK_GIAOVIEN] PRIMARY KEY CLUSTERED 
(
	[MaGiaoVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HANHKIEM]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HANHKIEM](
	[TenHocSinh] [varchar](10) NOT NULL,
	[MaLop] [varchar](15) NULL,
	[MaHK] [varchar](15) NOT NULL,
	[NgayNghiCoPhep] [tinyint] NULL,
	[NgayNghiKoPhep] [tinyint] NULL,
	[SoLanKyLuat] [tinyint] NULL,
	[HanhKiem] [nvarchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HOCKY]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HOCKY](
	[MaHK] [varchar](15) NOT NULL,
	[TenHK] [nvarchar](50) NOT NULL,
	[MaNamHoc] [varchar](6) NOT NULL,
	[TuNgay] [datetime] NOT NULL,
	[DenNgay] [datetime] NOT NULL,
 CONSTRAINT [PK_HOCKY] PRIMARY KEY CLUSTERED 
(
	[MaHK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HOCSINH]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HOCSINH](
	[MaHocSinh] [varchar](10) NOT NULL,
	[MaLop] [varchar](15) NOT NULL,
	[TenHocSinh] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[NoiSinh] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[NgayNhapHoc] [datetime] NOT NULL,
	[HoTenBo] [nvarchar](30) NULL,
	[HoTenMe] [nvarchar](30) NULL,
	[Anh] [nchar](10) NULL,
	[NgheBo] [nchar](10) NULL,
	[NgheMe] [nchar](10) NULL,
	[NgayVaoDoan] [datetime] NOT NULL,
	[TrangThai] [nvarchar](30) NOT NULL,
	[SoDienThoaiNha] [nchar](20) NULL,
 CONSTRAINT [PK_HOCSINH] PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHENTHUONG]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHENTHUONG](
	[TenKhoi] [nvarchar](50) NOT NULL,
	[TenHocSinh] [nvarchar](30) NOT NULL,
	[Lop] [nvarchar](50) NOT NULL,
	[HinhThucKhen] [nvarchar](50) NOT NULL,
	[NoiKhenThuong] [nvarchar](50) NOT NULL,
	[NgayKhen] [datetime] NOT NULL,
	[NoiDungKhen] [nvarchar](500) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHOILOP]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHOILOP](
	[MaKhoi] [varchar](15) NOT NULL,
	[TenKhoi] [nvarchar](50) NOT NULL,
	[MaHocKy] [varchar](15) NOT NULL,
 CONSTRAINT [PK_KHOILOP] PRIMARY KEY CLUSTERED 
(
	[MaKhoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KYLUAT]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KYLUAT](
	[KhoiHoc] [nvarchar](50) NOT NULL,
	[Lop] [nvarchar](50) NOT NULL,
	[TenHocSinh] [nvarchar](50) NOT NULL,
	[HinhThucKyLuat] [nvarchar](50) NOT NULL,
	[NgayKyLuat] [nvarchar](50) NOT NULL,
	[NoiDung] [nvarchar](500) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOAINGUOIDUNG]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOAINGUOIDUNG](
	[MaLoaiND] [varchar](10) NOT NULL,
	[TenLoaiND] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_LOAINGUOIDUNG] PRIMARY KEY CLUSTERED 
(
	[MaLoaiND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MENU_HS]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU_HS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MENU_HS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MONHOC]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MONHOC](
	[MaMonHoc] [varchar](10) NOT NULL,
	[MaGiaoVien] [varchar](10) NULL,
	[TenMonHoc] [nvarchar](50) NOT NULL,
	[SoTiet] [int] NOT NULL,
	[HeSo] [int] NOT NULL,
	[TrangThai] [int] NOT NULL,
 CONSTRAINT [PK_MONHOC] PRIMARY KEY CLUSTERED 
(
	[MaMonHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NAMHOC]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NAMHOC](
	[MaNamHoc] [varchar](6) NOT NULL,
	[TenNamHoc] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_NAMHOC] PRIMARY KEY CLUSTERED 
(
	[MaNamHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHATRUONG]    Script Date: 4/16/2014 10:35:08 PM ******/
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
	[NgayLap] [date] NULL,
	[AnhDaiDien] [nchar](100) NULL,
	[HieuTruong] [nvarchar](30) NOT NULL,
	[Website] [nchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QUANTRI]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QUANTRI](
	[MaND] [varchar](10) NOT NULL,
	[MaLoaiND] [varchar](10) NOT NULL,
	[TenDNhap] [varchar](30) NOT NULL,
	[MatKhau] [varchar](35) NOT NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_NGUOIDUNG] PRIMARY KEY CLUSTERED 
(
	[MaND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[THOIKHOABIEU]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[THOIKHOABIEU](
	[MaTKB] [varchar](15) NOT NULL,
	[MaLop] [varchar](15) NOT NULL,
	[Tiet1] [nvarchar](30) NULL,
	[Tiet2] [nvarchar](30) NULL,
	[Tiet3] [nvarchar](30) NULL,
	[Tiet4] [nvarchar](30) NULL,
	[Tiet5] [nvarchar](30) NULL,
	[TuNgay] [datetime] NULL,
	[DenNgay] [datetime] NULL,
 CONSTRAINT [PK_THOIKHOABIEU_1] PRIMARY KEY CLUSTERED 
(
	[MaTKB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TINTUC]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TINTUC](
	[TieuDeTin] [nvarchar](500) NOT NULL,
	[NoiDungTin] [ntext] NULL,
	[NgayDangTin] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TOBOMON]    Script Date: 4/16/2014 10:35:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TOBOMON](
	[MaTo] [varchar](10) NOT NULL,
	[MaLoaiND] [varchar](10) NULL,
	[TenToBoMon] [nvarchar](100) NOT NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_TOBOMON] PRIMARY KEY CLUSTERED 
(
	[MaTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
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
ALTER TABLE [dbo].[MONHOC] ADD  CONSTRAINT [DF_MONHOC_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[QUANTRI] ADD  CONSTRAINT [DF_NGUOIDUNG_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
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
ALTER TABLE [dbo].[DSLOP]  WITH CHECK ADD  CONSTRAINT [FK_LOP_GIAOVIEN] FOREIGN KEY([MaGiaoVien])
REFERENCES [dbo].[GIAOVIEN] ([MaGiaoVien])
GO
ALTER TABLE [dbo].[DSLOP] CHECK CONSTRAINT [FK_LOP_GIAOVIEN]
GO
ALTER TABLE [dbo].[DSLOP]  WITH CHECK ADD  CONSTRAINT [FK_LOP_KHOILOP] FOREIGN KEY([MaKhoi])
REFERENCES [dbo].[KHOILOP] ([MaKhoi])
GO
ALTER TABLE [dbo].[DSLOP] CHECK CONSTRAINT [FK_LOP_KHOILOP]
GO
ALTER TABLE [dbo].[GIAOVIEN]  WITH CHECK ADD  CONSTRAINT [FK_GIAOVIEN_TOBOMON] FOREIGN KEY([MaTo])
REFERENCES [dbo].[TOBOMON] ([MaTo])
GO
ALTER TABLE [dbo].[GIAOVIEN] CHECK CONSTRAINT [FK_GIAOVIEN_TOBOMON]
GO
ALTER TABLE [dbo].[HANHKIEM]  WITH CHECK ADD  CONSTRAINT [FK_HANHKIEM_DSLOP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[DSLOP] ([MaLop])
GO
ALTER TABLE [dbo].[HANHKIEM] CHECK CONSTRAINT [FK_HANHKIEM_DSLOP]
GO
ALTER TABLE [dbo].[HOCKY]  WITH CHECK ADD  CONSTRAINT [FK_HOCKY_NAMHOC] FOREIGN KEY([MaNamHoc])
REFERENCES [dbo].[NAMHOC] ([MaNamHoc])
GO
ALTER TABLE [dbo].[HOCKY] CHECK CONSTRAINT [FK_HOCKY_NAMHOC]
GO
ALTER TABLE [dbo].[HOCSINH]  WITH CHECK ADD  CONSTRAINT [FK_HOCSINH_DSLOP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[DSLOP] ([MaLop])
GO
ALTER TABLE [dbo].[HOCSINH] CHECK CONSTRAINT [FK_HOCSINH_DSLOP]
GO
ALTER TABLE [dbo].[KHOILOP]  WITH CHECK ADD  CONSTRAINT [FK_KHOILOP_HOCKY] FOREIGN KEY([MaHocKy])
REFERENCES [dbo].[HOCKY] ([MaHK])
GO
ALTER TABLE [dbo].[KHOILOP] CHECK CONSTRAINT [FK_KHOILOP_HOCKY]
GO
ALTER TABLE [dbo].[MONHOC]  WITH CHECK ADD  CONSTRAINT [FK_MONHOC_GIAOVIEN] FOREIGN KEY([MaGiaoVien])
REFERENCES [dbo].[GIAOVIEN] ([MaGiaoVien])
GO
ALTER TABLE [dbo].[MONHOC] CHECK CONSTRAINT [FK_MONHOC_GIAOVIEN]
GO
ALTER TABLE [dbo].[QUANTRI]  WITH CHECK ADD  CONSTRAINT [FK_NGUOIDUNG_LOAINGUOIDUNG] FOREIGN KEY([MaLoaiND])
REFERENCES [dbo].[LOAINGUOIDUNG] ([MaLoaiND])
GO
ALTER TABLE [dbo].[QUANTRI] CHECK CONSTRAINT [FK_NGUOIDUNG_LOAINGUOIDUNG]
GO
ALTER TABLE [dbo].[THOIKHOABIEU]  WITH CHECK ADD  CONSTRAINT [FK_THOIKHOABIEU_DSLOP] FOREIGN KEY([MaLop])
REFERENCES [dbo].[DSLOP] ([MaLop])
GO
ALTER TABLE [dbo].[THOIKHOABIEU] CHECK CONSTRAINT [FK_THOIKHOABIEU_DSLOP]
GO
ALTER TABLE [dbo].[TOBOMON]  WITH CHECK ADD  CONSTRAINT [FK_TOBOMON_LOAINGUOIDUNG] FOREIGN KEY([MaLoaiND])
REFERENCES [dbo].[LOAINGUOIDUNG] ([MaLoaiND])
GO
ALTER TABLE [dbo].[TOBOMON] CHECK CONSTRAINT [FK_TOBOMON_LOAINGUOIDUNG]
GO
