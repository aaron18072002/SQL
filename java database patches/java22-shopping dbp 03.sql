-- java22-shopping dbp 03.sql --> liên quan đến SUPPLIER
-- T100_SUPPLIER, T101_SUPPLIER_CHAIN

CREATE TABLE T100_SUPPLIER (
	C100_SUPPLIER_ID    INT PRIMARY KEY AUTO_INCREMENT,
    C100_SUPPLIER_NAME  VARCHAR(255) NOT NULL,
    C100_SUPPLIER_TAX   VARCHAR(255) NOT NULL,
    CONSTRAINT UNQ_T100_SUPPLIER_NAME UNIQUE(C100_SUPPLIER_NAME),
    CONSTRAINT UNQ_T100_SUPPLIER_TAX UNIQUE(C100_SUPPLIER_TAX)
);

CREATE TABLE T101_SUPPLIER_CHAIN (
	C101_SID INT PRIMARY KEY AUTO_INCREMENT,
	C101_ITEM_ID INT NOT NULL,
	C101_SUPPLIER_ID INT NOT NULL,
	C101_AMOUNT INT NOT NULL,
	C101_ENTERING_DATE DATETIME NOT NULL DEFAULT(current_timestamp()),
	C01_BUY_PRICE DOUBLE NOT NULL,
    CONSTRAINT FK_T101_T01 FOREIGN KEY (C101_ITEM_ID) REFERENCES T01_ITEM(C01_ITEM_ID),
    CONSTRAINT FK_T101_T100 FOREIGN KEY (C101_SUPPLIER_ID) REFERENCES T100_SUPPLIER(C100_SUPPLIER_ID),
    CONSTRAINT UNQ_T101_SUPPLIER_CHAIN UNIQUE(C101_ITEM_ID, C101_SUPPLIER_ID, C101_ENTERING_DATE)
);