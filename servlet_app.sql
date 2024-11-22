SHOW DATABASES;
USE mysql;

CREATE TABLE ACCOUNT
	(accno INT, lastname VARCHAR(25), firstname VARCHAR(25), bal INT);
    
SELECT * FROM ACCOUNT;

INSERT INTO ACCOUNT(accno, lastname, firstname, bal)
VALUES (1,'Johnny','Evan',10000);

SET @currentBalOfNemo = (SELECT bal FROM ACCOUNT WHERE accno = 2);

SET SQL_SAFE_UPDATES = 0; 
UPDATE ACCOUNT
SET bal = @currentBalOfNemo + 35000
WHERE accno = 2;
SET SQL_SAFE_UPDATES = 1;

INSERT INTO ACCOUNT(accno,lastname,firstname,bal)
VALUES (3, 'Nguyen','C',12000),
	   (4, 'Nguyen','D',13000),
       (5, 'Nguyen','E',14000);
       
-- ------------------------------------------------------------------------ 

USE servlet_app;

CREATE TABLE USER (
	UserId INT auto_increment PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Email VARCHAR(20),
    Password VARCHAR(20)
);

SELECT * FROM USER;

SELECT * FROM User WHERE Email = 'nemo1@gmail.com';

INSERT INTO USER(FirstName,LastName,Email,Password)
VALUES ('Nemo1','Nguyen1','nemo1@gmail.com','nemo123');

UPDATE USER
SET Password = 'nemo1234'
WHERE Email = 'nemo@gmail.com';

SHOW VARIABLES LIKE 'datadir';

-- -----------------------------------------

USE servlet_app;

CREATE TABLE Product (
	Id INT auto_increment primary key,
    Name VARCHAR(20) NOT NULL,
    Description VARCHAR (50),
    Price INT
);

SELECT * FROM Product;

INSERT INTO Product(Name, Description, Price)
VALUES ('Asus ROG','New Model',1000);

UPDATE Product
SET Price = 250
WHERE Id = 2;

