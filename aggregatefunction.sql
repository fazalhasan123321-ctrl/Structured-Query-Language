create database college;

use college;

create table aggregate (name varchar(50), city varchar(50), percentage decimal(5,2));

-- AGGREGATE FUNCTIONS

-- AGGREGATE FUNCTIONS

select count(name) from `aggregate`;

select count(*) from `aggregate`;

select count(distinct city) from `aggregate`;

select * from `aggregate`;

select count(city) from `aggregate`;

select max(percentage) from `aggregate`;

select min(percentage) as min from `aggregate`;

select sum(percentage) as perecentage from `aggregate`;

select avg(percentage) as percentage from `aggregate`;

select min(percentage) from aggregate where city="Agra"






