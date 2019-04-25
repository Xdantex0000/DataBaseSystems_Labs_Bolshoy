-- 1) Створити базу даних з іменем, яке відповідає вашому прізвищу англійською мовою.
--CREATE DATABASE Bolshoy;

--USE Bolshoy;
-- 2) Створити в новій базі таблицю Student з атрибутами StudentId, SecondName, FirstName, Sex. 
-- Обрати для них оптимальний тип даних в вашій СУБД.
--CREATE TABLE Student(StudentID INT IDENTITY(1,1), SecondName VARCHAR(30), FirstName VARCHAR(30), Sex VARCHAR (20)); 

-- 3) Модифікувати таблицю Student. Атрибут StudentId має стати первинним ключем.
--ALTER TABLE Student ALTER COLUMN StudentID INT NOT NULL;
--ALTER TABLE Student ADD PRIMARY KEY (StudentID);

-- 4) Модифікувати таблицю Student. Атрибут StudentId повинен заповнюватися автоматично починаючи з 1 і з кроком в 1.
--DROP TABLE Student;
--CREATE TABLE Student(StudentID INT IDENTITY(1,1) NOT NULL PRIMARY KEY, SecondName VARCHAR(30), FirstName VARCHAR(30), Sex VARCHAR (20));

-- 5) Модифікувати таблицю Student. Додати необов’язковий атрибут BirthDate з відповідним типом даних.
--ALTER TABLE Student ADD BirthDate DATE;

-- 6) Модифікувати таблицю Student. Додати атрибут CurrentAge, що генерується автоматично на базі існуючих в таблиці даних.
--ALTER TABLE Student ADD CurrentAge AS DATEDIFF(YEAR, BirthDate,GETDATE());

-- 7) Реалізувати перевірку вставлення даних. Значення атрибуту Sex може бути тільки «m» або «f».
--ALTER TABLE Student ADD CHECK (Sex='m' OR SEX ='f');

-- 8) В таблицю Student додати себе та двох «сусідів» у списку групи. 
--INSERT INTO Student VALUES('Андрощук','Юрій','m','21/06/2000'),('Большой','Олександр','m','10/02/2000'),('Вознюк','Олександра','f','16/09/2000');
--SELECT * FROM Student;

-- 9) Створити представлення vMaleStudent та vFemaleStudent, що надають відповідну інформацію. 
--CREATE VIEW vMaleStudent AS SELECT * FROM Student WHERE Sex = 'm';
--CREATE VIEW vFemaleStudent AS SELECT * FROM Student WHERE Sex = 'f';

-- 10) Змінити тип даних первинного ключа на TinyInt (або SmallInt), не втрачаючи дані.
--ALTER TABLE Student DROP CONSTRAINT PK__Student__32C52A7907603A2D;
--ALTER TABLE Student ALTER COLUMN StudentID SmallInt NOT NULL;
--ALTER TABLE Student ADD PRIMARY KEY(StudentID);

