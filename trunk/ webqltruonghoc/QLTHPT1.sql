if exists (select * from sysobjects where id = object_id(N'[sproc_BANGDIEM_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_BANGDIEM_GetCount]
GO

/* Procedure sproc_BANGDIEM_GetCount*/
CREATE PROCEDURE sproc_BANGDIEM_GetCount
AS
SELECT
	COUNT(*)
FROM
	[BANGDIEM]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_BANGDIEM_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_BANGDIEM_Get]
GO

/* Procedure sproc_BANGDIEM_Get*/
CREATE PROCEDURE sproc_BANGDIEM_Get
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
	--[DThi]

*
FROM
	[BANGDIEM]
GO






if exists (select * from sysobjects where id = object_id(N'[sproc_BANGDIEM_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_BANGDIEM_Add]
GO

/* Procedure sproc_BANGDIEM_Add*/
CREATE PROCEDURE sproc_BANGDIEM_Add
	@MaHocSinh varchar(10),
	@MaMonHoc varchar(10),
	@DM_1 real,
	@DM_2 real,
	@D15_1 real,
	@D15_2 real,
	@D15_3 real,
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
		@D1T_1,
		@D1T_2,
		@DThi
	)
GO
if exists (select * from sysobjects where id = object_id(N'[sproc_BANNER_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_BANNER_GetCount]
GO

/* Procedure sproc_BANNER_GetCount*/
CREATE PROCEDURE sproc_BANNER_GetCount
AS
SELECT
	COUNT(*)
FROM
	[BANNER]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_BANNER_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_BANNER_Get]
GO

/* Procedure sproc_BANNER_Get*/
CREATE PROCEDURE sproc_BANNER_Get
AS
SELECT
	--[TenBanner],
	--[Link],
	--[MoTa]

*
FROM
	[BANNER]
GO






if exists (select * from sysobjects where id = object_id(N'[sproc_BANNER_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_BANNER_Add]
GO

/* Procedure sproc_BANNER_Add*/
CREATE PROCEDURE sproc_BANNER_Add
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
if exists (select * from sysobjects where id = object_id(N'[sproc_CHUYENLOP_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_CHUYENLOP_GetCount]
GO

/* Procedure sproc_CHUYENLOP_GetCount*/
CREATE PROCEDURE sproc_CHUYENLOP_GetCount
AS
SELECT
	COUNT(*)
FROM
	[CHUYENLOP]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_CHUYENLOP_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_CHUYENLOP_Get]
GO

/* Procedure sproc_CHUYENLOP_Get*/
CREATE PROCEDURE sproc_CHUYENLOP_Get
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


if exists (select * from sysobjects where id = object_id(N'[sproc_CHUYENLOP_GetByTuLop]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_CHUYENLOP_GetByTuLop]
GO

/* Procedure sproc_CHUYENLOP_GetByTuLop*/
CREATE PROCEDURE sproc_CHUYENLOP_GetByTuLop
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



if exists (select * from sysobjects where id = object_id(N'[sproc_CHUYENLOP_GetPaged]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_CHUYENLOP_GetPaged]
GO

/* Procedure sproc_CHUYENLOP_GetPaged*/
CREATE PROCEDURE sproc_CHUYENLOP_GetPaged
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



if exists (select * from sysobjects where id = object_id(N'[sproc_CHUYENLOP_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_CHUYENLOP_Add]
GO

/* Procedure sproc_CHUYENLOP_Add*/
CREATE PROCEDURE sproc_CHUYENLOP_Add
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
if exists (select * from sysobjects where id = object_id(N'[sproc_CHUYENLOP_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_CHUYENLOP_Update]
GO

/* Procedure sproc_CHUYENLOP_Update*/
CREATE PROCEDURE sproc_CHUYENLOP_Update
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

if exists (select * from sysobjects where id = object_id(N'[sproc_CHUYENLOP_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_CHUYENLOP_Delete]
GO

/* Procedure sproc_CHUYENLOP_Delete*/
CREATE PROCEDURE sproc_CHUYENLOP_Delete
	@TuLop varchar(15)
AS
DELETE
FROM
	[CHUYENLOP]
WHERE
	[TuLop] = @TuLop
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_DSLOP_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_DSLOP_GetCount]
GO

/* Procedure sproc_DSLOP_GetCount*/
CREATE PROCEDURE sproc_DSLOP_GetCount
AS
SELECT
	COUNT(*)
FROM
	[DSLOP]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_DSLOP_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_DSLOP_Get]
GO

/* Procedure sproc_DSLOP_Get*/
CREATE PROCEDURE sproc_DSLOP_Get
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


if exists (select * from sysobjects where id = object_id(N'[sproc_DSLOP_GetByMaLop]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_DSLOP_GetByMaLop]
GO

/* Procedure sproc_DSLOP_GetByMaLop*/
CREATE PROCEDURE sproc_DSLOP_GetByMaLop
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



if exists (select * from sysobjects where id = object_id(N'[sproc_DSLOP_GetPaged]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_DSLOP_GetPaged]
GO

/* Procedure sproc_DSLOP_GetPaged*/
CREATE PROCEDURE sproc_DSLOP_GetPaged
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



if exists (select * from sysobjects where id = object_id(N'[sproc_DSLOP_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_DSLOP_Add]
GO

/* Procedure sproc_DSLOP_Add*/
CREATE PROCEDURE sproc_DSLOP_Add
	@MaLop int OUTPUT
	,@TenLop nvarchar(50)
	,@MaKhoi int
	,@SiSo int
	,@MaGiaoVien varchar(10)
	,@MoTaKhac nvarchar(500)

AS

	INSERT INTO [DSLOP]
	(
		[TenLop],
		[MaKhoi],
		[SiSo],
		[MaGiaoVien],
		[MoTaKhac]
	)
	VALUES
	(
		@TenLop,
		@MaKhoi,
		@SiSo,
		@MaGiaoVien,
		@MoTaKhac
	)
	SELECT
		@MaLop = @@Identity

GO
if exists (select * from sysobjects where id = object_id(N'[sproc_DSLOP_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_DSLOP_Update]
GO

/* Procedure sproc_DSLOP_Update*/
CREATE PROCEDURE sproc_DSLOP_Update
	@TenLop nvarchar(50),
	@MaKhoi int,
	@SiSo int,
	@MaGiaoVien varchar(10),
	@MoTaKhac nvarchar(500),
	@MaLop int

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

if exists (select * from sysobjects where id = object_id(N'[sproc_DSLOP_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_DSLOP_Delete]
GO

/* Procedure sproc_DSLOP_Delete*/
CREATE PROCEDURE sproc_DSLOP_Delete
	@MaLop int
AS
DELETE
FROM
	[DSLOP]
WHERE
	[MaLop] = @MaLop
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_GIAOVIEN_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_GIAOVIEN_GetCount]
GO

/* Procedure sproc_GIAOVIEN_GetCount*/
CREATE PROCEDURE sproc_GIAOVIEN_GetCount
AS
SELECT
	COUNT(*)
FROM
	[GIAOVIEN]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_GIAOVIEN_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_GIAOVIEN_Get]
GO

/* Procedure sproc_GIAOVIEN_Get*/
CREATE PROCEDURE sproc_GIAOVIEN_Get
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


if exists (select * from sysobjects where id = object_id(N'[sproc_GIAOVIEN_GetByMaGiaoVien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_GIAOVIEN_GetByMaGiaoVien]
GO

/* Procedure sproc_GIAOVIEN_GetByMaGiaoVien*/
CREATE PROCEDURE sproc_GIAOVIEN_GetByMaGiaoVien
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



if exists (select * from sysobjects where id = object_id(N'[sproc_GIAOVIEN_GetPaged]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_GIAOVIEN_GetPaged]
GO

/* Procedure sproc_GIAOVIEN_GetPaged*/
CREATE PROCEDURE sproc_GIAOVIEN_GetPaged
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



if exists (select * from sysobjects where id = object_id(N'[sproc_GIAOVIEN_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_GIAOVIEN_Add]
GO

/* Procedure sproc_GIAOVIEN_Add*/
CREATE PROCEDURE sproc_GIAOVIEN_Add
	@MaGiaoVien varchar(10) OUTPUT
	,@TenGiaoVien nvarchar(50)
	,@NgaySinh datetime
	,@GioiTinh nvarchar(10)
	,@DiaChi nvarchar(200)
	,@SoDienThoai nchar(20)
	,@ChuNhiem bit
	,@MaTo int

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
if exists (select * from sysobjects where id = object_id(N'[sproc_GIAOVIEN_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_GIAOVIEN_Update]
GO

/* Procedure sproc_GIAOVIEN_Update*/
CREATE PROCEDURE sproc_GIAOVIEN_Update
	@TenGiaoVien nvarchar(50),
	@NgaySinh datetime,
	@GioiTinh nvarchar(10),
	@DiaChi nvarchar(200),
	@SoDienThoai nchar(20),
	@ChuNhiem bit,
	@MaTo int,
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
	[MaTo] = @MaTo
WHERE
	[MaGiaoVien] = @MaGiaoVien
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_GIAOVIEN_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_GIAOVIEN_Delete]
GO

/* Procedure sproc_GIAOVIEN_Delete*/
CREATE PROCEDURE sproc_GIAOVIEN_Delete
	@MaGiaoVien varchar(10)
AS
DELETE
FROM
	[GIAOVIEN]
WHERE
	[MaGiaoVien] = @MaGiaoVien
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_HANHKIEM_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_HANHKIEM_GetCount]
GO

/* Procedure sproc_HANHKIEM_GetCount*/
CREATE PROCEDURE sproc_HANHKIEM_GetCount
AS
SELECT
	COUNT(*)
FROM
	[HANHKIEM]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_HANHKIEM_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_HANHKIEM_Get]
GO

/* Procedure sproc_HANHKIEM_Get*/
CREATE PROCEDURE sproc_HANHKIEM_Get
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






if exists (select * from sysobjects where id = object_id(N'[sproc_HANHKIEM_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_HANHKIEM_Add]
GO

/* Procedure sproc_HANHKIEM_Add*/
CREATE PROCEDURE sproc_HANHKIEM_Add
	@TenHocSinh varchar(10),
	@MaLop int,
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
if exists (select * from sysobjects where id = object_id(N'[sproc_HOCKY_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_HOCKY_GetCount]
GO

/* Procedure sproc_HOCKY_GetCount*/
CREATE PROCEDURE sproc_HOCKY_GetCount
AS
SELECT
	COUNT(*)
FROM
	[HOCKY]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_HOCKY_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_HOCKY_Get]
GO

/* Procedure sproc_HOCKY_Get*/
CREATE PROCEDURE sproc_HOCKY_Get
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


if exists (select * from sysobjects where id = object_id(N'[sproc_HOCKY_GetByMaHK]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_HOCKY_GetByMaHK]
GO

/* Procedure sproc_HOCKY_GetByMaHK*/
CREATE PROCEDURE sproc_HOCKY_GetByMaHK
@MaHK int
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



if exists (select * from sysobjects where id = object_id(N'[sproc_HOCKY_GetPaged]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_HOCKY_GetPaged]
GO

/* Procedure sproc_HOCKY_GetPaged*/
CREATE PROCEDURE sproc_HOCKY_GetPaged
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



if exists (select * from sysobjects where id = object_id(N'[sproc_HOCKY_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_HOCKY_Add]
GO

/* Procedure sproc_HOCKY_Add*/
CREATE PROCEDURE sproc_HOCKY_Add
	@MaHK int OUTPUT
	,@TenHK nvarchar(50)
	,@MaNamHoc int
	,@TuNgay datetime
	,@DenNgay datetime

AS

	INSERT INTO [HOCKY]
	(
		[TenHK],
		[MaNamHoc],
		[TuNgay],
		[DenNgay]
	)
	VALUES
	(
		@TenHK,
		@MaNamHoc,
		@TuNgay,
		@DenNgay
	)
	SELECT
		@MaHK = @@Identity

GO
if exists (select * from sysobjects where id = object_id(N'[sproc_HOCKY_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_HOCKY_Update]
GO

/* Procedure sproc_HOCKY_Update*/
CREATE PROCEDURE sproc_HOCKY_Update
	@TenHK nvarchar(50),
	@MaNamHoc int,
	@TuNgay datetime,
	@DenNgay datetime,
	@MaHK int

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

if exists (select * from sysobjects where id = object_id(N'[sproc_HOCKY_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_HOCKY_Delete]
GO

/* Procedure sproc_HOCKY_Delete*/
CREATE PROCEDURE sproc_HOCKY_Delete
	@MaHK int
AS
DELETE
FROM
	[HOCKY]
WHERE
	[MaHK] = @MaHK
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_HOCSINH_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_HOCSINH_GetCount]
GO

/* Procedure sproc_HOCSINH_GetCount*/
CREATE PROCEDURE sproc_HOCSINH_GetCount
AS
SELECT
	COUNT(*)
FROM
	[HOCSINH]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_HOCSINH_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_HOCSINH_Get]
GO

/* Procedure sproc_HOCSINH_Get*/
CREATE PROCEDURE sproc_HOCSINH_Get
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
	--[SoDienThoaiNha]

*
FROM
	[HOCSINH]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_HOCSINH_GetByMaHocSinh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_HOCSINH_GetByMaHocSinh]
GO

/* Procedure sproc_HOCSINH_GetByMaHocSinh*/
CREATE PROCEDURE sproc_HOCSINH_GetByMaHocSinh
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
	--[NgayVaoDoan],
	--[TrangThai],
	--[SoDienThoaiNha]

*
FROM
	[HOCSINH]
WHERE
	[MaHocSinh] = @MaHocSinh
GO



if exists (select * from sysobjects where id = object_id(N'[sproc_HOCSINH_GetPaged]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_HOCSINH_GetPaged]
GO

/* Procedure sproc_HOCSINH_GetPaged*/
CREATE PROCEDURE sproc_HOCSINH_GetPaged
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



if exists (select * from sysobjects where id = object_id(N'[sproc_HOCSINH_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_HOCSINH_Add]
GO

/* Procedure sproc_HOCSINH_Add*/
CREATE PROCEDURE sproc_HOCSINH_Add
	@MaHocSinh varchar(10) OUTPUT
	,@MaLop int
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
		[NgayVaoDoan],
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
		@NgayVaoDoan,
		@TrangThai,
		@SoDienThoaiNha
	)
GO
if exists (select * from sysobjects where id = object_id(N'[sproc_HOCSINH_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_HOCSINH_Update]
GO

/* Procedure sproc_HOCSINH_Update*/
CREATE PROCEDURE sproc_HOCSINH_Update
	@MaLop int,
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
	[NgayVaoDoan] = @NgayVaoDoan,
	[TrangThai] = @TrangThai,
	[SoDienThoaiNha] = @SoDienThoaiNha
WHERE
	[MaHocSinh] = @MaHocSinh
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_HOCSINH_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_HOCSINH_Delete]
GO

/* Procedure sproc_HOCSINH_Delete*/
CREATE PROCEDURE sproc_HOCSINH_Delete
	@MaHocSinh varchar(10)
AS
DELETE
FROM
	[HOCSINH]
WHERE
	[MaHocSinh] = @MaHocSinh
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_KHENTHUONG_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_KHENTHUONG_GetCount]
GO

/* Procedure sproc_KHENTHUONG_GetCount*/
CREATE PROCEDURE sproc_KHENTHUONG_GetCount
AS
SELECT
	COUNT(*)
FROM
	[KHENTHUONG]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_KHENTHUONG_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_KHENTHUONG_Get]
GO

/* Procedure sproc_KHENTHUONG_Get*/
CREATE PROCEDURE sproc_KHENTHUONG_Get
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






if exists (select * from sysobjects where id = object_id(N'[sproc_KHENTHUONG_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_KHENTHUONG_Add]
GO

/* Procedure sproc_KHENTHUONG_Add*/
CREATE PROCEDURE sproc_KHENTHUONG_Add
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
if exists (select * from sysobjects where id = object_id(N'[sproc_KHOILOP_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_KHOILOP_GetCount]
GO

/* Procedure sproc_KHOILOP_GetCount*/
CREATE PROCEDURE sproc_KHOILOP_GetCount
AS
SELECT
	COUNT(*)
FROM
	[KHOILOP]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_KHOILOP_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_KHOILOP_Get]
GO

/* Procedure sproc_KHOILOP_Get*/
CREATE PROCEDURE sproc_KHOILOP_Get
AS
SELECT
	--[MaKhoi],
	--[TenKhoi],
	--[MaHocKy]

*
FROM
	[KHOILOP]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_KHOILOP_GetByMaKhoi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_KHOILOP_GetByMaKhoi]
GO

/* Procedure sproc_KHOILOP_GetByMaKhoi*/
CREATE PROCEDURE sproc_KHOILOP_GetByMaKhoi
@MaKhoi int
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



if exists (select * from sysobjects where id = object_id(N'[sproc_KHOILOP_GetPaged]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_KHOILOP_GetPaged]
GO

/* Procedure sproc_KHOILOP_GetPaged*/
CREATE PROCEDURE sproc_KHOILOP_GetPaged
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



if exists (select * from sysobjects where id = object_id(N'[sproc_KHOILOP_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_KHOILOP_Add]
GO

/* Procedure sproc_KHOILOP_Add*/
CREATE PROCEDURE sproc_KHOILOP_Add
	@MaKhoi int OUTPUT
	,@TenKhoi nvarchar(50)
	,@MaHocKy int

AS

	INSERT INTO [KHOILOP]
	(
		[TenKhoi],
		[MaHocKy]
	)
	VALUES
	(
		@TenKhoi,
		@MaHocKy
	)
	SELECT
		@MaKhoi = @@Identity

GO
if exists (select * from sysobjects where id = object_id(N'[sproc_KHOILOP_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_KHOILOP_Update]
GO

/* Procedure sproc_KHOILOP_Update*/
CREATE PROCEDURE sproc_KHOILOP_Update
	@TenKhoi nvarchar(50),
	@MaHocKy int,
	@MaKhoi int

AS
UPDATE [KHOILOP]
SET
	[TenKhoi] = @TenKhoi,
	[MaHocKy] = @MaHocKy
WHERE
	[MaKhoi] = @MaKhoi
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_KHOILOP_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_KHOILOP_Delete]
GO

/* Procedure sproc_KHOILOP_Delete*/
CREATE PROCEDURE sproc_KHOILOP_Delete
	@MaKhoi int
AS
DELETE
FROM
	[KHOILOP]
WHERE
	[MaKhoi] = @MaKhoi
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_KYLUAT_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_KYLUAT_GetCount]
GO

/* Procedure sproc_KYLUAT_GetCount*/
CREATE PROCEDURE sproc_KYLUAT_GetCount
AS
SELECT
	COUNT(*)
FROM
	[KYLUAT]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_KYLUAT_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_KYLUAT_Get]
GO

/* Procedure sproc_KYLUAT_Get*/
CREATE PROCEDURE sproc_KYLUAT_Get
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






if exists (select * from sysobjects where id = object_id(N'[sproc_KYLUAT_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_KYLUAT_Add]
GO

/* Procedure sproc_KYLUAT_Add*/
CREATE PROCEDURE sproc_KYLUAT_Add
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
if exists (select * from sysobjects where id = object_id(N'[sproc_LOAINGUOIDUNG_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_LOAINGUOIDUNG_GetCount]
GO

/* Procedure sproc_LOAINGUOIDUNG_GetCount*/
CREATE PROCEDURE sproc_LOAINGUOIDUNG_GetCount
AS
SELECT
	COUNT(*)
FROM
	[LOAINGUOIDUNG]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_LOAINGUOIDUNG_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_LOAINGUOIDUNG_Get]
GO

/* Procedure sproc_LOAINGUOIDUNG_Get*/
CREATE PROCEDURE sproc_LOAINGUOIDUNG_Get
AS
SELECT
	--[MaLoaiND],
	--[TenLoaiND]

*
FROM
	[LOAINGUOIDUNG]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_LOAINGUOIDUNG_GetByMaLoaiND]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_LOAINGUOIDUNG_GetByMaLoaiND]
GO

/* Procedure sproc_LOAINGUOIDUNG_GetByMaLoaiND*/
CREATE PROCEDURE sproc_LOAINGUOIDUNG_GetByMaLoaiND
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



if exists (select * from sysobjects where id = object_id(N'[sproc_LOAINGUOIDUNG_GetPaged]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_LOAINGUOIDUNG_GetPaged]
GO

/* Procedure sproc_LOAINGUOIDUNG_GetPaged*/
CREATE PROCEDURE sproc_LOAINGUOIDUNG_GetPaged
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



if exists (select * from sysobjects where id = object_id(N'[sproc_LOAINGUOIDUNG_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_LOAINGUOIDUNG_Add]
GO

/* Procedure sproc_LOAINGUOIDUNG_Add*/
CREATE PROCEDURE sproc_LOAINGUOIDUNG_Add
	@MaLoaiND varchar(10) OUTPUT
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
if exists (select * from sysobjects where id = object_id(N'[sproc_LOAINGUOIDUNG_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_LOAINGUOIDUNG_Update]
GO

/* Procedure sproc_LOAINGUOIDUNG_Update*/
CREATE PROCEDURE sproc_LOAINGUOIDUNG_Update
	@TenLoaiND nvarchar(30),
	@MaLoaiND varchar(10)

AS
UPDATE [LOAINGUOIDUNG]
SET
	[TenLoaiND] = @TenLoaiND
WHERE
	[MaLoaiND] = @MaLoaiND
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_LOAINGUOIDUNG_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_LOAINGUOIDUNG_Delete]
GO

/* Procedure sproc_LOAINGUOIDUNG_Delete*/
CREATE PROCEDURE sproc_LOAINGUOIDUNG_Delete
	@MaLoaiND varchar(10)
AS
DELETE
FROM
	[LOAINGUOIDUNG]
WHERE
	[MaLoaiND] = @MaLoaiND
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_MONHOC_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_MONHOC_GetCount]
GO

/* Procedure sproc_MONHOC_GetCount*/
CREATE PROCEDURE sproc_MONHOC_GetCount
AS
SELECT
	COUNT(*)
FROM
	[MONHOC]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_MONHOC_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_MONHOC_Get]
GO

/* Procedure sproc_MONHOC_Get*/
CREATE PROCEDURE sproc_MONHOC_Get
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


if exists (select * from sysobjects where id = object_id(N'[sproc_MONHOC_GetByMaMonHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_MONHOC_GetByMaMonHoc]
GO

/* Procedure sproc_MONHOC_GetByMaMonHoc*/
CREATE PROCEDURE sproc_MONHOC_GetByMaMonHoc
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



if exists (select * from sysobjects where id = object_id(N'[sproc_MONHOC_GetPaged]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_MONHOC_GetPaged]
GO

/* Procedure sproc_MONHOC_GetPaged*/
CREATE PROCEDURE sproc_MONHOC_GetPaged
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



if exists (select * from sysobjects where id = object_id(N'[sproc_MONHOC_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_MONHOC_Add]
GO

/* Procedure sproc_MONHOC_Add*/
CREATE PROCEDURE sproc_MONHOC_Add
	@MaMonHoc varchar(10) OUTPUT
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
if exists (select * from sysobjects where id = object_id(N'[sproc_MONHOC_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_MONHOC_Update]
GO

/* Procedure sproc_MONHOC_Update*/
CREATE PROCEDURE sproc_MONHOC_Update
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

if exists (select * from sysobjects where id = object_id(N'[sproc_MONHOC_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_MONHOC_Delete]
GO

/* Procedure sproc_MONHOC_Delete*/
CREATE PROCEDURE sproc_MONHOC_Delete
	@MaMonHoc varchar(10)
AS
DELETE
FROM
	[MONHOC]
WHERE
	[MaMonHoc] = @MaMonHoc
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_NAMHOC_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_NAMHOC_GetCount]
GO

/* Procedure sproc_NAMHOC_GetCount*/
CREATE PROCEDURE sproc_NAMHOC_GetCount
AS
SELECT
	COUNT(*)
FROM
	[NAMHOC]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_NAMHOC_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_NAMHOC_Get]
GO

/* Procedure sproc_NAMHOC_Get*/
CREATE PROCEDURE sproc_NAMHOC_Get
AS
SELECT
	--[MaNamHoc],
	--[TenNamHoc]

*
FROM
	[NAMHOC]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_NAMHOC_GetByMaNamHoc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_NAMHOC_GetByMaNamHoc]
GO

/* Procedure sproc_NAMHOC_GetByMaNamHoc*/
CREATE PROCEDURE sproc_NAMHOC_GetByMaNamHoc
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



if exists (select * from sysobjects where id = object_id(N'[sproc_NAMHOC_GetPaged]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_NAMHOC_GetPaged]
GO

/* Procedure sproc_NAMHOC_GetPaged*/
CREATE PROCEDURE sproc_NAMHOC_GetPaged
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



if exists (select * from sysobjects where id = object_id(N'[sproc_NAMHOC_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_NAMHOC_Add]
GO

/* Procedure sproc_NAMHOC_Add*/
CREATE PROCEDURE sproc_NAMHOC_Add
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
if exists (select * from sysobjects where id = object_id(N'[sproc_NAMHOC_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_NAMHOC_Update]
GO

/* Procedure sproc_NAMHOC_Update*/
CREATE PROCEDURE sproc_NAMHOC_Update
	@TenNamHoc nvarchar(30),
	@MaNamHoc int

AS
UPDATE [NAMHOC]
SET
	[TenNamHoc] = @TenNamHoc
WHERE
	[MaNamHoc] = @MaNamHoc
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_NAMHOC_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_NAMHOC_Delete]
GO

/* Procedure sproc_NAMHOC_Delete*/
CREATE PROCEDURE sproc_NAMHOC_Delete
	@MaNamHoc int
AS
DELETE
FROM
	[NAMHOC]
WHERE
	[MaNamHoc] = @MaNamHoc
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_NHATRUONG_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_NHATRUONG_GetCount]
GO

/* Procedure sproc_NHATRUONG_GetCount*/
CREATE PROCEDURE sproc_NHATRUONG_GetCount
AS
SELECT
	COUNT(*)
FROM
	[NHATRUONG]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_NHATRUONG_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_NHATRUONG_Get]
GO

/* Procedure sproc_NHATRUONG_Get*/
CREATE PROCEDURE sproc_NHATRUONG_Get
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






if exists (select * from sysobjects where id = object_id(N'[sproc_NHATRUONG_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_NHATRUONG_Add]
GO

/* Procedure sproc_NHATRUONG_Add*/
CREATE PROCEDURE sproc_NHATRUONG_Add
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
if exists (select * from sysobjects where id = object_id(N'[sproc_QUANTRI_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_QUANTRI_GetCount]
GO

/* Procedure sproc_QUANTRI_GetCount*/
CREATE PROCEDURE sproc_QUANTRI_GetCount
AS
SELECT
	COUNT(*)
FROM
	[QUANTRI]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_QUANTRI_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_QUANTRI_Get]
GO

/* Procedure sproc_QUANTRI_Get*/
CREATE PROCEDURE sproc_QUANTRI_Get
AS
SELECT
	--[MaND],
	--[MaLoaiND],
	--[TenDNhap],
	--[TenNguoiDung],
	--[MatKhau],
	--[TrangThai]

*
FROM
	[QUANTRI]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_QUANTRI_GetByMaND]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_QUANTRI_GetByMaND]
GO

/* Procedure sproc_QUANTRI_GetByMaND*/
CREATE PROCEDURE sproc_QUANTRI_GetByMaND
@MaND varchar(10)
AS
SELECT
	--[MaND],
	--[MaLoaiND],
	--[TenDNhap],
	--[TenNguoiDung],
	--[MatKhau],
	--[TrangThai]

*
FROM
	[QUANTRI]
WHERE
	[MaND] = @MaND
GO



if exists (select * from sysobjects where id = object_id(N'[sproc_QUANTRI_GetPaged]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_QUANTRI_GetPaged]
GO

/* Procedure sproc_QUANTRI_GetPaged*/
CREATE PROCEDURE sproc_QUANTRI_GetPaged
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



if exists (select * from sysobjects where id = object_id(N'[sproc_QUANTRI_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_QUANTRI_Add]
GO

/* Procedure sproc_QUANTRI_Add*/
CREATE PROCEDURE sproc_QUANTRI_Add
	@MaND varchar(10) OUTPUT
	,@MaLoaiND varchar(10)
	,@TenDNhap varchar(30)
	,@TenNguoiDung nvarchar(50)
	,@MatKhau varchar(35)
	,@TrangThai bit

AS

	INSERT INTO [QUANTRI]
	(
		[MaND],
		[MaLoaiND],
		[TenDNhap],
		[TenNguoiDung],
		[MatKhau],
		[TrangThai]
	)
	VALUES
	(
		@MaND,
		@MaLoaiND,
		@TenDNhap,
		@TenNguoiDung,
		@MatKhau,
		@TrangThai
	)
GO
if exists (select * from sysobjects where id = object_id(N'[sproc_QUANTRI_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_QUANTRI_Update]
GO

/* Procedure sproc_QUANTRI_Update*/
CREATE PROCEDURE sproc_QUANTRI_Update
	@MaLoaiND varchar(10),
	@TenDNhap varchar(30),
	@TenNguoiDung nvarchar(50),
	@MatKhau varchar(35),
	@TrangThai bit,
	@MaND varchar(10)

AS
UPDATE [QUANTRI]
SET
	[MaLoaiND] = @MaLoaiND,
	[TenDNhap] = @TenDNhap,
	[TenNguoiDung] = @TenNguoiDung,
	[MatKhau] = @MatKhau,
	[TrangThai] = @TrangThai
WHERE
	[MaND] = @MaND
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_QUANTRI_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_QUANTRI_Delete]
GO

/* Procedure sproc_QUANTRI_Delete*/
CREATE PROCEDURE sproc_QUANTRI_Delete
	@MaND varchar(10)
AS
DELETE
FROM
	[QUANTRI]
WHERE
	[MaND] = @MaND
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_THOIKHOABIEU_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_THOIKHOABIEU_GetCount]
GO

/* Procedure sproc_THOIKHOABIEU_GetCount*/
CREATE PROCEDURE sproc_THOIKHOABIEU_GetCount
AS
SELECT
	COUNT(*)
FROM
	[THOIKHOABIEU]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_THOIKHOABIEU_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_THOIKHOABIEU_Get]
GO

/* Procedure sproc_THOIKHOABIEU_Get*/
CREATE PROCEDURE sproc_THOIKHOABIEU_Get
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
	--[DenNgay]

*
FROM
	[THOIKHOABIEU]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_THOIKHOABIEU_GetByMaTKB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_THOIKHOABIEU_GetByMaTKB]
GO

/* Procedure sproc_THOIKHOABIEU_GetByMaTKB*/
CREATE PROCEDURE sproc_THOIKHOABIEU_GetByMaTKB
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
	--[DenNgay]

*
FROM
	[THOIKHOABIEU]
WHERE
	[MaTKB] = @MaTKB
GO



if exists (select * from sysobjects where id = object_id(N'[sproc_THOIKHOABIEU_GetPaged]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_THOIKHOABIEU_GetPaged]
GO

/* Procedure sproc_THOIKHOABIEU_GetPaged*/
CREATE PROCEDURE sproc_THOIKHOABIEU_GetPaged
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



if exists (select * from sysobjects where id = object_id(N'[sproc_THOIKHOABIEU_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_THOIKHOABIEU_Add]
GO

/* Procedure sproc_THOIKHOABIEU_Add*/
CREATE PROCEDURE sproc_THOIKHOABIEU_Add
	@MaTKB varchar(15) OUTPUT
	,@MaLop int
	,@Tiet1 nvarchar(30)
	,@Tiet2 nvarchar(30)
	,@Tiet3 nvarchar(30)
	,@Tiet4 nvarchar(30)
	,@Tiet5 nvarchar(30)
	,@TuNgay datetime
	,@DenNgay datetime

AS

	INSERT INTO [THOIKHOABIEU]
	(
		[MaTKB],
		[MaLop],
		[Tiet1],
		[Tiet2],
		[Tiet3],
		[Tiet4],
		[Tiet5],
		[TuNgay],
		[DenNgay]
	)
	VALUES
	(
		@MaTKB,
		@MaLop,
		@Tiet1,
		@Tiet2,
		@Tiet3,
		@Tiet4,
		@Tiet5,
		@TuNgay,
		@DenNgay
	)
GO
if exists (select * from sysobjects where id = object_id(N'[sproc_THOIKHOABIEU_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_THOIKHOABIEU_Update]
GO

/* Procedure sproc_THOIKHOABIEU_Update*/
CREATE PROCEDURE sproc_THOIKHOABIEU_Update
	@MaLop int,
	@Tiet1 nvarchar(30),
	@Tiet2 nvarchar(30),
	@Tiet3 nvarchar(30),
	@Tiet4 nvarchar(30),
	@Tiet5 nvarchar(30),
	@TuNgay datetime,
	@DenNgay datetime,
	@MaTKB varchar(15)

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
	[DenNgay] = @DenNgay
WHERE
	[MaTKB] = @MaTKB
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_THOIKHOABIEU_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_THOIKHOABIEU_Delete]
GO

/* Procedure sproc_THOIKHOABIEU_Delete*/
CREATE PROCEDURE sproc_THOIKHOABIEU_Delete
	@MaTKB varchar(15)
AS
DELETE
FROM
	[THOIKHOABIEU]
WHERE
	[MaTKB] = @MaTKB
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_TINTUC_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_TINTUC_GetCount]
GO

/* Procedure sproc_TINTUC_GetCount*/
CREATE PROCEDURE sproc_TINTUC_GetCount
AS
SELECT
	COUNT(*)
FROM
	[TINTUC]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_TINTUC_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_TINTUC_Get]
GO

/* Procedure sproc_TINTUC_Get*/
CREATE PROCEDURE sproc_TINTUC_Get
AS
SELECT
	--[TieuDeTin],
	--[NoiDungTin],
	--[MotaNgan],
	--[NgayDangTin]

*
FROM
	[TINTUC]
GO






if exists (select * from sysobjects where id = object_id(N'[sproc_TINTUC_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_TINTUC_Add]
GO

/* Procedure sproc_TINTUC_Add*/
CREATE PROCEDURE sproc_TINTUC_Add
	@TieuDeTin nvarchar(500),
	@NoiDungTin ntext,
	@MotaNgan ntext,
	@NgayDangTin datetime
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
GO
if exists (select * from sysobjects where id = object_id(N'[sproc_TOBOMON_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_TOBOMON_GetCount]
GO

/* Procedure sproc_TOBOMON_GetCount*/
CREATE PROCEDURE sproc_TOBOMON_GetCount
AS
SELECT
	COUNT(*)
FROM
	[TOBOMON]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_TOBOMON_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_TOBOMON_Get]
GO

/* Procedure sproc_TOBOMON_Get*/
CREATE PROCEDURE sproc_TOBOMON_Get
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


if exists (select * from sysobjects where id = object_id(N'[sproc_TOBOMON_GetByMaTo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_TOBOMON_GetByMaTo]
GO

/* Procedure sproc_TOBOMON_GetByMaTo*/
CREATE PROCEDURE sproc_TOBOMON_GetByMaTo
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



if exists (select * from sysobjects where id = object_id(N'[sproc_TOBOMON_GetPaged]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_TOBOMON_GetPaged]
GO

/* Procedure sproc_TOBOMON_GetPaged*/
CREATE PROCEDURE sproc_TOBOMON_GetPaged
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



if exists (select * from sysobjects where id = object_id(N'[sproc_TOBOMON_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_TOBOMON_Add]
GO

/* Procedure sproc_TOBOMON_Add*/
CREATE PROCEDURE sproc_TOBOMON_Add
	@MaTo int OUTPUT
	,@MaLoaiND varchar(10)
	,@TenToBoMon nvarchar(100)
	,@MoTa nvarchar(500)

AS

	INSERT INTO [TOBOMON]
	(
		[MaLoaiND],
		[TenToBoMon],
		[MoTa]
	)
	VALUES
	(
		@MaLoaiND,
		@TenToBoMon,
		@MoTa
	)
	SELECT
		@MaTo = @@Identity

GO
if exists (select * from sysobjects where id = object_id(N'[sproc_TOBOMON_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_TOBOMON_Update]
GO

/* Procedure sproc_TOBOMON_Update*/
CREATE PROCEDURE sproc_TOBOMON_Update
	@MaLoaiND varchar(10),
	@TenToBoMon nvarchar(100),
	@MoTa nvarchar(500),
	@MaTo int

AS
UPDATE [TOBOMON]
SET
	[MaLoaiND] = @MaLoaiND,
	[TenToBoMon] = @TenToBoMon,
	[MoTa] = @MoTa
WHERE
	[MaTo] = @MaTo
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_TOBOMON_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_TOBOMON_Delete]
GO

/* Procedure sproc_TOBOMON_Delete*/
CREATE PROCEDURE sproc_TOBOMON_Delete
	@MaTo int
AS
DELETE
FROM
	[TOBOMON]
WHERE
	[MaTo] = @MaTo
GO

if exists (select * from sysobjects where id = object_id(N'[sproc_trace_xe_action_map_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_trace_xe_action_map_GetCount]
GO

/* Procedure sproc_trace_xe_action_map_GetCount*/
CREATE PROCEDURE sproc_trace_xe_action_map_GetCount
AS
SELECT
	COUNT(*)
FROM
	[trace_xe_action_map]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_trace_xe_action_map_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_trace_xe_action_map_Get]
GO

/* Procedure sproc_trace_xe_action_map_Get*/
CREATE PROCEDURE sproc_trace_xe_action_map_Get
AS
SELECT
	--[trace_column_id],
	--[package_name],
	--[xe_action_name]

*
FROM
	[trace_xe_action_map]
GO






if exists (select * from sysobjects where id = object_id(N'[sproc_trace_xe_action_map_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_trace_xe_action_map_Add]
GO

/* Procedure sproc_trace_xe_action_map_Add*/
CREATE PROCEDURE sproc_trace_xe_action_map_Add
	@trace_column_id smallint,
	@package_name nvarchar(60),
	@xe_action_name nvarchar(60)
AS

	INSERT INTO [trace_xe_action_map]
	(
		[trace_column_id],
		[package_name],
		[xe_action_name]
	)
	VALUES
	(
		@trace_column_id,
		@package_name,
		@xe_action_name
	)
GO
if exists (select * from sysobjects where id = object_id(N'[sproc_trace_xe_event_map_GetCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_trace_xe_event_map_GetCount]
GO

/* Procedure sproc_trace_xe_event_map_GetCount*/
CREATE PROCEDURE sproc_trace_xe_event_map_GetCount
AS
SELECT
	COUNT(*)
FROM
	[trace_xe_event_map]
GO


if exists (select * from sysobjects where id = object_id(N'[sproc_trace_xe_event_map_Get]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_trace_xe_event_map_Get]
GO

/* Procedure sproc_trace_xe_event_map_Get*/
CREATE PROCEDURE sproc_trace_xe_event_map_Get
AS
SELECT
	--[trace_event_id],
	--[package_name],
	--[xe_event_name]

*
FROM
	[trace_xe_event_map]
GO






if exists (select * from sysobjects where id = object_id(N'[sproc_trace_xe_event_map_Add]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [sproc_trace_xe_event_map_Add]
GO

/* Procedure sproc_trace_xe_event_map_Add*/
CREATE PROCEDURE sproc_trace_xe_event_map_Add
	@trace_event_id smallint,
	@package_name nvarchar(60),
	@xe_event_name nvarchar(60)
AS

	INSERT INTO [trace_xe_event_map]
	(
		[trace_event_id],
		[package_name],
		[xe_event_name]
	)
	VALUES
	(
		@trace_event_id,
		@package_name,
		@xe_event_name
	)
GO
