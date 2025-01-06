-- create table logger
CREATE TABLE T999_LOGGER(
	C999_MESSAGE TEXT,
    C999_LEVEL TEXT
);

-- update primary key
-- ALTER TABLE T05_ORDER_DETAIL DROP PRIMARY KEY;

-- 16:57:23	ALTER TABLE T05_ORDER_DETAIL DROP PRIMARY KEY	
-- Error Code: 1553. Cannot drop index 'PRIMARY': needed in a foreign key constraint	0.016 sec