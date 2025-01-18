-- T01_ITEM, T02_ITEM_GROUP, T03_ITEM_DETAIL, T12_SIZE
INSERT INTO t02_item_group(C02_ITEM_GROUP_NAME) VALUES
('Áo'),
('Quần'),
('Giày'),
('Dép'),
('Mũ'),
('Thắt lưng'),
('Túi xách');

INSERT INTO t01_item(C01_ITEM_NAME, C01_ITEM_GROUP_ID) VALUES
('Áo 1',	1),
('Áo 2',	1),
('Áo 3',	1),
('Quần 4',	2),
('Quần 5',	2),
('Giày 6',	3),
('Giày 7',	3),
('Giày 8',	3),
('Giày 9',	3),
('Giày 10',	3),
('Giép 11',	4),
('Áo 12',	1),
('Giép 13',	4),
('Mũ 14',	5),
('Mũ 15',	5),
('Thắt lưng 16',6),
('Thắt lưng 17',6),
('Mũ 18', 5),
('Túi xách 1',7),
('Túi xách 2',7);

CALL p_insert_into_size();

-- T100_SUPPLIER, T101_SUPPLIER_CHAIN
INSERT INTO T100_SUPPLIER (C100_SUPPLIER_ID, C100_SUPPLIER_NAME, C100_SUPPLIER_TAX) VALUES
(1, 'NCC S1', 108767251),
(2, 'NCC S2', 108767252),
(3, 'NCC S3', 108767253),
(4, 'NCC S4', 108767254),
(5, 'NCC S5', 108767255);

SELECT max(C01_ITEM_ID) INTO @max_item_id FROM t01_item;

INSERT INTO T101_SUPPLIER_CHAIN(C101_ITEM_ID, C101_SUPPLIER_ID, C101_AMOUNT, C101_ENTERING_DATE, C01_BUY_PRICE)
SELECT C01_ITEM_ID ITEM_ID,
       CASE
		WHEN C01_ITEM_ID <= 4 THEN 1
        WHEN C01_ITEM_ID <= 8 THEN 2
        WHEN C01_ITEM_ID <= 12 THEN 3
        WHEN C01_ITEM_ID <= 16 THEN 4
        WHEN C01_ITEM_ID <= 20 THEN 5
       END AS SUPPLIER_ID,
       elt((floor(rand() * 5) + 1), 220, 400, 582, 600, 300) AMOUNT,
       DATE_SUB(current_timestamp(), INTERVAL (@max_item_id-C01_ITEM_ID) DAY) ENTERING_DATE,
       elt((floor(rand() * 6) + 1), 100, 120, 140, 160, 180, 200) BUY_PRICE
  FROM T01_ITEM
  ORDER BY C01_ITEM_ID; 
  
INSERT INTO T101_SUPPLIER_CHAIN(C101_SID, C101_ITEM_ID,	C101_SUPPLIER_ID, C101_AMOUNT, C101_ENTERING_DATE, C01_BUY_PRICE)
SELECT 21, 1, 2, 400, current_time(), 180;

INSERT INTO T101_SUPPLIER_CHAIN(C101_SID, C101_ITEM_ID,	C101_SUPPLIER_ID, C101_AMOUNT, C101_ENTERING_DATE, C01_BUY_PRICE)
SELECT 22, 5, 3, 200, current_time(), 280;

INSERT INTO T101_SUPPLIER_CHAIN(C101_SID, C101_ITEM_ID,	C101_SUPPLIER_ID, C101_AMOUNT, C101_ENTERING_DATE, C01_BUY_PRICE)
SELECT 23, 5, 4, 100, current_time(), 410;

