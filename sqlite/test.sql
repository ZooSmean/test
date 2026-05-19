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

*/

