/*
CREATE TABLE users(
id INTEGER PRIMARY KEY
,username VARCHAR(50)
,age INTEGER
,email TEXT
);

INSERT INTO users(username, age, email)
VALUES('Kate', 18, 'kpeg@mail.ru');

SELECT * FROM users;

CREATE TABLE users2(
id INTEGER PRIMARY KEY
,username VARCHAR(50) NOT NULL
,age INTEGER CHECK(age > 0 AND age < 200)
,email TEXT UNIQUE NOT NULL
);

INSERT INTO users2(username, age, email)
VALUES
('Дед', 99, '9863@mail.ru'),
('Inna', 21, '79825256@mail.ru'),
('Lors', 27, 'jopa3@mail.ru');

UPDATE users2
SET age = 26
WHERE username = 'Inna';

UPDATE users2
SET age = age - 1;

DELETE FROM users2
WHERE id = 5;

DROP TABLE users;

INSERT INTO users3(username, age, email)
SELECT username, age, email FROM users2;


UPDATE users
SET username = 'TOP',
age = 3
WHERE id = 3;

----------------------------------------------------------
SELECT name       #можно * написать
FROM sqlite_master
WHERE type = 'table'

----------------------------------------------------------
CREATE TABLE employees(
id INTEGER PRIMARY KEY
,full_name TEXT
,departmen_id INTEGER
);

CREATE TABLE department(
departmen_id INTEGER PRIMARY KEY
,departmen_name VARCHAR(30)
);

INSERT INTO employees(full_name, departmen_id)
VALUES
('Dan', 1),
('Lora Colt', 2),
('Max', 2);

INSERT INTO department(departmen_name)
VALUES
('IT'),
('HR'),
('1C');

SELECT employees.full_name, department.departmen_name
FROM employees
INNER JOIN department ON
employees.departmen_id = department.departmen_id;

SELECT employees.full_name, department.departmen_name
FROM employees
FULL/LEFT/RIGHT JOIN department ON
employees.departmen_id = department.departmen_id;

SELECT full_name FROM employees
UNION
SELECT departmen_name FROM department;

SELECT departmen_id AS 'ID' FROM employees
EXCEPT       # разность множеств
SELECT departmen_id FROM department;

___________________________________________
CREATE TABLE rabotniki(
    id INTEGER PRIMARY KEY
    ,full_name TEXT
    ,department TEXT
    ,salary ITEGER
);

INSERT INTO rabotniki(full_name, department, salary)
VALUES
('Alex', 'IT', 100000),
('Danya', 'Marketing', 25000),
('Kate', 'Managers', 50000),
('Olga', 'IT', 110000),
('Nina', 'Marketing', 65000),
('Sofia', 'Managers', 90000);

DELETE * FROM rabotniki;

SELECT full_name AS 'Имя', salary AS 'Зарплата' FROM rabotniki
WHERE salary > (SELECT AVG(salary) FROM rabotniki);

SELECT full_name, salary FROM rabotniki
GROUP BY salary; #Сортировка

SELECT full_name, salary FROM rabotniki
GROUP BY salary
HAVING salary > 50000 #Имеющий признак
ORDER BY salary DESC; #В обратном значении

SELECT * FROM sqlite_master;

SELECT (Unit_Price * 1) AS 'Цена' FROM sales
ORDER BY Цена DESC
LIMIT 5;

SELECT ROUND(AVG(Unit_Price * Units_Sold), 1) AS 'Средняя цена' FROM sales

SELECT COUNT(Units_Sold*1), Region FROM sales
GROUP BY Region;

SELECT ROUND(AVG(Unit_Price*1),1) AS 'Средняя цена', Region FROM sales
GROUP BY Region;

WITH Product_counts AS (
    SELECT Product_Name, COUNT(*) AS Total
    FROM sales
    GROUP BY Product_Name
)
SELECT Product_Name
FROM Product_counts
WHERE total > 1;

SELECT * FROM sqlite_master;
*/

