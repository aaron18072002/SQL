USE java22_shopping;

SELECT * FROM t02_item_group;

DELIMITER $$
CREATE PROCEDURE mergeNewItemGroup (p_group_id INT, p_group_name VARCHAR(255))
BEGIN
	DECLARE counter INT;
	SELECT count(*) INTO counter FROM t02_item_group WHERE C02_ITEM_GROUP_ID=p_group_id;
	IF (counter = 0) THEN
		INSERT INTO t02_item_group(C02_ITEM_GROUP_ID, CO2_ITEM_GROUP_NAME)
		VALUES(p_group_id, p_group_name);
	ELSE
		UPDATE t02_item_group
		SET C02_ITEM_GROUP_NAME = P_group_name
		WHERE C02_ITEM_GROUP_ID = p_group_id;
	END IF;
END$$

CALL mergeNewItemGroup(null,'Dép quai hậu');

SELECT * FROM T01_ITEM AS t1
LEFT JOIN T02_ITEM_GROUP AS t2
ON t1.C01_ITEM_GROUP_ID = t2.C02_ITEM_GROUP_ID;

-- 15. Số lượng 'Giày 9' được bản trong ngày 23/11/2019 
SELECT t01.*
FROM t01_item AS t01 
JOIN t03_item_detail AS t03 ON t01.C01_ITEM_ID = t03.C03_ITEM_ID 
JOIN t05_order_detail AS t05 ON t05.C05_ITEM_DETAIL_ID = t03.C03_ITEM_DETAIL_ID 
JOIN t04_order AS t04 ON t04.C04_ORDER_ID = t05.C05_ORDER_ID 
WHERE date(t04.C04_ORDER_TIME) = '2024-10-27' 
AND t01.C01_ITEM_NAME LIKE '%Giày 9%';

SELECT * FROM T03_ITEM_DETAIL;