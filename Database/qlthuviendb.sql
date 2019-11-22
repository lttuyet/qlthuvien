if DB_ID('qlthuviendb') is not null
drop database qlthuviendb
Go

create database qlthuviendb
Go

use qlthuviendb
Go

create table LOAIDG
(
	MaLDG int not null identity(1,1),
	TenLDG nvarchar(30) not null,
	Xoa int not null
	constraint PK_LOAIDG priMary key (MaLDG)
)

create table THEDOCGIA
(
	MaDG int identity(1,1) not null,
	HoTen nvarchar(50) not null,
	NgaySinh datetime not null,
	Diachi nvarchar(100) not null,
	Email varchar(30) not null,
	NgayLT datetime not null,
	MaLDG int not null,
	Xoa int not null
	constraint PK_THEDOCGia priMary key (MaDG)
)

create table SACH
(
	MaSach int  identity(1,1) not null,
	TenSach nvarchar(100) not null,
	TacGia nvarchar(50) not null,
	NamXB int not null,
	NhaXB nvarchar(50) not null,
	NgayNhap datetime not null,
	TinhTrang nvarchar(30) not null,
	MaLS int not null,
	Xoa int not null
	constraint PK_SACH priMary key (MaSach)
)

create table LOAISACH
(
	MaLS int  identity(1,1) not null,
	TenLS nvarchar(30) not null,
	Xoa int not null
	constraint PK_LOAISACH priMary key (MaLS)
)

create table LOAINV
(
	MaLNV int  identity(1,1) not null,
	TenLNV nvarchar(30) not null,
	Xoa int not null
	constraint PK_LOAINV priMary key (MaLNV)
)

create table NHANVIEN
(
	MaNV int  identity(1,1) not null,
	TenNV nvarchar(50) not null,
	NgaySinh datetime not null,
	DiaChi nvarchar(100) not null,
	Email varchar(30) not null,
	TenDangNhap varchar(30) not null,
	MatKhau varchar(100) not null,
	MaLNV int not null,
	Xoa int not null
	constraint PK_NHANVIEN priMary key (MaNV)
)

create table PHIEUMUON
(
	MaPM int not null identity(1,1),
	MaDG int not null,
	NgayMuon datetime not null,
	NgayTra datetime,
	TienPhat float not null,
	Xoa int not null
	constraint PK_PHIEUMUON priMary key (MaPM)
)

create table CHITIETPHIEUMUON
(
	MaPM int not null,
	STT int not null,
	MaSach int not null,
	Xoa int not null
	constraint PK_CHITIETPHIEUMUON priMary key (MaPM, STT)
)

create table QUYDINH
(
	MaQD int not null identity(1,1),
	TenQD nvarchar(50) not null,
	KieuDL nvarchar(10) not null,
	GiaTri nvarchar(50) not null,
	TinhTrang nvarchar(20) not null
	constraint PK_QUYDINH priMary key (MaQD)
)
Go

alter table THEDOCGia
add constraint FK_THEDOCGia_LOAIDG
foreign key(MaLDG)
references LOAIDG(MaLDG)

alter table NHANVIEN
add constraint FK_NHANVIEN_LOAINV
foreign key(MaLNV)
references LOAINV(MaLNV)

alter table PHIEUMUON
add constraint FK_PHIEUMUON_THEDOCGia
foreign key(MaDG)
references THEDOCGia(MaDG)

alter table CHITIETPHIEUMUON
add constraint FK_CHITIETPHIEUMUON_PHIEUMUON
foreign key(MaPM)
references PHIEUMUON(MaPM)

alter table CHITIETPHIEUMUON
add constraint FK_CHITIETPHIEUMUON_SACH
foreign key(MaSach)
references SACH(MaSach)

alter table SACH
add constraint FK_SACH_LOAISACH
foreign key(MaLS)
references LOAISACH(MaLS)
Go

insert into LOAINV(TenLNV,Xoa)
values (N'Thủ thư',0),
		(N'Nhân viên',0)

insert into NHANVIEN(TenNV,NgaySinh,DiaChi,Email,TenDangNhap,MatKhau,MaLNV,Xoa)
values (N'Nguyễn Thủ Thư','19871210',N'123, Nguyễn Văn Cừ, Phường 2, Quận 5, Hồ Chí Minh',N'ntthu@gmail.com','Admin','87d9bb400c0634691f0e3baaf1e2fd0d',1,0),
		(N'Trịnh Nhân Viên','19990102',N'280, An Dương Vương, Phường 4, Quận 5, Hồ Chí Minh',N'tnvien@gmail.com','NhanVien','87d9bb400c0634691f0e3baaf1e2fd0d',1,0)

