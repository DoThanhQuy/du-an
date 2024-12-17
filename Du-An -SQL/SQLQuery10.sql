USE [QuanLiSinhVien]
GO

INSERT INTO [dbo].[khoa]
           ([MaKhoa]
           ,[TenKhoa])
     VALUES
           ('SP','Su pham')
		   ,('CNTT','Cong nghe thong tin')
		   ,('YK','Y khoa')
		   ,('KT','Ke Toan')
		   ,('QTKD','Quan tri kinh doanh')
		   ,('NNA','Ngon ngu Anh')
		   ,('DS','Duoc si')
GO
INSERT INTO [dbo].[Nganh]
           ([MaNganh]
           ,[TenNganh]
           ,[MaKhoa])
     VALUES
           ('140902','Su pham','SP')
		   ,('480202','Cong nghe thong tin','CNTT')
		   ,('243687','Cong nghe o to','CNOT')
		   ,('236357','Y khoa','YK')
		   ,('146246','Ke Toan','KT')
		   ,('651646','Quan tri kinh doanh','QTKD')
		   ,('486286','Ngon ngu Anh','NNA')
		   ,('437586','Duoc si','DS')

GO


