-- 1) ������� �� ����� ����� ��� ������� � ��� ����� �� ������� ����� � ���
--USE Northwind;
--SELECT T.name AS [TABLE NAME], 
--       I.rows AS [ROWCOUNT] 
--FROM   sys.tables AS T 
--       INNER JOIN sys.sysindexes AS I 
--               ON T.object_id = I.id 
--                  AND I.indid < 2 
--ORDER  BY I.rows DESC;	

-- 2) ������ ����� �� ������� ���� ����� Northwind ��� ������������ ���� ����.
--    ��� ������� ��������� ��������� �� ������� ���� �������� ������������.
--GRANT SELECT ON DATABASE::Northwind TO PUBLIC;

-- 3) �� ��������� ������� ���������� ������������ TestUser ������ �� ��� ������� ������� ���� �����, 
--    ����� ������ ����������� �� ������� �prod_�.

--Declare @bantable nvarchar(50);
--USE Northwind;
--GO
--DECLARE cours CURSOR FOR
--SELECT table_name FROM information_schema.tables
--WHERE TABLE_CATALOG='Northwind'
--AND left(table_name, 4) = 'prod'
--
--OPEN cours
--FETCH NEXT FROM cours 
--INTO @bantable
--
--WHILE @@FETCH_STATUS<>0
--BEGIN
--    DENY ALL ON dbo.[@bantable] to TestUser
--  FETCH NEXT FROM cours INTO @bantable
--END;
--CLOSE cours ; 
--DEALLOCATE cours;
--
--


-- 4) �������� ������ �� ������� Customers, ���� ��� ������� ������ ����������� ������ ���� �������� �� �������, ��� ����.
--GO
--CREATE TRIGGER PhoneUpdate
--ON Customers
--INSTEAD OF INSERT 
--AS
--INSERT INTO Customers(CustomerID,CompanyName,Phone)
--SELECT CustomerID,CompanyName,(REPLACE(TRANSLATE([Phone], 'abcdefghijklmnopqrstuvwxyz+()- ,#+.', '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'), '@', '')) From inserted;
--DROP TRIGGER PhoneUpdate;
--insert into Customers(CustomerID,CompanyName,Phone)
--values('aa','1','a99997sdfsdfs7dfgdf');
--SELECT * FROM Customers;

-- 5)�������� ������� Contacts (ContactId, LastName, FirstName, PersonalPhone, WorkPhone, Email, PreferableNumber). 
--   �������� ������, ���� ��� ������� ����� � ������� Contacts �������� � ����� PreferableNumber WorkPhone,
--   ���� ����� �, ��� PersonalPhone, ���� ������� ����� �������� �� �������.
--CREATE TABLE Contacts
--(
--  ContactId NVARCHAR(50),
--  LastName NVARCHAR(50),
--  FirstName NVARCHAR(50),
--  PersonalPhone NVARCHAR(50),
--  WorkPhone NVARCHAR(50),
--  Email NVARCHAR(50),
--  PreferableNumber NVARCHAR(50),
--);

--GO
--CREATE TRIGGER InsertChange
--ON Contacts
--INSTEAD OF INSERT 
--AS
--IF (SELECT WorkPhone FROM inserted) IS NOT NULL
--   INSERT INTO Contacts(ContactId,WorkPhone,PreferableNumber)
--   SELECT ContactId ,WorkPhone, WorkPhone FROM inserted
--ELSE 
--    INSERT INTO Contacts(ContactId,PersonalPhone,PreferableNumber)
--    SELECT ContactId,PersonalPhone,PersonalPhone FROM inserted;
--DROP TRIGGER InsertChange;

--INSERT INTO Contacts(ContactId,PersonalPhone)
--Values(1,'1111111');

-- 6) �������� ������� OrdersArchive, �� ������ �������� Orders �� �� �������� �������� DeletionDateTime �� DeletedBy.
--    �������� ������, ���� ��� ��������� ����� � ������� Orders ���� �������� �� � ������� OrdersArchive ��
--    ����������� �������� �������.*/

--CREATE TABLE OrdersArchive1 (
--    OrderID int NOT NULL,
--    CustomerID NVARCHAR(50),
--    EmployeeID NVARCHAR(50),
--    OrderDate date,
--    RequiredDate date,
--    ShippedDate date,
--    ShipVia NVARCHAR(50),
--    Freight NVARCHAR(50),
--    ShipName NVARCHAR(50),
--    ShipAddres NVARCHAR(50),
--    ShipCity NVARCHAR(50),
--    ShipRegion NVARCHAR(50),
--    ShipPostalCode NVARCHAR(50),
--    ShipCountry NVARCHAR(50),
--    DeletionDateTime Date,
--    DeletedBy NVARCHAR(50)
--);

--GO
--CREATE TRIGGER OrdersDelete
--ON Orders
--AFTER DELETE
--AS
--INSERT INTO OrdersArchive1(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,ShippedDate,ShipVia,Freight,ShipName,ShipAddres,ShipCity,ShipRegion,ShipPostalCode,ShipCountry,DeletionDateTime,DeletedBy)
--SELECT OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPostalCode,ShipCountry,GETDATE(),'Oleksandr' FROM DELETED;
----DROP TRIGGER OrdersDelete;
--SELECT * FROM Orders;
--DELETE [Order Details] Where OrderID=10251;
--DELETE Orders Where OrderID=10251;
--SELECT * FROM OrdersArchive1;
--DROP TABLE OrdersArchive1;


--7. �������� ��� �������: TriggerTable1, TriggerTable2 �� TriggerTable3. ����� �--������� �� �������� ���������: 
--   TriggerId(int) � ��������� ���� �--��������������, TriggerDate(Date). �������� ��� �������. 
--   ������ ������--������� ��� ����-����� ����� � ������� TriggerTable1 ������ ���� ������ �
--   ������� TriggerTable2. ������ ������ ������� ��� ����-����� ����� � ������� TriggerTable2 ������ ���� ������ 
--   � ������� TriggerTable3. �����--������ ������ ��������� � ��������� TriggerTable3 �� TriggerTable1. 
--   ������� ���� ����� � ������� TriggerTable1. �������, �� �������, � �������� �� ����. ���� �� �������?

--CREATE TABLE TriggerTable1
--(
--    TriggerId INT PRIMARY KEY IDENTITY(1,1),
--    TriggerDate date
--);
--CREATE TABLE TriggerTable2
--(
--    TriggerId INT PRIMARY KEY IDENTITY(1,1),
--    TriggerDate date
--);
--CREATE TABLE TriggerTable3
--(
--    TriggerId INT PRIMARY KEY IDENTITY(1,1),
--    TriggerDate date
--);
--USE Northwind;
--Go
--CREATE TRIGGER From1To2
--ON TriggerTable1
--AFTER INSERT
--AS INSERT INTO TriggerTable2(TriggerDate)
--SELECT GETDATE() FROM inserted;
----DROP TRIGGER From1To2;
--
--Go
--CREATE TRIGGER From2To3
--ON TriggerTable2
--AFTER INSERT
--AS INSERT INTO TriggerTable3(TriggerDate)
--SELECT GETDATE() FROM inserted;
----DROP TRIGGER From2To3;
--
--Go
--CREATE TRIGGER From3To1
--ON TriggerTable3
--AFTER INSERT
--AS INSERT INTO TriggerTable1(TriggerDate)
--SELECT GETDATE() FROM inserted;
--DROP TRIGGER From3To1;

--INSERT INTO TriggerTable1(TriggerDate) VALUES(GETDATE());
