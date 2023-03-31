----câu 1------
create function ThongTinSanPhamTheoHangSX(@tenhangsx nvarchar(50))
returns @sanpham table(
masp nvarchar(10),
mahangsx nvarchar(10),
tensp nvarchar(50),
soluong int,
mausac nvarchar(20),
giaban float,
donvitinh nvarchar(20),
mota nvarchar(max)
)
as
begin
insert into @sanpham
select masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota
from Sanpham
where mahangsx = (select mahangsx from Hangsx where tenhang = @tenhangsx)
return
end
---câu 2---
create function DanhSachSanPhamHangSXNhap(@ngaybatdau datetime, @ngayketthuc datetime)
returns @sanphamhangsx table(
tensp nvarchar(50),
tenhangsx nvarchar(50),
soluongN int,
dongiaN float
)
as
begin
insert into @sanphamhangsx
select sp.tensp, hsx.tenhang, np.soluongN, np.dongiaN
from Sanpham sp
inner join Hangsx hsx on sp.mahangsx = hsx.mahangsx
inner join Nhap np on sp.masp = np.masp
where np.ngaynhap between @ngaybatdau and @ngayketthuc
return
end

---câu 3 ---
CREATE FUNCTION sp_by_hangsx_soluong(@tenhangsx NVARCHAR(50), @luachon INT)
RETURNS @sanpham TABLE (
    masp INT,
    mahangsx INT,
    tensp NVARCHAR(50),
    soluong INT,
    mausac NVARCHAR(20),
    giaban FLOAT,
    donvitinh NVARCHAR(10),
    mota NVARCHAR(MAX)
)
AS
BEGIN
    IF @luachon = 0
    BEGIN
        INSERT INTO @sanpham
        SELECT masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota
        FROM Sanpham
        WHERE mahangsx = (SELECT mahangsx FROM Hangsx WHERE tenhang = @tenhangsx) AND soluong = 0
    END
    ELSE
    BEGIN
        INSERT INTO @sanpham
        SELECT masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota
        FROM Sanpham
        WHERE mahangsx = (SELECT mahangsx FROM Hangsx WHERE tenhang = @tenhangsx) AND soluong > 0
    END
    RETURN
END
----câu 4------
CREATE FUNCTION nv_by_phong(@tenphong NVARCHAR(50))
RETURNS @nhanvien TABLE (
    manv INT,
    tennv NVARCHAR(50),
    gioitinh NVARCHAR(10),
    diachi NVARCHAR(100),
    sodt NVARCHAR(20),
    email NVARCHAR(50),
    phong NVARCHAR(50)
)
AS
BEGIN
    INSERT INTO @nhanvien
    SELECT manv, tennv, gioitinh, diachi, sodt, email, phong
    FROM Nhanvien
    WHERE phong = @tenphong
    RETURN
END

--- câu 5---
CREATE FUNCTION DanhSachHangSXTheoDiaChi(@diaChi NVARCHAR(50))
RETURNS @hangSX TABLE (
    mahangsx INT,
    tenhang NVARCHAR(50),
    diachi NVARCHAR(50),
    sodt NVARCHAR(20),
    email NVARCHAR(50)
)
AS
BEGIN
    INSERT INTO @hangSX
    SELECT mahangsx, tenhang, diachi, sodt, email
    FROM Hangsx
    WHERE diachi LIKE '%' + @diaChi + '%'

    RETURN
END
---câu 6---
CREATE FUNCTION DanhSachSanPhamVaHangSXDaXuat(@namX INT, @namY INT)
RETURNS @sanPhamHangSX TABLE (
    masp INT,
    tensp NVARCHAR(50),
    tenhang NVARCHAR(50),
    ngayxuat DATE,
    soluongX INT
)
AS
BEGIN
    INSERT INTO @sanPhamHangSX
    SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.ngayxuat, Xuat.soluongX
    FROM Sanpham
    JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
    JOIN Xuat ON Sanpham.masp = Xuat.masp
	----câu 1------
