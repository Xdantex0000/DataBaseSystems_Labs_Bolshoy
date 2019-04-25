-- 1) �������� ���� ����� � ������, ��� ������� ������ ������� ���������� �����.
--CREATE DATABASE Bolshoy;

--USE Bolshoy;
-- 2) �������� � ���� ��� ������� Student � ���������� StudentId, SecondName, FirstName, Sex. 
-- ������ ��� ��� ����������� ��� ����� � ����� ����.
--CREATE TABLE Student(StudentID INT IDENTITY(1,1), SecondName VARCHAR(30), FirstName VARCHAR(30), Sex VARCHAR (20)); 

-- 3) ������������ ������� Student. ������� StudentId �� ����� ��������� ������.
--ALTER TABLE Student ALTER COLUMN StudentID INT NOT NULL;
--ALTER TABLE Student ADD PRIMARY KEY (StudentID);

-- 4) ������������ ������� Student. ������� StudentId ������� ������������� ����������� ��������� � 1 � � ������ � 1.
--DROP TABLE Student;
--CREATE TABLE Student(StudentID INT IDENTITY(1,1) NOT NULL PRIMARY KEY, SecondName VARCHAR(30), FirstName VARCHAR(30), Sex VARCHAR (20));

-- 5) ������������ ������� Student. ������ ������������� ������� BirthDate � ��������� ����� �����.
--ALTER TABLE Student ADD BirthDate DATE;

-- 6) ������������ ������� Student. ������ ������� CurrentAge, �� ���������� ����������� �� ��� �������� � ������� �����.
--ALTER TABLE Student ADD CurrentAge AS DATEDIFF(YEAR, BirthDate,GETDATE());

-- 7) ���������� �������� ���������� �����. �������� �������� Sex ���� ���� ����� �m� ��� �f�.
--ALTER TABLE Student ADD CHECK (Sex='m' OR SEX ='f');

-- 8) � ������� Student ������ ���� �� ���� ������ � ������ �����. 
--INSERT INTO Student VALUES('��������','���','m','21/06/2000'),('�������','���������','m','10/02/2000'),('������','����������','f','16/09/2000');
--SELECT * FROM Student;

-- 9) �������� ������������� vMaleStudent �� vFemaleStudent, �� ������� �������� ����������. 
--CREATE VIEW vMaleStudent AS SELECT * FROM Student WHERE Sex = 'm';
--CREATE VIEW vFemaleStudent AS SELECT * FROM Student WHERE Sex = 'f';

-- 10) ������ ��� ����� ���������� ����� �� TinyInt (��� SmallInt), �� ��������� ���.
--ALTER TABLE Student DROP CONSTRAINT PK__Student__32C52A7907603A2D;
--ALTER TABLE Student ALTER COLUMN StudentID SmallInt NOT NULL;
--ALTER TABLE Student ADD PRIMARY KEY(StudentID);

