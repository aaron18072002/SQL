--CREATE DATABASE [DemoQuanLyBanHang]
--CONTAINMENT = NONE
--ON PRIMARY 
--( 
--    NAME = N'DemoQuanLyBanHang_TSQL_FILE', 
--    FILENAME = N'D:\SQL\DemoQuanLyBanHang.mdf'
--)
--LOG ON
--( 
--    NAME = N'DemoQuanLyBanHang_TSQL_FILE_LOG', 
--    FILENAME = N'D:\SQL\DemoQuanLyBanHang_LOG.ldf'
--);

--USE [DemoQuanLyBanHang];
GO
/****** Object:  Table [dbo].[ChiTietHD]    Script Date: 9/23/2021 8:47:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[MaCT] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [int] NOT NULL,
	[MaHH] [int] NOT NULL,
	[DonGia] [float] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiamGia] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 9/23/2021 8:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[MaHH] [int] IDENTITY(1,1) NOT NULL,
	[TenHH] [nvarchar](40) NOT NULL,
	[MaLoai] [int] NOT NULL,
	[MoTaDonVi] [nvarchar](50) NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [float] NULL,
	[Hinh] [nvarchar](50) NULL,
	[NgaySX] [datetime] NOT NULL,
	[GiamGia] [float] NOT NULL,
	[SoLanXem] [int] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaNCC] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 9/23/2021 8:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nvarchar](20) NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[NgayCan] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](60) NOT NULL,
	[CachThanhToan] [nvarchar](50) NOT NULL,
	[CachVanChuyen] [nvarchar](50) NOT NULL,
	[PhiVanChuyen] [float] NOT NULL,
	[MaTrangThai] [int] NOT NULL,
	[MaNV] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 9/23/2021 8:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](20) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[DiaChi] [nvarchar](60) NULL,
	[DienThoai] [nvarchar](24) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Hinh] [nvarchar](50) NULL,
	[HieuLuc] [bit] NOT NULL,
	[VaiTro] [int] NOT NULL,
	[RandomKey] [varchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 9/23/2021 8:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[Hinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 9/23/2021 8:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](50) NOT NULL,
	[TenCongTy] [nvarchar](50) NOT NULL,
	[Logo] [nvarchar](50) NOT NULL,
	[NguoiLienLac] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DienThoai] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 9/23/2021 8:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[MaNguoiQuanLy] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 9/23/2021 8:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCong](
	[MaPC] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[MaPB] [varchar](7) NOT NULL,
	[NgayPC] [datetime] NULL,
	[HieuLuc] [bit] NULL,
 CONSTRAINT [PK_PhanCong] PRIMARY KEY CLUSTERED 
(
	[MaPC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 9/23/2021 8:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaPQ] [int] IDENTITY(1,1) NOT NULL,
	[MaPB] [varchar](7) NULL,
	[MaTrang] [int] NULL,
	[Them] [bit] NOT NULL,
	[Sua] [bit] NOT NULL,
	[Xoa] [bit] NOT NULL,
	[Xem] [bit] NOT NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[MaPQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 9/23/2021 8:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPB] [varchar](7) NOT NULL,
	[TenPB] [nvarchar](50) NOT NULL,
	[ThongTin] [nvarchar](max) NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MaPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 9/23/2021 8:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[MaTrangThai] [int] NOT NULL,
	[TenTrangThai] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_TrangThai] PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangWeb]    Script Date: 9/23/2021 8:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangWeb](
	[MaTrang] [int] IDENTITY(1,1) NOT NULL,
	[TenTrang] [nvarchar](50) NOT NULL,
	[URL] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_TrangWeb] PRIMARY KEY CLUSTERED 
(
	[MaTrang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YeuThich]    Script Date: 9/23/2021 8:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YeuThich](
	[MaYT] [int] IDENTITY(1,1) NOT NULL,
	[MaHH] [int] NULL,
	[MaKH] [nvarchar](20) NULL,
	[NgayChon] [datetime] NULL,
	[MoTa] [nvarchar](255) NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[MaYT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHD] ON 

INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100006, 10250, 1041, 7.7, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100007, 10250, 1051, 42.4, 35, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100008, 10250, 1065, 16.8, 15, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100015, 10253, 1031, 10, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100016, 10253, 1039, 14.4, 42, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100017, 10253, 1049, 16, 40, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100019, 10254, 1055, 19.2, 21, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100020, 10254, 1074, 8, 21, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100027, 10257, 1027, 35.1, 25, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100028, 10257, 1039, 14.4, 6, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100030, 10258, 1002, 15.2, 50, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100031, 10258, 1005, 17, 65, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100032, 10258, 1032, 25.6, 6, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100033, 10259, 1021, 8, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100034, 10259, 1037, 20.8, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100044, 10263, 1016, 13.9, 60, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100046, 10263, 1030, 20.7, 60, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100047, 10263, 1074, 8, 36, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100048, 10264, 1002, 15.2, 35, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100049, 10264, 1041, 7.7, 25, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100050, 10265, 1017, 31.2, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100051, 10265, 1070, 12, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100053, 10267, 1040, 14.7, 50, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100054, 10267, 1059, 44, 70, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100057, 10268, 1072, 27.8, 4, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100079, 10278, 1044, 15.5, 16, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100080, 10278, 1059, 44, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100081, 10278, 1063, 35.1, 8, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100085, 10280, 1055, 19.2, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100110, 10289, 1003, 8, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100111, 10289, 1064, 26.6, 9, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100112, 10290, 1005, 17, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100114, 10290, 1049, 16, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100133, 10297, 1039, 14.4, 60, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100134, 10297, 1072, 27.8, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100148, 10303, 1040, 14.7, 40, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100149, 10303, 1065, 16.8, 30, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100150, 10303, 1068, 10, 15, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100162, 10308, 1069, 28.8, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100163, 10308, 1070, 12, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100171, 10311, 1042, 11.2, 6, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100172, 10311, 1069, 28.8, 7, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100207, 10326, 1004, 17.6, 24, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100208, 10326, 1057, 15.6, 16, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100210, 10327, 1002, 15.2, 25, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100211, 10327, 1011, 16.8, 50, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100212, 10327, 1030, 20.7, 35, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100213, 10327, 1058, 10.6, 30, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100214, 10328, 1059, 44, 9, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100215, 10328, 1065, 16.8, 40, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100216, 10328, 1068, 10, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100223, 10331, 1054, 5.9, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100239, 10337, 1036, 15.2, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100240, 10337, 1037, 20.8, 28, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100241, 10337, 1072, 27.8, 25, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100247, 10340, 1018, 50, 20, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100248, 10340, 1041, 7.7, 12, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100249, 10340, 1043, 36.8, 40, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100252, 10342, 1002, 15.2, 24, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100253, 10342, 1031, 10, 56, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100254, 10342, 1036, 15.2, 40, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100255, 10342, 1055, 19.2, 40, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100267, 10347, 1039, 14.4, 50, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100268, 10347, 1040, 14.7, 4, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100273, 10350, 1050, 13, 15, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100274, 10350, 1069, 28.8, 18, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100276, 10351, 1041, 7.7, 13, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100277, 10351, 1044, 15.5, 77, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100278, 10351, 1065, 16.8, 10, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100280, 10352, 1054, 5.9, 20, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100286, 10355, 1057, 15.6, 25, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100294, 10358, 1034, 11.2, 10, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100295, 10358, 1036, 15.2, 20, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100302, 10360, 1049, 16, 35, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100303, 10360, 1054, 5.9, 28, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100307, 10362, 1051, 42.4, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100308, 10362, 1054, 5.9, 24, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100309, 10363, 1031, 10, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100312, 10364, 1069, 28.8, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100313, 10364, 1071, 17.2, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100314, 10365, 1011, 16.8, 24, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100315, 10366, 1065, 16.8, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100321, 10368, 1021, 8, 5, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100323, 10368, 1057, 15.6, 25, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100324, 10368, 1064, 26.6, 35, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100327, 10370, 1001, 14.4, 15, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100328, 10370, 1064, 26.6, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100329, 10370, 1074, 8, 20, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100330, 10371, 1036, 15.2, 6, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100344, 10378, 1071, 17.2, 6, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100353, 10382, 1005, 17, 32, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100354, 10382, 1018, 50, 9, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100356, 10382, 1033, 2, 60, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100357, 10382, 1074, 8, 50, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100358, 10383, 1013, 4.8, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100359, 10383, 1050, 13, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100360, 10383, 1056, 30.4, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100361, 10384, 1020, 64.8, 28, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100362, 10384, 1060, 27.2, 15, 0)
GO
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100367, 10386, 1034, 11.2, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100375, 10389, 1010, 24.8, 16, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100376, 10389, 1055, 19.2, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100377, 10389, 1062, 39.4, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100378, 10389, 1070, 12, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100379, 10390, 1031, 10, 60, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100380, 10390, 1035, 14.4, 40, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100381, 10390, 1046, 9.6, 45, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100382, 10390, 1072, 27.8, 24, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100383, 10391, 1013, 4.8, 18, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100392, 10395, 1046, 9.6, 28, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100393, 10395, 1053, 26.2, 70, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100394, 10395, 1069, 28.8, 8, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100396, 10396, 1071, 17.2, 60, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100397, 10396, 1072, 27.8, 21, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100407, 10400, 1035, 14.4, 35, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100408, 10400, 1049, 16, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100414, 10402, 1063, 35.1, 65, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100415, 10403, 1016, 13.9, 21, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100416, 10403, 1048, 10.2, 70, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100429, 10408, 1037, 20.8, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100430, 10408, 1054, 5.9, 6, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100431, 10408, 1062, 39.4, 35, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100434, 10410, 1033, 2, 49, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100435, 10410, 1059, 44, 16, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100436, 10411, 1041, 7.7, 25, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100437, 10411, 1044, 15.5, 40, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100438, 10411, 1059, 44, 9, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100440, 10413, 1001, 14.4, 24, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100441, 10413, 1062, 39.4, 40, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100443, 10414, 1019, 7.3, 18, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100444, 10414, 1033, 2, 50, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100469, 10423, 1031, 10, 14, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100470, 10423, 1059, 44, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100474, 10425, 1055, 19.2, 10, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100476, 10426, 1056, 30.4, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100477, 10426, 1064, 26.6, 7, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100482, 10430, 1017, 31.2, 45, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100483, 10430, 1021, 8, 50, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100484, 10430, 1056, 30.4, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100485, 10430, 1059, 44, 70, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100486, 10431, 1017, 31.2, 50, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100487, 10431, 1040, 14.7, 50, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100488, 10431, 1047, 7.6, 30, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100492, 10434, 1011, 16.8, 6, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100494, 10435, 1002, 15.2, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100496, 10435, 1072, 27.8, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100497, 10436, 1046, 9.6, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100498, 10436, 1056, 30.4, 40, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100499, 10436, 1064, 26.6, 30, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100514, 10442, 1011, 16.8, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100515, 10442, 1054, 5.9, 80, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100516, 10442, 1066, 13.6, 60, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100519, 10444, 1017, 31.2, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100521, 10444, 1035, 14.4, 8, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100522, 10444, 1041, 7.7, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100523, 10445, 1039, 14.4, 6, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100524, 10445, 1054, 5.9, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100534, 10449, 1010, 24.8, 14, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100535, 10449, 1052, 5.6, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100536, 10449, 1062, 39.4, 35, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100545, 10453, 1048, 10.2, 15, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100546, 10453, 1070, 12, 25, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100547, 10454, 1016, 13.9, 20, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100548, 10454, 1033, 2, 20, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100549, 10454, 1046, 9.6, 10, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100565, 10460, 1068, 10, 21, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100570, 10462, 1013, 4.8, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100574, 10464, 1004, 17.6, 16, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100575, 10464, 1043, 36.8, 3, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100576, 10464, 1056, 30.4, 30, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100577, 10464, 1060, 27.2, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100583, 10466, 1011, 16.8, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100584, 10466, 1046, 9.6, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100592, 10470, 1018, 50, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100594, 10470, 1064, 26.6, 8, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100595, 10471, 1007, 24, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100596, 10471, 1056, 30.4, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100608, 10476, 1055, 19.2, 2, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100609, 10476, 1070, 12, 12, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100618, 10480, 1047, 7.6, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100619, 10480, 1059, 44, 12, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100625, 10484, 1021, 8, 14, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100626, 10484, 1040, 14.7, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100627, 10484, 1051, 42.4, 3, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100632, 10486, 1011, 16.8, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100633, 10486, 1051, 42.4, 25, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100634, 10486, 1074, 8, 16, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100638, 10488, 1059, 44, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100642, 10490, 1059, 44, 60, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100643, 10490, 1068, 10, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100645, 10491, 1044, 15.5, 15, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100648, 10492, 1042, 11.2, 20, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100649, 10493, 1065, 16.8, 15, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100650, 10493, 1066, 13.6, 10, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100651, 10493, 1069, 28.8, 10, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100652, 10494, 1056, 30.4, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100654, 10495, 1041, 7.7, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100661, 10498, 1040, 18.4, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100662, 10498, 1042, 14, 30, 0)
GO
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100665, 10500, 1015, 15.5, 12, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100667, 10501, 1054, 7.45, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100680, 10507, 1043, 46, 15, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100681, 10507, 1048, 12.75, 15, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100687, 10511, 1004, 22, 50, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100688, 10511, 1007, 30, 50, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100689, 10511, 1008, 40, 10, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100691, 10512, 1046, 12, 9, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100692, 10512, 1047, 9.5, 6, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100693, 10512, 1060, 34, 12, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100697, 10514, 1020, 81, 39, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100699, 10514, 1056, 38, 70, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100700, 10514, 1065, 21.05, 39, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100716, 10519, 1010, 31, 16, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100717, 10519, 1056, 38, 40, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100718, 10519, 1060, 34, 10, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100721, 10521, 1035, 18, 3, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100722, 10521, 1041, 9.65, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100723, 10521, 1068, 12.5, 6, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100732, 10524, 1010, 31, 2, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100733, 10524, 1030, 25.89, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100734, 10524, 1043, 46, 60, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100735, 10524, 1054, 7.45, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100736, 10525, 1036, 19, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100737, 10525, 1040, 18.4, 15, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100743, 10528, 1011, 21, 3, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100744, 10528, 1033, 2.5, 8, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100745, 10528, 1072, 34.8, 9, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100754, 10532, 1030, 25.89, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100755, 10532, 1066, 17, 24, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100756, 10533, 1004, 22, 50, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100757, 10533, 1072, 34.8, 24, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100762, 10535, 1011, 21, 50, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100763, 10535, 1040, 18.4, 10, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100764, 10535, 1057, 19.5, 5, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100765, 10535, 1059, 55, 15, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100775, 10538, 1070, 15, 7, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100776, 10538, 1072, 34.8, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100777, 10539, 1013, 6, 8, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100778, 10539, 1021, 10, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100779, 10539, 1033, 2.5, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100780, 10539, 1049, 20, 6, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100787, 10541, 1065, 21.05, 36, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100788, 10541, 1071, 21.5, 9, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100806, 10550, 1017, 39, 8, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100807, 10550, 1019, 9.2, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100808, 10550, 1021, 10, 6, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100810, 10551, 1016, 17.45, 40, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100811, 10551, 1035, 18, 20, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100812, 10551, 1044, 19.45, 40, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100813, 10552, 1069, 36, 18, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100832, 10558, 1047, 9.5, 25, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100833, 10558, 1051, 53, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100834, 10558, 1052, 7, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100835, 10558, 1053, 32.8, 18, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100837, 10559, 1041, 9.65, 12, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100838, 10559, 1055, 24, 18, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100839, 10560, 1030, 25.89, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100840, 10560, 1062, 49.3, 15, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100841, 10561, 1044, 19.45, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100842, 10561, 1051, 53, 50, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100852, 10566, 1011, 21, 35, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100853, 10566, 1018, 62.5, 18, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100858, 10568, 1010, 31, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100863, 10571, 1014, 23.25, 11, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100864, 10571, 1042, 14, 28, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100865, 10572, 1016, 17.45, 12, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100866, 10572, 1032, 32, 10, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100867, 10572, 1040, 18.4, 50, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100869, 10573, 1017, 39, 18, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100870, 10573, 1034, 14, 40, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100871, 10573, 1053, 32.8, 25, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100886, 10578, 1035, 18, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100887, 10578, 1057, 19.5, 6, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100894, 10582, 1057, 19.5, 4, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100899, 10584, 1031, 12.5, 50, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100907, 10589, 1035, 18, 4, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100920, 10595, 1035, 18, 30, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100922, 10595, 1069, 36, 65, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100931, 10599, 1062, 49.3, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100934, 10601, 1013, 6, 60, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100935, 10601, 1059, 55, 35, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100939, 10604, 1048, 12.75, 6, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100954, 10609, 1001, 18, 3, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100955, 10609, 1010, 31, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100956, 10609, 1021, 10, 6, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100957, 10610, 1036, 19, 21, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100966, 10613, 1013, 6, 8, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100968, 10614, 1011, 21, 14, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100969, 10614, 1021, 10, 8, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100970, 10614, 1039, 18, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100973, 10616, 1056, 38, 14, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100974, 10616, 1070, 15, 15, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100975, 10616, 1071, 21.5, 15, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100976, 10617, 1059, 55, 30, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100983, 10620, 1052, 7, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100990, 10623, 1014, 23.25, 21, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100991, 10623, 1019, 9.2, 15, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100992, 10623, 1021, 10, 25, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100994, 10623, 1035, 18, 30, 0.10000000149011612)
GO
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100998, 10625, 1014, 23.25, 3, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100999, 10625, 1042, 14, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101000, 10625, 1060, 34, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101001, 10626, 1053, 32.8, 12, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101002, 10626, 1060, 34, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101003, 10626, 1071, 21.5, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101006, 10628, 1001, 18, 25, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101008, 10629, 1064, 33.25, 9, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101014, 10633, 1012, 38, 36, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101015, 10633, 1013, 6, 13, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101017, 10633, 1062, 49.3, 80, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101018, 10634, 1007, 30, 35, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101019, 10634, 1018, 62.5, 50, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101020, 10634, 1051, 53, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101036, 10641, 1002, 19, 50, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101037, 10641, 1040, 18.4, 60, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101041, 10643, 1039, 18, 21, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101042, 10643, 1046, 12, 2, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101046, 10645, 1018, 62.5, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101047, 10645, 1036, 19, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101058, 10650, 1030, 25.89, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101059, 10650, 1053, 32.8, 25, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101060, 10650, 1054, 7.45, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101063, 10652, 1030, 25.89, 2, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101064, 10652, 1042, 14, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101065, 10653, 1016, 17.45, 30, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101066, 10653, 1060, 34, 20, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101067, 10654, 1004, 22, 12, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101068, 10654, 1039, 18, 20, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101069, 10654, 1054, 7.45, 6, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101071, 10656, 1014, 23.25, 3, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101072, 10656, 1044, 19.45, 28, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101073, 10656, 1047, 9.5, 6, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101091, 10663, 1040, 18.4, 30, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101092, 10663, 1042, 14, 30, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101093, 10663, 1051, 53, 20, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101094, 10664, 1010, 31, 24, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101095, 10664, 1056, 38, 12, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101096, 10664, 1065, 21.05, 15, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101102, 10667, 1069, 36, 45, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101103, 10667, 1071, 21.5, 14, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101109, 10670, 1046, 12, 60, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101110, 10670, 1067, 14, 25, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101113, 10671, 1016, 17.45, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101114, 10671, 1062, 49.3, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101115, 10671, 1065, 21.05, 12, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101117, 10672, 1071, 21.5, 12, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101122, 10675, 1014, 23.25, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101123, 10675, 1053, 32.8, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101124, 10675, 1058, 13.25, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101129, 10677, 1033, 2.5, 8, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101134, 10679, 1059, 55, 12, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101138, 10681, 1019, 9.2, 30, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101139, 10681, 1021, 10, 12, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101140, 10681, 1064, 33.25, 28, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101141, 10682, 1033, 2.5, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101142, 10682, 1066, 17, 4, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101144, 10683, 1052, 7, 9, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101148, 10685, 1010, 31, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101149, 10685, 1041, 9.65, 4, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101150, 10685, 1047, 9.5, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101159, 10689, 1001, 18, 35, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101160, 10690, 1056, 38, 20, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101167, 10692, 1063, 43.9, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101184, 10698, 1011, 21, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101185, 10698, 1017, 39, 8, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101187, 10698, 1065, 21.05, 65, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101188, 10698, 1070, 15, 8, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101197, 10702, 1003, 10, 6, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101199, 10703, 1002, 19, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101200, 10703, 1059, 55, 35, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101205, 10705, 1031, 12.5, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101206, 10705, 1032, 32, 4, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101210, 10707, 1055, 24, 21, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101211, 10707, 1057, 19.5, 40, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101212, 10707, 1070, 15, 28, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101215, 10709, 1008, 40, 40, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101216, 10709, 1051, 53, 28, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101217, 10709, 1060, 34, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101218, 10710, 1019, 9.2, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101219, 10710, 1047, 9.5, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101234, 10715, 1010, 31, 21, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101235, 10715, 1071, 21.5, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101239, 10717, 1021, 10, 32, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101240, 10717, 1054, 7.45, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101241, 10717, 1069, 36, 25, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101259, 10725, 1041, 9.65, 12, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101260, 10725, 1052, 7, 4, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101261, 10725, 1055, 24, 6, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101262, 10726, 1004, 22, 25, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101263, 10726, 1011, 21, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101274, 10730, 1016, 17.45, 15, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101275, 10730, 1031, 12.5, 3, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101276, 10730, 1065, 21.05, 10, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101277, 10731, 1021, 10, 40, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101278, 10731, 1051, 53, 30, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101280, 10733, 1014, 23.25, 16, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101282, 10733, 1052, 7, 25, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101283, 10734, 1006, 25, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101284, 10734, 1030, 25.89, 15, 0)
GO
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101299, 10741, 1002, 19, 15, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101300, 10742, 1003, 10, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101301, 10742, 1060, 34, 50, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101302, 10742, 1072, 34.8, 35, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101303, 10743, 1046, 12, 28, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101309, 10746, 1013, 6, 6, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101310, 10746, 1042, 14, 28, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101311, 10746, 1062, 49.3, 9, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101312, 10746, 1069, 36, 40, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101332, 10753, 1045, 9.5, 4, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101333, 10753, 1074, 10, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101335, 10755, 1047, 9.5, 30, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101336, 10755, 1056, 38, 30, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101337, 10755, 1057, 19.5, 14, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101338, 10755, 1069, 36, 25, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101350, 10759, 1032, 32, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101356, 10762, 1039, 18, 16, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101357, 10762, 1047, 9.5, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101358, 10762, 1051, 53, 28, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101359, 10762, 1056, 38, 60, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101360, 10763, 1021, 10, 40, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101363, 10764, 1003, 10, 20, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101364, 10764, 1039, 18, 130, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101371, 10768, 1031, 12.5, 50, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101372, 10768, 1060, 34, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101373, 10768, 1071, 21.5, 12, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101378, 10770, 1011, 21, 15, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101379, 10771, 1071, 21.5, 16, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101382, 10773, 1017, 39, 33, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101383, 10773, 1031, 12.5, 70, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101385, 10774, 1031, 12.5, 2, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101386, 10774, 1066, 17, 50, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101389, 10776, 1031, 12.5, 16, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101390, 10776, 1042, 14, 12, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101391, 10776, 1045, 9.5, 27, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101392, 10776, 1051, 53, 120, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101393, 10777, 1042, 14, 20, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101394, 10778, 1041, 9.65, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101402, 10782, 1031, 12.5, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101403, 10783, 1031, 12.5, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101408, 10785, 1010, 31, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101413, 10787, 1002, 19, 15, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101417, 10789, 1018, 62.5, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101418, 10789, 1035, 18, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101419, 10789, 1063, 43.9, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101420, 10789, 1068, 12.5, 18, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101421, 10790, 1007, 30, 3, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101422, 10790, 1056, 38, 20, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101424, 10791, 1041, 9.65, 20, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101428, 10793, 1041, 9.65, 14, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101429, 10793, 1052, 7, 8, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101432, 10795, 1016, 17.45, 65, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101433, 10795, 1017, 39, 35, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101435, 10796, 1044, 19.45, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101436, 10796, 1064, 33.25, 35, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101437, 10796, 1069, 36, 24, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101438, 10797, 1011, 21, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101447, 10801, 1017, 39, 40, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101464, 10807, 1040, 18.4, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101468, 10810, 1013, 6, 7, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101470, 10810, 1070, 15, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101485, 10816, 1062, 49.3, 20, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101492, 10819, 1043, 46, 7, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101503, 10824, 1041, 9.65, 12, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101504, 10824, 1070, 15, 9, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101506, 10825, 1053, 32.8, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101507, 10826, 1031, 12.5, 35, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101508, 10826, 1057, 19.5, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101509, 10827, 1010, 31, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101510, 10827, 1039, 18, 21, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101525, 10832, 1013, 6, 3, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101527, 10832, 1044, 19.45, 16, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101528, 10832, 1064, 33.25, 3, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101534, 10835, 1059, 55, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101537, 10836, 1035, 18, 6, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101538, 10836, 1057, 19.5, 24, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101539, 10836, 1060, 34, 60, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101540, 10836, 1064, 33.25, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101541, 10837, 1013, 6, 6, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101542, 10837, 1040, 18.4, 25, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101543, 10837, 1047, 9.5, 40, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101576, 10848, 1005, 21.35, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101577, 10848, 1009, 97, 3, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101590, 10853, 1018, 62.5, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101591, 10854, 1010, 31, 100, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101592, 10854, 1013, 6, 65, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101597, 10856, 1002, 19, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101598, 10856, 1042, 14, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101599, 10857, 1003, 10, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101606, 10859, 1054, 7.45, 35, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101607, 10859, 1064, 33.25, 30, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101608, 10860, 1051, 53, 3, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101617, 10863, 1001, 18, 20, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101618, 10863, 1058, 13.25, 12, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101619, 10864, 1035, 18, 4, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101620, 10864, 1067, 14, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101623, 10866, 1002, 19, 21, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101625, 10866, 1030, 25.89, 40, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101636, 10871, 1006, 25, 50, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101637, 10871, 1016, 17.45, 12, 0.05000000074505806)
GO
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101638, 10871, 1017, 39, 16, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101639, 10872, 1055, 24, 10, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101640, 10872, 1062, 49.3, 20, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101641, 10872, 1064, 33.25, 15, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101642, 10872, 1065, 21.05, 21, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101645, 10874, 1010, 31, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101646, 10875, 1019, 9.2, 25, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101647, 10875, 1047, 9.5, 21, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101648, 10875, 1049, 20, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101649, 10876, 1046, 12, 21, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101650, 10876, 1064, 33.25, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101659, 10880, 1070, 15, 50, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101672, 10886, 1010, 31, 70, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101673, 10886, 1031, 12.5, 35, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101676, 10888, 1002, 19, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101677, 10888, 1068, 12.5, 18, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101680, 10890, 1017, 39, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101681, 10890, 1034, 14, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101682, 10890, 1041, 9.65, 14, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101694, 10895, 1039, 18, 45, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101695, 10895, 1040, 18.4, 91, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101696, 10895, 1060, 34, 100, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101704, 10901, 1041, 9.65, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101705, 10901, 1071, 21.5, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101706, 10902, 1055, 24, 30, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101707, 10902, 1062, 49.3, 6, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101708, 10903, 1013, 6, 40, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101709, 10903, 1065, 21.05, 21, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101710, 10903, 1068, 12.5, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101724, 10911, 1001, 18, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101725, 10911, 1017, 39, 12, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101726, 10911, 1067, 14, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101741, 10918, 1001, 18, 60, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101742, 10918, 1060, 34, 25, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101746, 10920, 1050, 16.25, 24, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101749, 10922, 1017, 39, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101751, 10923, 1042, 14, 10, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101752, 10923, 1043, 46, 10, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101753, 10923, 1067, 14, 24, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101754, 10924, 1010, 31, 20, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101757, 10925, 1036, 19, 25, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101758, 10925, 1052, 7, 12, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101759, 10926, 1011, 21, 2, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101760, 10926, 1013, 6, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101761, 10926, 1019, 9.2, 7, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101762, 10926, 1072, 34.8, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101766, 10928, 1047, 9.5, 5, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101768, 10929, 1021, 10, 60, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101777, 10932, 1016, 17.45, 30, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101778, 10932, 1062, 49.3, 14, 0.10000000149011612)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101779, 10932, 1072, 34.8, 16, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101787, 10936, 1036, 19, 30, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101789, 10937, 1034, 14, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101796, 10940, 1007, 30, 8, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101797, 10940, 1013, 6, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101803, 10943, 1013, 6, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101805, 10943, 1046, 12, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101806, 10944, 1011, 21, 5, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101807, 10944, 1044, 19.45, 18, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101808, 10944, 1056, 38, 18, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101814, 10947, 1059, 55, 4, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101815, 10948, 1050, 16.25, 9, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101816, 10948, 1051, 53, 40, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101817, 10948, 1055, 24, 4, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101818, 10949, 1006, 25, 12, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101819, 10949, 1010, 31, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101820, 10949, 1017, 39, 6, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101821, 10949, 1062, 49.3, 60, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101826, 10952, 1006, 25, 16, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101828, 10953, 1020, 81, 50, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101829, 10953, 1031, 12.5, 50, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101835, 10956, 1021, 10, 12, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101836, 10956, 1047, 9.5, 14, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101837, 10956, 1051, 53, 8, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101838, 10957, 1030, 25.89, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101839, 10957, 1035, 18, 40, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101840, 10957, 1064, 33.25, 8, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101846, 10960, 1041, 9.65, 24, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101854, 10963, 1060, 34, 2, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101859, 10966, 1037, 26, 8, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101860, 10966, 1056, 38, 12, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101861, 10966, 1062, 49.3, 12, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101864, 10968, 1012, 38, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101866, 10968, 1064, 33.25, 4, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101867, 10969, 1046, 12, 9, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101868, 10970, 1052, 7, 40, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101876, 10975, 1008, 40, 16, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101879, 10977, 1039, 18, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101880, 10977, 1047, 9.5, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101881, 10977, 1051, 53, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101882, 10977, 1063, 43.9, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101887, 10979, 1007, 30, 18, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101888, 10979, 1012, 38, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101890, 10979, 1027, 43.9, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101891, 10979, 1031, 12.5, 24, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101892, 10979, 1063, 43.9, 35, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101895, 10982, 1007, 30, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101896, 10982, 1043, 46, 9, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101909, 10987, 1007, 30, 60, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101910, 10987, 1043, 46, 6, 0)
GO
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101911, 10987, 1072, 34.8, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101917, 10990, 1021, 10, 65, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101918, 10990, 1034, 14, 60, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101919, 10990, 1055, 24, 65, 0.15000000596046448)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101926, 10993, 1041, 9.65, 35, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101944, 11001, 1007, 30, 60, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101946, 11001, 1046, 12, 25, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101947, 11001, 1055, 24, 6, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101959, 11006, 1001, 18, 8, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101965, 11008, 1034, 14, 90, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101966, 11008, 1071, 21.5, 21, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101968, 11009, 1036, 19, 18, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101969, 11009, 1060, 34, 9, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101972, 11011, 1058, 13.25, 40, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101973, 11011, 1071, 21.5, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101974, 11012, 1019, 9.2, 50, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101975, 11012, 1060, 34, 36, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101976, 11012, 1071, 21.5, 60, 0.05000000074505806)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101984, 11016, 1031, 12.5, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101985, 11016, 1036, 19, 16, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101986, 11017, 1003, 10, 25, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101987, 11017, 1059, 55, 110, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (101988, 11017, 1070, 15, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102000, 11022, 1019, 9.2, 35, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102001, 11022, 1069, 36, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102002, 11023, 1007, 30, 4, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102003, 11023, 1043, 46, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102005, 11024, 1033, 2.5, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102006, 11024, 1065, 21.05, 21, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102007, 11024, 1071, 21.5, 50, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102010, 11026, 1018, 62.5, 8, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102011, 11026, 1051, 53, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102013, 11027, 1062, 49.3, 21, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102016, 11029, 1056, 38, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102017, 11029, 1063, 43.9, 12, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102039, 11036, 1013, 6, 7, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102040, 11036, 1059, 55, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102041, 11037, 1070, 15, 4, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102049, 11040, 1021, 10, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102050, 11041, 1002, 19, 30, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102051, 11041, 1063, 43.9, 30, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102052, 11042, 1044, 19.45, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102056, 11045, 1033, 2.5, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102057, 11045, 1051, 53, 24, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102061, 11047, 1001, 18, 25, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102062, 11047, 1005, 21.35, 30, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102063, 11048, 1068, 12.5, 42, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102064, 11049, 1002, 19, 10, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102065, 11049, 1012, 38, 4, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102068, 11052, 1043, 46, 30, 0.20000000298023224)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102073, 11054, 1033, 2.5, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102074, 11054, 1067, 14, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102077, 11055, 1051, 53, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102078, 11055, 1057, 19.5, 20, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102079, 11056, 1007, 30, 40, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102080, 11056, 1055, 24, 35, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102081, 11056, 1060, 34, 50, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102083, 11058, 1021, 10, 3, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102084, 11058, 1060, 34, 21, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102089, 11060, 1060, 34, 4, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102091, 11061, 1060, 34, 15, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102107, 11067, 1041, 9.65, 9, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102118, 11072, 1002, 19, 8, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102119, 11072, 1041, 9.65, 40, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102120, 11072, 1050, 16.25, 22, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102121, 11072, 1064, 33.25, 130, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102128, 11076, 1006, 25, 20, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102129, 11076, 1014, 23.25, 20, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102130, 11076, 1019, 9.2, 10, 0.25)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102231, 11111, 1002, 19, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102233, 11112, 1004, 22, 2, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102234, 11112, 1005, 21.35, 2, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102235, 11112, 1006, 25, 2, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102236, 11113, 1042, 14, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102238, 11114, 1002, 19, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102239, 11114, 1053, 32.8, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102240, 11115, 1001, 190, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102241, 11115, 1034, 14, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102242, 11116, 1020, 81, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102243, 11116, 1021, 10, 1, 0)
SET IDENTITY_INSERT [dbo].[ChiTietHD] OFF
SET IDENTITY_INSERT [dbo].[HangHoa] ON 

INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1001, N'Đồng hồ Aniseed Syrup 123', 1000, N'10 boxes x 20 bags', 1, 190, N'41MJUdI2jdL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' value="EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors"', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1002, N'Đồng hồ Change', 1000, N'10 boxes x 20 bags', 3, 19, N'41TexqWVkHL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1562, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1003, N'Dell Latitude 7440', 1001, N'12 - 550 ml bottles', 1, 10, N'31EPGSm2s1L._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 491, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1004, N'Dell Latitude 7240', 1001, N'48 - 6 oz jars', 3, 22, N'41CIcYRxJKL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 216, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1005, N'Dell Vostro V1234', 1001, N'36 boxes', 1, 21.35, N'41G38jC0ajL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 134, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1006, N'Dell Vostro V1270 Spread', 1001, N'12 - 8 oz jars', 3, 25, N'41iDo0HDhbL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 153, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1007, N'Nike Pears', 1006, N'12 - 1 lb pkgs.', 1, 30, N'81k1XbQ6nQL._SL1500_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 5006, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1008, N'Dell Vostro V1239 Sauce', 1001, N'12 - 12 oz jars', 3, 40, N'41LMouG6j7L._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1009, N'Mishi Kobe Niku', 1005, N'18 - 500 g pkgs.', 1, 97, N'21meTyhQebL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 3, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1010, N'Vali Ikura', 1007, N'12 - 200 ml jars', 3, 31, N'31hCgES5GXL._AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 3, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1011, N'Vertu 1022', 1003, N'1 kg pkg.', 13, 21, N'31jsjfVfH9L._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1012, N'Vertu La Pastora', 1003, N'10 - 500 g pkgs.', 3, 38, N'41BiMx1FKyL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1013, N'Konbu', 1007, N'2 kg box', 1, 6, N'31ioCUUFnoL.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1014, N'Tofu', 1006, N'40 - 100 g pkgs.', 3, 23.25, N'81Q1DvOnnoL._SL1500_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1015, N'Dell Vostro V1999 Genen Shouyu', 1001, N'24 - 250 ml bottles', 1, 15.5, N'41qlcUEhNmL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1016, N'Pavlova', 1002, N'32 - 500 g boxes', 3, 17.45, N'41iji4-9UsL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 329, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1017, N'Alice Mutton', 1005, N'20 - 1 kg tins', 1, 39, N'31LAnW1JFqL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1018, N'Carnarvon Tigers', 1007, N'16 kg pkg.', 3, 62.5, N'31yxRemzRLL._SS350_ (1).jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1019, N'Canon D500', 1002, N'10 boxes x 12 pieces', 1, 9.2, N'41KALboJKuL.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 12, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1020, N'Fuj Film', 1002, N'30 gift boxes', 3, 81, N'41sl3FN6NpL.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1021, N'Kodak Express', 1002, N'24 pkgs. x 4 pieces', 1, 10, N'41w4TlVPhGL.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1027, N'Canon D501', 1002, N'100 - 100 g pieces', 1, 43.9, N'41ZE9SmWdzL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1030, N'Vali MSI', 1007, N'10 - 200 g glasses', 3, 25.89, N'41lffECD-sL._SY445_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1031, N'Samsung S20', 1003, N'12 - 100 g pkgs', 1, 12.5, N'41IPLmZIKhL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1032, N'Samsung S10', 1003, N'24 - 200 g pkgs.', 3, 32, N'41qfgTvFBwL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1033, N'Samsung Galaxy A', 1003, N'500 g', 1, 2.5, N'41qfgTvFBwL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SM')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1034, N'Đồng hồ Sasquatch Ale', 1000, N'24 - 12 oz bottles', 3, 14, N'41WvZnGYUkL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 7, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1035, N'Đồng hồ Steeleye Stout', 1000, N'24 - 12 oz bottles', 1, 18, N'41yh1vBmqsL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1036, N'Inlagd Sill', 1007, N'24 - 250 g  jars', 3, 19, N'41sw9ASUvBL._SX342_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1037, N'Gravad lax', 1007, N'12 - 500 g pkgs.', 1, 26, N'41Z43OmFHjL._SX342_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1039, N'Đồng hồ Chartreuse verte', 1000, N'750 cc per bottle', 1, 18, N'51GBNkHO6vL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1040, N'Boston Crab Meat', 1007, N'24 - 4 oz tins', 3, 18.4, N'51JhyHtnEgL._SL1001_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1041, N'Vali IMAX', 1007, N'12 - 12 oz cans', 1, 9.65, N'71bJrFAys9L._SL1280_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1042, N'Singaporean Hokkien Fried Mee', 1004, N'32 - 1 kg pkgs.', 3, 14, N'41A9R5KXCXL._AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1043, N'Đồng hồ Casio', 1000, N'16 - 500 g tins', 1, 46, N'51czOOat0OL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 2, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1044, N'HP Gula Malacca', 1001, N'20 - 2 kg bags', 3, 19.45, N'41riQRGf-6L._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1045, N'Rogede sild', 1007, N'1k pkg.', 1, 9.5, N'71cBwWAgvIL._SL1430_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1046, N'Spegesild', 1007, N'4 - 450 g glasses', 3, 12, N'91T2BjUkYmL._SL1500_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1047, N'Zaanse koeken', 1002, N'10 - 4 oz boxes', 1, 9.5, N'51s6pbRlNyL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1048, N'Canon Chocolade', 1002, N'10 pkgs.', 3, 12.75, N'91JUBDf1jTL._AA1500_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1049, N'Canon Maxilaku', 1002, N'24 - 50 g pkgs.', 1, 20, N'51w+JqOnmSL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'MO')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1050, N'Valkoinen suklaa', 1002, N'12 - 100 g bars', 3, 16.25, N'51yomC0EodL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1051, N'Manjimup Dried Apples', 1006, N'50 - 300 g pkgs.', 1, 53, N'416pdroSEkL.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1052, N'Filo Mix', 1004, N'16 - 2 kg boxes', 3, 7, N'41Pg1ahql8L._AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1053, N'Perth Pasties', 1005, N'48 pieces', 1, 32.8, N'31pAGovVENL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1054, N'PNJ 5C', 1005, N'16 pies', 3, 7.45, N'31TB6tC6BOL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1055, N'PNJ 1L', 1005, N'24 boxes x 2 pies', 1, 24, N'41brDHtPY9L._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1056, N'Gnocchi di nonna Alice', 1004, N'24 - 250 g pkgs.', 3, 38, N'51nukXFJLJL.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1057, N'Ravioli Angelo', 1004, N'24 - 250 g pkgs.', 1, 19.5, N'410PjzqoC8L._AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1058, N'Escargots de Bourgogne', 1007, N'24 pieces', 3, 13.25, N'91T2BjUkYmL._SL1500_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1059, N'Raclette Courdavault', 1003, N'5 kg pkg.', 1, 55, N'41sdBTtnUDL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1060, N'Camembert Pierrot', 1003, N'15 - 300 g rounds', 3, 34, N'41zxxR71G+L._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1062, N'Canon Tarte au sucre', 1002, N'48 pies', 3, 49.3, N'415cOCbeyML.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1063, N'Acer Aspire', 1001, N'15 - 625 g jars', 1, 43.9, N'41sd2DTD8EL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1064, N'Channel 5', 1004, N'20 bags x 4 pieces', 3, 33.25, N'419WCoqfamL._AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1065, N'MI Lap', 1001, N'32 - 8 oz bottles', 1, 21.05, N'41wHu2N4tVL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'SS')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1066, N'ASUS Vivobook', 1001, N'24 - 8 oz jars', 3, 17, N'416OcTXFfeL._AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1067, N'Đồng hồ Laughing Lager', 1000, N'24 - 12 oz bottles', 1, 14, N'51GBNkHO6vL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1068, N'Canon Scottish Longbreads', 1002, N'10 boxes x 8 pieces', 3, 12.5, N'Camera1.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1069, N'Gudbrandsdalsost', 1003, N'10 kg pkg.', 1, 36, N'51+4d3VBFvL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1070, N'Đồng hồ Outback Lager', 1000, N'24 - 355 ml bottles', 3, 15, N'51Lj5bxbNtL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1071, N'Flotemysost', 1003, N'10 - 500 g pkgs.', 1, 21.5, N'51l46qQB50L._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1072, N'Mozzarella di Giovanni', 1003, N'24 - 200 g pkgs.', 3, 34.8, N'5195-l+nflL._AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1074, N'Longlife Tofu', 1006, N'5 kg pkg.', 3, 10, N'816zGZv1ORL._SL1500_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1081, N'Đồng hồ Rolex', 1000, N'10 boxes x 20 bags', 1, 19, N'51y46IslQkL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 4, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1083, N'Mishi Kobe Niku', 1005, N'18 - 500 g pkgs.', 1, 97, N'41GVLtgNngL._SL500_AA300_.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 0, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoai], [MoTaDonVi], [SoLuong], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1084, N'Đồng hồ Change-New', 1000, N'10 boxes x 20 bags', 3, 19, N'51Z9tfgl4aL._SL500_AA300_.jpg', CAST(N'2009-08-01T07:00:00.000' AS DateTime), 0, 1, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', N'NK')
SET IDENTITY_INSERT [dbo].[HangHoa] OFF
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10250, N'HANAR', CAST(N'1996-07-08T00:00:00.000' AS DateTime), CAST(N'1996-08-05T00:00:00.000' AS DateTime), CAST(N'1996-07-12T00:00:00.000' AS DateTime), NULL, N'Rua do Paço, 67', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10253, N'HANAR', CAST(N'1996-07-10T00:00:00.000' AS DateTime), CAST(N'1996-07-24T00:00:00.000' AS DateTime), CAST(N'1996-07-16T00:00:00.000' AS DateTime), NULL, N'Rua do Paço, 67', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10254, N'CHOPS', CAST(N'1996-07-11T00:00:00.000' AS DateTime), CAST(N'1996-08-08T00:00:00.000' AS DateTime), CAST(N'1996-07-23T00:00:00.000' AS DateTime), NULL, N'Hauptstr. 31', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10257, N'HILAA', CAST(N'1996-07-16T00:00:00.000' AS DateTime), CAST(N'1996-08-13T00:00:00.000' AS DateTime), CAST(N'1996-07-22T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10258, N'ERNSH', CAST(N'1996-07-17T00:00:00.000' AS DateTime), CAST(N'1996-08-14T00:00:00.000' AS DateTime), CAST(N'1996-07-23T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10259, N'CENTC', CAST(N'1996-07-18T00:00:00.000' AS DateTime), CAST(N'1996-08-15T00:00:00.000' AS DateTime), CAST(N'1996-07-25T00:00:00.000' AS DateTime), NULL, N'Sierras de Granada 9993', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10263, N'ERNSH', CAST(N'1996-07-23T00:00:00.000' AS DateTime), CAST(N'1996-08-20T00:00:00.000' AS DateTime), CAST(N'1996-07-31T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10264, N'FOLKO', CAST(N'1996-07-24T00:00:00.000' AS DateTime), CAST(N'1996-08-21T00:00:00.000' AS DateTime), CAST(N'1996-08-23T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10265, N'BLONP', CAST(N'1996-07-25T00:00:00.000' AS DateTime), CAST(N'1996-08-22T00:00:00.000' AS DateTime), CAST(N'1996-08-12T00:00:00.000' AS DateTime), NULL, N'24, place Kléber', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10267, N'FRANK', CAST(N'1996-07-29T00:00:00.000' AS DateTime), CAST(N'1996-08-26T00:00:00.000' AS DateTime), CAST(N'1996-08-06T00:00:00.000' AS DateTime), NULL, N'Berliner Platz 43', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10268, N'GROSR', CAST(N'1996-07-30T00:00:00.000' AS DateTime), CAST(N'1996-08-27T00:00:00.000' AS DateTime), CAST(N'1996-08-02T00:00:00.000' AS DateTime), NULL, N'5ª Ave. Los Palos Grandes', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10278, N'BERGS', CAST(N'1996-08-12T00:00:00.000' AS DateTime), CAST(N'1996-09-09T00:00:00.000' AS DateTime), CAST(N'1996-08-16T00:00:00.000' AS DateTime), NULL, N'Berguvsvägen  8', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10280, N'BERGS', CAST(N'1996-08-14T00:00:00.000' AS DateTime), CAST(N'1996-09-11T00:00:00.000' AS DateTime), CAST(N'1996-09-12T00:00:00.000' AS DateTime), NULL, N'Berguvsvägen  8', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10289, N'BSBEV', CAST(N'1996-08-26T00:00:00.000' AS DateTime), CAST(N'1996-09-23T00:00:00.000' AS DateTime), CAST(N'1996-08-28T00:00:00.000' AS DateTime), NULL, N'Fauntleroy Circus', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10290, N'COMMI', CAST(N'1996-08-27T00:00:00.000' AS DateTime), CAST(N'1996-09-24T00:00:00.000' AS DateTime), CAST(N'1996-09-03T00:00:00.000' AS DateTime), NULL, N'Av. dos Lusíadas, 23', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10297, N'BLONP', CAST(N'1996-09-04T00:00:00.000' AS DateTime), CAST(N'1996-10-16T00:00:00.000' AS DateTime), CAST(N'1996-09-10T00:00:00.000' AS DateTime), NULL, N'24, place Kléber', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10303, N'GODOS', CAST(N'1996-09-11T00:00:00.000' AS DateTime), CAST(N'1996-10-09T00:00:00.000' AS DateTime), CAST(N'1996-09-18T00:00:00.000' AS DateTime), NULL, N'C/ Romero, 33', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10308, N'ANATR', CAST(N'1996-09-18T00:00:00.000' AS DateTime), CAST(N'1996-10-16T00:00:00.000' AS DateTime), CAST(N'1996-09-24T00:00:00.000' AS DateTime), NULL, N'Avda. de la Constitución 2222', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10311, N'DUMON', CAST(N'1996-09-20T00:00:00.000' AS DateTime), CAST(N'1996-10-04T00:00:00.000' AS DateTime), CAST(N'1996-09-26T00:00:00.000' AS DateTime), NULL, N'67, rue des Cinquante Otages', N'Cash', N'Airline', 0, 0, N'ronaldo', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10326, N'BOLID', CAST(N'1996-10-10T00:00:00.000' AS DateTime), CAST(N'1996-11-07T00:00:00.000' AS DateTime), CAST(N'1996-10-14T00:00:00.000' AS DateTime), NULL, N'C/ Araquil, 67', N'Cash', N'Airline', 0, 0, N'ronaldo', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10327, N'FOLKO', CAST(N'1996-10-11T00:00:00.000' AS DateTime), CAST(N'1996-11-08T00:00:00.000' AS DateTime), CAST(N'1996-10-14T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10328, N'FURIB', CAST(N'1996-10-14T00:00:00.000' AS DateTime), CAST(N'1996-11-11T00:00:00.000' AS DateTime), CAST(N'1996-10-17T00:00:00.000' AS DateTime), NULL, N'Jardim das rosas n. 32', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10331, N'BONAP', CAST(N'1996-10-16T00:00:00.000' AS DateTime), CAST(N'1996-11-27T00:00:00.000' AS DateTime), CAST(N'1996-10-21T00:00:00.000' AS DateTime), NULL, N'12, rue des Bouchers', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10337, N'FRANK', CAST(N'1996-10-24T00:00:00.000' AS DateTime), CAST(N'1996-11-21T00:00:00.000' AS DateTime), CAST(N'1996-10-29T00:00:00.000' AS DateTime), NULL, N'Berliner Platz 43', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10340, N'BONAP', CAST(N'1996-10-29T00:00:00.000' AS DateTime), CAST(N'1996-11-26T00:00:00.000' AS DateTime), CAST(N'1996-11-08T00:00:00.000' AS DateTime), NULL, N'12, rue des Bouchers', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10342, N'FRANK', CAST(N'1996-10-30T00:00:00.000' AS DateTime), CAST(N'1996-11-13T00:00:00.000' AS DateTime), CAST(N'1996-11-04T00:00:00.000' AS DateTime), NULL, N'Berliner Platz 43', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10347, N'FAMIA', CAST(N'1996-11-06T00:00:00.000' AS DateTime), CAST(N'1996-12-04T00:00:00.000' AS DateTime), CAST(N'1996-11-08T00:00:00.000' AS DateTime), NULL, N'Rua Orós, 92', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10350, N'LAMAI', CAST(N'1996-11-11T00:00:00.000' AS DateTime), CAST(N'1996-12-09T00:00:00.000' AS DateTime), CAST(N'1996-12-03T00:00:00.000' AS DateTime), NULL, N'1 rue Alsace-Lorraine', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10351, N'ERNSH', CAST(N'1996-11-11T00:00:00.000' AS DateTime), CAST(N'1996-12-09T00:00:00.000' AS DateTime), CAST(N'1996-11-20T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10352, N'FURIB', CAST(N'1996-11-12T00:00:00.000' AS DateTime), CAST(N'1996-11-26T00:00:00.000' AS DateTime), CAST(N'1996-11-18T00:00:00.000' AS DateTime), NULL, N'Jardim das rosas n. 32', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10355, N'AROUT', CAST(N'1996-11-15T00:00:00.000' AS DateTime), CAST(N'1996-12-13T00:00:00.000' AS DateTime), CAST(N'1996-11-20T00:00:00.000' AS DateTime), NULL, N'Brook Farm Stratford St. Mary', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10358, N'LAMAI', CAST(N'1996-11-20T00:00:00.000' AS DateTime), CAST(N'1996-12-18T00:00:00.000' AS DateTime), CAST(N'1996-11-27T00:00:00.000' AS DateTime), NULL, N'1 rue Alsace-Lorraine', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10360, N'BLONP', CAST(N'1996-11-22T00:00:00.000' AS DateTime), CAST(N'1996-12-20T00:00:00.000' AS DateTime), CAST(N'1996-12-02T00:00:00.000' AS DateTime), NULL, N'24, place Kléber', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10362, N'BONAP', CAST(N'1996-11-25T00:00:00.000' AS DateTime), CAST(N'1996-12-23T00:00:00.000' AS DateTime), CAST(N'1996-11-28T00:00:00.000' AS DateTime), NULL, N'12, rue des Bouchers', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10363, N'DRACD', CAST(N'1996-11-26T00:00:00.000' AS DateTime), CAST(N'1996-12-24T00:00:00.000' AS DateTime), CAST(N'1996-12-04T00:00:00.000' AS DateTime), NULL, N'Walserweg 21', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10364, N'EASTC', CAST(N'1996-11-26T00:00:00.000' AS DateTime), CAST(N'1997-01-07T00:00:00.000' AS DateTime), CAST(N'1996-12-04T00:00:00.000' AS DateTime), NULL, N'35 King George', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10365, N'ANTON', CAST(N'1996-11-27T00:00:00.000' AS DateTime), CAST(N'1996-12-25T00:00:00.000' AS DateTime), CAST(N'1996-12-02T00:00:00.000' AS DateTime), NULL, N'Mataderos  2312', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10366, N'GALED', CAST(N'1996-11-28T00:00:00.000' AS DateTime), CAST(N'1997-01-09T00:00:00.000' AS DateTime), CAST(N'1996-12-30T00:00:00.000' AS DateTime), NULL, N'Rambla de Cataluña, 23', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10368, N'ERNSH', CAST(N'1996-11-29T00:00:00.000' AS DateTime), CAST(N'1996-12-27T00:00:00.000' AS DateTime), CAST(N'1996-12-02T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10370, N'CHOPS', CAST(N'1996-12-03T00:00:00.000' AS DateTime), CAST(N'1996-12-31T00:00:00.000' AS DateTime), CAST(N'1996-12-27T00:00:00.000' AS DateTime), NULL, N'Hauptstr. 31', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10371, N'LAMAI', CAST(N'1996-12-03T00:00:00.000' AS DateTime), CAST(N'1996-12-31T00:00:00.000' AS DateTime), CAST(N'1996-12-24T00:00:00.000' AS DateTime), NULL, N'1 rue Alsace-Lorraine', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10378, N'FOLKO', CAST(N'1996-12-10T00:00:00.000' AS DateTime), CAST(N'1997-01-07T00:00:00.000' AS DateTime), CAST(N'1996-12-19T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10382, N'ERNSH', CAST(N'1996-12-13T00:00:00.000' AS DateTime), CAST(N'1997-01-10T00:00:00.000' AS DateTime), CAST(N'1996-12-16T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10383, N'AROUT', CAST(N'1996-12-16T00:00:00.000' AS DateTime), CAST(N'1997-01-13T00:00:00.000' AS DateTime), CAST(N'1996-12-18T00:00:00.000' AS DateTime), NULL, N'Brook Farm Stratford St. Mary', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10384, N'BERGS', CAST(N'1996-12-16T00:00:00.000' AS DateTime), CAST(N'1997-01-13T00:00:00.000' AS DateTime), CAST(N'1996-12-20T00:00:00.000' AS DateTime), NULL, N'Berguvsvägen  8', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10386, N'FAMIA', CAST(N'1996-12-18T00:00:00.000' AS DateTime), CAST(N'1997-01-01T00:00:00.000' AS DateTime), CAST(N'1996-12-25T00:00:00.000' AS DateTime), NULL, N'Rua Orós, 92', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10389, N'BOTTM', CAST(N'1996-12-20T00:00:00.000' AS DateTime), CAST(N'1997-01-17T00:00:00.000' AS DateTime), CAST(N'1996-12-24T00:00:00.000' AS DateTime), NULL, N'23 Tsawassen Blvd.', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10390, N'ERNSH', CAST(N'1996-12-23T00:00:00.000' AS DateTime), CAST(N'1997-01-20T00:00:00.000' AS DateTime), CAST(N'1996-12-26T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10391, N'DRACD', CAST(N'1996-12-23T00:00:00.000' AS DateTime), CAST(N'1997-01-20T00:00:00.000' AS DateTime), CAST(N'1996-12-31T00:00:00.000' AS DateTime), NULL, N'Walserweg 21', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10395, N'HILAA', CAST(N'1996-12-26T00:00:00.000' AS DateTime), CAST(N'1997-01-23T00:00:00.000' AS DateTime), CAST(N'1997-01-03T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10396, N'FRANK', CAST(N'1996-12-27T00:00:00.000' AS DateTime), CAST(N'1997-01-10T00:00:00.000' AS DateTime), CAST(N'1997-01-06T00:00:00.000' AS DateTime), NULL, N'Berliner Platz 43', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10400, N'EASTC', CAST(N'1997-01-01T00:00:00.000' AS DateTime), CAST(N'1997-01-29T00:00:00.000' AS DateTime), CAST(N'1997-01-16T00:00:00.000' AS DateTime), NULL, N'35 King George', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10402, N'ERNSH', CAST(N'1997-01-02T00:00:00.000' AS DateTime), CAST(N'1997-02-13T00:00:00.000' AS DateTime), CAST(N'1997-01-10T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10403, N'ERNSH', CAST(N'1997-01-03T00:00:00.000' AS DateTime), CAST(N'1997-01-31T00:00:00.000' AS DateTime), CAST(N'1997-01-09T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10408, N'FOLIG', CAST(N'1997-01-08T00:00:00.000' AS DateTime), CAST(N'1997-02-05T00:00:00.000' AS DateTime), CAST(N'1997-01-14T00:00:00.000' AS DateTime), NULL, N'184, chaussée de Tournai', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10410, N'BOTTM', CAST(N'1997-01-10T00:00:00.000' AS DateTime), CAST(N'1997-02-07T00:00:00.000' AS DateTime), CAST(N'1997-01-15T00:00:00.000' AS DateTime), NULL, N'23 Tsawassen Blvd.', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10411, N'BOTTM', CAST(N'1997-01-10T00:00:00.000' AS DateTime), CAST(N'1997-02-07T00:00:00.000' AS DateTime), CAST(N'1997-01-21T00:00:00.000' AS DateTime), NULL, N'23 Tsawassen Blvd.', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10413, N'LAMAI', CAST(N'1997-01-14T00:00:00.000' AS DateTime), CAST(N'1997-02-11T00:00:00.000' AS DateTime), CAST(N'1997-01-16T00:00:00.000' AS DateTime), NULL, N'1 rue Alsace-Lorraine', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10414, N'FAMIA', CAST(N'1997-01-14T00:00:00.000' AS DateTime), CAST(N'1997-02-11T00:00:00.000' AS DateTime), CAST(N'1997-01-17T00:00:00.000' AS DateTime), NULL, N'Rua Orós, 92', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10422, N'FRANS', CAST(N'1997-01-22T00:00:00.000' AS DateTime), CAST(N'1997-02-19T00:00:00.000' AS DateTime), CAST(N'1997-01-31T00:00:00.000' AS DateTime), NULL, N'Via Monte Bianco 34', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10423, N'GOURL', CAST(N'1997-01-23T00:00:00.000' AS DateTime), CAST(N'1997-02-06T00:00:00.000' AS DateTime), CAST(N'1997-02-24T00:00:00.000' AS DateTime), NULL, N'Av. Brasil, 442', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10425, N'LAMAI', CAST(N'1997-01-24T00:00:00.000' AS DateTime), CAST(N'1997-02-21T00:00:00.000' AS DateTime), CAST(N'1997-02-14T00:00:00.000' AS DateTime), NULL, N'1 rue Alsace-Lorraine', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10426, N'GALED', CAST(N'1997-01-27T00:00:00.000' AS DateTime), CAST(N'1997-02-24T00:00:00.000' AS DateTime), CAST(N'1997-02-06T00:00:00.000' AS DateTime), NULL, N'Rambla de Cataluña, 23', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10430, N'ERNSH', CAST(N'1997-01-30T00:00:00.000' AS DateTime), CAST(N'1997-02-13T00:00:00.000' AS DateTime), CAST(N'1997-02-03T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10431, N'BOTTM', CAST(N'1997-01-30T00:00:00.000' AS DateTime), CAST(N'1997-02-13T00:00:00.000' AS DateTime), CAST(N'1997-02-07T00:00:00.000' AS DateTime), NULL, N'23 Tsawassen Blvd.', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10434, N'FOLKO', CAST(N'1997-02-03T00:00:00.000' AS DateTime), CAST(N'1997-03-03T00:00:00.000' AS DateTime), CAST(N'1997-02-13T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10435, N'CONSH', CAST(N'1997-02-04T00:00:00.000' AS DateTime), CAST(N'1997-03-18T00:00:00.000' AS DateTime), CAST(N'1997-02-07T00:00:00.000' AS DateTime), NULL, N'Berkeley Gardens 12  Brewery', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10436, N'BLONP', CAST(N'1997-02-05T00:00:00.000' AS DateTime), CAST(N'1997-03-05T00:00:00.000' AS DateTime), CAST(N'1997-02-11T00:00:00.000' AS DateTime), NULL, N'24, place Kléber', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10442, N'ERNSH', CAST(N'1997-02-11T00:00:00.000' AS DateTime), CAST(N'1997-03-11T00:00:00.000' AS DateTime), CAST(N'1997-02-18T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10444, N'BERGS', CAST(N'1997-02-12T00:00:00.000' AS DateTime), CAST(N'1997-03-12T00:00:00.000' AS DateTime), CAST(N'1997-02-21T00:00:00.000' AS DateTime), NULL, N'Berguvsvägen  8', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10445, N'BERGS', CAST(N'1997-02-13T00:00:00.000' AS DateTime), CAST(N'1997-03-13T00:00:00.000' AS DateTime), CAST(N'1997-02-20T00:00:00.000' AS DateTime), NULL, N'Berguvsvägen  8', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10449, N'BLONP', CAST(N'1997-02-18T00:00:00.000' AS DateTime), CAST(N'1997-03-18T00:00:00.000' AS DateTime), CAST(N'1997-02-27T00:00:00.000' AS DateTime), NULL, N'24, place Kléber', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10453, N'AROUT', CAST(N'1997-02-21T00:00:00.000' AS DateTime), CAST(N'1997-03-21T00:00:00.000' AS DateTime), CAST(N'1997-02-26T00:00:00.000' AS DateTime), NULL, N'Brook Farm Stratford St. Mary', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10454, N'LAMAI', CAST(N'1997-02-21T00:00:00.000' AS DateTime), CAST(N'1997-03-21T00:00:00.000' AS DateTime), CAST(N'1997-02-25T00:00:00.000' AS DateTime), NULL, N'1 rue Alsace-Lorraine', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10460, N'FOLKO', CAST(N'1997-02-28T00:00:00.000' AS DateTime), CAST(N'1997-03-28T00:00:00.000' AS DateTime), CAST(N'1997-03-03T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10462, N'CONSH', CAST(N'1997-03-03T00:00:00.000' AS DateTime), CAST(N'1997-03-31T00:00:00.000' AS DateTime), CAST(N'1997-03-18T00:00:00.000' AS DateTime), NULL, N'Berkeley Gardens 12  Brewery', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10464, N'FURIB', CAST(N'1997-03-04T00:00:00.000' AS DateTime), CAST(N'1997-04-01T00:00:00.000' AS DateTime), CAST(N'1997-03-14T00:00:00.000' AS DateTime), NULL, N'Jardim das rosas n. 32', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10466, N'COMMI', CAST(N'1997-03-06T00:00:00.000' AS DateTime), CAST(N'1997-04-03T00:00:00.000' AS DateTime), CAST(N'1997-03-13T00:00:00.000' AS DateTime), NULL, N'Av. dos Lusíadas, 23', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10470, N'BONAP', CAST(N'1997-03-11T00:00:00.000' AS DateTime), CAST(N'1997-04-08T00:00:00.000' AS DateTime), CAST(N'1997-03-14T00:00:00.000' AS DateTime), NULL, N'12, rue des Bouchers', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10471, N'BSBEV', CAST(N'1997-03-11T00:00:00.000' AS DateTime), CAST(N'1997-04-08T00:00:00.000' AS DateTime), CAST(N'1997-03-18T00:00:00.000' AS DateTime), NULL, N'Fauntleroy Circus', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10476, N'HILAA', CAST(N'1997-03-17T00:00:00.000' AS DateTime), CAST(N'1997-04-14T00:00:00.000' AS DateTime), CAST(N'1997-03-24T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10480, N'FOLIG', CAST(N'1997-03-20T00:00:00.000' AS DateTime), CAST(N'1997-04-17T00:00:00.000' AS DateTime), CAST(N'1997-03-24T00:00:00.000' AS DateTime), NULL, N'184, chaussée de Tournai', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10484, N'BSBEV', CAST(N'1997-03-24T00:00:00.000' AS DateTime), CAST(N'1997-04-21T00:00:00.000' AS DateTime), CAST(N'1997-04-01T00:00:00.000' AS DateTime), NULL, N'Fauntleroy Circus', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10486, N'HILAA', CAST(N'1997-03-26T00:00:00.000' AS DateTime), CAST(N'1997-04-23T00:00:00.000' AS DateTime), CAST(N'1997-04-02T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10488, N'FRANK', CAST(N'1997-03-27T00:00:00.000' AS DateTime), CAST(N'1997-04-24T00:00:00.000' AS DateTime), CAST(N'1997-04-02T00:00:00.000' AS DateTime), NULL, N'Berliner Platz 43', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10490, N'HILAA', CAST(N'1997-03-31T00:00:00.000' AS DateTime), CAST(N'1997-04-28T00:00:00.000' AS DateTime), CAST(N'1997-04-03T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10491, N'FURIB', CAST(N'1997-03-31T00:00:00.000' AS DateTime), CAST(N'1997-04-28T00:00:00.000' AS DateTime), CAST(N'1997-04-08T00:00:00.000' AS DateTime), NULL, N'Jardim das rosas n. 32', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10492, N'BOTTM', CAST(N'1997-04-01T00:00:00.000' AS DateTime), CAST(N'1997-04-29T00:00:00.000' AS DateTime), CAST(N'1997-04-11T00:00:00.000' AS DateTime), NULL, N'23 Tsawassen Blvd.', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10493, N'LAMAI', CAST(N'1997-04-02T00:00:00.000' AS DateTime), CAST(N'1997-04-30T00:00:00.000' AS DateTime), CAST(N'1997-04-10T00:00:00.000' AS DateTime), NULL, N'1 rue Alsace-Lorraine', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10494, N'COMMI', CAST(N'1997-04-02T00:00:00.000' AS DateTime), CAST(N'1997-04-30T00:00:00.000' AS DateTime), CAST(N'1997-04-09T00:00:00.000' AS DateTime), NULL, N'Av. dos Lusíadas, 23', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10495, N'LAUGB', CAST(N'1997-04-03T00:00:00.000' AS DateTime), CAST(N'1997-05-01T00:00:00.000' AS DateTime), CAST(N'1997-04-11T00:00:00.000' AS DateTime), NULL, N'2319 Elm St.', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10498, N'HILAA', CAST(N'1997-04-07T00:00:00.000' AS DateTime), CAST(N'1997-05-05T00:00:00.000' AS DateTime), CAST(N'1997-04-11T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10500, N'LAMAI', CAST(N'1997-04-09T00:00:00.000' AS DateTime), CAST(N'1997-05-07T00:00:00.000' AS DateTime), CAST(N'1997-04-17T00:00:00.000' AS DateTime), NULL, N'1 rue Alsace-Lorraine', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10501, N'BLAUS', CAST(N'1997-04-09T00:00:00.000' AS DateTime), CAST(N'1997-05-07T00:00:00.000' AS DateTime), CAST(N'1997-04-16T00:00:00.000' AS DateTime), NULL, N'Forsterstr. 57', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10507, N'ANTON', CAST(N'1997-04-15T00:00:00.000' AS DateTime), CAST(N'1997-05-13T00:00:00.000' AS DateTime), CAST(N'1997-04-22T00:00:00.000' AS DateTime), NULL, N'Mataderos  2312', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10509, N'BLAUS', CAST(N'1997-04-17T00:00:00.000' AS DateTime), CAST(N'1997-05-15T00:00:00.000' AS DateTime), CAST(N'1997-04-29T00:00:00.000' AS DateTime), NULL, N'Forsterstr. 57', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10511, N'BONAP', CAST(N'1997-04-18T00:00:00.000' AS DateTime), CAST(N'1997-05-16T00:00:00.000' AS DateTime), CAST(N'1997-04-21T00:00:00.000' AS DateTime), NULL, N'12, rue des Bouchers', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10512, N'FAMIA', CAST(N'1997-04-21T00:00:00.000' AS DateTime), CAST(N'1997-05-19T00:00:00.000' AS DateTime), CAST(N'1997-04-24T00:00:00.000' AS DateTime), NULL, N'Rua Orós, 92', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10514, N'ERNSH', CAST(N'1997-04-22T00:00:00.000' AS DateTime), CAST(N'1997-05-20T00:00:00.000' AS DateTime), CAST(N'1997-05-16T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'david', NULL)
GO
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10519, N'CHOPS', CAST(N'1997-04-28T00:00:00.000' AS DateTime), CAST(N'1997-05-26T00:00:00.000' AS DateTime), CAST(N'1997-05-01T00:00:00.000' AS DateTime), NULL, N'Hauptstr. 31', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10521, N'CACTU', CAST(N'1997-04-29T00:00:00.000' AS DateTime), CAST(N'1997-05-27T00:00:00.000' AS DateTime), CAST(N'1997-05-02T00:00:00.000' AS DateTime), NULL, N'Cerrito 333', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10524, N'BERGS', CAST(N'1997-05-01T00:00:00.000' AS DateTime), CAST(N'1997-05-29T00:00:00.000' AS DateTime), CAST(N'1997-05-07T00:00:00.000' AS DateTime), NULL, N'Berguvsvägen  8', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10525, N'BONAP', CAST(N'1997-05-02T00:00:00.000' AS DateTime), CAST(N'1997-05-30T00:00:00.000' AS DateTime), CAST(N'1997-05-23T00:00:00.000' AS DateTime), NULL, N'12, rue des Bouchers', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10528, N'GREAL', CAST(N'1997-05-06T00:00:00.000' AS DateTime), CAST(N'1997-05-20T00:00:00.000' AS DateTime), CAST(N'1997-05-09T00:00:00.000' AS DateTime), NULL, N'2732 Baker Blvd.', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10532, N'EASTC', CAST(N'1997-05-09T00:00:00.000' AS DateTime), CAST(N'1997-06-06T00:00:00.000' AS DateTime), CAST(N'1997-05-12T00:00:00.000' AS DateTime), NULL, N'35 King George', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10533, N'FOLKO', CAST(N'1997-05-12T00:00:00.000' AS DateTime), CAST(N'1997-06-09T00:00:00.000' AS DateTime), CAST(N'1997-05-22T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10535, N'ANTON', CAST(N'1997-05-13T00:00:00.000' AS DateTime), CAST(N'1997-06-10T00:00:00.000' AS DateTime), CAST(N'1997-05-21T00:00:00.000' AS DateTime), NULL, N'Mataderos  2312', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10538, N'BSBEV', CAST(N'1997-05-15T00:00:00.000' AS DateTime), CAST(N'1997-06-12T00:00:00.000' AS DateTime), CAST(N'1997-05-16T00:00:00.000' AS DateTime), NULL, N'Fauntleroy Circus', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10539, N'BSBEV', CAST(N'1997-05-16T00:00:00.000' AS DateTime), CAST(N'1997-06-13T00:00:00.000' AS DateTime), CAST(N'1997-05-23T00:00:00.000' AS DateTime), NULL, N'Fauntleroy Circus', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10541, N'HANAR', CAST(N'1997-05-19T00:00:00.000' AS DateTime), CAST(N'1997-06-16T00:00:00.000' AS DateTime), CAST(N'1997-05-29T00:00:00.000' AS DateTime), NULL, N'Rua do Paço, 67', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10550, N'GODOS', CAST(N'1997-05-28T00:00:00.000' AS DateTime), CAST(N'1997-06-25T00:00:00.000' AS DateTime), CAST(N'1997-06-06T00:00:00.000' AS DateTime), NULL, N'C/ Romero, 33', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10551, N'FURIB', CAST(N'1997-05-28T00:00:00.000' AS DateTime), CAST(N'1997-07-09T00:00:00.000' AS DateTime), CAST(N'1997-06-06T00:00:00.000' AS DateTime), NULL, N'Jardim das rosas n. 32', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10552, N'HILAA', CAST(N'1997-05-29T00:00:00.000' AS DateTime), CAST(N'1997-06-26T00:00:00.000' AS DateTime), CAST(N'1997-06-05T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10558, N'AROUT', CAST(N'1997-06-04T00:00:00.000' AS DateTime), CAST(N'1997-07-02T00:00:00.000' AS DateTime), CAST(N'1997-06-10T00:00:00.000' AS DateTime), NULL, N'Brook Farm Stratford St. Mary', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10559, N'BLONP', CAST(N'1997-06-05T00:00:00.000' AS DateTime), CAST(N'1997-07-03T00:00:00.000' AS DateTime), CAST(N'1997-06-13T00:00:00.000' AS DateTime), NULL, N'24, place Kléber', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10560, N'FRANK', CAST(N'1997-06-06T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime), CAST(N'1997-06-09T00:00:00.000' AS DateTime), NULL, N'Berliner Platz 43', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10561, N'FOLKO', CAST(N'1997-06-06T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime), CAST(N'1997-06-09T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10566, N'BLONP', CAST(N'1997-06-12T00:00:00.000' AS DateTime), CAST(N'1997-07-10T00:00:00.000' AS DateTime), CAST(N'1997-06-18T00:00:00.000' AS DateTime), NULL, N'24, place Kléber', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10568, N'GALED', CAST(N'1997-06-13T00:00:00.000' AS DateTime), CAST(N'1997-07-11T00:00:00.000' AS DateTime), CAST(N'1997-07-09T00:00:00.000' AS DateTime), NULL, N'Rambla de Cataluña, 23', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10571, N'ERNSH', CAST(N'1997-06-17T00:00:00.000' AS DateTime), CAST(N'1997-07-29T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10572, N'BERGS', CAST(N'1997-06-18T00:00:00.000' AS DateTime), CAST(N'1997-07-16T00:00:00.000' AS DateTime), CAST(N'1997-06-25T00:00:00.000' AS DateTime), NULL, N'Berguvsvägen  8', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10573, N'ANTON', CAST(N'1997-06-19T00:00:00.000' AS DateTime), CAST(N'1997-07-17T00:00:00.000' AS DateTime), CAST(N'1997-06-20T00:00:00.000' AS DateTime), NULL, N'Mataderos  2312', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10578, N'BSBEV', CAST(N'1997-06-24T00:00:00.000' AS DateTime), CAST(N'1997-07-22T00:00:00.000' AS DateTime), CAST(N'1997-07-25T00:00:00.000' AS DateTime), NULL, N'Fauntleroy Circus', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10581, N'FAMIA', CAST(N'1997-06-26T00:00:00.000' AS DateTime), CAST(N'1997-07-24T00:00:00.000' AS DateTime), CAST(N'1997-07-02T00:00:00.000' AS DateTime), NULL, N'Rua Orós, 92', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10582, N'BLAUS', CAST(N'1997-06-27T00:00:00.000' AS DateTime), CAST(N'1997-07-25T00:00:00.000' AS DateTime), CAST(N'1997-07-14T00:00:00.000' AS DateTime), NULL, N'Forsterstr. 57', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10584, N'BLONP', CAST(N'1997-06-30T00:00:00.000' AS DateTime), CAST(N'1997-07-28T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime), NULL, N'24, place Kléber', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10589, N'GREAL', CAST(N'1997-07-04T00:00:00.000' AS DateTime), CAST(N'1997-08-01T00:00:00.000' AS DateTime), CAST(N'1997-07-14T00:00:00.000' AS DateTime), NULL, N'2732 Baker Blvd.', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10595, N'ERNSH', CAST(N'1997-07-10T00:00:00.000' AS DateTime), CAST(N'1997-08-07T00:00:00.000' AS DateTime), CAST(N'1997-07-14T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10599, N'BSBEV', CAST(N'1997-07-15T00:00:00.000' AS DateTime), CAST(N'1997-08-26T00:00:00.000' AS DateTime), CAST(N'1997-07-21T00:00:00.000' AS DateTime), NULL, N'Fauntleroy Circus', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10601, N'HILAA', CAST(N'1997-07-16T00:00:00.000' AS DateTime), CAST(N'1997-08-27T00:00:00.000' AS DateTime), CAST(N'1997-07-22T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10604, N'FURIB', CAST(N'1997-07-18T00:00:00.000' AS DateTime), CAST(N'1997-08-15T00:00:00.000' AS DateTime), CAST(N'1997-07-29T00:00:00.000' AS DateTime), NULL, N'Jardim das rosas n. 32', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10609, N'DUMON', CAST(N'1997-07-24T00:00:00.000' AS DateTime), CAST(N'1997-08-21T00:00:00.000' AS DateTime), CAST(N'1997-07-30T00:00:00.000' AS DateTime), NULL, N'67, rue des Cinquante Otages', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10610, N'LAMAI', CAST(N'1997-07-25T00:00:00.000' AS DateTime), CAST(N'1997-08-22T00:00:00.000' AS DateTime), CAST(N'1997-08-06T00:00:00.000' AS DateTime), NULL, N'1 rue Alsace-Lorraine', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10613, N'HILAA', CAST(N'1997-07-29T00:00:00.000' AS DateTime), CAST(N'1997-08-26T00:00:00.000' AS DateTime), CAST(N'1997-08-01T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10614, N'BLAUS', CAST(N'1997-07-29T00:00:00.000' AS DateTime), CAST(N'1997-08-26T00:00:00.000' AS DateTime), CAST(N'1997-08-01T00:00:00.000' AS DateTime), NULL, N'Forsterstr. 57', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10616, N'GREAL', CAST(N'1997-07-31T00:00:00.000' AS DateTime), CAST(N'1997-08-28T00:00:00.000' AS DateTime), CAST(N'1997-08-05T00:00:00.000' AS DateTime), NULL, N'2732 Baker Blvd.', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10617, N'GREAL', CAST(N'1997-07-31T00:00:00.000' AS DateTime), CAST(N'1997-08-28T00:00:00.000' AS DateTime), CAST(N'1997-08-04T00:00:00.000' AS DateTime), NULL, N'2732 Baker Blvd.', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10620, N'LAUGB', CAST(N'1997-08-05T00:00:00.000' AS DateTime), CAST(N'1997-09-02T00:00:00.000' AS DateTime), CAST(N'1997-08-14T00:00:00.000' AS DateTime), NULL, N'2319 Elm St.', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10623, N'FRANK', CAST(N'1997-08-07T00:00:00.000' AS DateTime), CAST(N'1997-09-04T00:00:00.000' AS DateTime), CAST(N'1997-08-12T00:00:00.000' AS DateTime), NULL, N'Berliner Platz 43', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10625, N'ANATR', CAST(N'1997-08-08T00:00:00.000' AS DateTime), CAST(N'1997-09-05T00:00:00.000' AS DateTime), CAST(N'1997-08-14T00:00:00.000' AS DateTime), NULL, N'Avda. de la Constitución 2222', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10626, N'BERGS', CAST(N'1997-08-11T00:00:00.000' AS DateTime), CAST(N'1997-09-08T00:00:00.000' AS DateTime), CAST(N'1997-08-20T00:00:00.000' AS DateTime), NULL, N'Berguvsvägen  8', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10628, N'BLONP', CAST(N'1997-08-12T00:00:00.000' AS DateTime), CAST(N'1997-09-09T00:00:00.000' AS DateTime), CAST(N'1997-08-20T00:00:00.000' AS DateTime), NULL, N'24, place Kléber', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10629, N'GODOS', CAST(N'1997-08-12T00:00:00.000' AS DateTime), CAST(N'1997-09-09T00:00:00.000' AS DateTime), CAST(N'1997-08-20T00:00:00.000' AS DateTime), NULL, N'C/ Romero, 33', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10631, N'LAMAI', CAST(N'1997-08-14T00:00:00.000' AS DateTime), CAST(N'1997-09-11T00:00:00.000' AS DateTime), CAST(N'1997-08-15T00:00:00.000' AS DateTime), NULL, N'1 rue Alsace-Lorraine', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10633, N'ERNSH', CAST(N'1997-08-15T00:00:00.000' AS DateTime), CAST(N'1997-09-12T00:00:00.000' AS DateTime), CAST(N'1997-08-18T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10634, N'FOLIG', CAST(N'1997-08-15T00:00:00.000' AS DateTime), CAST(N'1997-09-12T00:00:00.000' AS DateTime), CAST(N'1997-08-21T00:00:00.000' AS DateTime), NULL, N'184, chaussée de Tournai', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10641, N'HILAA', CAST(N'1997-08-22T00:00:00.000' AS DateTime), CAST(N'1997-09-19T00:00:00.000' AS DateTime), CAST(N'1997-08-26T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10643, N'ALFKI', CAST(N'1997-08-25T00:00:00.000' AS DateTime), CAST(N'1997-09-22T00:00:00.000' AS DateTime), CAST(N'1997-09-02T00:00:00.000' AS DateTime), NULL, N'Obere Str. 57', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10645, N'HANAR', CAST(N'1997-08-26T00:00:00.000' AS DateTime), CAST(N'1997-09-23T00:00:00.000' AS DateTime), CAST(N'1997-09-02T00:00:00.000' AS DateTime), NULL, N'Rua do Paço, 67', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10650, N'FAMIA', CAST(N'1997-08-29T00:00:00.000' AS DateTime), CAST(N'1997-09-26T00:00:00.000' AS DateTime), CAST(N'1997-09-03T00:00:00.000' AS DateTime), NULL, N'Rua Orós, 92', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10652, N'GOURL', CAST(N'1997-09-01T00:00:00.000' AS DateTime), CAST(N'1997-09-29T00:00:00.000' AS DateTime), CAST(N'1997-09-08T00:00:00.000' AS DateTime), NULL, N'Av. Brasil, 442', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10653, N'FRANK', CAST(N'1997-09-02T00:00:00.000' AS DateTime), CAST(N'1997-09-30T00:00:00.000' AS DateTime), CAST(N'1997-09-19T00:00:00.000' AS DateTime), NULL, N'Berliner Platz 43', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10654, N'BERGS', CAST(N'1997-09-02T00:00:00.000' AS DateTime), CAST(N'1997-09-30T00:00:00.000' AS DateTime), CAST(N'1997-09-11T00:00:00.000' AS DateTime), NULL, N'Berguvsvägen  8', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10656, N'GREAL', CAST(N'1997-09-04T00:00:00.000' AS DateTime), CAST(N'1997-10-02T00:00:00.000' AS DateTime), CAST(N'1997-09-10T00:00:00.000' AS DateTime), NULL, N'2732 Baker Blvd.', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10663, N'BONAP', CAST(N'1997-09-10T00:00:00.000' AS DateTime), CAST(N'1997-09-24T00:00:00.000' AS DateTime), CAST(N'1997-10-03T00:00:00.000' AS DateTime), NULL, N'12, rue des Bouchers', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10664, N'FURIB', CAST(N'1997-09-10T00:00:00.000' AS DateTime), CAST(N'1997-10-08T00:00:00.000' AS DateTime), CAST(N'1997-09-19T00:00:00.000' AS DateTime), NULL, N'Jardim das rosas n. 32', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10667, N'ERNSH', CAST(N'1997-09-12T00:00:00.000' AS DateTime), CAST(N'1997-10-10T00:00:00.000' AS DateTime), CAST(N'1997-09-19T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10670, N'FRANK', CAST(N'1997-09-16T00:00:00.000' AS DateTime), CAST(N'1997-10-14T00:00:00.000' AS DateTime), CAST(N'1997-09-18T00:00:00.000' AS DateTime), NULL, N'Berliner Platz 43', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10671, N'FRANR', CAST(N'1997-09-17T00:00:00.000' AS DateTime), CAST(N'1997-10-15T00:00:00.000' AS DateTime), CAST(N'1997-09-24T00:00:00.000' AS DateTime), NULL, N'54, rue Royale', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10672, N'BERGS', CAST(N'1997-09-17T00:00:00.000' AS DateTime), CAST(N'1997-10-01T00:00:00.000' AS DateTime), CAST(N'1997-09-26T00:00:00.000' AS DateTime), NULL, N'Berguvsvägen  8', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10675, N'FRANK', CAST(N'1997-09-19T00:00:00.000' AS DateTime), CAST(N'1997-10-17T00:00:00.000' AS DateTime), CAST(N'1997-09-23T00:00:00.000' AS DateTime), NULL, N'Berliner Platz 43', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10677, N'ANTON', CAST(N'1997-09-22T00:00:00.000' AS DateTime), CAST(N'1997-10-20T00:00:00.000' AS DateTime), CAST(N'1997-09-26T00:00:00.000' AS DateTime), NULL, N'Mataderos  2312', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10679, N'BLONP', CAST(N'1997-09-23T00:00:00.000' AS DateTime), CAST(N'1997-10-21T00:00:00.000' AS DateTime), CAST(N'1997-09-30T00:00:00.000' AS DateTime), NULL, N'24, place Kléber', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10681, N'GREAL', CAST(N'1997-09-25T00:00:00.000' AS DateTime), CAST(N'1997-10-23T00:00:00.000' AS DateTime), CAST(N'1997-09-30T00:00:00.000' AS DateTime), NULL, N'2732 Baker Blvd.', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10682, N'ANTON', CAST(N'1997-09-25T00:00:00.000' AS DateTime), CAST(N'1997-10-23T00:00:00.000' AS DateTime), CAST(N'1997-10-01T00:00:00.000' AS DateTime), NULL, N'Mataderos  2312', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10683, N'DUMON', CAST(N'1997-09-26T00:00:00.000' AS DateTime), CAST(N'1997-10-24T00:00:00.000' AS DateTime), CAST(N'1997-10-01T00:00:00.000' AS DateTime), NULL, N'67, rue des Cinquante Otages', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10685, N'GOURL', CAST(N'1997-09-29T00:00:00.000' AS DateTime), CAST(N'1997-10-13T00:00:00.000' AS DateTime), CAST(N'1997-10-03T00:00:00.000' AS DateTime), NULL, N'Av. Brasil, 442', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10689, N'BERGS', CAST(N'1997-10-01T00:00:00.000' AS DateTime), CAST(N'1997-10-29T00:00:00.000' AS DateTime), CAST(N'1997-10-07T00:00:00.000' AS DateTime), NULL, N'Berguvsvägen  8', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10690, N'HANAR', CAST(N'1997-10-02T00:00:00.000' AS DateTime), CAST(N'1997-10-30T00:00:00.000' AS DateTime), CAST(N'1997-10-03T00:00:00.000' AS DateTime), NULL, N'Rua do Paço, 67', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10692, N'ALFKI', CAST(N'1997-10-03T00:00:00.000' AS DateTime), CAST(N'1997-10-31T00:00:00.000' AS DateTime), CAST(N'1997-10-13T00:00:00.000' AS DateTime), NULL, N'Obere Str. 57', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10698, N'ERNSH', CAST(N'1997-10-09T00:00:00.000' AS DateTime), CAST(N'1997-11-06T00:00:00.000' AS DateTime), CAST(N'1997-10-17T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10702, N'ALFKI', CAST(N'1997-10-13T00:00:00.000' AS DateTime), CAST(N'1997-11-24T00:00:00.000' AS DateTime), CAST(N'1997-10-21T00:00:00.000' AS DateTime), NULL, N'Obere Str. 57', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10703, N'FOLKO', CAST(N'1997-10-14T00:00:00.000' AS DateTime), CAST(N'1997-11-11T00:00:00.000' AS DateTime), CAST(N'1997-10-20T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10705, N'HILAA', CAST(N'1997-10-15T00:00:00.000' AS DateTime), CAST(N'1997-11-12T00:00:00.000' AS DateTime), CAST(N'1997-11-18T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10707, N'AROUT', CAST(N'1997-10-16T00:00:00.000' AS DateTime), CAST(N'1997-10-30T00:00:00.000' AS DateTime), CAST(N'1997-10-23T00:00:00.000' AS DateTime), NULL, N'Brook Farm Stratford St. Mary', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10709, N'GOURL', CAST(N'1997-10-17T00:00:00.000' AS DateTime), CAST(N'1997-11-14T00:00:00.000' AS DateTime), CAST(N'1997-11-20T00:00:00.000' AS DateTime), NULL, N'Av. Brasil, 442', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10710, N'FRANS', CAST(N'1997-10-20T00:00:00.000' AS DateTime), CAST(N'1997-11-17T00:00:00.000' AS DateTime), CAST(N'1997-10-23T00:00:00.000' AS DateTime), NULL, N'Via Monte Bianco 34', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10715, N'BONAP', CAST(N'1997-10-23T00:00:00.000' AS DateTime), CAST(N'1997-11-06T00:00:00.000' AS DateTime), CAST(N'1997-10-29T00:00:00.000' AS DateTime), NULL, N'12, rue des Bouchers', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10717, N'FRANK', CAST(N'1997-10-24T00:00:00.000' AS DateTime), CAST(N'1997-11-21T00:00:00.000' AS DateTime), CAST(N'1997-10-29T00:00:00.000' AS DateTime), NULL, N'Berliner Platz 43', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10725, N'FAMIA', CAST(N'1997-10-31T00:00:00.000' AS DateTime), CAST(N'1997-11-28T00:00:00.000' AS DateTime), CAST(N'1997-11-05T00:00:00.000' AS DateTime), NULL, N'Rua Orós, 92', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10726, N'EASTC', CAST(N'1997-11-03T00:00:00.000' AS DateTime), CAST(N'1997-11-17T00:00:00.000' AS DateTime), CAST(N'1997-12-05T00:00:00.000' AS DateTime), NULL, N'35 King George', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10730, N'BONAP', CAST(N'1997-11-05T00:00:00.000' AS DateTime), CAST(N'1997-12-03T00:00:00.000' AS DateTime), CAST(N'1997-11-14T00:00:00.000' AS DateTime), NULL, N'12, rue des Bouchers', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10731, N'CHOPS', CAST(N'1997-11-06T00:00:00.000' AS DateTime), CAST(N'1997-12-04T00:00:00.000' AS DateTime), CAST(N'1997-11-14T00:00:00.000' AS DateTime), NULL, N'Hauptstr. 31', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10732, N'BONAP', CAST(N'1997-11-06T00:00:00.000' AS DateTime), CAST(N'1997-12-04T00:00:00.000' AS DateTime), CAST(N'1997-11-07T00:00:00.000' AS DateTime), NULL, N'12, rue des Bouchers', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10733, N'BERGS', CAST(N'1997-11-07T00:00:00.000' AS DateTime), CAST(N'1997-12-05T00:00:00.000' AS DateTime), CAST(N'1997-11-10T00:00:00.000' AS DateTime), NULL, N'Berguvsvägen  8', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10734, N'GOURL', CAST(N'1997-11-07T00:00:00.000' AS DateTime), CAST(N'1997-12-05T00:00:00.000' AS DateTime), CAST(N'1997-11-12T00:00:00.000' AS DateTime), NULL, N'Av. Brasil, 442', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10741, N'AROUT', CAST(N'1997-11-14T00:00:00.000' AS DateTime), CAST(N'1997-11-28T00:00:00.000' AS DateTime), CAST(N'1997-11-18T00:00:00.000' AS DateTime), NULL, N'Brook Farm Stratford St. Mary', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10742, N'BOTTM', CAST(N'1997-11-14T00:00:00.000' AS DateTime), CAST(N'1997-12-12T00:00:00.000' AS DateTime), CAST(N'1997-11-18T00:00:00.000' AS DateTime), NULL, N'23 Tsawassen Blvd.', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10743, N'AROUT', CAST(N'1997-11-17T00:00:00.000' AS DateTime), CAST(N'1997-12-15T00:00:00.000' AS DateTime), CAST(N'1997-11-21T00:00:00.000' AS DateTime), NULL, N'Brook Farm Stratford St. Mary', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10746, N'CHOPS', CAST(N'1997-11-19T00:00:00.000' AS DateTime), CAST(N'1997-12-17T00:00:00.000' AS DateTime), CAST(N'1997-11-21T00:00:00.000' AS DateTime), NULL, N'Hauptstr. 31', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10753, N'FRANS', CAST(N'1997-11-25T00:00:00.000' AS DateTime), CAST(N'1997-12-23T00:00:00.000' AS DateTime), CAST(N'1997-11-27T00:00:00.000' AS DateTime), NULL, N'Via Monte Bianco 34', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10755, N'BONAP', CAST(N'1997-11-26T00:00:00.000' AS DateTime), CAST(N'1997-12-24T00:00:00.000' AS DateTime), CAST(N'1997-11-28T00:00:00.000' AS DateTime), NULL, N'12, rue des Bouchers', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10759, N'ANATR', CAST(N'1997-11-28T00:00:00.000' AS DateTime), CAST(N'1997-12-26T00:00:00.000' AS DateTime), CAST(N'1997-12-12T00:00:00.000' AS DateTime), NULL, N'Avda. de la Constitución 2222', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10762, N'FOLKO', CAST(N'1997-12-02T00:00:00.000' AS DateTime), CAST(N'1997-12-30T00:00:00.000' AS DateTime), CAST(N'1997-12-09T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10763, N'FOLIG', CAST(N'1997-12-03T00:00:00.000' AS DateTime), CAST(N'1997-12-31T00:00:00.000' AS DateTime), CAST(N'1997-12-08T00:00:00.000' AS DateTime), NULL, N'184, chaussée de Tournai', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10764, N'ERNSH', CAST(N'1997-12-03T00:00:00.000' AS DateTime), CAST(N'1997-12-31T00:00:00.000' AS DateTime), CAST(N'1997-12-08T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10768, N'AROUT', CAST(N'1997-12-08T00:00:00.000' AS DateTime), CAST(N'1998-01-05T00:00:00.000' AS DateTime), CAST(N'1997-12-15T00:00:00.000' AS DateTime), NULL, N'Brook Farm Stratford St. Mary', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10770, N'HANAR', CAST(N'1997-12-09T00:00:00.000' AS DateTime), CAST(N'1998-01-06T00:00:00.000' AS DateTime), CAST(N'1997-12-17T00:00:00.000' AS DateTime), NULL, N'Rua do Paço, 67', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10771, N'ERNSH', CAST(N'1997-12-10T00:00:00.000' AS DateTime), CAST(N'1998-01-07T00:00:00.000' AS DateTime), CAST(N'1998-01-02T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
GO
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10773, N'ERNSH', CAST(N'1997-12-11T00:00:00.000' AS DateTime), CAST(N'1998-01-08T00:00:00.000' AS DateTime), CAST(N'1997-12-16T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10774, N'FOLKO', CAST(N'1997-12-11T00:00:00.000' AS DateTime), CAST(N'1997-12-25T00:00:00.000' AS DateTime), CAST(N'1997-12-12T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10776, N'ERNSH', CAST(N'1997-12-15T00:00:00.000' AS DateTime), CAST(N'1998-01-12T00:00:00.000' AS DateTime), CAST(N'1997-12-18T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10777, N'GOURL', CAST(N'1997-12-15T00:00:00.000' AS DateTime), CAST(N'1997-12-29T00:00:00.000' AS DateTime), CAST(N'1998-01-21T00:00:00.000' AS DateTime), NULL, N'Av. Brasil, 442', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10778, N'BERGS', CAST(N'1997-12-16T00:00:00.000' AS DateTime), CAST(N'1998-01-13T00:00:00.000' AS DateTime), CAST(N'1997-12-24T00:00:00.000' AS DateTime), NULL, N'Berguvsvägen  8', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10782, N'CACTU', CAST(N'1997-12-17T00:00:00.000' AS DateTime), CAST(N'1998-01-14T00:00:00.000' AS DateTime), CAST(N'1997-12-22T00:00:00.000' AS DateTime), NULL, N'Cerrito 333', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10783, N'HANAR', CAST(N'1997-12-18T00:00:00.000' AS DateTime), CAST(N'1998-01-15T00:00:00.000' AS DateTime), CAST(N'1997-12-19T00:00:00.000' AS DateTime), NULL, N'Rua do Paço, 67', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10785, N'GROSR', CAST(N'1997-12-18T00:00:00.000' AS DateTime), CAST(N'1998-01-15T00:00:00.000' AS DateTime), CAST(N'1997-12-24T00:00:00.000' AS DateTime), NULL, N'5ª Ave. Los Palos Grandes', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10787, N'LAMAI', CAST(N'1997-12-19T00:00:00.000' AS DateTime), CAST(N'1998-01-02T00:00:00.000' AS DateTime), CAST(N'1997-12-26T00:00:00.000' AS DateTime), NULL, N'1 rue Alsace-Lorraine', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10789, N'FOLIG', CAST(N'1997-12-22T00:00:00.000' AS DateTime), CAST(N'1998-01-19T00:00:00.000' AS DateTime), CAST(N'1997-12-31T00:00:00.000' AS DateTime), NULL, N'184, chaussée de Tournai', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10790, N'GOURL', CAST(N'1997-12-22T00:00:00.000' AS DateTime), CAST(N'1998-01-19T00:00:00.000' AS DateTime), CAST(N'1997-12-26T00:00:00.000' AS DateTime), NULL, N'Av. Brasil, 442', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10791, N'FRANK', CAST(N'1997-12-23T00:00:00.000' AS DateTime), CAST(N'1998-01-20T00:00:00.000' AS DateTime), CAST(N'1998-01-01T00:00:00.000' AS DateTime), NULL, N'Berliner Platz 43', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10793, N'AROUT', CAST(N'1997-12-24T00:00:00.000' AS DateTime), CAST(N'1998-01-21T00:00:00.000' AS DateTime), CAST(N'1998-01-08T00:00:00.000' AS DateTime), NULL, N'Brook Farm Stratford St. Mary', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10795, N'ERNSH', CAST(N'1997-12-24T00:00:00.000' AS DateTime), CAST(N'1998-01-21T00:00:00.000' AS DateTime), CAST(N'1998-01-20T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10796, N'HILAA', CAST(N'1997-12-25T00:00:00.000' AS DateTime), CAST(N'1998-01-22T00:00:00.000' AS DateTime), CAST(N'1998-01-14T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10797, N'DRACD', CAST(N'1997-12-25T00:00:00.000' AS DateTime), CAST(N'1998-01-22T00:00:00.000' AS DateTime), CAST(N'1998-01-05T00:00:00.000' AS DateTime), NULL, N'Walserweg 21', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10801, N'BOLID', CAST(N'1997-12-29T00:00:00.000' AS DateTime), CAST(N'1998-01-26T00:00:00.000' AS DateTime), CAST(N'1997-12-31T00:00:00.000' AS DateTime), NULL, N'C/ Araquil, 67', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10807, N'FRANS', CAST(N'1997-12-31T00:00:00.000' AS DateTime), CAST(N'1998-01-28T00:00:00.000' AS DateTime), CAST(N'1998-01-30T00:00:00.000' AS DateTime), NULL, N'Via Monte Bianco 34', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10810, N'LAUGB', CAST(N'1998-01-01T00:00:00.000' AS DateTime), CAST(N'1998-01-29T00:00:00.000' AS DateTime), CAST(N'1998-01-07T00:00:00.000' AS DateTime), NULL, N'2319 Elm St.', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10816, N'GREAL', CAST(N'1998-01-06T00:00:00.000' AS DateTime), CAST(N'1998-02-03T00:00:00.000' AS DateTime), CAST(N'1998-02-04T00:00:00.000' AS DateTime), NULL, N'2732 Baker Blvd.', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10819, N'CACTU', CAST(N'1998-01-07T00:00:00.000' AS DateTime), CAST(N'1998-02-04T00:00:00.000' AS DateTime), CAST(N'1998-01-16T00:00:00.000' AS DateTime), NULL, N'Cerrito 333', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10824, N'FOLKO', CAST(N'1998-01-09T00:00:00.000' AS DateTime), CAST(N'1998-02-06T00:00:00.000' AS DateTime), CAST(N'1998-01-30T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10825, N'DRACD', CAST(N'1998-01-09T00:00:00.000' AS DateTime), CAST(N'1998-02-06T00:00:00.000' AS DateTime), CAST(N'1998-01-14T00:00:00.000' AS DateTime), NULL, N'Walserweg 21', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10826, N'BLONP', CAST(N'1998-01-12T00:00:00.000' AS DateTime), CAST(N'1998-02-09T00:00:00.000' AS DateTime), CAST(N'1998-02-06T00:00:00.000' AS DateTime), NULL, N'24, place Kléber', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10827, N'BONAP', CAST(N'1998-01-12T00:00:00.000' AS DateTime), CAST(N'1998-01-26T00:00:00.000' AS DateTime), CAST(N'1998-02-06T00:00:00.000' AS DateTime), NULL, N'12, rue des Bouchers', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10832, N'LAMAI', CAST(N'1998-01-14T00:00:00.000' AS DateTime), CAST(N'1998-02-11T00:00:00.000' AS DateTime), CAST(N'1998-01-19T00:00:00.000' AS DateTime), NULL, N'1 rue Alsace-Lorraine', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10835, N'ALFKI', CAST(N'1998-01-15T00:00:00.000' AS DateTime), CAST(N'1998-02-12T00:00:00.000' AS DateTime), CAST(N'1998-01-21T00:00:00.000' AS DateTime), NULL, N'Obere Str. 57', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10836, N'ERNSH', CAST(N'1998-01-16T00:00:00.000' AS DateTime), CAST(N'1998-02-13T00:00:00.000' AS DateTime), CAST(N'1998-01-21T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10837, N'BERGS', CAST(N'1998-01-16T00:00:00.000' AS DateTime), CAST(N'1998-02-13T00:00:00.000' AS DateTime), CAST(N'1998-01-23T00:00:00.000' AS DateTime), NULL, N'Berguvsvägen  8', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10848, N'CONSH', CAST(N'1998-01-23T00:00:00.000' AS DateTime), CAST(N'1998-02-20T00:00:00.000' AS DateTime), CAST(N'1998-01-29T00:00:00.000' AS DateTime), NULL, N'Berkeley Gardens 12  Brewery', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10853, N'BLAUS', CAST(N'1998-01-27T00:00:00.000' AS DateTime), CAST(N'1998-02-24T00:00:00.000' AS DateTime), CAST(N'1998-02-03T00:00:00.000' AS DateTime), NULL, N'Forsterstr. 57', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10854, N'ERNSH', CAST(N'1998-01-27T00:00:00.000' AS DateTime), CAST(N'1998-02-24T00:00:00.000' AS DateTime), CAST(N'1998-02-05T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10856, N'ANTON', CAST(N'1998-01-28T00:00:00.000' AS DateTime), CAST(N'1998-02-25T00:00:00.000' AS DateTime), CAST(N'1998-02-10T00:00:00.000' AS DateTime), NULL, N'Mataderos  2312', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10857, N'BERGS', CAST(N'1998-01-28T00:00:00.000' AS DateTime), CAST(N'1998-02-25T00:00:00.000' AS DateTime), CAST(N'1998-02-06T00:00:00.000' AS DateTime), NULL, N'Berguvsvägen  8', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10859, N'FRANK', CAST(N'1998-01-29T00:00:00.000' AS DateTime), CAST(N'1998-02-26T00:00:00.000' AS DateTime), CAST(N'1998-02-02T00:00:00.000' AS DateTime), NULL, N'Berliner Platz 43', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10860, N'FRANR', CAST(N'1998-01-29T00:00:00.000' AS DateTime), CAST(N'1998-02-26T00:00:00.000' AS DateTime), CAST(N'1998-02-04T00:00:00.000' AS DateTime), NULL, N'54, rue Royale', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10863, N'HILAA', CAST(N'1998-02-02T00:00:00.000' AS DateTime), CAST(N'1998-03-02T00:00:00.000' AS DateTime), CAST(N'1998-02-17T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10864, N'AROUT', CAST(N'1998-02-02T00:00:00.000' AS DateTime), CAST(N'1998-03-02T00:00:00.000' AS DateTime), CAST(N'1998-02-09T00:00:00.000' AS DateTime), NULL, N'Brook Farm Stratford St. Mary', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10866, N'BERGS', CAST(N'1998-02-03T00:00:00.000' AS DateTime), CAST(N'1998-03-03T00:00:00.000' AS DateTime), CAST(N'1998-02-12T00:00:00.000' AS DateTime), NULL, N'Berguvsvägen  8', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10871, N'BONAP', CAST(N'1998-02-05T00:00:00.000' AS DateTime), CAST(N'1998-03-05T00:00:00.000' AS DateTime), CAST(N'1998-02-10T00:00:00.000' AS DateTime), NULL, N'12, rue des Bouchers', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10872, N'GODOS', CAST(N'1998-02-05T00:00:00.000' AS DateTime), CAST(N'1998-03-05T00:00:00.000' AS DateTime), CAST(N'1998-02-09T00:00:00.000' AS DateTime), NULL, N'C/ Romero, 33', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10874, N'GODOS', CAST(N'1998-02-06T00:00:00.000' AS DateTime), CAST(N'1998-03-06T00:00:00.000' AS DateTime), CAST(N'1998-02-11T00:00:00.000' AS DateTime), NULL, N'C/ Romero, 33', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10875, N'BERGS', CAST(N'1998-02-06T00:00:00.000' AS DateTime), CAST(N'1998-03-06T00:00:00.000' AS DateTime), CAST(N'1998-03-03T00:00:00.000' AS DateTime), NULL, N'Berguvsvägen  8', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10876, N'BONAP', CAST(N'1998-02-09T00:00:00.000' AS DateTime), CAST(N'1998-03-09T00:00:00.000' AS DateTime), CAST(N'1998-02-12T00:00:00.000' AS DateTime), NULL, N'12, rue des Bouchers', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10880, N'FOLKO', CAST(N'1998-02-10T00:00:00.000' AS DateTime), CAST(N'1998-03-24T00:00:00.000' AS DateTime), CAST(N'1998-02-18T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10881, N'CACTU', CAST(N'1998-02-11T00:00:00.000' AS DateTime), CAST(N'1998-03-11T00:00:00.000' AS DateTime), CAST(N'1998-02-18T00:00:00.000' AS DateTime), NULL, N'Cerrito 333', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10886, N'HANAR', CAST(N'1998-02-13T00:00:00.000' AS DateTime), CAST(N'1998-03-13T00:00:00.000' AS DateTime), CAST(N'1998-03-02T00:00:00.000' AS DateTime), NULL, N'Rua do Paço, 67', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10887, N'GALED', CAST(N'1998-02-13T00:00:00.000' AS DateTime), CAST(N'1998-03-13T00:00:00.000' AS DateTime), CAST(N'1998-02-16T00:00:00.000' AS DateTime), NULL, N'Rambla de Cataluña, 23', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10888, N'GODOS', CAST(N'1998-02-16T00:00:00.000' AS DateTime), CAST(N'1998-03-16T00:00:00.000' AS DateTime), CAST(N'1998-02-23T00:00:00.000' AS DateTime), NULL, N'C/ Romero, 33', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10890, N'DUMON', CAST(N'1998-02-16T00:00:00.000' AS DateTime), CAST(N'1998-03-16T00:00:00.000' AS DateTime), CAST(N'1998-02-18T00:00:00.000' AS DateTime), NULL, N'67, rue des Cinquante Otages', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10895, N'ERNSH', CAST(N'1998-02-18T00:00:00.000' AS DateTime), CAST(N'1998-03-18T00:00:00.000' AS DateTime), CAST(N'1998-02-23T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10901, N'HILAA', CAST(N'1998-02-23T00:00:00.000' AS DateTime), CAST(N'1998-03-23T00:00:00.000' AS DateTime), CAST(N'1998-02-26T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10902, N'FOLKO', CAST(N'1998-02-23T00:00:00.000' AS DateTime), CAST(N'1998-03-23T00:00:00.000' AS DateTime), CAST(N'1998-03-03T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10903, N'HANAR', CAST(N'1998-02-24T00:00:00.000' AS DateTime), CAST(N'1998-03-24T00:00:00.000' AS DateTime), CAST(N'1998-03-04T00:00:00.000' AS DateTime), NULL, N'Rua do Paço, 67', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10911, N'GODOS', CAST(N'1998-02-26T00:00:00.000' AS DateTime), CAST(N'1998-03-26T00:00:00.000' AS DateTime), CAST(N'1998-03-05T00:00:00.000' AS DateTime), NULL, N'C/ Romero, 33', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10918, N'BOTTM', CAST(N'1998-03-02T00:00:00.000' AS DateTime), CAST(N'1998-03-30T00:00:00.000' AS DateTime), CAST(N'1998-03-11T00:00:00.000' AS DateTime), NULL, N'23 Tsawassen Blvd.', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10920, N'AROUT', CAST(N'1998-03-03T00:00:00.000' AS DateTime), CAST(N'1998-03-31T00:00:00.000' AS DateTime), CAST(N'1998-03-09T00:00:00.000' AS DateTime), NULL, N'Brook Farm Stratford St. Mary', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10922, N'HANAR', CAST(N'1998-03-03T00:00:00.000' AS DateTime), CAST(N'1998-03-31T00:00:00.000' AS DateTime), CAST(N'1998-03-05T00:00:00.000' AS DateTime), NULL, N'Rua do Paço, 67', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10923, N'LAMAI', CAST(N'1998-03-03T00:00:00.000' AS DateTime), CAST(N'1998-04-14T00:00:00.000' AS DateTime), CAST(N'1998-03-13T00:00:00.000' AS DateTime), NULL, N'1 rue Alsace-Lorraine', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10924, N'BERGS', CAST(N'1998-03-04T00:00:00.000' AS DateTime), CAST(N'1998-04-01T00:00:00.000' AS DateTime), CAST(N'1998-04-08T00:00:00.000' AS DateTime), NULL, N'Berguvsvägen  8', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10925, N'HANAR', CAST(N'1998-03-04T00:00:00.000' AS DateTime), CAST(N'1998-04-01T00:00:00.000' AS DateTime), CAST(N'1998-03-13T00:00:00.000' AS DateTime), NULL, N'Rua do Paço, 67', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10926, N'ANATR', CAST(N'1998-03-04T00:00:00.000' AS DateTime), CAST(N'1998-04-01T00:00:00.000' AS DateTime), CAST(N'1998-03-11T00:00:00.000' AS DateTime), NULL, N'Avda. de la Constitución 2222', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10928, N'GALED', CAST(N'1998-03-05T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime), CAST(N'1998-03-18T00:00:00.000' AS DateTime), NULL, N'Rambla de Cataluña, 23', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10929, N'FRANK', CAST(N'1998-03-05T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime), CAST(N'1998-03-12T00:00:00.000' AS DateTime), NULL, N'Berliner Platz 43', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10932, N'BONAP', CAST(N'1998-03-06T00:00:00.000' AS DateTime), CAST(N'1998-04-03T00:00:00.000' AS DateTime), CAST(N'1998-03-24T00:00:00.000' AS DateTime), NULL, N'12, rue des Bouchers', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10936, N'GREAL', CAST(N'1998-03-09T00:00:00.000' AS DateTime), CAST(N'1998-04-06T00:00:00.000' AS DateTime), CAST(N'1998-03-18T00:00:00.000' AS DateTime), NULL, N'2732 Baker Blvd.', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10937, N'CACTU', CAST(N'1998-03-10T00:00:00.000' AS DateTime), CAST(N'1998-03-24T00:00:00.000' AS DateTime), CAST(N'1998-03-13T00:00:00.000' AS DateTime), NULL, N'Cerrito 333', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10940, N'BONAP', CAST(N'1998-03-11T00:00:00.000' AS DateTime), CAST(N'1998-04-08T00:00:00.000' AS DateTime), CAST(N'1998-03-23T00:00:00.000' AS DateTime), NULL, N'12, rue des Bouchers', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10943, N'BSBEV', CAST(N'1998-03-11T00:00:00.000' AS DateTime), CAST(N'1998-04-08T00:00:00.000' AS DateTime), CAST(N'1998-03-19T00:00:00.000' AS DateTime), NULL, N'Fauntleroy Circus', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10944, N'BOTTM', CAST(N'1998-03-12T00:00:00.000' AS DateTime), CAST(N'1998-03-26T00:00:00.000' AS DateTime), CAST(N'1998-03-13T00:00:00.000' AS DateTime), NULL, N'23 Tsawassen Blvd.', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10947, N'BSBEV', CAST(N'1998-03-13T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime), CAST(N'1998-03-16T00:00:00.000' AS DateTime), NULL, N'Fauntleroy Circus', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10948, N'GODOS', CAST(N'1998-03-13T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime), CAST(N'
1998-03-19T00:00:00.000' AS DateTime), NULL, N'C/ Romero, 33', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10949, N'BOTTM', CAST(N'1998-03-13T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime), CAST(N'1998-03-17T00:00:00.000' AS DateTime), NULL, N'23 Tsawassen Blvd.', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10952, N'ALFKI', CAST(N'1998-03-16T00:00:00.000' AS DateTime), CAST(N'1998-04-27T00:00:00.000' AS DateTime), CAST(N'1998-03-24T00:00:00.000' AS DateTime), NULL, N'Obere Str. 57', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10953, N'AROUT', CAST(N'1998-03-16T00:00:00.000' AS DateTime), CAST(N'1998-03-30T00:00:00.000' AS DateTime), CAST(N'1998-03-25T00:00:00.000' AS DateTime), NULL, N'Brook Farm Stratford St. Mary', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10955, N'FOLKO', CAST(N'1998-03-17T00:00:00.000' AS DateTime), CAST(N'1998-04-14T00:00:00.000' AS DateTime), CAST(N'1998-03-20T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10956, N'BLAUS', CAST(N'1998-03-17T00:00:00.000' AS DateTime), CAST(N'1998-04-28T00:00:00.000' AS DateTime), CAST(N'1998-03-20T00:00:00.000' AS DateTime), NULL, N'Forsterstr. 57', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10957, N'HILAA', CAST(N'1998-03-18T00:00:00.000' AS DateTime), CAST(N'1998-04-15T00:00:00.000' AS DateTime), CAST(N'1998-03-27T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10959, N'GOURL', CAST(N'1998-03-18T00:00:00.000' AS DateTime), CAST(N'1998-04-29T00:00:00.000' AS DateTime), CAST(N'1998-03-23T00:00:00.000' AS DateTime), NULL, N'Av. Brasil, 442', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10960, N'HILAA', CAST(N'1998-03-19T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime), CAST(N'1998-04-08T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10963, N'FURIB', CAST(N'1998-03-19T00:00:00.000' AS DateTime), CAST(N'1998-04-16T00:00:00.000' AS DateTime), CAST(N'1998-03-26T00:00:00.000' AS DateTime), NULL, N'Jardim das rosas n. 32', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10966, N'CHOPS', CAST(N'1998-03-20T00:00:00.000' AS DateTime), CAST(N'1998-04-17T00:00:00.000' AS DateTime), CAST(N'1998-04-08T00:00:00.000' AS DateTime), NULL, N'Hauptstr. 31', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10968, N'ERNSH', CAST(N'1998-03-23T00:00:00.000' AS DateTime), CAST(N'1998-04-20T00:00:00.000' AS DateTime), CAST(N'1998-04-01T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10969, N'COMMI', CAST(N'1998-03-23T00:00:00.000' AS DateTime), CAST(N'1998-04-20T00:00:00.000' AS DateTime), CAST(N'1998-03-30T00:00:00.000' AS DateTime), NULL, N'Av. dos Lusíadas, 23', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10970, N'BOLID', CAST(N'1998-03-24T00:00:00.000' AS DateTime), CAST(N'1998-04-07T00:00:00.000' AS DateTime), CAST(N'1998-04-24T00:00:00.000' AS DateTime), NULL, N'C/ Araquil, 67', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10971, N'FRANR', CAST(N'1998-03-24T00:00:00.000' AS DateTime), CAST(N'1998-04-21T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime), NULL, N'54, rue Royale', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10975, N'BOTTM', CAST(N'1998-03-25T00:00:00.000' AS DateTime), CAST(N'1998-04-22T00:00:00.000' AS DateTime), CAST(N'1998-03-27T00:00:00.000' AS DateTime), NULL, N'23 Tsawassen Blvd.', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10976, N'HILAA', CAST(N'1998-03-25T00:00:00.000' AS DateTime), CAST(N'1998-05-06T00:00:00.000' AS DateTime), CAST(N'1998-04-03T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10977, N'FOLKO', CAST(N'1998-03-26T00:00:00.000' AS DateTime), CAST(N'1998-04-23T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10979, N'ERNSH', CAST(N'1998-03-26T00:00:00.000' AS DateTime), CAST(N'1998-04-23T00:00:00.000' AS DateTime), CAST(N'1998-03-31T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10980, N'FOLKO', CAST(N'1998-03-27T00:00:00.000' AS DateTime), CAST(N'1998-05-08T00:00:00.000' AS DateTime), CAST(N'1998-04-17T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10981, N'HANAR', CAST(N'1998-03-27T00:00:00.000' AS DateTime), CAST(N'1998-04-24T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime), NULL, N'Rua do Paço, 67', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10982, N'BOTTM', CAST(N'1998-03-27T00:00:00.000' AS DateTime), CAST(N'1998-04-24T00:00:00.000' AS DateTime), CAST(N'1998-04-08T00:00:00.000' AS DateTime), NULL, N'23 Tsawassen Blvd.', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10987, N'EASTC', CAST(N'1998-03-31T00:00:00.000' AS DateTime), CAST(N'1998-04-28T00:00:00.000' AS DateTime), CAST(N'1998-04-06T00:00:00.000' AS DateTime), NULL, N'35 King George', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10990, N'ERNSH', CAST(N'1998-04-01T00:00:00.000' AS DateTime), CAST(N'1998-05-13T00:00:00.000' AS DateTime), CAST(N'1998-04-07T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10993, N'FOLKO', CAST(N'1998-04-01T00:00:00.000' AS DateTime), CAST(N'1998-04-29T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11001, N'FOLKO', CAST(N'1998-04-06T00:00:00.000' AS DateTime), CAST(N'1998-05-04T00:00:00.000' AS DateTime), CAST(N'1998-04-14T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11006, N'GREAL', CAST(N'1998-04-07T00:00:00.000' AS DateTime), CAST(N'1998-05-05T00:00:00.000' AS DateTime), CAST(N'1998-04-15T00:00:00.000' AS DateTime), NULL, N'2732 Baker Blvd.', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11008, N'ERNSH', CAST(N'1998-04-08T00:00:00.000' AS DateTime), CAST(N'1998-05-06T00:00:00.000' AS DateTime), CAST(N'2010-01-01T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11009, N'GODOS', CAST(N'1998-04-08T00:00:00.000' AS DateTime), CAST(N'1998-05-06T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime), NULL, N'C/ Romero, 33', N'Cash', N'Airline', 0, 0, N'david', NULL)
GO
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11011, N'ALFKI', CAST(N'1998-04-09T00:00:00.000' AS DateTime), CAST(N'1998-05-07T00:00:00.000' AS DateTime), CAST(N'1998-04-13T00:00:00.000' AS DateTime), NULL, N'Obere Str. 57', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11012, N'FRANK', CAST(N'1998-04-09T00:00:00.000' AS DateTime), CAST(N'1998-04-23T00:00:00.000' AS DateTime), CAST(N'1998-04-17T00:00:00.000' AS DateTime), NULL, N'Berliner Platz 43', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11016, N'AROUT', CAST(N'1998-04-10T00:00:00.000' AS DateTime), CAST(N'1998-05-08T00:00:00.000' AS DateTime), CAST(N'1998-04-13T00:00:00.000' AS DateTime), NULL, N'Brook Farm Stratford St. Mary', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11017, N'ERNSH', CAST(N'1998-04-13T00:00:00.000' AS DateTime), CAST(N'1998-05-11T00:00:00.000' AS DateTime), CAST(N'1998-04-20T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11022, N'HANAR', CAST(N'1998-04-14T00:00:00.000' AS DateTime), CAST(N'1998-05-12T00:00:00.000' AS DateTime), CAST(N'1998-05-04T00:00:00.000' AS DateTime), NULL, N'Rua do Paço, 67', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11023, N'BSBEV', CAST(N'1998-04-14T00:00:00.000' AS DateTime), CAST(N'1998-04-28T00:00:00.000' AS DateTime), CAST(N'1998-04-24T00:00:00.000' AS DateTime), NULL, N'Fauntleroy Circus', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11024, N'EASTC', CAST(N'1998-04-15T00:00:00.000' AS DateTime), CAST(N'1998-05-13T00:00:00.000' AS DateTime), CAST(N'1998-04-20T00:00:00.000' AS DateTime), NULL, N'35 King George', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11026, N'FRANS', CAST(N'1998-04-15T00:00:00.000' AS DateTime), CAST(N'1998-05-13T00:00:00.000' AS DateTime), CAST(N'1998-04-28T00:00:00.000' AS DateTime), NULL, N'Via Monte Bianco 34', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11027, N'BOTTM', CAST(N'1998-04-16T00:00:00.000' AS DateTime), CAST(N'1998-05-14T00:00:00.000' AS DateTime), CAST(N'1998-04-20T00:00:00.000' AS DateTime), NULL, N'23 Tsawassen Blvd.', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11029, N'CHOPS', CAST(N'1998-04-16T00:00:00.000' AS DateTime), CAST(N'1998-05-14T00:00:00.000' AS DateTime), CAST(N'1998-04-27T00:00:00.000' AS DateTime), NULL, N'Hauptstr. 31', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11036, N'DRACD', CAST(N'1998-04-20T00:00:00.000' AS DateTime), CAST(N'1998-05-18T00:00:00.000' AS DateTime), CAST(N'1998-04-22T00:00:00.000' AS DateTime), NULL, N'Walserweg 21', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11037, N'GODOS', CAST(N'1998-04-21T00:00:00.000' AS DateTime), CAST(N'1998-05-19T00:00:00.000' AS DateTime), CAST(N'1998-04-27T00:00:00.000' AS DateTime), NULL, N'C/ Romero, 33', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11040, N'GREAL', CAST(N'1998-04-22T00:00:00.000' AS DateTime), CAST(N'1998-05-20T00:00:00.000' AS DateTime), CAST(N'1998-04-16T00:00:00.000' AS DateTime), NULL, N'2732 Baker Blvd.', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11041, N'CHOPS', CAST(N'1998-04-22T00:00:00.000' AS DateTime), CAST(N'1998-05-20T00:00:00.000' AS DateTime), CAST(N'1998-04-28T00:00:00.000' AS DateTime), NULL, N'Hauptstr. 31', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11042, N'COMMI', CAST(N'1998-04-22T00:00:00.000' AS DateTime), CAST(N'1998-05-06T00:00:00.000' AS DateTime), CAST(N'1998-05-01T00:00:00.000' AS DateTime), NULL, N'Av. dos Lusíadas, 23', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11045, N'BOTTM', CAST(N'1998-04-23T00:00:00.000' AS DateTime), CAST(N'1998-05-21T00:00:00.000' AS DateTime), CAST(N'1998-04-16T00:00:00.000' AS DateTime), NULL, N'23 Tsawassen Blvd.', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11047, N'EASTC', CAST(N'1998-04-24T00:00:00.000' AS DateTime), CAST(N'1998-05-22T00:00:00.000' AS DateTime), CAST(N'1998-05-01T00:00:00.000' AS DateTime), NULL, N'35 King George', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11048, N'BOTTM', CAST(N'1998-04-24T00:00:00.000' AS DateTime), CAST(N'1998-05-22T00:00:00.000' AS DateTime), CAST(N'1998-04-30T00:00:00.000' AS DateTime), NULL, N'23 Tsawassen Blvd.', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11049, N'GOURL', CAST(N'1998-04-24T00:00:00.000' AS DateTime), CAST(N'1998-05-22T00:00:00.000' AS DateTime), CAST(N'1998-05-04T00:00:00.000' AS DateTime), NULL, N'Av. Brasil, 442', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11050, N'FOLKO', CAST(N'1998-04-27T00:00:00.000' AS DateTime), CAST(N'1998-05-25T00:00:00.000' AS DateTime), CAST(N'1998-05-05T00:00:00.000' AS DateTime), NULL, N'Åkergatan 24', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11051, N'LAMAI', CAST(N'1998-04-27T00:00:00.000' AS DateTime), CAST(N'1998-05-25T00:00:00.000' AS DateTime), CAST(N'1998-04-16T00:00:00.000' AS DateTime), NULL, N'1 rue Alsace-Lorraine', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11052, N'HANAR', CAST(N'1998-04-27T00:00:00.000' AS DateTime), CAST(N'1998-05-25T00:00:00.000' AS DateTime), CAST(N'1998-05-01T00:00:00.000' AS DateTime), NULL, N'Rua do Paço, 67', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11054, N'CACTU', CAST(N'1998-04-28T00:00:00.000' AS DateTime), CAST(N'1998-05-26T00:00:00.000' AS DateTime), CAST(N'1998-04-16T00:00:00.000' AS DateTime), NULL, N'Cerrito 333', N'Cash', N'Airline', 0, 0, N'david', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11055, N'HILAA', CAST(N'1998-04-28T00:00:00.000' AS DateTime), CAST(N'1998-05-26T00:00:00.000' AS DateTime), CAST(N'1998-05-05T00:00:00.000' AS DateTime), NULL, N'Carrera 22 con Ave. Carlos Soublette #8-35', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11056, N'EASTC', CAST(N'1998-04-28T00:00:00.000' AS DateTime), CAST(N'1998-05-12T00:00:00.000' AS DateTime), CAST(N'1998-05-01T00:00:00.000' AS DateTime), NULL, N'35 King George', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11058, N'BLAUS', CAST(N'1998-04-29T00:00:00.000' AS DateTime), CAST(N'1998-05-27T00:00:00.000' AS DateTime), CAST(N'1998-04-16T00:00:00.000' AS DateTime), NULL, N'Forsterstr. 57', N'Cash', N'Airline', 0, 0, N'cavani', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11060, N'FRANS', CAST(N'1998-04-30T00:00:00.000' AS DateTime), CAST(N'1998-05-28T00:00:00.000' AS DateTime), CAST(N'1998-05-04T00:00:00.000' AS DateTime), NULL, N'Via Monte Bianco 34', N'Cash', N'Airline', 0, 0, N'nvb', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11061, N'GREAL', CAST(N'1998-04-30T00:00:00.000' AS DateTime), CAST(N'1998-06-11T00:00:00.000' AS DateTime), CAST(N'1998-04-16T00:00:00.000' AS DateTime), NULL, N'2732 Baker Blvd.', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11067, N'DRACD', CAST(N'1998-05-04T00:00:00.000' AS DateTime), CAST(N'1998-05-18T00:00:00.000' AS DateTime), CAST(N'1998-05-06T00:00:00.000' AS DateTime), NULL, N'Walserweg 21', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11072, N'ERNSH', CAST(N'1998-05-05T00:00:00.000' AS DateTime), CAST(N'1998-06-02T00:00:00.000' AS DateTime), CAST(N'1998-04-16T00:00:00.000' AS DateTime), NULL, N'Kirchgasse 6', N'Cash', N'Airline', 0, 0, N'nva', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11076, N'BONAP', CAST(N'1998-05-06T00:00:00.000' AS DateTime), CAST(N'1998-06-03T00:00:00.000' AS DateTime), CAST(N'1998-04-16T00:00:00.000' AS DateTime), NULL, N'12, rue des Bouchers', N'Cash', N'Airline', 0, 0, N'lvc', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11111, N'ANTON', CAST(N'2017-12-09T14:52:00.587' AS DateTime), NULL, NULL, N'Antonio Moreno', N'105 Bà Huyện Thanh Quan', N'Tiền mặt', N'', 0, 0, N'lvc', N'Giao hàng trước 17g')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11112, N'ANTON', CAST(N'2017-12-09T15:15:58.843' AS DateTime), NULL, NULL, N'Antonio Moreno', N'', N'Tiền mặt', N'', 0, 0, N'nva', N'')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11113, N'ANTON', CAST(N'2017-12-09T15:16:39.150' AS DateTime), NULL, NULL, N'Antonio Moreno', N'', N'Tiền mặt', N'', 0, 0, N'cavani', N'')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11114, N'ANTON', CAST(N'2017-12-09T15:18:14.817' AS DateTime), NULL, NULL, N'Antonio Moreno', N'', N'Tiền mặt', N'', 0, 0, N'david', N'')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11115, N'11111', CAST(N'2017-12-09T16:34:16.363' AS DateTime), NULL, NULL, N'Anh Hùng', N'105 Bà Huyện Thanh Quan', N'Tiền mặt', N'', 0, 0, N'nvb', N'Giao sớm')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11116, N'11111', CAST(N'2017-12-09T16:37:02.070' AS DateTime), NULL, NULL, N'111', N'', N'Tiền mặt', N'', 0, 0, N'lvc', N'')
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'11111', N'11111', N'Năm Số Một', 1, CAST(N'2011-01-19T07:00:00.000' AS DateTime), N'11111', N'111', N'hpt7777@gmail.com', N'111', 1, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'55555', N'55555', N'Năm Số Năm', 1, CAST(N'2011-02-09T07:00:00.000' AS DateTime), N'123 Truong Dinh', N'0913745789', N'demo@abc.com', N'Tulips.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'99999', N'99999', N'99999', 1, CAST(N'2011-03-16T00:00:00.000' AS DateTime), N'Hoang Van Thu', N'0913745789', N'demo@abc.com', N'Penguins.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'ALFKI', N'iloveyou', N'Maria Anders', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Obere Str. 57', N'030-0074321', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'ANATR', N'iloveyou', N'Ana Trujillo', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Avda. de la Constitución 2222', N'(5) 555-4729', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'ANTON', N'iloveyou', N'Antonio Moreno', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Mataderos  2312', N'(5) 555-3932', N'demo@abc.com', N'User.jpg', 1, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'AROUT', N'iloveyou', N'Thomas Hardy', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'120 Hanover Sq.', N'(171) 555-7788', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'BERGS', N'iloveyou', N'Christina Berglund', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Berguvsvägen  8', N'0921-12 34 65', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'BLAUS', N'iloveyou', N'Hanna Moos', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Forsterstr. 57', N'0621-08460', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'BLONP', N'iloveyou', N'Frédérique Citeaux', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'24, place Kléber', N'88.60.15.31', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'BOLID', N'iloveyou', N'Martín Sommer', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'C/ Araquil, 67', N'(91) 555 22 82', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'BONAP', N'iloveyou', N'Laurence Lebihan', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'12, rue des Bouchers', N'91.24.45.40', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'BOTTM', N'iloveyou', N'Elizabeth Lincoln', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'23 Tsawassen Blvd.', N'(604) 555-4729', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'BSBEV', N'iloveyou', N'Victoria Ashworth', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Fauntleroy Circus', N'(171) 555-1212', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'CACTU', N'iloveyou', N'Patricio Simpson', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Cerrito 333', N'(1) 135-5555', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'CENTC', N'iloveyou', N'Francisco Chang', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Sierras de Granada 9993', N'(5) 555-3392', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'CHOPS', N'iloveyou', N'Yang Wang', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Hauptstr. 29', N'0452-076545', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'COMMI', N'iloveyou', N'Pedro Afonso', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Av. dos Lusíadas, 23', N'(11) 555-7647', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'CONSH', N'iloveyou', N'Elizabeth Brown', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Berkeley Gardens 12  Brewery', N'(171) 555-2282', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'DRACD', N'iloveyou', N'Sven Ottlieb', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Walserweg 21', N'0241-039123', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'DUMON', N'iloveyou', N'Janine Labrune', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'67, rue des Cinquante Otages', N'40.67.88.88', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'EASTC', N'iloveyou', N'Ann Devon', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'35 King George', N'(171) 555-0297', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'ERNSH', N'iloveyou', N'Roland Mendel', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Kirchgasse 6', N'7675-3425', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'FAMIA', N'iloveyou', N'Aria Cruz', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Rua Orós, 92', N'(11) 555-9857', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'FISSA', N'iloveyou', N'Diego Roel', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'C/ Moralzarzal, 86', N'(91) 555 94 44', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'FOLIG', N'iloveyou', N'Martine Rancé', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'184, chaussée de Tournai', N'20.16.10.16', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'FOLKO', N'iloveyou', N'Maria Larsson', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Åkergatan 24', N'0695-34 67 21', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'FRANK', N'iloveyou', N'Peter Franken', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Berliner Platz 43', N'089-0877310', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'FRANR', N'iloveyou', N'Carine Schmitt', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'54, rue Royale', N'40.32.21.21', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'FRANS', N'iloveyou', N'Paolo Accorti', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Via Monte Bianco 34', N'011-4988260', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'FURIB', N'iloveyou', N'Lino Rodriguez', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Jardim das rosas n. 32', N'(1) 354-2534', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'GALED', N'iloveyou', N'Eduardo Saavedra', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Rambla de Cataluña, 23', N'(93) 203 4560', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'GODOS', N'iloveyou', N'José Pedro Freyre', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'C/ Romero, 33', N'(95) 555 82 82', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'GOURL', N'iloveyou', N'André Fonseca', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Av. Brasil, 442', N'(11) 555-9482', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'GREAL', N'iloveyou', N'Howard Snyder', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'2732 Baker Blvd.', N'(503) 555-7555', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'GROSR', N'iloveyou', N'Manuel Pereira', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'5ª Ave. Los Palos Grandes', N'(2) 283-2951', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'HANAR', N'iloveyou', N'Mario Pontes', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Rua do Paço, 67', N'(21) 555-0091', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'HILAA', N'iloveyou', N'Carlos Hernández', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35', N'(5) 555-1340', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'LAMAI', N'iloveyou', N'Annette Roulet', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'1 rue Alsace-Lorraine', N'61.77.61.10', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'LAUGB', N'iloveyou', N'Yoshi Tannamuri', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'1900 Oak St.', N'(604) 555-3392', N'demo@abc.com', N'User.jpg', 0, 0, NULL)
SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa], [Hinh]) VALUES (1000, N'Đồng hồ', N'Soft drinks, coffees, teas, beers, and ales', N'Best.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa], [Hinh]) VALUES (1001, N'Laptop', N'Sweet and savory sauces, relishes, spreads, and seasonings', N'Certificate.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa], [Hinh]) VALUES (1002, N'Máy ảnh', N'Desserts, candies, and sweet breads', N'')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa], [Hinh]) VALUES (1003, N'Điện thoại', N'Cheeses', N'Bell.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa], [Hinh]) VALUES (1004, N'Nước hoa', N'Breads, crackers, pasta, and cereal', N'Favourites.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa], [Hinh]) VALUES (1005, N'Trang sức', N'Prepared meats', N'Dice.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa], [Hinh]) VALUES (1006, N'Giày', N'Dried fruit and bean curd', N'')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa], [Hinh]) VALUES (1007, N'Vali', N'Seaweed and fish', N'Microsoft.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa], [Hinh]) VALUES (1008, N'Laptop', N'Cac loai laptop', NULL)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MoTa], [Hinh]) VALUES (2008, N'Bia hơi', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Loai] OFF
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'AP', N'Apple', N'apple.gif', N'Petter Pike', N'pike@yahoo.com', N'0987345876', N'765 Hello, Califonia, United States', N'Moble Device')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'MO', N'Motorola', N'motorola.gif', N'John David', N'john@gmail.com', N'0918456987', N'22 Rose, Messachuset, United States', N'Communication Company')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'NK', N'Nokia', N'Nokia.gif', N'Okawa', N'okawa@gmail.com', N'0913745789', N'123 Revenue, Tokyo, Japan', N'Famous company')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'SM', N'Seamen', N'semen.gif', N'David Brown', N'brown@gmail.com', N'0987456876', N'23 New World, Texas, United Kindom', N'Digital device company')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'SS', N'Samsung', N'samsung.gif', N'LeeSongChai', N'lee@yahoo.com', N'0913745789', N'456 Romario, Seaul, Korea', N'The best company')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau], [MaNguoiQuanLy]) VALUES (N'alex', N'Alex Johnson', N'alex.johnson@gmail.com', N'123', N'lvc')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau], [MaNguoiQuanLy]) VALUES (N'beckham', N'David Beckham', N'david.beckham@mu.com', N'123', NULL)
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau], [MaNguoiQuanLy]) VALUES (N'cavani', N'Edinson Cavani', N'cavani@mu.com', N'123', N'ronaldo')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau], [MaNguoiQuanLy]) VALUES (N'david', N'David De Gea', N'degea@mu.com', N'123', NULL)
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau], [MaNguoiQuanLy]) VALUES (N'grant', N'Lee Grant', N'grant@mu.com', N'123', N'henderson')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau], [MaNguoiQuanLy]) VALUES (N'heaton', N'Thomas Heaton', N'heaton@mu.com', N'123', N'david')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau], [MaNguoiQuanLy]) VALUES (N'henderson', N'Dean Henderson', N'henderson@mu.com', N'123', N'david')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau], [MaNguoiQuanLy]) VALUES (N'lvc', N'Lê Văn C', N'lvc@gmail.com', N'123', NULL)
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau], [MaNguoiQuanLy]) VALUES (N'nva', N'Trần Văn A', N'tva@gmail.com', N'123', NULL)
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau], [MaNguoiQuanLy]) VALUES (N'nvb', N'Nguyễn Văn B', N'nvb@gmail.com', N'123', NULL)
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau], [MaNguoiQuanLy]) VALUES (N'ronaldo', N'Cristiano Ronaldo', N'cr7@mu.com', N'123', N'beckham')
SET IDENTITY_INSERT [dbo].[PhanCong] ON 

INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (1, N'lvc', N'BGD', CAST(N'2017-12-17T10:10:06.877' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (2, N'nva', N'BGD', CAST(N'2017-11-11T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (3, N'lvc', N'BGD', CAST(N'2017-12-17T10:15:51.303' AS DateTime), 1)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (4, N'nva', N'BGD', CAST(N'2017-12-17T10:15:51.333' AS DateTime), 1)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (5, N'nva', N'PKT', CAST(N'2017-12-17T10:16:19.203' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (6, N'nvb', N'PKT', CAST(N'2017-12-17T10:16:19.213' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (7, N'nvb', N'PKT', CAST(N'2017-12-17T10:16:39.180' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[PhanCong] OFF
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 

INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (16, N'BGD', 1, 0, 0, 0, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (17, N'BGD', 2, 0, 0, 0, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (18, N'BGD', 3, 0, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'BGD', N'Ban Giám Đốc', NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKD', N'Phòng kinh doanh', NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKT', N'Phòng Kỹ thuật', NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKTo', N'Phòng Kế toán', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (0, N'Mới đặt hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (1, N'Đã giao hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (2, N'Khách hàng hủy đơn hàng', NULL)
SET IDENTITY_INSERT [dbo].[TrangWeb] ON 

INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (1, N'Trang chủ Admin', N'Default.aspx')
INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (2, N'Quản lý Đơn hàng', N'QLDonHang.aspx')
INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (3, N'Quản lý Hàng hóa', N'QLHangHoa.aspx')
SET IDENTITY_INSERT [dbo].[TrangWeb] OFF
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_Discount]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_HangHoa_SoLuong]  DEFAULT ((0)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [NgaySX]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_Discount]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_Votes]  DEFAULT ((0)) FOR [SoLanXem]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_RequireDate]  DEFAULT (getdate()) FOR [NgayCan]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_ShippedDate]  DEFAULT (((1)/(1))/(1900)) FOR [NgayGiao]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_PaymentMethod]  DEFAULT (N'Cash') FOR [CachThanhToan]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_ShippingMethod]  DEFAULT (N'Airline') FOR [CachVanChuyen]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_Freight]  DEFAULT ((0)) FOR [PhiVanChuyen]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_Status]  DEFAULT ((0)) FOR [MaTrangThai]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Gender]  DEFAULT ((0)) FOR [GioiTinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Birthday]  DEFAULT (getdate()) FOR [NgaySinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Hinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Active]  DEFAULT ((0)) FOR [HieuLuc]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_UserLevel]  DEFAULT ((0)) FOR [VaiTro]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Them]  DEFAULT ((0)) FOR [Them]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Sua]  DEFAULT ((0)) FOR [Sua]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Xoa]  DEFAULT ((0)) FOR [Xoa]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Xem]  DEFAULT ((0)) FOR [Xem]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_TrangThai] FOREIGN KEY([MaTrangThai])
REFERENCES [dbo].[TrangThai] ([MaTrangThai])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_TrangThai]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_NhanVien] FOREIGN KEY([MaNguoiQuanLy])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_TrangWeb] FOREIGN KEY([MaTrang])
REFERENCES [dbo].[TrangWeb] ([MaTrang])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_TrangWeb]
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Customers] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YeuThich] CHECK CONSTRAINT [FK_Favorites_Customers]
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD  CONSTRAINT [FK_YeuThich_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YeuThich] CHECK CONSTRAINT [FK_YeuThich_HangHoa]
GO