INSERT INTO T03_ITEM_DETAIL(C03_ITEM_ID,	C03_SIZE_ID,	C03_COLOR,	C03_AMOUNT,	C03_SALES_PRICE
)
WITH CTE_ITEM_PRICE AS (
	SELECT C101_ITEM_ID ITEM_ID, 
       MAX(C01_BUY_PRICE) MAX_BUY_PRICE
    FROM T101_SUPPLIER_CHAIN
    GROUP BY C101_ITEM_ID
)
SELECT t01.C01_ITEM_ID ITEM_ID,
       t12.C12_SIZE_ID SIZE_ID,
       elt((floor(rand() * 5) + 1), 'red', 'yellow', 'blue', 'green', 'orange') COLOR,
       185 AMOUNT,
       cte.MAX_BUY_PRICE * 2 + t12.C12_SIZE_ID * 5
  FROM T01_ITEM t01, T12_SIZE t12, CTE_ITEM_PRICE cte -- cross join
 WHERE t01.C01_ITEM_ID MOD 2 != 0
   AND t12.C12_SIZE_ID MOD 2 != 0
   AND cte.ITEM_ID = t01.C01_ITEM_ID

UNION ALL

SELECT t01.C01_ITEM_ID ITEM_ID,
       t12.C12_SIZE_ID SIZE_ID,
       elt((floor(rand() * 5) + 1), 'red', 'yellow', 'blue', 'green', 'orange') COLOR,
       220 AMOUNT,
       cte.MAX_BUY_PRICE * 2 + t12.C12_SIZE_ID * 5 + 20
  FROM T01_ITEM t01, T12_SIZE t12, CTE_ITEM_PRICE cte -- cross join
 WHERE t01.C01_ITEM_ID MOD 2 = 0
   AND t12.C12_SIZE_ID MOD 2 = 0
   AND cte.ITEM_ID = t01.C01_ITEM_ID;


-- T08_CUSTOMER, T11_TITLE, T13_EMPLOYEE
CALL p_insert_into_customer(1, 10);

INSERT INTO T11_TITLE(C11_TITLE_ID, C11_TITLE_NAME) VALUES
(1, 'Nhân viên'),
(2, 'Trưởng bộ phận'),
(3, 'Giám đốc'),
(4, 'Chủ sở hữu');

CALL p_insert_into_employee(1, 10);


-- T09_PAYMENT_METHOD, T10_ORDER_STATUS
INSERT INTO T09_PAYMENT_METHOD (C09_PAYMENT_METHOD_ID, C09_PAYMENT_METHOD_TYPE) VALUES
(1, 'Thanh toán khi nhận hàng'),
(2, 'Thanh toán online - chuyển khoản'),
(3, 'Thanh toán online - thẻ ghi nợ');

INSERT INTO T10_ORDER_STATUS (C10_STATUS_ID, C10_STATUS_DESC) VALUES
(1, 'Chờ xác nhận'),
(2, 'Đang đóng gói'),
(3, 'Đóng gói hoàn thành'),
(4, 'Đang vận chuyển'),
(5, 'Giao hàng thành công'),
(6, 'Giao hàng thất bại'),
(7, 'Hủy đơn hàng');


-- T04_ORDER, T05_ORDER_DETAIL, T06_ORDER_STATUS_DETAIL, T07_BILL
CALL p_insert_into_order(1, 20);

INSERT INTO T05_ORDER_DETAIL (C05_ORDER_ID, C05_ITEM_DETAIL_ID, C05_AMOUNT) VALUES
(1, 1, 2),
(1, 3, 4),
(2, 4, 2),
(2, 5, 2),
(3, 6, 4),
(3, 2, 4),
(4, 8, 2),
(4, 12, 4),
(5, 88, 1),
(5, 22, 3),
(5, 11, 1),
(5, 33, 1),
(6, 2, 1),
(7, 1, 2),
(8, 27, 1),
(8, 23, 1),
(8, 98, 2),
(9, 100, 6),
(9, 11, 7),
(9, 45, 2),
(9, 22, 2),
(9, 32, 1),
(10, 18, 2),
(10, 29, 4),
(11, 33, 2),
(11, 65, 1),
(11, 1, 1),
(11, 2, 2),
(11, 5, 5),
(11, 7, 10),
(12, 55, 1),
(13, 92, 1),
(13, 14, 2),
(14, 5, 2),
(14, 7, 2),
(14, 2, 4),
(15, 9, 5),
(15, 44, 8),
(16, 23, 2),
(16, 18, 5),
(16, 66, 3),
(16, 77, 12),
(17, 1, 20),
(18, 82, 1),
(18, 84, 7),
(19, 12, 8),
(19, 20, 2),
(20, 30, 5),
(20, 100, 9),
(20, 70, 1);

