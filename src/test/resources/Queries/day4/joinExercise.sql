select * from employees;

--1.Display all first_name and related department_name
select * from DEPARTMENTS;

select FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
from EMPLOYEES E join DEPARTMENTS D
on E.DEPARTMENT_ID=D.DEPARTMENT_ID;

--Order the list based on firstname asc
select FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
from EMPLOYEES E INNER join DEPARTMENTS D
on E.DEPARTMENT_ID=D.DEPARTMENT_ID
ORDER BY FIRST_NAME asc ;

--2.Display all first_name and department_name including the employee without department
select FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
from EMPLOYEES E LEFT join DEPARTMENTS D
on E.DEPARTMENT_ID=D.DEPARTMENT_ID;

select FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS D RIGHT JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;

--3.Display all first_name and department_name including the DEPARTMENT without EMPLOYEE
select FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
from EMPLOYEES E RIGHT join DEPARTMENTS D
on E.DEPARTMENT_ID=D.DEPARTMENT_ID;

--4-HOW MANY EMPLOYEE we have for  EACH DEPARTMENT_NAME?  each keyword-<group by
select  DEPARTMENT_NAME, count(*)
from EMPLOYEES E RIGHT join DEPARTMENTS D
on E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME;

--5-Display all firstname and department name including the department without employees
--and also employees without the department
select FIRST_NAME, DEPARTMENT_NAME
from EMPLOYEES full join  DEPARTMENTS
on EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID;

--6-Display all cities and related country names
select CITY, COUNTRY_NAME
from LOCATIONS join COUNTRIES
On LOCATIONS.COUNTRY_ID = COUNTRIES.COUNTRY_ID;

--7-right join -->Display all cities and related country names including with countries without city
select CITY, COUNTRY_NAME
from LOCATIONS right join COUNTRIES
On LOCATIONS.COUNTRY_ID = COUNTRIES.COUNTRY_ID;

--left join-->Display all cities and related country names including with city without countries
select CITY, COUNTRY_NAME
from LOCATIONS left join COUNTRIES
On LOCATIONS.COUNTRY_ID = COUNTRIES.COUNTRY_ID;

--full name
select CITY, COUNTRY_NAME
from LOCATIONS full join COUNTRIES
On LOCATIONS.COUNTRY_ID = COUNTRIES.COUNTRY_ID;

--8-Display all department name and related street address
select DEPARTMENT_NAME, STREET_ADDRESS
from DEPARTMENTS D join LOCATIONS L
on D.LOCATION_ID = L.LOCATION_ID;

--including locations(street name) without departments
select DEPARTMENT_NAME, D.LOCATION_ID, L.LOCATION_ID,STREET_ADDRESS
from DEPARTMENTS D right join LOCATIONS L
on D.LOCATION_ID = L.LOCATION_ID;

--including departments without locations
select DEPARTMENT_NAME, STREET_ADDRESS
from DEPARTMENTS D join LOCATIONS L
on D.LOCATION_ID = L.LOCATION_ID;

-----------important-----use that , add table using the same key

--9-Display first name , last name, and department name , city
select FIRST_NAME,LAST_NAME,DEPARTMENT_NAME,CITY
from EMPLOYEES E join DEPARTMENTS D ON E.DEPARTMENT_ID= D.DEPARTMENT_ID
                 join LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID;

--10-Display first name , last name, and department name , city, country name for all employees
select FIRST_NAME,LAST_NAME,DEPARTMENT_NAME,CITY, COUNTRY_NAME, REGION_NAME
from EMPLOYEES E join DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 join LOCATIONS L   ON D.LOCATION_ID   = L.LOCATION_ID
                 join COUNTRIES C   on L.COUNTRY_ID    = C.COUNTRY_ID
                 join REGIONS R     on R.REGION_ID     = C.REGION_ID;

--11-How many employees working for each country_name? -->count(*)
select  COUNTRY_NAME, COUNT(*)
from EMPLOYEES E join DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
join LOCATIONS L   ON D.LOCATION_ID   = L.LOCATION_ID
join COUNTRIES C   on L.COUNTRY_ID    = C.COUNTRY_ID
GROUP BY COUNTRY_NAME
HAVING COUNT(*) >10;  --How many employees working for each country_name more than 10?

--LEFT JOIN WITH WHERE
SELECT *
FROM CUSTOMER C LEFT JOIN ADDRESS A
ON A.ADDRESS_ID = C.CUSTOMER_ID
WHERE C.ADDRESS_ID is null ;




