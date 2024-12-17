GROUP BY[dbo].[TTSinhVien].MaSV

SELECT [dbo].[TTSinhVien].MaSV, COUNT([dbo].[DiemHocPhan].DiemHP) AS SoHocPhanThieu
FROM [dbo].[TTSinhVien] JOIN ON [dbo].[DiemHocPhan] [dbo].[dbo].[TTSinhVien].MaSV = [dbo].[DiemHocPhan].MaSV
WHERE [DiemHP]<5 

