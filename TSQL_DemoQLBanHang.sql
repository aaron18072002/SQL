USE [DemoQuanLyBanHang];

DECLARE @HoTen NVARCHAR(30);
SELECT @HoTen = N'Lê Ni La';
PRINT @HoTen;

-- Lấy giá lớn nhất giá TB của HangHoa
DECLARE @GiaLonNhat FLOAT;
DECLARE @GiaTB FLOAT;

SELECT @GiaLonNhat = MAX(DonGia),
	   @GiaTB = AVG(DonGia)
FROM HangHoa;

PRINT CONCAT(N'Giá lớn nhất: ', CONVERT(VARCHAR(30),@GiaLonNhat,101) + N', Giá trung bình: ', 
								CONVERT(VARCHAR(30),@GiaTB,101));

-- Khai báo biến kiểu ngày tháng
DECLARE @date DATE;
SET @date = '2025-01-01';
DECLARE @current_date DATE = GETDATE();
DECLARE @due_date DATE = DATEADD(DAY,7,@date);

SELECT @date as 'Date',
	   @current_date AS 'CurrentDate',
	   @due_date AS 'DueDate'

-- Khai báo biến kiểu dạng TABLE (tạm)
DECLARE @BangTam TABLE (
	MaKH NVARCHAR(50),
	HoTen NVARCHAR(200)
);

-- Lấy ds khách hàng đã từng mua hàng vào bảng tạm
INSERT INTO @BangTam
SELECT KH.MaKH, KH.HoTen
FROM KhachHang AS KH
WHERE KH.MaKH IN (
	SELECT DISTINCT HD.MaKH
	FROM HoaDon AS HD
);

SELECT * FROM @BangTam;

-- DEMO tìm max
DECLARE @a FLOAT;
DECLARE @b FLOAT;
SET @a = 11;
SET @b = 22;
IF @a > @b 
BEGIN
	PRINT CONCAT(CONVERT(VARCHAR(10),@a,101),' > ',CONVERT(VARCHAR(10),@b,101))
END
ELSE
BEGIN
	PRINT CONCAT(CONVERT(VARCHAR(10),@a,101),' > ',CONVERT(VARCHAR(10),@b,101))
END;

-- DEMO CASE WHEN THEN END
SELECT MaKH, HoTen, 
	   CASE GioiTinh	
			WHEN 1 THEN N'Nam'
			WHEN 0 THEN N'Nữ'
	   END AS 'GioiTinh'
FROM KhachHang;

-- Ví dụ giảm 5% giá bán nếu KH là Nam, 2% nếu KH là Nữ
SELECT KH.MaKH, HD.MaHD, KH.GioiTinh,
	   CASE KH.GioiTinh
			WHEN 1 THEN N'Nam'
			WHEN 0 THEN N'Nữ'
	   END AS 'GioiTinh',
	   CASE 
			WHEN KH.GioiTinh = 1 THEN 0.05
			WHEN KH.GioiTinh = 0 THEN 0.02
			ELSE 0
	   END AS 'GiamGia'
FROM KhachHang AS KH
INNER JOIN HoaDon AS HD
ON KH.MaKH = HD.MaKH;

-- DEMO vòng lặp từ 1 đến N, tính tổng số lẻ
DECLARE @N INT;
DECLARE @Tong INT;
DECLARE @I INT;

SET @Tong = 0;
SET @I = 1;
SET @N = 11;

WHILE (@I < @N)
BEGIN
	IF (@I % 2 = 0)
		BEGIN
			SET @I = @I + 1;
			CONTINUE;
		END
	ELSE
		BEGIN
			SET @Tong = @Tong + @I;
			SET @I = @I + 1;
		END
END;

PRINT CONCAT(N'Tổng từ 1', N' đến ',@N,' là: ',@Tong);

-- @@var: Biến hệ thống
SELECT @@VERSION, @@ERROR, @@CONNECTIONS;

-- Tạo CREATE PROCEDURE lấy hàng hóa theo loại, ncc
DROP PROCEDURE IF EXISTS spLayDanhSachHangHoa;

GO
CREATE PROCEDURE spLayDanhSachHangHoa
	(@MaLoai INT, @MaNCC NVARCHAR(50))
AS
BEGIN
	SELECT *
	FROM HangHoa AS HH
	WHERE HH.MaLoai = @MaLoai AND
		  HH.MaNCC = @MaNCC
END;
GO

-- DEMO gọi SP
EXEC spLayDanhSachHangHoa @MaLoai = 1001, @MaNCC = 'SS';

-- Câu 1: Viết sp thêm loại
GO
CREATE PROCEDURE spThemLoai
	(@MaLoai INT OUTPUT,
	 @TenLoai NVARCHAR(50),
	 @Mota NVARCHAR(MAX),
	 @Hinh NVARCHAR(50))
AS
BEGIN
	INSERT INTO Loai(TenLoai,MoTa,Hinh)
	VALUES (@TenLoai,@Mota,@Hinh);

	SET @MaLoai = @@IDENTITY;
