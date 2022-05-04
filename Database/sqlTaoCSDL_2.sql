go
use QuanLyRapChieuPhim
go
--Bang The Loai Phim
Create table THE_LOAI_PHIM
(
	MaTheLoaiPhim varchar(6) primary key not null constraint IDTLP default dbo.AUTO_IDTLP(),
	TenTheLoaiPhim nvarchar(20)
)

--Bang Loai Nha Cung Cap
go
Create table LoaiNhaCungCap(
	MaLoaiNCC varchar(6) primary key not null constraint IDLNCC default dbo.AUTO_IDLOAINCC(),
	TenLoaiNCC nvarchar(40)
)
go
-- Bang Nha Cung Cap

Create table NHA_CUNG_CAP(
	MaNhaCungCap varchar(6) primary key not null constraint IDNCC default dbo.AUTO_IDNCC(),
	TenNhaCungCap nvarchar(40),
	MaSoThue varchar(15),
	DiaChi nvarchar(50),
	Email varchar(50),
	SoDienThoai varchar(15),
	TenGiamDoc nvarchar(30),
	MaLoaiNCC varchar(6) foreign key(MaLoaiNCC) references LoaiNhaCungCap
)
go
--Bang Phim

Create table PHIM(
	MaPhim varchar(6) primary key not null constraint IDP default dbo.AUTO_IDP(),
	TenPhim nvarchar(50),
	AnhPhim image,
	ThoiLuong int,
	QuocGia nvarchar(20),
	NamSanXuat date,
	TenHangPhim nvarchar(30),
	DoTuoiXem int,
	MaTheLoai varchar(6) foreign key(MaTheLoai) references THE_LOAI_PHIM,
	NoiDung ntext,
	DienVienChinh ntext,
	DienVienPhu ntext,
	DaoDien nvarchar(30)
)
go
-- Bang Hop Dong Phim
Create table HOP_DONG_PHIM(
	MaNhaCungCap varchar(6) foreign key(MaNhaCungCap) references NHA_CUNG_CAP,
	MaPhim varchar(6) foreign key(MaPhim) references PHIM,
	NgayKiKetHD date,
	NgayBatDauBanQuyen date,
	NgayKetThucBanQuyen date,
	Donvitinh nvarchar(15),
	SoLuong int,
	GiaTien money,
	constraint pk_HopDongPhim primary key(MaNhaCungCap,MaPhim)
)
go
-- Bang Phong Chieu

Create table PHONG_CHIEU(
	MaPhongChieu varchar(6) primary key not null constraint IDPC default dbo.AUTO_IDPC(),
	TenPhong nvarchar(20),
	TinhTrangPhong bit
)
go
--Bang Khung Gio Chieu

Create table KHUNG_GIO_CHIEU(
	MaKhungGioChieu varchar(8) primary key not null constraint IDKGC default dbo.AUTO_IDKGC(),
	TenKhungGio nvarchar(30),
	TGBatDau time,
	TGKetThuc time
)
go
--Bang Lich Chieu
Create table LICH_CHIEU(
	MaPhim varchar(6) foreign key(MaPhim) references PHIM,
	MaPhongChieu varchar(6) foreign key(MaPhongChieu) references PHONG_CHIEU,
	MaKhungGioChieu varchar(8) foreign key(MaKhungGioChieu) references KHUNG_GIO_CHIEU,
	TrangThai bit,
	constraint pk_LichChieu primary key(MaPhim,MaPhongChieu,MaKhungGioChieu)
)
go
--Bang Ca Lam Viec

Create table CA_LAM_VIEC(
	MaCa varchar(6) primary key not null constraint IDCLV default dbo.AUTO_IDCLV(),
	TenCa nvarchar(40),
	GioBatDau time,
	GioKetThuc time
)
go
-- Bang Ngay Lam Viec
create table NGAY_LAM_VIEC
(
	MaNgayLamViec varchar(6) primary key not null constraint IDNLV default dbo.AUTO_IDNLV(),
	NgayLamViec date,
	MaCa varchar(6) foreign key (MaCa)references CA_LAM_VIEC
)
go
--Bang Chinh Sach
Create table CHINH_SACH(
	MaChinhSach varchar(6) primary key not null constraint IDCS default dbo.AUTO_IDCS(),
	HeSoLuong Float(4),
	BHXH varchar(20),
	TienThuong int
)
go
-- Bang Chuc Vu

