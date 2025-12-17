CREATE TABLE arithmetic_operators (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100), percentage DECIMAL(5,2));

-- ARITHMETIC OPERATORS

SELECT 5 + 6;

SELECT 5 + 6 AS total;

SELECT 6 - 5 AS difference;

SELECT 5 * 6 AS total;

SELECT 12 / 6 AS total;

SELECT id, name, (percentage + 5) AS "new percentage"

FROM arithmetic_operators;

SELECT PI();

SELECT ROUND(4.51);

SELECT ROUND(4.49);

SELECT ROUND(-4.49);

SELECT ROUND(1234.987, 1);

SELECT CEIL(1.23);

SELECT FLOOR(1.23);

SELECT POW(2, 2);

SELECT POW(2, 3);
