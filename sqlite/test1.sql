SELECT departmen_id AS 'ID' FROM employees
EXCEPT
SELECT departmen_id FROM department;
