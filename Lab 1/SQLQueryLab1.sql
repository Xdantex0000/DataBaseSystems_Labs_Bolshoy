--1 ������� �� ��������� ������� SELECT ��� �������, ��� �� ��-������� �� �����.
--SELECT 'Bolshoy' AS Surname, 'Oleksandr' AS Name , 'Olegovich' AS Patronymic;

--2 ������� �� ��� � ������� Products
--SELECT * FROM Products;

--3 ������ � 򳺿 � ������� �� ����� ��������, ������ ���� ���������
--SELECT * FROM Products WHERE Discontinued=1;

--4 ������� �� ���� �볺���, �������� ��������.
--SELECT DISTINCT City FROM Customers;

--5 ������� �� ����� �������-������������� � ��������-���������� �������.
--SELECT CompanyName FROM Suppliers ORDER BY CompanyName DESC;

--6 �������� �� ����� ���������, �������� ����� ��������� �� ���� ���������� �����
--SELECT OrderID AS '1', ProductID AS '2', UnitPrice AS '3', Quantity AS '4', Discount AS '5' FROM [Order Details];

--7 ������� �� �������� ����� �볺���, �� ����������� � ����� ����� ������ �������, ����, ��-�������.
--SELECT ContactName FROM Customers WHERE ContactName LIKE '[BO]%';

--8 �������� �� ����������, � ������� �������� ���� � �����.
--SELECT * FROM Orders WHERE ShipAddress LIKE '% %';

--9 ������� ����� ��� ��������, �� ����������� � �%� ��� �_�, � ����������� �� ������� ����� ������ ����.
--SELECT ProductName FROM Products WHERE ProductName LIKE '[%_]%r';