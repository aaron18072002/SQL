CREATE DATABASE [JPL.L.A301_SMS]
CONTAINMENT = NONE
ON PRIMARY 
( 
    NAME = N'JPL.L.A301_SMS_TSQL_FILE', 
    FILENAME = N'D:\SQL\JPL.L.A301_SMS.mdf'
)
LOG ON
( 
    NAME = N'JPL.L.A301_SMS_TSQL_FILE_LOG', 
    FILENAME = N'D:\SQL\JPL.L.A301_SMS_LOG.ldf'
);

USE [JPL.L.A301_SMS];

DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS LineItem;

CREATE TABLE Customers (
    customer_id INT IDENTITY(1,1), 
    customer_name NVARCHAR(100) NOT NULL ,
	PRIMARY KEY (customer_id)
);

CREATE TABLE Employees (
    employee_id INT IDENTITY (1,1),
    employee_name NVARCHAR(100) NOT NULL,      
    salary DECIMAL(12, 2),           
    supervisor_id INT, 
	PRIMARY KEY (employee_id),
    FOREIGN KEY (supervisor_id) REFERENCES Employees(employee_id) 
);

CREATE TABLE Products (
    product_id INT IDENTITY (1,1), 
    product_name NVARCHAR(100) NOT NULL,      
    list_price DECIMAL(12, 2),   
	PRIMARY KEY (product_id)
);

CREATE TABLE Orders (
    order_id INT IDENTITY(1,1),  
    order_date DATE,                 
    customer_id INT,                 
    employee_id INT,                 
    total DECIMAL(12, 2),    
	PRIMARY KEY (order_id)
);

ALTER TABLE Orders
ADD CONSTRAINT fk_Orders_Customers
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id);
ALTER TABLE Orders
ADD CONSTRAINT fk_Orders_Employees
FOREIGN KEY (employee_id) REFERENCES Employees(employee_id);

CREATE TABLE LineItem (
    order_id INT,                  
    product_id INT,                
    quantity INT ,                   
    price DECIMAL(12, 2),          
    PRIMARY KEY (order_id, product_id),      
);

ALTER TABLE LineItem
ADD CONSTRAINT fk_LineItem_Products
FOREIGN KEY (product_id) REFERENCES Products(product_id);
ALTER TABLE LineItem
ADD CONSTRAINT fk_LineItem_Orders
FOREIGN KEY (order_id) REFERENCES Orders(order_id);

INSERT INTO Products (product_name, list_price)
VALUES 
    ('Laptop', 24000000.00),    
    ('Smartphone', 16800000.00),   
    ('Headphones', 3600000.00),    
    ('Tablet', 12000000.00),      
    ('Smartwatch', 6000000.00);    

INSERT INTO Employees (employee_name, salary, supervisor_id)
VALUES 
    ('Nguyễn Văn A', 12000000.00, NULL),  -- Supervisor
    ('Trần Thị B', 10000000.00, 1),
    ('Phạm Văn C', 9500000.00, 1),
    ('Lê Thị D', 9000000.00, 1),
    ('Đặng Văn E', 8500000.00, 1);

INSERT INTO Customers (customer_name)
VALUES 
    ('Công ty ABC'),
    ('Công ty DEF'),
    ('Công ty GHI');

INSERT INTO Orders (order_date, customer_id, employee_id, total)
VALUES 
    ('2025-01-01', 1, 2, 36000000.00), 
    ('2025-01-02', 1, 3, 24000000.00),  
    ('2025-01-03', 2, 4, 16800000.00), 
    ('2025-01-04', 2, 5, 36000000.00), 
    ('2025-01-05', 3, 2, 48000000.00),  
    ('2025-01-06', 3, 3, 6000000.00);   

INSERT INTO LineItem (order_id, product_id, quantity, price)
VALUES 
    (1, 1, 1, 24000000.00),   
    (1, 3, 2, 7200000.00),  
    (2, 2, 1, 16800000.00),  
    (3, 5, 1, 6000000.00),   
    (3, 3, 2, 7200000.00),   
    (4, 1, 1, 24000000.00),   
    (4, 4, 2, 24000000.00),   
    (5, 2, 2, 33600000.00), 
    (5, 4, 1, 12000000.00),  
    (6, 5, 1, 6000000.00);    

SELECT * FROM LineItem;
SELECT * FROM Orders;

SELECT O.*
FROM Orders AS O
LEFT JOIN Customers AS C
ON O.customer_id = C.customer_id
WHERE C.customer_id = 3;

SELECT Li.*
FROM LineItem AS LI
LEFT JOIN Orders AS O
ON LI.order_id = O.order_id
WHERE O.order_id = 1;

SELECT * FROM Employees;

SELECT * FROM Customers;

DROP FUNCTION IF EXISTS fn_computeOrderTotal;
GO
CREATE FUNCTION fn_computeOrderTotal
	(@orderId INT)
RETURNS DECIMAL(12,2)
AS
BEGIN
	DECLARE @total DECIMAL(12, 2);

	SELECT @total = SUM(LI.price * LI.quantity)
	FROM LineItem AS LI
	WHERE LI.order_id = @orderId;

	RETURN @total;
END;
GO

SELECT dbo.fn_computeOrderTotal(2) AS total_price;

-- thêm
GO
CREATE PROCEDURE sp_insertCustomer
	(@customerName NVARCHAR(100))
AS
BEGIN
	IF @customerName IS NULL
		BEGIN
			RETURN;
		END
	ELSE
		BEGIN
			INSERT INTO Customers (customer_name)
			VALUES (@customerName);
		END
END
GO

DECLARE @customerName NVARCHAR(100) = 'Công ty AAA'
EXEC sp_insertCustomer @customerName;

SELECT * FROM Customers;

-- xóa Customer
GO
CREATE PROCEDURE sp_deleteCustomer
    (@customerId INT)
AS
BEGIN
    BEGIN TRANSACTION;

    DELETE FROM LineItem
    WHERE order_id IN (SELECT order_id FROM Orders WHERE customer_id = @customerId);

    DELETE FROM Orders
    WHERE customer_id = @customerId;

    DELETE FROM Customers
    WHERE customer_id = @customerId;

    COMMIT TRANSACTION;
END;
GO

EXEC sp_deleteCustomer 4;

-- Data test cho câu 6
INSERT INTO Orders (order_date, customer_id, employee_id, total)
VALUES 
    ('2025-01-01', 5, 4, 36000000.00);

INSERT INTO LineItem (order_id, product_id, quantity, price)
VALUES 
    (10, 1, 1, 24000000.00),   
    (10, 3, 2, 7200000.00);

SELECT * FROM Orders;
SELECT* FROM LineItem;
SELECT* FROM Customers;

-- update
GO
CREATE PROCEDURE sp_updateCustomer
	(@customerId INT, @customerName NVARCHAR(100))
AS
BEGIN
	IF @customerName IS NULL
		BEGIN
			RETURN;
		END
	ELSE
		BEGIN
			UPDATE Customers
			SET customer_name = @customerName
			WHERE customer_id = @customerId;
		END
END
GO

SELECT * FROM Customers;

EXEC sp_updateCustomer @customerId = 1, @customerName = 'Công ty ABC';

-- câu 8
INSERT INTO Orders(customer_id,employee_id,order_date,total)
VALUES (null,null,null,null);

SELECT * FROM Orders;

-- câu 9
INSERT INTO LineItem(order_id,price,product_id,quantity)
VALUES (null,null,null,null);

SELECT * FROM LineItem;

-- cau 10
UPDATE Orders
SET total = 15000000
WHERE order_id = 12;
