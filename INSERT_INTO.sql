
-- Thêm một khách hàng mới

INSERT INTO [dbo].[Customers]
	(
		[Address],
		[CustomerName],
		[PhoneNumber]
	)
VALUES ('68 Luong Ngoc Quyen', 'Nguyen Thanh Anh', '0906413507'),
	   ('TITV.VN', 'Le Nhat Tung', '0123456789'),
	   ('TITV.VN', 'Le Nhat Tung', '0123456789'),
	   ('TITV.VN', 'Le Nhat Tung', '0123456789');

-- Bài tập 2:
-- Hãy viết một câu lệnh INSERT INTO để thêm đơn hàng sau: 
-- CustomerlD: Chọn một mã khách hàng hiện có trong bảng Customers. 
-- EmployeelD: Chọn một mã nhân viên hiện có trong bảng Employees. 
-- OrderDate: Sử dụng ngày hiện tại.
-- ShipVia: Chọn một mã Shipper hiện có trong bảng Shippers.

INSERT INTO [dbo].[Orders] (
	[CustomerID],
	[EmployeeID],
	[OrderDate],
	[ShipVia]
)
VALUES ('ALFKI', 1, GETDATE(), 1)