create function ThongTinSanPhamTheoHangSX(@tenhangsx nvarchar(50))
returns @sanpham table(
masp nvarchar(10),
mahangsx nvarchar(10),
tensp nvarchar(50),
soluong int,
mausac nvarchar(20),
giaban float,
donvitinh nvarchar(20),
mota nvarchar(max)
)
as
begin
insert into @sanpham
select masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota
from Sanpham
where mahangsx = (select mahangsx from Hangsx where tenhang = @tenhangsx)
return
end
---câu 2---
create function DanhSachSanPhamHangSXNhap(@ngaybatdau datetime, @ngayketthuc datetime)
returns @sanphamhangsx table(
tensp nvarchar(50),
tenhangsx nvarchar(50),
soluongN int,
dongiaN float
)
as
begin
insert into @sanphamhangsx
select sp.tensp, hsx.tenhang, np.soluongN, np.dongiaN
from Sanpham sp
inner join Hangsx hsx on sp.mahangsx = hsx.mahangsx
inner join Nhap np on sp.masp = np.masp
where np.ngaynhap between @ngaybatdau and @ngayketthuc
return
end

---câu 3 ---
CREATE FUNCTION sp_by_hangsx_soluong(@tenhangsx NVARCHAR(50), @luachon INT)
RETURNS @sanpham TABLE (
    masp INT,
    mahangsx INT,
    tensp NVARCHAR(50),
    soluong INT,
    mausac NVARCHAR(20),
    giaban FLOAT,
    donvitinh NVARCHAR(10),
    mota NVARCHAR(MAX)
)
AS
BEGIN
    IF @luachon = 0
    BEGIN
        INSERT INTO @sanpham
        SELECT masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota
        FROM Sanpham
        WHERE mahangsx = (SELECT mahangsx FROM Hangsx WHERE tenhang = @tenhangsx) AND soluong = 0
    END
    ELSE
    BEGIN
        INSERT INTO @sanpham
        SELECT masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota
        FROM Sanpham
        WHERE mahangsx = (SELECT mahangsx FROM Hangsx WHERE tenhang = @tenhangsx) AND soluong > 0
    END
    RETURN
END
----câu 4------
CREATE FUNCTION nv_by_phong(@tenphong NVARCHAR(50))
RETURNS @nhanvien TABLE (
    manv INT,
    tennv NVARCHAR(50),
    gioitinh NVARCHAR(10),
    diachi NVARCHAR(100),
    sodt NVARCHAR(20),
    email NVARCHAR(50),
    phong NVARCHAR(50)
)
AS
BEGIN
    INSERT INTO @nhanvien
    SELECT manv, tennv, gioitinh, diachi, sodt, email, phong
    FROM Nhanvien
    WHERE phong = @tenphong
    RETURN
END

--- câu 5---
CREATE FUNCTION DanhSachHangSXTheoDiaChi(@diaChi NVARCHAR(50))
RETURNS @hangSX TABLE (
    mahangsx INT,
    tenhang NVARCHAR(50),
    diachi NVARCHAR(50),
    sodt NVARCHAR(20),
    email NVARCHAR(50)
)
AS
BEGIN
    INSERT INTO @hangSX
    SELECT mahangsx, tenhang, diachi, sodt, email
    FROM Hangsx
    WHERE diachi LIKE '%' + @diaChi + '%'

    RETURN
END
---câu 6---
CREATE FUNCTION DanhSachSanPhamVaHangSXDaXuat(@namX INT, @namY INT)
RETURNS @sanPhamHangSX TABLE (
    masp INT,
    tensp NVARCHAR(50),
    tenhang NVARCHAR(50),
    ngayxuat DATE,
    soluongX INT
)
AS
BEGIN
    INSERT INTO @sanPhamHangSX
    SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.ngayxuat, Xuat.soluongX
    FROM Sanpham
    JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
    JOIN Xuat ON Sanpham.masp = Xuat.masp