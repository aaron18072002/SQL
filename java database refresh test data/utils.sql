DROP PROCEDURE IF EXISTS p_insert_into_size;
DROP PROCEDURE IF EXISTS p_insert_into_customer;
DROP PROCEDURE IF EXISTS p_insert_into_employee;
DROP PROCEDURE IF EXISTS p_insert_into_order;

-- lưu ý khi tạo procedure với mysql workbench
-- phải có DELIMITER $$ trước và sau

DELIMITER $$
CREATE PROCEDURE p_insert_into_size()
BEGIN
	DECLARE running INT DEFAULT 1;
    DECLARE max_size_val INT DEFAULT 10;
    DECLARE size_name VARCHAR(50);
    DECLARE is_female BIT(1);
    
    DELETE FROM T12_SIZE;
    
    WHILE running <= max_size_val DO
        SET is_female := running <= 5;
        SET size_name := elt(if(is_female, running, running - 5), 'S', 'M', 'L', 'XL', 'XXL');
		INSERT INTO T12_SIZE(C12_SIZE_ID, C12_SIZE_NAME, C12_GENDER, C12_SIZE_DESC)
		VALUES(
			running, 
            size_name, 
            if(is_female, 0, 1),
            concat("Size '", size_name  ,"' cho ", if(is_female, 'Nữ', "Nam")));
		SET running := running + 1;    
    END WHILE;
    
END $$;


DELIMITER $$
CREATE PROCEDURE p_insert_into_customer(p_from INT, p_until INT)
BEGIN
    DECLARE is_exist BIT DEFAULT 0;
	
    WHILE p_from <= p_until DO
        SELECT (count(*) > 0) INTO is_exist FROM T08_CUSTOMER WHERE C08_CUSTOMER_ID = p_from;
 
        IF (is_exist) THEN
			INSERT INTO t999_logger(C999_message, c999_level)
            VALUES(concat('Customer ', p_from, ' is existing '), 'INFO');
        ELSE 
			INSERT INTO T08_CUSTOMER(C08_CUSTOMER_ID,C08_CUSTOMER_NAME,C08_CUSTOMER_EMAIL,C08_CUSTOMER_PHONE,C08_CUSTOMER_ADDRESS,C08_CUSTOMER_PASSWORD)
			SELECT p_from, 
				   concat('Khách Hàng A', p_from),
				   concat('c', p_from, '@gmail.com'),
				   '123456789',
				   concat('Địa chỉ', p_from),  
				   '$2a$12$msqp9i8Mf33td8UQ0B6uOTguWPB9RXANeiJV5FBLaaxAaQzZTIK';
		END IF;
        
        SET p_from := p_from + 1;
    END WHILE;
    
    SELECT * FROM t999_logger;
	TRUNCATE TABLE t999_logger;
END $$;


DELIMITER $$
CREATE PROCEDURE p_insert_into_employee(p_from INT, p_until INT)
BEGIN
    DECLARE is_exist BIT DEFAULT 0;
	
    WHILE p_from <= p_until DO
        SELECT (count(*) > 0) INTO is_exist FROM T13_EMPLOYEE WHERE C13_EMPLOYEE_ID = p_from;
 
        IF (is_exist) THEN
			INSERT INTO t999_logger(C999_message, c999_level)
            VALUES(concat('Employee ', p_from, ' is existing '), 'INFO');
        ELSE 
			INSERT INTO T13_EMPLOYEE(C13_EMPLOYEE_ID,C13_EMPLOYEE_NAME,C13_EMPLOYEE_EMAIL,C13_EMPLOYEE_PHONE,C13_EMPLOYEE_ADDRESS,C13_EMPLOYEE_PASSWORD, C13_TITLE_ID)
			SELECT p_from, 
				   concat('Nhân viên ', p_from),
				   concat('nv', p_from, '@gmail.com'),
				   '123456789',
				   concat('Địa chỉ', p_from),  
				   '$2a$12$msqp9i8Mf33td8UQ0B6uOTguWPB9RXANeiJV5FBLaaxAaQzZTIK',
                   1;
		END IF;
        
        SET p_from := p_from + 1;
    END WHILE;
    
    UPDATE T13_EMPLOYEE SET C13_TITLE_ID = 2 WHERE C13_EMPLOYEE_ID IN (3, 7);
    UPDATE T13_EMPLOYEE SET C13_TITLE_ID = 3 WHERE C13_EMPLOYEE_ID IN (8);
    UPDATE T13_EMPLOYEE SET C13_TITLE_ID = 4 WHERE C13_EMPLOYEE_ID IN (10);
    
    SELECT * FROM t999_logger;
	TRUNCATE TABLE t999_logger;
END $$;

DELIMITER $$
CREATE PROCEDURE p_insert_into_order(p_from INT, p_until INT)
BEGIN
	
    DECLARE pmethod_id INT;
    DECLARE pmethod_id_max INT DEFAULT (SELECT count(*) FROM t09_payment_method);
    
    WHILE p_from <= p_until DO
		SET pmethod_id := (SELECT floor(rand() * pmethod_id_max) + 1);
        
		INSERT INTO t04_order(C04_ORDER_ID,C04_RECEIVER_NAME,C04_RECEIVER_PHONE,C04_DELIVERY_ADDRESS,C04_ORDER_TIME,C04_PAYMENT_METHOD_ID,C04_CUSTOMER_ID)
		SELECT p_from,
               concat('Người nhận X', p_from),
               '258369741',
               concat('Địa chỉ X', p_from),
               current_timestamp() - INTERVAL (p_until - p_from)  HOUR,
               pmethod_id,
               CASE
					WHEN p_from <= 10 THEN p_from
                    ELSE p_from - 10
			   END AS p_customer_id;
        SET p_from := p_from + 1;
    END WHILE;
END $$