USE [qldl]
GO

INSERT INTO [dbo].[DmNganh]
           ([MaNganh]
           ,[TenNganh]
           ,[MaKhoa])
     VALUES
           ('140902','Sư phạm toán tin','SP')
		   ,('480202','Tin học ứng dụng','CNTT')
GO
USE [qldl]
GO
USE [qldl]
GO


INSERT INTO [dbo].[DmLop]
           ([MaLop]
           ,[TenLop]
           ,[MaNganh]
           ,[KhoaHoc]
           ,[HeDaoTao]
           ,[NamNhapHoc])
     VALUES
           ('CT11',N'Cao đẳng tin học','480202','11','TC','2022')
           ,('CT12',N'Cao đẳng tin học','480202','12','CĐ','2022')
           ,('CT13',N'Cao đẳng tin học','480202','13','CĐ','2022')

GO

INSERT INTO [dbo].[SinhVien]
           ([MaSinhVien]
           ,[HoTen]
           ,[MaLop]
           ,[GioiTinh]
           ,[NgaySinh]
           ,[DiaChi])
     VALUES
 ('001',N'Phan Thanh','CT12','False','09/12/1990',N'Tuy Phương')
,('002',N'Nguyễn Thị Cẩm','CT12','True','01/12/1994',N'Quy Nhơn')
,('003',N'Võ Thị Hà','CT12','True','07/02/1995',N'An Nhơn')
,('004',N'Trần Hoài Nam','CT12','False','04/05/1994',N'Tây Sơn')
,('005',N'Trần Văn Hoàng','CT13','False','08/04/1995',N'Vĩnh Thạch')
,('006',N'Đặng Thị Thảo','CT13','True','06/12/1995',N'Quy Nhơn')
,('007',N'Lê Thị Sen','CT13','True','08/12/1994',N'Phủ Cát')
,('008',N'Nguyễn Văn Huy','CT11','False','06/04/1995',N'Phú Mĩ')
,('009',N'Trần Thị Hoa','CT11','True','08/09/1994',N'Hoài Nhơn')

GO


USE [qldl]
GO

INSERT INTO [dbo].[DmKhoa]
           ([MaKhoa]
           ,[TenKhoa])
     VALUES
           ('CNTT','Công nghệ thông tin')
		   ,('KT','Kế toán')
		   ,('SP','Sư Phạm')

GO
USE [qldl]
GO

INSERT INTO [dbo].[DmHocPhan]
           ([MaHP]
           ,[TenHP]
           ,[SoTinChi]
           ,[MaNganh]
           ,[HocKy])
     VALUES
 ('001',N'toán cao cấp A1','4','480202' ,'1')
,('002',N'Tiếng Anh 1','3','480202','1')
,('003',N'Vật lý đại cương','4','480202','1')
,('004',N'Tiếng anh 2','7','480202','1')
,('005',N'Tiếng anh 1','3','140902','2')
,('006',N'xác xuất  thống kê','3','140902','2')

GO



USE [qldl]
GO

INSERT INTO [dbo].[DiemHP]
           ([MaSinhVien]
           ,[MaHP]
           ,[DiemHP])
     VALUES
  ('002','002','5.9')
,('002','003','4.5')
,('003','001','4.3')
,('003','002','6.7')
,('003','003','7.3')
,('004','001','4.0')
,('004','002','5.2')
,('004','003','3.5')
,('005','001','9.8')
,('005','002','7.9')
,('005','003','7.5')
,('006','001','6.1')
,('006','002','5.6')
,('006','003','4.0')
,('007','001','6.2')

         
		  
GO


