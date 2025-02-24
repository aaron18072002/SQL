-- java22-shopping dbp 01.sql --> liên quan đến ITEM
-- T01_ITEM, T02_ITEM_GROUP, T03_ITEM_DETAIL, T12_SIZE

USE java22_shopping;

CREATE TABLE T02_ITEM_GROUP (
	C02_ITEM_GROUP_ID 					INT PRIMARY KEY AUTO_INCREMENT,
    C02_ITEM_GROUP_NAME 				VARCHAR(30) NOT NULL,
    CONSTRAINT UNQ_T02_ITEM_GROUP_NAME  UNIQUE(C02_ITEM_GROUP_NAME)
);

CREATE TABLE T01_ITEM (
	C01_ITEM_ID			INT PRIMARY KEY AUTO_INCREMENT,
    C01_ITEM_NAME		VARCHAR(30) NOT NULL,
    C01_ITEM_GROUP_ID	INT,
    CONSTRAINT FK_T01_T02 FOREIGN KEY (C01_ITEM_GROUP_ID)
						REFERENCES T02_ITEM_GROUP(C02_ITEM_GROUP_ID)
);

CREATE TABLE T12_SIZE (
	C12_SIZE_ID		INT PRIMARY KEY AUTO_INCREMENT,
    C12_SIZE_NAME	VARCHAR(5) NOT NULL,
    C12_GENDER		BIT(1) NOT NULL,
    C12_SIZE_DESC	TEXT,
    CONSTRAINT T12_SIZE_CHECK CHECK (C12_SIZE_NAME IN ('S','M','L','XL','XXL'))
);

CREATE TABLE T03_ITEM_DETAIL (
	C03_ITEM_DETAIL_ID		INT PRIMARY KEY AUTO_INCREMENT,
    C03_ITEM_ID				INT,
    C03_SIZE_ID				INT,
    C03_COLOR				VARCHAR(30) NOT NULL,
    C03_AMOUNT				INT NOT NULL DEFAULT(0),
    C03_SALES_PRICE			FLOAT NOT NULL,
    CONSTRAINT UNQ_T03_ITEM_DETAIL UNIQUE(C03_ITEM_ID,C03_SIZE_ID,C03_COLOR)
);