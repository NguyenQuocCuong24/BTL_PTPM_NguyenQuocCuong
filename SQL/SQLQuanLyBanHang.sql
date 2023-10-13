CREATE DATABASE QLBH2

USE QLBH2
GO

CREATE TABLE NhanVien
(
NhanVienID char(10) PRIMARY KEY,
HoTenNV nvarchar(30),
GioiTinh nvarchar(50),
NgaySinhNV date,
DiaChiNV nvarchar(50),
Email char(30),
SdtNV char(11),
)

CREATE TABLE KhachHang
(
KhachHangID char(10) PRIMARY KEY,
HoTenKH nvarchar(30),
DiaChiKH nvarchar(50),
EmailKH char(30),
SdtKH char(11),
)

CREATE TABLE MatHang
(
MatHangID char(10) PRIMARY KEY,
TenHang nvarchar(50),
Dvtinh nvarchar(10),
Slton tinyint,
LoaiHangID char(10) FOREIGN KEY (LoaiHangID) REFERENCES dbo.LoaiHang(LoaiHangID) ON DELETE CASCADE ON UPDATE CASCADE,
)

CREATE TABLE DonHangNhap
(
DonHangNhapID char(10) PRIMARY KEY,
NgayNhap datetime,
TrietKhauNhap float,
NhaCCID char(10) FOREIGN KEY (NhaCCID) REFERENCES dbo.NHACC(NhaCCID) ON DELETE CASCADE ON UPDATE CASCADE,
NhanVienID char(10) FOREIGN KEY (NhanVienID) REFERENCES dbo.NhanVien(NhanVienID) ON DELETE CASCADE ON UPDATE CASCADE,
)

CREATE TABLE ChiTietDHN
(
DonHangNhapID char(10) FOREIGN KEY (DonHangNhapID) REFERENCES dbo.DonHangNhap(DonHangNhapID) ON DELETE CASCADE ON UPDATE CASCADE,
MatHangID char(10) FOREIGN KEY (MatHangID) REFERENCES dbo.MatHang(MatHangID) ON DELETE CASCADE ON UPDATE CASCADE,
Slnhap tinyint,
DGnhap float,
)

CREATE TABLE ChiTietDHB
(
DonHangBanID char(10) FOREIGN KEY (DonHangBanID) REFERENCES dbo.DonHangBan(DonHangBanID) ON DELETE CASCADE ON UPDATE CASCADE,
MatHangID char(10) FOREIGN KEY (MatHangID) REFERENCES dbo.MatHang(MatHangID) ON DELETE CASCADE ON UPDATE CASCADE,
Slban tinyint,
DGiaBan float,
)

CREATE TABLE LoaiHang
(
LoaiHangID char(10) PRIMARY KEY,
TenLH nvarchar(60),
)

CREATE TABLE NHACC
(
NhaCCID char(10) PRIMARY KEY,
TenNCC nvarchar(30),
DiaChiNCC nvarchar(50),
SdtNCC char(11),
)

CREATE TABLE DonHangBan
(
DonHangBanID char(10) PRIMARY KEY,
NgayBan datetime,
TrietKhauBan float,
KhachhangID char(10) FOREIGN KEY (KhachHangID) REFERENCES dbo.KhachHang(KhachHangID) ON DELETE CASCADE ON UPDATE CASCADE,
NhanVienID char(10) FOREIGN KEY (NhanVienID) REFERENCES dbo.NhanVien(NhanVienID) ON DELETE CASCADE ON UPDATE CASCADE,
)

ALTER TABLE ChiTietDHB
	ADD CONSTRAINT KN_ChiTietDHB FOREIGN KEY (MatHangID) REFERENCES MatHang ON DELETE CASCADE ON UPDATE CASCADE,









