SELECT COUNT(*)
FROM [Sales].[SalesOrderDetail]

-- Bật hiển thị thống kê về tài nguyên I/O
SET STATISTICS IO ON

-- TRUY VẤN
SELECT *
FROM [Sales].[SalesOrderDetail]
WHERE [CarrierTrackingNumber]='1B2B-492F-A9'

-- Tắt hiển thị thống kê về tài nguyên I/O
SET STATISTICS IO OFF

-- Tạo index cho [CarrierTrackingNumber]
CREATE INDEX idx_CarrierTrackingNumber
ON [Sales].[SalesOrderDetail] ([CarrierTrackingNumber])

-- Thực hành 2
-- • Tạo index trên bảng Person. Address, cột AddressLinel và đánh giá hiệu suất truy vấn.
-- • Tạo index cho cột "ProductName" trong bảng "Production. Product"và đánh giá hiệu suất truy vấn.

-- Bật hiển thị thống kê về tài nguyên I/O
SET STATISTICS IO ON

-- TRUY VẤN
SELECT *
FROM [Person].[Address]
WHERE [AddressLine1] LIKE '%9%'

-- Tắt hiển thị thống kê về tài nguyên I/O
SET STATISTICS IO OFF

CREATE INDEX idx_AddressLine1
ON [Person].[Address] ([AddressLine1])