-- java22-shopping dbp 04.sql --> liên quan đến CUSTOMER, EMPLOYEE
-- T08_CUSTOMER, T11_TITLE, T13_EMPLOYEE

CREATE TABLE T08_CUSTOMER (
	C08_CUSTOMER_ID INT PRIMARY KEY AUTO_INCREMENT,
	C08_CUSTOMER_NAME VARCHAR(255) NOT NULL,
	C08_CUSTOMER_EMAIL VARCHAR(255) NOT NULL, -- username, should be unique
	C08_CUSTOMER_PHONE VARCHAR(255) NOT NULL,
	C08_CUSTOMER_ADDRESS TEXT NOT NULL,
	C08_CUSTOMER_PASSWORD TEXT NOT NULL,
    CONSTRAINT UNQ_T08_CUSTOMER_EMAIL UNIQUE(C08_CUSTOMER_EMAIL)
);

CREATE TABLE T11_TITLE (
	C11_TITLE_ID INT PRIMARY KEY AUTO_INCREMENT,
    C11_TITLE_NAME VARCHAR(255) NOT NULL,
	CONSTRAINT UNQ_T11_TITLE_NAME UNIQUE(C11_TITLE_NAME)
);

CREATE TABLE T13_EMPLOYEE (
	C13_EMPLOYEE_ID INT PRIMARY KEY AUTO_INCREMENT,
	C13_EMPLOYEE_NAME VARCHAR(255) NOT NULL,
	C13_EMPLOYEE_EMAIL VARCHAR(255) NOT NULL, -- username, shoule be unique
	C13_EMPLOYEE_PHONE VARCHAR(255) NOT NULL,
	C13_EMPLOYEE_ADDRESS TEXT NOT NULL,
	C13_EMPLOYEE_PASSWORD TEXT NOT NULL,
    C13_TITLE_ID INT NOT NULL,
    CONSTRAINT FK_T13_T11 FOREIGN KEY (C13_TITLE_ID) REFERENCES T11_TITLE(C11_TITLE_ID),
    CONSTRAINT UNQ_T13_EMPLOYEE_EMAIL UNIQUE(C13_EMPLOYEE_EMAIL)
);