CREATE DATABASE EmployeesDb
ON (
	NAME = 'employeesdb_data',
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\employeesdb_data.mdf',
	SIZE = 10MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB
)
LOG ON (
	NAME = 'employeesdb_log',
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\employeesdb_log.ldf',
	SIZE = 5MB,
	MAXSIZE = 50MB,
	FILEGROWTH = 5MB
)

CREATE TABLE Employees (
	EmployeeId INT NOT NULL PRIMARY KEY,
	FullName VARCHAR(40) NOT NULL,
	Gender VARCHAR(10) NOT NULL,
	DateOfBirth DATE,
	[Address] VARCHAR(50),
	PhoneNumber VARCHAR(10)
)

CREATE TABLE Customers (
	CustomerId INT IDENTITY(1,1) PRIMARY KEY,
	CustomerName VARCHAR(40) NOT NULL,
	[Address] VARCHAR(50),
	PhoneNumber VARCHAR(10) NOT NULL CHECK (PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)

ALTER TABLE Employees
ADD EMAIL VARCHAR(30)

EXEC sp_rename 'Employees.EMAIL', 'Email', 'COLUMN';

ALTER TABLE Employees
ALTER COLUMN [Address] VARCHAR(100)

ALTER TABLE Employees
ADD CONSTRAINT DateOfBirth CHECK (DateOfBirth < GetDate())

--+ yc1: tạo bảng SinhVien với các cột sau:
--+ MaSV: kiểu dữ liệu INT, khóa chính, không thể chứa giá trị null
--+ HoTen: Kiểu dữ liệu Varchar(50), không thể chứ giá trị null
--+ Lop: Kiểu dữ liệu Varchar(20)
--+ Nganh: Kiểu dữ liệu Varchar(20)
--+ DiemTB: Kiểu dữ liệu Float

CREATE TABLE Students (
	StudentId INT NOT NULL PRIMARY KEY,
	FullName VARCHAR(50) NOT NULL,
	Class VARCHAR(20),
	Major VARCHAR(20),
	AverageScore FLOAT
)

--yc2: thêm cột Email vào bảng SinhVien với kiểu dữ liệu varchar(100)

ALTER TABLE Students
ADD Email VARCHAR(100)

--yc3: sửa đổi kiểu dữ liệu của cột DiemTB trong bảng SinhVien thành kiểu dữ liệu Decimal(2,1)

ALTER TABLE Students
ALTER COLUMN AverageScore DECIMAL(2,1)

--yc4: xóa cột ngành khỏi bảng SinhVien

ALTER TABLE Students
DROP COLUMN Major

--yc5: Thêm ràng buộc kiểm tra cho cột DiemTB trong bảng SinhVien để giá trị phải >= 0 và <= 10

ALTER TABLE Students
ADD CONSTRAINT AverageScore CHECK (AverageScore >= 0 AND AverageScore <= 10)

--yc6: Thêm ràng buộc duy nhất cho cột MaSV trong bảng SinhVien

ALTER TABLE Students
ADD CONSTRAINT StudentId UNIQUE (StudentId)