CREATE TABLE string_functions (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100), city VARCHAR(100), percentage DECIMAL(5,2));
-- STRING FUNCTIONS

SELECT id, UPPER(name) AS Name, percentage AS Percentage
FROM string_functions;

SELECT id, UCASE(name) AS name, percentage
FROM string_functions;

SELECT id, LOWER(name) AS name, percentage
FROM string_functions;

SELECT id, LCASE(name) AS name, percentage
FROM string_functions;

SELECT id, name, CHARACTER_LENGTH(name) AS characters
FROM string_functions;

SELECT id, name, CHAR_LENGTH(name) AS characters
FROM string_functions;

SELECT id, name, LENGTH(name) AS characters
FROM string_functions;

SELECT id, city, CHAR_LENGTH(city) AS characters
FROM string_functions;

SELECT id, CONCAT(name, percentage) AS name
FROM string_functions;

SELECT id, CONCAT(name, '-', percentage) AS name
FROM string_functions;