END;
GO

DECLARE @MaLoai INT;
EXEC spThemLoai @MaLoai OUT, 
				N'Văn Phòng Phẩm', N'N/A', N'Ko có hình';
PRINT @MaLoai;

SELECT * FROM Loai;

-- Caau2 : sửa lại
GO
CREATE PROCEDURE spSuaLoai
	(@MaLoai INT,
	 @TenLoai NVARCHAR(50),
	 @MoTa VARCHAR(max),
	 @Hinh NVARCHAR(50))
AS
BEGIN
	UPDATE Loai 
	SET TenLoai = @TenLoai,
		MoTa = @MoTa,
		Hinh = @Hinh
	WHERE MaLoai = @MaLoai
END;
GO

-- Câu 3: Xóa loại
GO
CREATE PROCEDURE spXoaLoai
	(@MaLoai INT)
AS
BEGIN
	DELETE FROM Loai
	WHERE MaLoai = @MaLoai;
END;
GO

-- Câu 4: Lấy tất cả loại
GO
CREATE PROCEDURE spLayLoai
AS
BEGIN
	SELECT * FROM Loai;
END
GO

EXEC spLayLoai;

-- Câu 6: Lấy danh sách hàng hóa thuộc loại cụ thể
GO
CREATE PROCEDURE spLayHangHoaTheoLoai
	(@MaLoai INT)
AS
BEGIN
	SELECT HH.*,L.TenLoai,NCC.TenCongTy
	FROM HangHoa AS HH
	LEFT JOIN Loai AS L
	ON HH.MaLoai = L.MaLoai
	LEFT JOIN NhaCungCap AS NCC
	ON NCC.MaNCC = HH.MaNCC
	WHERE HH.MaLoai = @MaLoai;
END
GO

EXEC spLayHangHoaTheoLoai @MaLoai = 1002;

-- Câu 7: Liệt kê DS KH(HoTen,DienThoai) có đặt hàng với tổng số tiền trên X
GO
CREATE PROCEDURE spLietKeKhachHang
	(@TongTien FLOAT)
AS 
BEGIN
	SELECT KH.HoTen, KH.DienThoai,
		   SUM(CTHD.DonGia * CTHD.SoLuong) AS 'TongTien'
	FROM KhachHang AS KH
	LEFT JOIN HoaDon AS HD
	ON KH.MaKH = HD.MaKH
	LEFT JOIN ChiTietHD AS CTHD
	ON CTHD.MaHD = HD.MaHD
	GROUP BY KH.HoTen, KH.DienThoai
	HAVING SUM(CTHD.DonGia * CTHD.SoLuong) > @TongTien;
END
GO

EXEC spLietKeKhachHang @TongTien = 2000.0;

-- Câu 8: Liệt kê DS hàng hóa (TenHH,TôngSL) có số lượng đạt hàng trên X
GO
CREATE PROCEDURE spThongKeHangHoaTheoSLDon
	(@SLDat INT)
AS
BEGIN
	SELECT HH.TenHH, COUNT(CTHD.MaHD) AS 'SLDon'
	FROM HangHoa AS HH
	INNER JOIN ChiTietHD AS CTHD
	ON HH.MaHH = CTHD.MaHH
	GROUP BY HH.TenHH
	HAVING COUNT(CTHD.MaHD) > @SLDat;
END
GO

EXEC spThongKeHangHoaTheoSLDon @SLDat = 10;

-- Câu 9: Liệt kê DS hàng hóa (TenHH,TôngSL) có tổng số lượng đạt hàng trên X
GO
CREATE PROCEDURE spThongKeHangHoaTheoTongSLHang
	(@TongSLDat INT)
AS
BEGIN
	SELECT HH.TenHH, SUM(CTHD.SoLuong) AS 'TongSLDaDat'
	FROM HangHoa AS HH
	LEFT JOIN ChiTietHD AS CTHD
	ON HH.MaHH = CTHD.MaHH
	GROUP BY HH.TenHH
	HAVING SUM(CTHD.SoLuong) > @TongSLDat;
END
GO

EXEC spThongKeHangHoaTheoTongSLHang @TongSLDat = 200;

-- Câu 10: Liệt kê DS hàng hóa (TenHH,TongSoTien) có tổng số tiền đặt trên X
GO
CREATE PROCEDURE spThongKeHangHoaTheoTongSoTien
	(@TongSoTien FLOAT)
AS
BEGIN
	SELECT HH.TenHH, SUM(CTHD.DonGia * CTHD.SoLuong) AS 'TongSoTienDaDat'
	FROM HangHoa AS HH
	LEFT JOIN ChiTietHD AS CTHD
	ON HH.MaHH = CTHD.MaHH
	GROUP BY HH.TenHH
	HAVING SUM(CTHD.DonGia * CTHD.SoLuong) > @TongSoTien;
END
GO

EXEC spThongKeHangHoaTheoTongSoTien @TongSoTien = 5000.0;

