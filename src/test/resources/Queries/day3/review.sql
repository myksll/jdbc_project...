select * from Employees;

--Task: how many locations we have for each country
SELECT * FROM LOCATIONS;

select COUNTRY_ID, count(*)
from LOCATIONS
GROUP BY COUNTRY_ID;

-- order them based on country_id asc
select COUNTRY_ID, count(*)
from LOCATIONS
GROUP BY COUNTRY_ID
ORDER BY 1 asc;

--what is I want to see only US, UK, CA
select COUNTRY_ID, count(*)
from LOCATIONS
where COUNTRY_ID in ('US','UK','CA')
GROUP BY COUNTRY_ID
ORDER BY 1 DESC;

--display where location count is bigger than 2
select COUNTRY_ID, count(*)
from LOCATIONS
where COUNTRY_ID in ('US','UK','CA')
GROUP BY COUNTRY_ID
having count(*)>2
ORDER BY 1 DESC;

--Task2 : Display all employees salary in following format as column name Employees_salary
    --EXAMPLE:
       -- Steven makes 24000
       -- Neena makes 17000

select FIRST_NAME||' makes '||salary as Employees_salary  from EMPLOYEES;

select FIRST_NAME,salary as Employees_salary  from EMPLOYEES;