insert into LOAIDG(TenLDG,Xoa)
values (N'Học sinh',0),
		(N'Giáo viên',0),
		(N'Nhân viên thư viện',0)

insert into	THEDOCGia(hoTen,NgaySinh,Diachi,Email,NgayLT,MaLDG,Xoa)
values (N'Huỳnh Độc Giả','20000202',N'321, Nguyễn Trãi, Phường 7, Quận 5, Hồ Chí Minh','hdGia@gmail.com','20190109',1,0),
		(N'Hoàng Thảo My','19950305',N'151/6, Đồng Khởi, Quận 1, Hồ Chí Minh','htmy@gmail.com','20190114',1,0),
		(N'Đinh Thị Thùy Trang','19980101',N'10, Đặng Tất, Tân Định, Quận 1, Hồ Chí Minh','dtttrang@gmail.com','20190210',1,0),
		(N'Hỷ Hoàng Nam','19970503',N'17A, Ngô Văn Năm, phường Bến Nghé, Quận 1, Hồ Chí Minh','hhnam@gMail.com','20190216',1,0),		
		(N'Đoàn Hoàng Nam','19990303',N'Tầng thượng, 158 Pasteur, Bến Nghé, Quận 1, Hồ Chí Minh','dhnam@gMail.com','20190311',1,0),
		(N'Lê Mỹ Quang Minh','19980703',N'116 Hồ Tùng Mậu, Bến Nghé, Quận 1, Hồ Chí Minh','lmqminh@gMail.com','20190311',1,0),		
		(N'Hà Yến Thanh','19890305',N'36, Lê Lợi, Bến Nghé, Quận 1, Hồ Chí Minh','hythanh@gmail.com','20190615',1,0)


insert into QUYDINH(TenQD,KieuDL,GiaTri,TinhTrang)
values (N'Số sách mượn tối đa','int','5',N'Áp dụng'),
		(N'Số ngày mượn tối đa','int','4',N'Áp dụng'),
		(N'Số tuổi tối thiểu','int','18',N'Áp dụng'),
		(N'Số tuổi tối đa','int','35',N'Áp dụng'),
		(N'Thời hạn năm sản xuất tối đa','int','20',N'Áp dụng'),
		(N'Thời hạn thẻ độc giả','int','6',N'Áp dụng')

insert into LOAISACH(TenLS,Xoa)
values (N'Văn học',0),
		(N'Kỹ năng sống',0),
		(N'Kinh tế',0),
		(N'Bà mẹ - Em bé',0),
		(N'Y học',0),
		(N'Lịch sử',0),
		(N'Học ngoại ngữ',0)