Create table CHUC_VU(
	MaChucVu varchar(6) primary key not null constraint IDCV default dbo.AUTO_IDCV(),
	TenChucVu nvarchar(20)
)
go
--Bang Nhan Vien

Create table NHAN_VIEN(
	MaNhanVien varchar(6) primary key not null constraint IDNV default dbo.AUTO_IDNV(),
	TenNhanVien nvarchar(30),
	NgaySinh datetime,
	GioiTinh bit,
	DiaChi nvarchar(50),
	SoDienThoai varchar(15),
	CCCD varchar(20),
	TenTaiKhoan varchar(30),
	MatKhau varchar(15),
	Anh image,
	MaChinhSach varchar(6) foreign key(MaChinhSach) references CHINH_SACH,
	MaChucVu varchar(6) foreign key(MaChucVu) references CHUC_VU
)
go
--Bang Chi Tiet Ca Lam

Create table CHI_TIET_CA_LAM_VIEC(
	MaNhanVien varchar(6) foreign key(MaNhanVien) references NHAN_VIEN,
	MaCa varchar(6) foreign key(MaCa) references CA_LAM_VIEC,
	TrangThai bit,
	constraint pk_CTCaLamViec primary key(MaNhanVien,MaCa)
)
go
--Bang Loai Kho

Create table LOAI_KHO(
	MaLoaiKho varchar(5) primary key not null constraint IDLK default dbo.AUTO_IDLK(),
	TenLoaiKho nvarchar(15)
)
go
--Bang Kho

Create table KHO(
	MaKho varchar(5) primary key not null  constraint IDK default dbo.AUTO_IDK(),
	MaLoaiKho varchar(5) foreign key(MaLoaiKho) references LOAI_KHO,
	TenKho nvarchar(30)
)
go
--Bang Chi Tiet Kho Phim

Create table CHI_TIET_KHO_PHIM(
	MaKho varchar(5) foreign key (MaKho) references KHO,
	MaPhim varchar(6) foreign key(MaPhim) references PHIM,
	DonViTinh nvarchar(20),
	SoLuongSP int,
	constraint pk_CTKhoPhim primary key(MaKho,MaPhim)
)
go
--Bang Thuc An

Create table THUC_AN(
	MaThucAn varchar(6) primary key not null constraint IDTA default dbo.AUTO_IDTA(),
	TenThucAn nvarchar(30),
)
go
--Bang Vat Tu

Create table VAT_TU(
	MaVatTu varchar(6) primary key not null constraint IDVT default dbo.AUTO_IDVT(),
	TenVatTu nvarchar(30)
)
go
--Bang Chi Tiet Kho Vat Tu

Create table CHI_TIET_KHO_VT(
	MaKho varchar(5) foreign key (MaKho) references KHO,
	MaVatTu varchar(6) foreign key(MaVatTu) references VAT_TU,
	DonViTinh nvarchar(20),
	SoLuongSP int,
	constraint pk_CTKhoVatTu primary key(MaKho,MaVatTu)
)
go
--Bang Chi Tiet Kho Thuc An

Create table CHI_TIET_KHO_THUC_AN(
	MaKho varchar(5) foreign key (MaKho) references KHO,
	MaThucAn varchar(6) foreign key(MaThucAn) references THUC_AN,
	DonViTinh nvarchar(20),
	SoLuongSP int,
	constraint pk_CTKhoThucAn primary key(MaKho,MaThucAn)
)
go
--Bang Loai De Xuat

Create table LOAI_DE_XUAT(
	MaLoaiDeXuat varchar(5) primary key constraint IDLDX default dbo.AUTO_IDLDX(),
	TenLoaiDeXuat nvarchar(30)
)
go
--Bang De Xuat

Create table DE_XUAT(
	MaDeXuat varchar(6) primary key not null constraint IDDX default dbo.AUTO_IDDX(),
	MaNhanVien varchar(6) foreign key(MaNhanVien) references NHAN_VIEN,
	NgayDeXuat Date,
	MaLoaiDeXuat varchar(5) foreign key(MaLoaiDeXuat) references LOAI_DE_XUAT,
	MaKho varchar(5) foreign key(MaKho) references KHO
)
go
--Bang Chi Tiet De Xuat Phim

Create table CHI_TIET_DE_XUAT_PHIM(
	MaDeXuat varchar(6) foreign key(MaDeXuat) references DE_XUAT,
	MaPhim varchar(6) foreign key(MaPhim) references PHIM,
	Noidung ntext,
	TinhTrang bit,
	constraint pk_CTDeXuatPhim primary key(MaDeXuat,MaPhim)
)
go
--Bang Chi Tiet De Xuat Thuc An

