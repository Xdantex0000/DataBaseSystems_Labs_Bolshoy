-- 1) Додати себе як співробітника компанії на позицію Intern
--INSERT INTO Employees(LastName, FirstName, Title) VALUES ('Bolshoy', 'Oleksandr', 'Intern');
--SELECT LastName, FirstName, Title FROM Employees;

-- 2) Змінити свою посаду на Director. 
--UPDATE Employees
--SET Title = 'Director'
--WHERE LastName='Bolshoy' AND FirstName='Oleksandr';
--SELECT LastName, FirstName, Title FROM Employees;

-- 3) Скопіювати таблицю Orders в таблицю OrdersArchive.
--SELECT * INTO OrdersArchive FROM Orders;
--SELECT * FROM Orders ORDER BY OrderID;
--SELECT * FROM OrdersArchive ORDER BY OrderID;

-- 4) Очистити таблицю OrdersArchive
--TRUNCATE TABLE OrdersArchive;
--SELECT * FROM OrdersArchive;

-- 5) Не видаляючи таблицю OrdersArchive, наповнити її інформацією повторно
--INSERT INTO OrdersArchive
--SELECT CustomerID,EmployeeID,OrderDate,RequiredDate,ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPostalCode,ShipCountry FROM Orders
--SELECT * FROM OrdersArchive-- WHERE CustomerID='VINET'
--ORDER BY OrderID;

-- 6) З таблиці OrdersArchive видалити усі замовлення, які були зроблені замовниками із Берліну
--DELETE OrdersArchive WHERE ShipCity = 'Berlin';
--SELECT * FROM OrdersArchive WHERE ShipCity = 'Berlin';

-- 7) Внести в базу два продукти – з власним іменем та назвою групи
--INSERT INTO Products(ProductName) VALUES ('Oleksandr'), ('IS-71');
--SELECT * FROM Products WHERE ProductName='Oleksandr' OR ProductName='IS-71';

-- 8) Помітити продукти, що не фігурують в замовленнях, як такі, що більше не виробляються.
--UPDATE Products SET Discontinued= 'True'
--WHERE Products.ProductID NOT IN (SELECT ProductID FROM [Order Details]);
--SELECT * FROM Products WHERE Discontinued= 'True';

-- 9) Видалити таблицю OrdersArchive
--DROP TABLE OrdersArchive;

-- 10) Видалити базу Northwind.
-- DROP DATABASE Northwind;