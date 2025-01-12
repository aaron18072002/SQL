﻿CREATE DATABASE [SQLEDemo]
CONTAINMENT = NONE
ON PRIMARY 
( 
    NAME = N'SQLEDemo_TSQL_FILE', 
    FILENAME = N'D:\SQL\SQLEDemo.mdf'
)
LOG ON
( 
    NAME = N'SQLEDemo_TSQL_FILE_LOG', 
    FILENAME = N'D:\SQL\SQLEDemo_LOG.ldf'
);

USE [SQLEDemo];

DROP TABLE IF EXISTS LOAIKHACHHANG;
DROP TABLE IF EXISTS KHACHHANG;
DROP TABLE IF EXISTS BACSI;
DROP TABLE IF EXISTS DICHVU;
DROP TABLE IF EXISTS LSTHAMMY;
DROP TABLE IF EXISTS CTTHAMMY;

CREATE TABLE LOAIKHACHHANG (
	MaLoaiKH VARCHAR(20),
	TenLoaiKH VARCHAR(3),
	PRIMARY KEY (MaLoaiKH)
);

CREATE TABLE KHACHHANG (
	MaKH VARCHAR(20),
	HoTen VARCHAR(30),
	SoCMND CHAR(10) NOT NULL UNIQUE,
	GioiTinh VARCHAR(3) CHECK (GioiTinh IN ('Nam','Nu')),
	NgaySinh DATE,
	SoDienThoai CHAR(10) UNIQUE,
	MaLoaiKH VARCHAR(20),
	PRIMARY KEY (MaKH)
);

CREATE TABLE BACSI (
	MaBS VARCHAR(20),
	TenBS VARCHAR(30),
	SoCMND CHAR(10) NOT NULL UNIQUE,
	NgaySinh DATE,
	DiaChi VARCHAR(30),
	SoDienThoai CHAR(10) UNIQUE,
	PRIMARY KEY(MaBS)
);

CREATE TABLE DICHVU (
	MaDV VARCHAR(20),
	TenDV VARCHAR(30),
	GiaDV DECIMAL(10,2),
	PRIMARY KEY(MaDV)
);

CREATE TABLE LSTHAMMY (
	MaLS VARCHAR(20),
	MaKH VARCHAR(20),
	NgayTM DATE,
	PRIMARY KEY(MaLS)
);

CREATE TABLE CTTHAMMY (
	MaCT VARCHAR(20),
	MaLS VARCHAR(20),
	MaDV VARCHAR(20),
	MaBS VARCHAR(20),
	PRIMARY KEY(MaCT)
);

ALTER TABLE KHACHHANG
ADD CONSTRAINT fk_KHACHHANG_LOAIKHACHHANG
FOREIGN KEY(MaLoaiKH) REFERENCES LOAIKHACHHANG(MaLoaiKH);

ALTER TABLE LSTHAMMY
ADD CONSTRAINT fk_LSTHAMMY_KHACHHANG
FOREIGN KEY(MaKH) REFERENCES KHACHHANG(MaKH);

--ALTER TABLE CTTHAMMY
--DROP CONSTRAINT fk_LSTHAMMY_KHACHHANG;

ALTER TABLE CTTHAMMY
ADD CONSTRAINT fk_CTTHAMMY_LSTHAMMY
FOREIGN KEY(MaLS) REFERENCES LSTHAMMY(MaLS);
ALTER TABLE CTTHAMMY 
ADD CONSTRAINT fp_CTTHAMMY_DICHVU
FOREIGN KEY(MaDV) REFERENCES DICHVU(MaDV);
ALTER TABLE CTTHAMMY 
ADD CONSTRAINT fp_CTTHAMMY_BACSI
FOREIGN KEY(MaBS) REFERENCES BACSI(MaBS);

ALTER TABLE KHACHHANG
ADD DiaChi VARCHAR(40);

ALTER TABLE LOAIKHACHHANG
ALTER COLUMN TenLoaiKH VARCHAR(30);

ALTER TABLE LSTHAMMY
ADD DanhGia VARCHAR(30);

-- câu2

INSERT INTO LOAIKHACHHANG(MaLoaiKH,TenLoaiKH)
VALUES ('LKH001','VIP'),
	   ('LKH002','Gold'),
	   ('LKH003','Silver'),
	   ('LKH004','Vang lai');

