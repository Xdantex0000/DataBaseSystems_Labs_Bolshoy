-- ЗАДАЧА 1
-- 1. Знайти кількість рядків в таблиці, що містить більше ніж 2147483647 записів.
-- SELECT COUNT_BIG(*);
-- 2. Підрахувати довжину свого прізвища (кількість символів) за допомогою SQL
--SELECT 'Bolshoy' AS Surname, LEN('Bolshoy') AS SurnameLength;

-- 3. У рядку зі своїм прізвищем, іменем та по-батькові замінити пробіли на знак «_» (нижнє підкреслення).
--SELECT 'Bolshoy Oleksandr Olegovich' AS String, REPLACE('Bolshoy Oleksandr Olegovich', ' ', '_') AS ConvertedString;

-- 4. Створити генератор імені електронної поштової скриньки, що шляхом конкатенації об’єднував би дві перші літери 
-- з колонки імені користувача у БД з чотирма першими літерами з колонки прізвища користувача у БД, і з вашим прізвищем у вигляді домену. 
--SELECT CONCAT(LEFT('Oleksandr', 2), LEFT('Bolshoy', 4), '@', 'Bolshoy') AS Email;

-- 5. За допомогою SQL визначити, в який день тижня ви народилися.--SELECT '10.02.2000' AS BirthDate, DatePart("w", '10.02.2000') AS BirthWeek;-- ЗАДАЧА 2-- 1. Вивести усі дані по продуктах, їхніх категоріях та постачальниках, навіть якщо останні з певних причин відсутні.--SELECT ProductName, Products.CategoryID, CategoryName, Products.SupplierID, ContactName FROM Products --FULL JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID--FULL JOIN Categories ON Products.CategoryID = Categories.CategoryID;-- 2. Показати усі замовлення, що були зроблені в квітні 1988 року та не були відправлені.--SELECT OrderID, OrderDate, ShippedDate FROM Orders WHERE DATEPART(MONTH, OrderDate) = 04 AND DATEPART(YEAR, OrderDate) = 1998 AND ShippedDate IS NULL; -- 3. Відібрати усіх працівників, що відповідають за північний регіон--SELECT * FROM Employees;--SELECT * FROM EmployeeTerritories;--SELECT * FROM Territories;--SELECT LastName, FirstName, Employees.EmployeeID, EmployeeTerritories.TerritoryID FROM Employees--FULL JOIN  EmployeeTerritories ON  Employees.EmployeeID = EmployeeTerritories.EmployeeID  --WHERE EmployeeTerritories.TerritoryID IN (--	SELECT TerritoryID FROM Territories WHERE RegionID = (--		SELECT RegionID FROM Region WHERE RegionDescription = 'Northern'));-- 4. Вирахувати загальну вартість усіх замовлень (з урахуванням знижки), що були здійснені на непарну дату. --SELECT SUM(UnitPrice*Quantity*(1-Discount)) AS OrdersSum FROM [Order Details]
--FULL JOIN Orders ON Orders.OrderID=[Order Details].OrderID
--WHERE DAY(ShippedDate)%2!=0;

-- 5. Знайти адресу відправлення замовлення з найбільшою ціною (враховуючи усі позиції замовлення, їхні вартість, кількість, та наявність знижки).
--SELECT ShipAddress FROM Orders WHERE OrderID=(
--	SELECT OrderID FROM [Order Details] WHERE UnitPrice*Quantity*(1-Discount) = (
--		SELECT MAX(UnitPrice*Quantity*(1-Discount)) FROM [Order Details] ) );