Create table CHI_TIET_DE_XUAT_TA(
	MaDeXuat varchar(6) foreign key(MaDeXuat) references DE_XUAT,
	MaThucAn varchar(6) foreign key(MaThucAn) references THUC_AN,
	Noidung ntext,
	TinhTrang bit,
	constraint pk_CTDeXuatTA primary key(MaDeXuat,MaThucAn)
)
go
--Bang Chi Tiet De Xuat Vat Tu

Create table CHI_TIET_DE_XUAT_VT(
	MaDeXuat varchar(6) foreign key(MaDeXuat) references DE_XUAT,
	MaVatTu varchar(6) foreign key(MaVatTu) references VAT_TU,
	Noidung ntext,
	TinhTrang bit,
	constraint pk_CTDeXuatVT primary key(MaDeXuat,MaVatTu)
)
go
-- Bang Loai Phieu

Create table LOAI_PHIEU(
	MaLoaiPhieu varchar(5) primary key not null constraint IDLP default dbo.AUTO_IDLP(),
	TenLoaiPhieu nvarchar(30)
)
go
--Bang Phieu

Create table PHIEU(
	MaPhieu varchar(6) primary key not null constraint IDPH default dbo.AUTO_IDPH(), 
	MaLoaiPhieu varchar(5) foreign key(MaLoaiPhieu) references LOAI_PHIEU,
	MaKho varchar(5) foreign key(MaKho) references KHO,
	MaNhanVien varchar(6) foreign key(MaNhanVien) references NHAN_VIEN,
	NgayLapPhieu date
)
go
--Bang Chi Tiet Phieu Phim
Create table CHI_TIET_PHIEU_PHIM(
	MaPhieu varchar(6) foreign key(MaPhieu) references PHIEU,
	MaPhim varchar(6) foreign key(MaPhim) references PHIM,
	DonViTinh nvarchar(20),
	SoLuong int,
	constraint pk_CTPhieuPhim primary key(MaPhieu,MaPhim)
)
go
--Bang Chi Tiet Phieu Vat Tu

Create table CHI_TIET_PHIEU_VT(
	MaPhieu varchar(6) foreign key(MaPhieu) references PHIEU,
	MaVatTu varchar(6) foreign key(MaVatTu) references VAT_TU,
	DonViTinh nvarchar(20),
	SoLuong int,
	constraint pk_CTPhieuVatTu primary key(MaPhieu,MaVatTu)
)
go
--Bang Chi Tiet Phieu Thuc An

Create table CHI_TIET_PHIEU_THUC_AN(
	MaPhieu varchar(6) foreign key(MaPhieu) references PHIEU,
	MaThucAn varchar(6) foreign key(MaThucAn) references THUC_AN,
	DonViTinh nvarchar(20),
	SoLuong int,
	NgayHetHang date,
	constraint pk_CTPhieuThucAn primary key(MaPhieu,MaThucAn)
)
go
--Bang Chi Tiet Cung Cap Vat Tu

Create table CHI_TIET_CUNG_CAP_VAT_TU(
	MaVatTu varchar(6) foreign key(MaVatTu) references VAT_TU,
	MaNhaCungCap varchar(6) foreign key(MaNhaCungCap) references NHA_CUNG_CAP,
	GiaTien money,
	DonViTinh nvarchar(30),
	SoLuong int,
	constraint pk_CTCungCapVatTu primary key(MaVatTu,MaNhaCungCap)
)
go
--Bang Chi Tiet Cung Cap Thuc An

Create table CHI_TIET_CUNG_CAP_THUC_AN(
	MaThucAn varchar(6) foreign key(MaThucAn) references THUC_AN,
	MaNhaCungCap varchar(6) foreign key(MaNhaCungCap) references NHA_CUNG_CAP,
	GiaTien money,
	DonViTinh nvarchar(30),
	SoLuong int,
	constraint pk_CTCungCapThucAn primary key(MaThucAn,MaNhaCungCap)
)
go
--Bang Chi Tiet Cung Cap Phong Chieu

Create table CHI_TIET_PHONG_CHIEU(
	MaPhongChieu varchar(6) foreign key(MaPhongChieu) references PHONG_CHIEU,
	MaVatTu varchar(6) foreign key(MaVatTu) references VAT_TU,
	DonViTinh nvarchar(30),
	SoLuongSP int,
	constraint pk_CTPhongChieu primary key(MaPhongChieu,MaVatTu)
)