INSERT INTO KHACHHANG(MaKH,HoTen,SoCMND,GioiTinh,NgaySinh,DiaChi,SoDienThoai,MaLoaiKH)
VALUES ('KH001','Nguyen Van Hung','1914235876','Nam','1987-05-11','78 CMT8','0907657654','LKH001'),
	   ('KH002','Nguyen Van Son','1937687654','Nam','1978-06-15','25 Ha Huy Tap','0988765432','LKH002'),
	   ('KH003','Tran Thi Phuong','1974654328','Nu','1987-05-24','17 Hai Phong','0915976546','LKH003'),
	   ('KH004','Le Phan Thi','1978653295','Nu','1980-05-04','5 Nam Ky Khoi Nghia','0987643342','LKH001'),
	   ('KH005','Bui Viet Linh','2018076543','Nam','1975-10-10','25 Nguyen Tri Phuong','0963456543','LKH002'),
	   ('KH006','Truong Van Vinh','2018976789','Nam','1990-10-14','30 Phan Chu Trinh','098765865','LKH003');

INSERT INTO LSTHAMMY(MaLS, MaKH, NgayTM, DanhGia)
VALUES ('LS001','KH001','2020-12-09','Tot'),
	   ('LS002','KH002','2021-04-04','Trung binh'),
	   ('LS003','KH003','2021-06-17','Tot'),
	   ('LS004','KH004','2020-12-02','Chua tot');

INSERT INTO CTTHAMMY(MaCT, MaLS, MaDV, MaBS)
VALUES ('CT001','LS001','DV001','BS001'),
	   ('CT002','LS002','DV002','BS002'),
	   ('CT003','LS003','DV003','BS003'),
	   ('CT004','LS004','DV003','BS004');

INSERT INTO BACSI(MaBS,TenBS,SoCMND,NgaySinh,DiaChi,SoDienThoai)
VALUES ('BS001','Bui Tien Phat','1914345645','1982-03-07','123 Nguyen Chi Thanh','0907657654'),
	   ('BS002','Pham Minh Thu','1925674654','1986-02-07','42 Phan Dang Luu','0988765432'),
	   ('BS003','Nguyen Hoang Anh','1935465765','1978-03-09','17 Hai Phong','0915976546'),
	   ('BS004','Tran Cong Minh','1932459878','1975-05-10','5 Nam Ky Khoi Ngia','0987643342'),
	   ('BS005','Nguyen Thi Yen','2018067543','1985-06-10','257 Nguyen Tri Phuong','0963456543');

INSERT INTO DICHVU(MaDV,TenDV,GiaDV)
VALUES ('DV001','Cat mi mat',7000000.00),
	   ('DV002','Nang mui',1200000.00),
	   ('DV003','Don cam',1500000.00);

-- cau 3:
SELECT KH.MaKH,
	   KH.HoTen,
	   KH.SoCMND,
	   LKH.TenLoaiKH,
	   KH.GioiTinh,
	   FORMAT(KH.NgaySinh,'dd/MM/yyyy') AS 'NgaySinh',
	   KH.DiaChi,
	   KH.SoDienThoai
FROM KHACHHANG AS KH
LEFT JOIN LOAIKHACHHANG AS LKH
ON KH.MaLoaiKH = LKH.MaLoaiKH
ORDER BY LKH.TenLoaiKH ASC, KH.MaKH DESC;

-- câu 4:
SELECT DISTINCT DV.MaDV, DV.TenDV, DV.GiaDV, LSTM.MaKH
FROM DICHVU AS DV
LEFT JOIN CTTHAMMY AS CTTM
ON DV.MaDV = CTTM.MaDV
LEFT JOIN LSTHAMMY AS LSTM
ON CTTM.MaLS = LSTM.MaLS AND MONTH(LSTM.NgayTM) = 4 AND YEAR(LSTM.NgayTM) = 2021
WHERE LSTM.MaKH IS NULL;

SELECT DV.MaDV, DV.TenDV, DV.GiaDV
FROM DICHVU AS DV
WHERE DV.MaDV NOT IN (
	SELECT CTTM.MaDV
	FROM CTTHAMMY AS CTTM
	INNER JOIN LSTHAMMY AS LSTM
	ON CTTM.MaLS = LSTM.MaLS
	WHERE MONTH(LSTM.NgayTM) = 4 AND
		  YEAR(LSTM.NgayTM) = 2021
);

