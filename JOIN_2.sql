-- Sử dụng INNER JOIN
-- Từ bảng Products và Categories, hãy in ra các thông tin sau đây:
-- Mã thể loại
-- Tên thể loại
-- Mã sản phẩm
-- Tên sản phẩm

SELECT P.ProductID, P.ProductName, C.CategoryID, C.CategoryName
FROM [dbo].[Products] AS P
INNER JOIN [dbo].[Categories] AS C
ON P.CategoryID = C.CategoryID

-- Sử dụng INNER JOIN và LEFT JOIN
-- Từ bảng Products và Categories, hãy đưa ra các thông tin sau đây:
-- Mà thể loại
-- Tên thế loại
-- Số lượng sản phẩm

SELECT C.CategoryID, C.CategoryName, COUNT(*) AS [TotalProducts]
FROM [dbo].[Products] AS P
INNER JOIN [dbo].[Categories] AS C
ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryID, C.CategoryName

SELECT C.CategoryID, C.CategoryName, COUNT(*) AS [TotalProducts]
FROM [dbo].[Categories] AS C
LEFT JOIN [dbo].[Products] AS P
ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryID, C.CategoryName

SELECT *
FROM [dbo].[Categories] AS C
LEFT JOIN [dbo].[Products] AS P
ON P.CategoryID = C.CategoryID

-- Sử dụng FULL OUTER JOIN
-- Từ bảng Products và Categories, hãy in ra các thông tin sau đây:
-- Mã thể loại
-- Tên thế loại
-- Mã sản phẩm
-- Tên sản phẩm

SELECT *
FROM [dbo].[Products] AS P
RIGHT JOIN [dbo].[Categories] AS C
ON P.CategoryID = C.CategoryID
