/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [MaSinhVien]
      ,[MaHP]
      ,[DiemHP]
  FROM [qldl].[dbo].[DiemHP]
  WHERE [DiemHP] >= 5

  SELECT [dbo].[SinhVien].MaSV,[HoTen],[MaLop],[MaHP],[DiemHP]
FROM [dbo].[SinhVien] INNER JOIN [dbo].[DiemHP]  ON [dbo].[SinhVien] .MaSV = [dbo].[DiemHP].MaSV
ORDER BY [MaLop],[HoTen] ASC

SELECT [dbo].[SinhVien].MaSV,[HoTen],[MaLop],[DiemHP],[dbo].[DiemHP].[MaHP]
FROM [dbo].[SinhVien] INNER JOIN [dbo].[DiemHP] ON [dbo].[SinhVien].MaSV = [dbo].[DiemHP].MaSV
      JOIN [dbo].[DmHocPhan] ON [dbo].[DmHocPhan].[MaHP] = .[MaHP]
WHERE ([DiemHP] between 5 and 7 ) and ([HocKy]=1)

SELECT [dbo].[SinhVien].MaSV, SUM([DiemHP]*[Sodvht])/SUM([Sodvht]) AS DiemTBC
FROM  
         [dbo].[DiemHP] INNER JOIN
		                           [dbo].[SinhVien] ON [dbo].[DiemHP].MaSV = [dbo].[SinhVien].MaSV INNER JOIN 
 		                            [dbo].[DmHocPhan] ON [dbo].[DiemHP].MaHP = [dbo].[DmHocPhan].MaHP
GROUP BY[dbo].[SinhVien].MaSV

SELECT [dbo].[SinhVien].MaSV, COUNT([dbo].[DiemHP].DiemHP) AS SoHocPhanThieu
FROM [dbo].[SinhVien] JOIN ON [dbo].[DiemHP] [dbo].[dbo].[SinhVien].MaSV = [dbo].[DiemHP].MaSV
WHERE [DiemHP]<5 
GROUP BY [dbo].[SinhVien].MaSV

SELECT [TenLop], COUNT([dbo].[SinhVien].MaSV) AS SoLuongSinhVien
From [dbo].[DMLOP] join  [dbo].[SinhVien]  ON [dbo].[dbo].[DmLop].MaLop =[dbo].[SinhVien].MaLop
GROUP BY [TenLop]
       HAVING COUNT([dbo].[SinhVien].MaSV) < 10

	 
SELECT [dbo].[SinhVien].MaSV, [HoTen], [DiemHP] AS DiemCaoNhat
FROM [dbo].[DiemHP]
						 join [dbo].[SinhVien] ON [dbo].[DiemHP].MaSV = [dbo].[SinhVien].MaSV
						 join [dbo].[DMHocPhan] ON [dbo].[DiemHP].MaHP = [dbo].[DMHocPhan].MaHP
ORDER BY [DiemHP] DESC