-- ������ 1
-- 1. ������ ������� ����� � �������, �� ������ ����� �� 2147483647 ������.
-- SELECT COUNT_BIG(*);
-- 2. ϳ��������� ������� ����� ������� (������� �������) �� ��������� SQL
--SELECT 'Bolshoy' AS Surname, LEN('Bolshoy') AS SurnameLength;

-- 3. � ����� � ���� ��������, ������ �� ��-������� ������� ������ �� ���� �_� (���� �����������).
--SELECT 'Bolshoy Oleksandr Olegovich' AS String, REPLACE('Bolshoy Oleksandr Olegovich', ' ', '_') AS ConvertedString;

-- 4. �������� ��������� ���� ���������� ������� ��������, �� ������ ������������ �ᒺ������ �� �� ����� ����� 
-- � ������� ���� ����������� � �� � ������� ������� ������� � ������� ������� ����������� � ��, � � ����� �������� � ������ ������. 
--SELECT CONCAT(LEFT('Oleksandr', 2), LEFT('Bolshoy', 4), '@', 'Bolshoy') AS Email;

-- 5. �� ��������� SQL ���������, � ���� ���� ����� �� ����������.--SELECT '10.02.2000' AS BirthDate, DatePart("w", '10.02.2000') AS BirthWeek;-- ������ 2-- 1. ������� �� ��� �� ���������, ���� ��������� �� ��������������, ����� ���� ������ � ������ ������ ������.--SELECT ProductName, Products.CategoryID, CategoryName, Products.SupplierID, ContactName FROM Products --FULL JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID--FULL JOIN Categories ON Products.CategoryID = Categories.CategoryID;-- 2. �������� �� ����������, �� ���� ������� � ���� 1988 ���� �� �� ���� ���������.--SELECT OrderID, OrderDate, ShippedDate FROM Orders WHERE DATEPART(MONTH, OrderDate) = 04 AND DATEPART(YEAR, OrderDate) = 1998 AND ShippedDate IS NULL; -- 3. ³������ ��� ����������, �� ���������� �� ������� �����--SELECT * FROM Employees;--SELECT * FROM EmployeeTerritories;--SELECT * FROM Territories;--SELECT LastName, FirstName, Employees.EmployeeID, EmployeeTerritories.TerritoryID FROM Employees--FULL JOIN  EmployeeTerritories ON  Employees.EmployeeID = EmployeeTerritories.EmployeeID  --WHERE EmployeeTerritories.TerritoryID IN (--	SELECT TerritoryID FROM Territories WHERE RegionID = (--		SELECT RegionID FROM Region WHERE RegionDescription = 'Northern'));-- 4. ���������� �������� ������� ��� ��������� (� ����������� ������), �� ���� ������� �� ������� ����. --SELECT SUM(UnitPrice*Quantity*(1-Discount)) AS OrdersSum FROM [Order Details]
--FULL JOIN Orders ON Orders.OrderID=[Order Details].OrderID
--WHERE DAY(ShippedDate)%2!=0;

-- 5. ������ ������ ����������� ���������� � ��������� ����� (���������� �� ������� ����������, ��� �������, �������, �� �������� ������).
--SELECT ShipAddress FROM Orders WHERE OrderID=(
--	SELECT OrderID FROM [Order Details] WHERE UnitPrice*Quantity*(1-Discount) = (
--		SELECT MAX(UnitPrice*Quantity*(1-Discount)) FROM [Order Details] ) );