create table limit_offset (id int auto_increment primary key, name varchar(50), city varchar(50));

-- LIMIT & OFFSET examples

SELECT * FROM limit_offset;

SELECT * FROM limit_offset LIMIT 2;

SELECT * FROM limit_offset LIMIT 3;

SELECT * FROM limit_offset
WHERE city = 'agra'
LIMIT 2;

SELECT * FROM limit_offset
WHERE city = 'agra'
ORDER BY city
LIMIT 2;

SELECT * FROM limit_offset
WHERE city = 'agra'
ORDER BY name DESC
LIMIT 2;

SELECT * FROM limit_offset LIMIT 3, 3;   

SELECT * FROM limit_offset LIMIT 1, 3;   

SELECT * FROM limit_offset LIMIT 5, 2;   

SELECT * FROM limit_offset LIMIT 1, 8;
