-- 1) ������ ���� �� ����������� ������ �� ������� Intern
--INSERT INTO Employees(LastName, FirstName, Title) VALUES ('Bolshoy', 'Oleksandr', 'Intern');
--SELECT LastName, FirstName, Title FROM Employees;

-- 2) ������ ���� ������ �� Director. 
--UPDATE Employees
--SET Title = 'Director'
--WHERE LastName='Bolshoy' AND FirstName='Oleksandr';
--SELECT LastName, FirstName, Title FROM Employees;

-- 3) ��������� ������� Orders � ������� OrdersArchive.
--SELECT * INTO OrdersArchive FROM Orders;
--SELECT * FROM Orders ORDER BY OrderID;
--SELECT * FROM OrdersArchive ORDER BY OrderID;

-- 4) �������� ������� OrdersArchive
--TRUNCATE TABLE OrdersArchive;
--SELECT * FROM OrdersArchive;

-- 5) �� ��������� ������� OrdersArchive, ��������� �� ����������� ��������
--INSERT INTO OrdersArchive
--SELECT CustomerID,EmployeeID,OrderDate,RequiredDate,ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPostalCode,ShipCountry FROM Orders
--SELECT * FROM OrdersArchive-- WHERE CustomerID='VINET'
--ORDER BY OrderID;

-- 6) � ������� OrdersArchive �������� �� ����������, �� ���� ������� ����������� �� ������
--DELETE OrdersArchive WHERE ShipCity = 'Berlin';
--SELECT * FROM OrdersArchive WHERE ShipCity = 'Berlin';

-- 7) ������ � ���� ��� �������� � � ������� ������ �� ������ �����
--INSERT INTO Products(ProductName) VALUES ('Oleksandr'), ('IS-71');
--SELECT * FROM Products WHERE ProductName='Oleksandr' OR ProductName='IS-71';

-- 8) ������� ��������, �� �� ��������� � �����������, �� ���, �� ����� �� ������������.
--UPDATE Products SET Discontinued= 'True'
--WHERE Products.ProductID NOT IN (SELECT ProductID FROM [Order Details]);
--SELECT * FROM Products WHERE Discontinued= 'True';

-- 9) �������� ������� OrdersArchive
--DROP TABLE OrdersArchive;

-- 10) �������� ���� Northwind.
-- DROP DATABASE Northwind;