INSERT INTO T06_ORDER_STATUS_DETAIL(C06_ORDER_ID, C06_STATUS_ID, C06_EMPLOYEE_ID, C06_LAST_UPDATED)
WITH CTE_ORDER_STATUS_DETAIL AS (

	-- Đơn hàng từ 1-5 --> Giao hàng thành công (1-5)
	-- Nhân viên 1
	SELECT t4.C04_ORDER_ID ORDER_ID,
		   t10.C10_STATUS_ID STATUS_ID,
		   1 EMPLOYEE_ID,
		   date_sub(current_timestamp(), INTERVAL (5 - t10.C10_STATUS_ID) DAY) LAST_UPDATED_AT
	  FROM T04_ORDER t4, T10_ORDER_STATUS t10
	 WHERE t4.C04_ORDER_ID BETWEEN 1 AND 5
	   AND t10.C10_STATUS_ID BETWEEN 1 AND 5

	UNION

	-- Đơn hàng từ 6-8 --> Đóng gói thành công (1-3)
	-- Nhân viên 2
	SELECT t4.C04_ORDER_ID ORDER_ID,
		   t10.C10_STATUS_ID STATUS_ID,
		   2 EMPLOYEE_ID,
		   date_sub(current_timestamp(), INTERVAL (3 - t10.C10_STATUS_ID) DAY) LAST_UPDATED_AT
	  FROM T04_ORDER t4, T10_ORDER_STATUS t10
	 WHERE t4.C04_ORDER_ID BETWEEN 6 AND 8
	   AND t10.C10_STATUS_ID BETWEEN 1 AND 3

	UNION

	-- Đơn hàng từ 9-10 --> Đang giao hàng (1-4)
	-- Nhân viên 3
	SELECT t4.C04_ORDER_ID ORDER_ID,
		   t10.C10_STATUS_ID STATUS_ID,
		   3 EMPLOYEE_ID,
		   date_sub(current_timestamp(), INTERVAL (4 - t10.C10_STATUS_ID) DAY) LAST_UPDATED_AT
	  FROM T04_ORDER t4, T10_ORDER_STATUS t10
	 WHERE t4.C04_ORDER_ID BETWEEN 9 AND 10
	   AND t10.C10_STATUS_ID BETWEEN 1 AND 4

	UNION

	-- Đơn hàng từ 11-12 --> Hủy đơn hàng (trạng thái 1 và 7)
	-- Nhân viên 4
	SELECT t4.C04_ORDER_ID ORDER_ID,
		   t10.C10_STATUS_ID STATUS_ID,
		   4 EMPLOYEE_ID,
		   date_sub(current_timestamp(), INTERVAL (7 - t10.C10_STATUS_ID) DAY) LAST_UPDATED_AT
	  FROM T04_ORDER t4, T10_ORDER_STATUS t10
	 WHERE t4.C04_ORDER_ID BETWEEN 11 AND 12
	   AND t10.C10_STATUS_ID IN (1, 7)

	UNION

	-- Đơn hàng từ 13  --> Giao hàng thất bại (trạng thái 1,2,3,4,6)
	-- Nhân viên 5
	SELECT t4.C04_ORDER_ID ORDER_ID,
		   t10.C10_STATUS_ID STATUS_ID,
		   5 EMPLOYEE_ID,
		   date_sub(current_timestamp(), INTERVAL (6 - t10.C10_STATUS_ID) DAY) LAST_UPDATED_AT
	  FROM T04_ORDER t4, T10_ORDER_STATUS t10
	 WHERE t4.C04_ORDER_ID >= 13
	   AND t10.C10_STATUS_ID IN (1, 2, 3, 4, 6)
)
SELECT ORDER_ID, STATUS_ID, EMPLOYEE_ID, LAST_UPDATED_AT FROM CTE_ORDER_STATUS_DETAIL;