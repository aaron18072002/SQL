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