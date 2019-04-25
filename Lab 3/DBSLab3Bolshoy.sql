-- 1) Використовуючи SELECT двічі, виведіть на екран своє ім’я, прізвище та побатькові одним результуючим набором.
--SELECT 'Bolshoy Oleksandr Olegovich' UNION SELECT 'Bolshoy Oleksandr Olegovich';

-- 2) Порівнявши власний порядковий номер в групі з набором із всіх номерів в групі, вивести на екран «;-)», 
--    якщо він менший за усі з них, або «:-D» в протилежному випадку
--CREATE TABLE #GroupNumbers (Number INT);
--INSERT INTO #GroupNumbers VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),
--									(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25);
WITH GroupNumbers(Numbers) AS (SELECT 1 AS Number
UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8)
SELECT Numbers,
	CASE
		WHEN Numbers < 3 THEN ';)'
		WHEN Numbers > 3 THEN ':-D'
		ELSE 'Me'
	END AS Answer
FROM GroupNumbers ORDER BY Numbers;




-- 3) Не використовуючи таблиці, вивести на екран прізвища та імена усіх дівчат 
--    своєї групи за винятком тих, хто має спільне ім’я із студентками іншої групи.
--WITH List (Names) AS (SELECT 'Marina Protsenko' AS girls 
--UNION SELECT 'Anna Chuz'
--UNION SELECT'Olesia Dmytruk'
--UNION SELECT'Alexandra Voznuk'
--UNION SELECT'Julia Alpaeva'
--UNION SELECT'Daria Khanuchenko'
--UNION SELECT'Darina Mozoleva'
--UNION SELECT 'Kate Novakivska'
--UNION SELECT 'Julia Scherbakova'
--UNION SELECT 'Anastasia Rudenko')  
--SELECT Names FROM List
--WHERE ((Names not like 'Alexandra%') AND (Names not like  'Vlada%') AND (Names not like 'Margarita%') 
--	    AND (Names not like 'Kate%') AND (Names not like 'Arina%') AND (Names not like 'Olena%') AND (Names not like 'Alisa%'));

-- 4) Вивести усі рядки з таблиці Numbers (Number INT). Замінити обрану цифру від 0
--    до 9 на її назву літерами. Якщо цифра більша або менша за обрану, залишити її без змін.
--DECLARE @num INT;
--SET @num=3;
--CREATE TABLE #Numbers1 (Number NVARCHAR(50));
--INSERT INTO #Numbers1 VALUES ('0'),('1'),('2'),('3'),('4'),('5'),('6'),('7'),('8'),('9');
--SELECT
--CASE 
--    WHEN Number='0' AND @num=0 THEN  'Zero'
--    WHEN Number='1' AND @num=1 THEN  'One'
--    WHEN Number='2' AND @num=2 THEN  'Two'
--    WHEN Number='3' AND @num=3 THEN  'Three'
--    WHEN Number='4' AND @num=4 THEN  'Four'
--    WHEN Number='5' AND @num=5 THEN  'Five'
--    WHEN Number='6' AND @num=6 THEN  'Six'
--    WHEN Number='7' AND @num=7 THEN  'Seven'
--    WHEN Number='8' AND @num=8 THEN  'Eight'
--    WHEN Number='9' AND @num=9 THEN  'Nine'
--    ELSE Number
--END AS NewNumber
--FROM #Numbers1;

-- 5) Навести приклад синтаксису декартового об’єднання для вашої СУБД.
--SELECT *
--FROM Products 
--CROSS JOIN Suppliers;

-- 6) Вивести усі замовлення та обрані для них служби доставки. Залежно від ідентифікатора служби доставки,
--    перейменувати її на таку, що відповідає вашому імені, або прізвищу, або по-батькові.
--SELECT ShipName,
--  CASE 
--    WHEN ShipVia = '1' THEN 'Bolshoy'
--    WHEN ShipVia = '2' THEN 'Oleksandr'
--    WHEN ShipVia = '3' THEN 'Olegovich'
--  END AS ShipViaRenamed
--FROM Orders;

-- 7) Вивести в алфавітному порядку усі країни, що фігурують в адресах клієнтів, в
--    адресах працівників, та в місцях доставки замовлень.
--SELECT Country FROM Customers
--UNION SELECT Country FROM Employees
--UNION SELECT ShipCountry FROM Orders
--ORDER BY Country;

-- 8) Вивести прізвище та ім’я працівника, а також кількість замовлень, які він обробив за перший квартал 1998 року.
--SELECT LastName, FirstName, COUNT(Orders.OrderID) AS NumOfOrders FROM Employees 
--JOIN Orders ON Orders.EmployeeID = employees.EmployeeID
--WHERE DATEPART(MONTH, Orders.OrderDate)='01' OR DATEPART(MONTH, Orders.OrderDate)='02' OR DATEPART(MONTH, Orders.OrderDate)='03' 
--AND DATEPART(YEAR, Orders.OrderDate)= '1998'
--GROUP BY LastName, FirstName;

-- 9) Використовуючи CTE (common table expression), знайти усі замовлення, в які
--    входять продукти, яких на складі більше 100 одиниць, проте по яких немає максимальних знижок
--SELECT MAX(Discount) AS MaxDiscount FROM [Order Details];
--WITH MyProductsTable AS (
--SELECT OrderID,UnitsInStock,Discount FROM [Order Details]
--JOIN Products ON [Order Details].ProductID=Products.ProductID )
--SELECT * FROM MyProductsTable
--WHERE UnitsInStock>100 AND Discount<(SELECT MAX(Discount) FROM [Order Details]);

-- 10) Знайти назви усіх продуктів, що не продаються в південному регіоні
--SELECT ProductName FROM Products
--JOIN [Order Details] ON [Order Details].ProductID = Products.ProductID
--JOIN Orders ON Orders.OrderID=[Order Details].OrderID
--JOIN EmployeeTerritories ON EmployeeTerritories.EmployeeID=Orders.EmployeeID
--JOIN Territories ON EmployeeTerritories.TerritoryID=Territories.TerritoryID
--JOIN Region ON Territories.RegionID=Region.RegionID
--WHERE Region.RegionDescription NOT LIKE 'Southern';