insert into SACH(TenSach,tacGia,namXB,nhaXB,NgayNhap,TinhTrang,MaLS,Xoa)
values(N'Tôi là Bêtô',N'Nguyễn Nhật Ánh',2007,N'NXB Trẻ','20071212',N'Chưa mượn',1,0),
		(N'Nhà Giả Kim',N'Paulo Coelho',2013,N'NXB Văn học','20071212',N'Chưa mượn',1,0),
		(N'Sống Thực Tế Giữa Đời Thực Dụng',N'Mễ Mông',2018,N'NXB Dân Trí','20071212',N'Chưa mượn',2,0),
		(N'Bạn Đắt Giá Bao Nhiêu?',N'Vãn Tình',2018,N'NXB Thế Giới','20071212',N'Chưa mượn',2,0),
		(N'Đừng Lựa Chọn An Nhàn Khi Còn Trẻ',N'Cảnh Thiên',2019,N'NXB Thế Giới','20071212',N'Chưa mượn',2,0),
		(N'Đắc Nhân Tâm',N'Dale Carnegie',2016,N'NXB Tổng hợp TP.HCM','20071212',N'Chưa mượn',2,0),
		(N'Đọc Vị Bất Kỳ Ai',N'TS. David J. Lieberman',2018,N'NXB Lao động','20071212',N'Chưa mượn',3,0),
		(N'Khí Chất Bao Nhiêu, Hạnh Phúc Bấy Nhiêu',N'Vãn Tình',2018,N'NXB Thế Giới','20071212',N'Chưa mượn',2,0),
		(N'Tony Buổi Sáng - Trên Đường Băng',N'Tony Buổi Sáng',2017,N'NXB Trẻ','20071212',N'Chưa mượn',2,0),
		(N'999 Lá Thư Gửi Cho Chính Mình – Mong Bạn Trở Thành Phiên Bản Hoàn Hảo Nhất',N'Miêu Công Tử',2018,N'NXB Thanh niên','20071212',N'Chưa mượn',2,0),
		(N'Khéo Ăn Nói Sẽ Có Được Thiên Hạ',N'Trác Nhã',2018,N'NXB Văn học','20071212',N'Chưa mượn',3,0),
		(N'Không Gia Đình',N'Hector Malot',2018,N'NXB Văn Hóa - Văn Nghệ','20071212',N'Chưa mượn',1,0),
		(N'Hành Trình Về Phương Đông',N'Baird T. Spalding',2015,N'NXB Hồng Đức','20071212',N'Chưa mượn',2,0),
		(N'Để Con Được Ốm',N'Uyên Bùi - BS. Trí Đoàn',2016,N'NXB Thế Giới','20071212',N'Chưa mượn',4,0),
		(N'All The Rule - Sống Bản Lĩnh Theo Cách Một Quý Cô',N'Ellen Fein, Sherrie Schneider',2019,N'NXB Hà Nội','20071212',N'Chưa mượn',2,0),
		(N'Đàn Ông Sao Hỏa Đàn Bà Sao Kim',N'John Gray',2019,N'NXB Hồng Đức','20071212',N'Chưa mượn',2,0),
		(N'Nhân Tố Enzyme - Phương Thức Sống Lành Mạnh',N'Hiromi Shinya',2018,N'NXB Lao động','20071212',N'Chưa mượn',5,0),
		(N'Sapiens: Lược Sử Loài Người',N'Yuval Noah Harari',2017,N'NXB Tri thức','20071212',N'Chưa mượn',6,0),
		(N'Tự Học Tiếng Trung Cho Người Mới Bắt Đầu',N'The Zhishi',2016,N'NXB Đại Học Quốc Gia Hà Nội','20071212',N'Chưa mượn',7,0),
		(N'Chuyến Tàu Một Chiều Không Trở Lại',N'Kiên Trần',2019,N'NXB Hồng Đức','20071212',N'Chưa mượn',2,0)

insert into PHIEUMUON(MaDG,NgayMuon,NgayTra,TienPhat,Xoa)
values (1,'20190203','20190204',0,0),
		(2,'20190301','20190302',0,0),
		(3,'20190401','20190402',0,0),
		(4,'20190501','20190502',0,0),
		(5,'20190620','20190621',0,0),
		(6,'20190618','20190619',0,0),
		(1,'20190620','20190621',0,0),
		(2,'20190620','20190621',0,0),
		(3,'20190620','20190621',0,0),
		(4,'20190620','20190621',0,0),
		(5,'20190620','20190621',0,0),
		(6,'20190620','20190621',0,0),
		(7,'20190620','20190621',0,0),
		(1,'20190622','20190623',0,0),
		(2,'20190622','20190623',0,0),
		(3,'20190622','20190623',0,0),
		(4,'20190622','20190623',0,0),
		(5,'20190622','20190623',0,0),
		(6,'20190622','20190623',0,0),
		(7,'20190622','20190623',0,0)


insert into CHITIETPHIEUMUON(MaPM,STT,MaSach,Xoa)
values (1,1,1,0),
		(2,1,2,0),
		(3,1,3,0),
		(4,1,4,0),
		(5,1,5,0),
		(6,1,6,0),
		(7,1,7,0),
		(8,1,8,0),
		(9,1,9,0),
		(10,1,10,0),
		(11,1,11,0),
		(12,1,12,0),
		(13,1,13,0),
		(14,1,14,0),
		(15,1,14,0),
		(16,1,14,0),
		(17,1,14,0),
		(18,1,14,0),
		(19,1,14,0),
		(20,1,14,0)

Go

select *
from SACH

insert into PHIEUMUON(MaDG,NgayMuon,TienPhat,Xoa)
values (1,'20190619',0,0),
		(2,'20190622',0,0)

insert into CHITIETPHIEUMUON(MaPM,STT,MaSach,Xoa)
values (8,1,5,0),
		(8,2,15,0),
		(9,1,4,0)