-- cau 5:  Liệt kê những khách hàng (MaKH, HoTen) thuộc loại khách hàng “VIP” có tổng tiền
--		   thanh toán lớn nhất từ trước đến nay. (0.5 điểm)SELECT TOP 1 KH.MaKH, KH.HoTen, SUM(DV.GiaDV) AS 'TongTienThanhToan'FROM CTTHAMMY AS CTTMLEFT JOIN LSTHAMMY AS LSTMON LSTM.MaLS = CTTM.MaLSLEFT JOIN KHACHHANG AS KHON KH.MaKH = LSTM.MaKHLEFT JOIN LOAIKHACHHANG AS LKHON KH.MaLoaiKH = LKH.MaLoaiKHLEFT JOIN DICHVU AS DVON DV.MaDV = CTTM.MaDVWHERE LKH.TenLoaiKH LIKE 'VIP'GROUP BY KH.MaKH, KH.HoTenORDER BY SUM(DV.GiaDV) DESC;-- Câu 6: Liệt kê MaDV, TenDV, Số khách hàng sử dụng, Tổng giá trị thanh toán của mỗi dịch vụ
--		  trong năm 2020. (0.5 điểm)SELECT DV.MaDV, DV.TenDV, 	   COUNT(*) AS 'SoKHSuDung',	   SUM(DV.GiaDV) AS 'TongGiaTriThanhToan'FROM CTTHAMMY AS CTTMINNER JOIN DICHVU AS DVON CTTM.MaDV = DV.MaDV INNER JOIN LSTHAMMY AS LSTMON LSTM.MaLS = CTTM.MaLS  AND YEAR(LSTM.NgayTM) = 2020GROUP BY DV.MaDV, DV.TenDV-- Câu 7: Liệt kê MaKH, HoTen, DiaChi, SoDienThoai, TenLoaiKH, NgayTM, DanhGia, Tổng tiền
--	      thanh toán. (0.5 điểm)
-- ***Lưu ý: Những khách hàng nào chưa có thông tin thẩm mỹ liên quan cũng được liệt kê
SELECT KH.MaKH,
	   KH.HoTen,
	   KH.DiaChi,
	   KH.SoDienThoai,
	   LKH.TenLoaiKH,
	   LSTM.NgayTM,
	   LSTM.DanhGia,
	   SUM(DV.GiaDV) AS 'TongTienThanhToan'
FROM KHACHHANG AS KH
LEFT JOIN LOAIKHACHHANG AS LKH
ON LKH.MaLoaiKH = KH.MaLoaiKH
LEFT JOIN LSTHAMMY AS LSTM
ON KH.MaKH = LSTM.MaKH
LEFT JOIN CTTHAMMY AS CTTM
ON LSTM.MaLS = CTTM.MaLS
LEFT JOIN DICHVU AS DV
ON CTTM.MaDV = DV.MaDV
GROUP BY KH.MaKH,
	   KH.HoTen,
	   KH.DiaChi,
	   KH.SoDienThoai,
	   LKH.TenLoaiKH,
	   LSTM.NgayTM,
	   LSTM.DanhGia;

-- Câu 8: Liệt kê những khách hàng (MaKH, HoTen, DiaChi, SoDienThoai) đã ít nhất 2 lần đến
--		  làm đẹp ở trung tâm thẩm mỹ, trong đó có ít nhất 1 lần có tổng tiền thanh toán lớn hơn 10.000.000
--		  VNĐ. (1 điểm)
SELECT KH.MaKH, KH.HoTen, KH.DiaChi, KH.SoDienThoai, SUM(DV.GiaDV)
FROM LSTHAMMY AS LSTM
INNER JOIN KHACHHANG AS KH
ON LSTM.MaKH = KH.MaKH
INNER JOIN CTTHAMMY AS CTTM
ON CTTM.MaLS = LSTM.MaLS
INNER JOIN DICHVU AS DV
ON DV.MaDV = CTTM.MaDV
GROUP BY KH.MaKH, KH.HoTen, KH.DiaChi, KH.SoDienThoai
HAVING COUNT(*) = 2 AND 
	   SUM(DV.GiaDV) > 10000000.00;