-- ������ 1
-- 1. ������ ������� ����� � �������, �� ������ ����� ��� 2147483647 ������.
-- SELECT COUNT_BIG(*);
-- 2. ϳ��������� ������� ����� ������� (������� �������) �� ��������� SQL
--SELECT 'Bolshoy' AS Surname, LEN('Bolshoy') AS SurnameLength;

-- 3. � ����� � ���� ��������, ������ �� ��-������� ������� ������ �� ���� �_� (����� �����������).
--SELECT 'Bolshoy Oleksandr Olegovich' AS String, REPLACE('Bolshoy Oleksandr Olegovich', ' ', '_') AS ConvertedString;

-- 4. �������� ��������� ����� ���������� ������� ��������, �� ������ ������������ �ᒺ������ �� �� ����� ����� 
-- � ������� ����� ����������� � �� � ������� ������� ������� � ������� ������� ����������� � ��, � � ����� �������� � ������ ������. 
--SELECT CONCAT(LEFT('Oleksandr', 2), LEFT('Bolshoy', 4), '@', 'Bolshoy') AS Email;

-- 5. �� ��������� SQL ���������, � ���� ���� ����� �� ����������.
--FULL JOIN Orders ON Orders.OrderID=[Order Details].OrderID
--WHERE DAY(ShippedDate)%2!=0;

-- 5. ������ ������ ����������� ���������� � ��������� ����� (���������� �� ������� ����������, ���� �������, �������, �� ��������� ������).
--SELECT ShipAddress FROM Orders WHERE OrderID=(
--	SELECT OrderID FROM [Order Details] WHERE UnitPrice*Quantity*(1-Discount) = (
--		SELECT MAX(UnitPrice*Quantity*(1-Discount)) FROM [Order Details] ) );