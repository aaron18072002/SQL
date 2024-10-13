-- FIBONACI
-- Sn = S(n-1) + S(n-2)

--WITH fibo(prev_n,n) AS (
--	SELECT
--		0 AS prev_n,
--		1 AS n
--	UNION ALL

--	SELECT
--		n AS prev_n,
--		prev_n + n AS n
--	FROM fibo
--)

--SELECT * FROM fibo
--OPTION (MAXRECURSION 5);

-- GIAI THUA

--WITH giai_thua(n, result) AS (
--	SELECT 
--		1 AS n,
--		1 AS result
--	UNION ALL

--	SELECT
--		n + 1 AS n,
--		(n + 1)*result AS result
--	FROM giai_thua
--	WHERE n < 5
--)

--SELECT * FROM giai_thua
--OPTION (MAXRECURSION 5)

-- Sử dụng truy vấn đệ quy để tạo một cây cấu trúc quản lý của nhân viên trong bảng "Employees“.
-- Trong đó “ReportsTo” chí là mã của người quản lý.

declare @EmployeeId int
SET @EmployeeId = 2;

WITH e_cte AS (
	--khoi tao
	SELECT E.EmployeeID,
		   E.FirstName+' '+E.LastName AS EmployeeName,
		   E.ReportsTo AS ManagerId,
		   0 AS Level
	FROM [dbo].[Employees] AS E
	WHERE E.EmployeeID = @EmployeeId

	UNION ALL
	--de quy
	SELECT E1.EmployeeID,
		   E1.FirstName+' '+E1.LastName AS EmployeeName,
		   E1.ReportsTo AS ManagerId,
		   Level + 1 AS Level
	FROM [dbo].[Employees] AS E1
	INNER JOIN e_cte ON E1.ReportsTo=e_cte.EmployeeId
)

SELECT * FROM e_cte
OPTION (MAXRECURSION 500)