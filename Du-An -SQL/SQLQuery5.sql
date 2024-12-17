create table khoa
(
MaKhoa nvarchar(50) primary key
,TenKhoa nvarchar(50) null
)
create table Nganh
(
MaNganh nvarchar (50) primary key
,TenNganh nvarchar(50) null
,MaKhoa nvarchar(50) foreign key references khoa(MaKhoa) on update cascade on delete cascade
)
create table Lop
(
MaLop nvarchar(50) primary key
,TenLop nvarchar(50) null
,MaNganh nvarchar(50) foreign key references Nganh(MaNganh) on update cascade on delete cascade
,KhoaHoc nvarchar(50) null
,HeDaoTao nvarchar(50) null
,NamNhapHoc int null check (NamNhapHoc>=2022)
)
create table HocPhan
(
MaHP nvarchar(50) primary key
,TenHP nvarchar(50) null
,SoTinChi int null check (SoTinChi>=2 and SoTinChi<=10)
,MaNganh nvarchar(50) foreign key references Nganh(MaNganh) on update cascade on delete cascade
,HocKy nvarchar(50) null check (HocKy in('1','2','3','4','5','6','7','8'))
)
create table TTSinhVien
(
MaSinhVien nvarchar(50) primary key
,HoTen nvarchar(50) not null
,MaLop nvarchar(50) foreign key references Lop(MaLop) on update cascade on delete cascade
,GioiTinh bit not null
,NgaySinh date not null
,DiaChi nvarchar (max) default N'Ch?a xác ??nh'
)
create table DiemHocPhan
(
MaSinhVien nvarchar(50)
,MaHP nvarchar(50)
,DiemHP float null check (DiemHP Between 0 and 10)
,constraint PK_DiemHP primary key (MaSinhVien,MaHP)
,constraint FK_SV foreign key(MaSinhVien) references TTSinhVien(MaSinhVien)
,constraint FK_HP foreign key(MaHP) references HocPhan(MaHP)
)

