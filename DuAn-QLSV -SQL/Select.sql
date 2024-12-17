SELECT [TenHP]
FROM [dbo].[HocPhan] LEFT JOIN [dbo].[DiemHocPhan] ON [dbo].[HocPhan].MaHP = [DiemHocPhan].MaHP
WHERE [DiemHP] > 5
