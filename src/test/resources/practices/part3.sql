--1. FIND OUT COUNTRY NAME AND REGION NAME FROM COUNTRIES AND REGION TABLE
select country_name, region_name
from countries join regions
ON countries.REGION_ID = regions.REGION_ID;

--2. FIND OUT FIRST_NAME AND JOB_TITLE FROM JOBS AND EMPLOYEES TABLE
SELECT FIRST_NAME, JOB_TITLE
FROM EMPLOYEES E INNER JOIN JOBS J
ON E.JOB_ID = J.JOB_ID;

--3. FIND OUT DEPARTMENT_NAME AND CITY
SELECT DEPARTMENT_NAME , CITY
FROM DEPARTMENTS D INNER JOIN LOCATIONS L
ON D.LOCATION_ID =L.LOCATION_ID;

--4. FIND OUT ALL CITIES AND COUNTRY NAMES
SELECT CITY , COUNTRY_NAME
FROM LOCATIONS L INNER JOIN COUNTRIES C
ON L.COUNTRY_ID = C.COUNTRY_ID;

--5. FIND OUT FIRST_NAME, LAST NAME, DEPARTMENT ID , DEPARTMENT NAME FOR DEPARTMENT ID 80 OR 40
SELECT FIRST_NAME, LAST_NAME, e.DEPARTMENT_ID,DEPARTMENT_NAME
from EMPLOYEES E join DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.DEPARTMENT_ID IN (80, 40);

--6. FIND OUT CITY , COUNTRY_NAME OF THAT CITY , REGION_NAME OF THAT CITY
SELECT CITY, COUNTRY_NAME,  REGION_NAME
from LOCATIONS L join COUNTRIES C on L.COUNTRY_ID = C.COUNTRY_ID
join REGIONS R ON C.REGION_ID = R.REGION_ID;

--7. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME , CITY
SELECT FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME, CITY
from EMPLOYEES E join JOBS J oN E.JOB_ID = J.JOB_ID
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID;

--8. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME , CITY , COUNTRY_NAME , REGION_NAME
SELECT FIRST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY, COUNTRY_NAME, REGION_NAME
from EMPLOYEES E join JOBS J        On E.JOB_ID = J.JOB_ID
                 join DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 JOIN LOCATIONS L   ON D.LOCATION_ID = L.LOCATION_ID
                 join COUNTRIES C   ON C.COUNTRY_ID = L.COUNTRY_ID
                 join Regions  R    on C.REGION_ID = R.REGION_ID;

--9. FIND OUR EMPLOYEES FIRST_NAME, LAST NAME, DEPARTMENT ID AND ALL DEPARTMENTS INCLUDING WHERE DO NOT HAVE ANY EMPLOYEE.
SELECT FIRST_NAME, LAST_NAME,E.DEPARTMENT_ID, DEPARTMENT_NAME
from EMPLOYEES E right join DEPARTMENTS D
On E.DEPARTMENT_ID = D.DEPARTMENT_ID;

select e.first_name, e.last_name, e.department_id, d.department_name
from departments d left outer join employees e
on d.department_id=e.department_id;

--10. FIND OUT ALL DEPARTMENT_NAME , LOCATION_ID , AND COUNTRY_ID INCLUDING THOSE LOCATIONS WITH NO DEPARTMENT
select  DEPARTMENT_NAME , D.LOCATION_ID , COUNTRY_ID
from DEPARTMENTS D right outer join LOCATIONS L
On D.LOCATION_ID = L.LOCATION_ID
order by 1;

--11.FIND OUT DEPARTMENT_NAME , LOCATION_ID , AND COUNTRY_NAME INCLUDING THOSE COUNTRIES WITH NO DEPARTMENT
select DEPARTMENT_NAME , l.LOCATION_ID ,COUNTRY_NAME
from DEPARTMENTS d
right outer join locations l on l.location_id = d.location_id
right outer join countries c on l.country_id = c.country_id ;

--12. FIND OUT EMPLOYEES FIRST_NAME, DEPARTMENT ID AND DEPARTMENT NAME INCLUDING THOSE DOES NOT HAVE DEPARTMENT, INCLUDING THOSE
 --DEPARTMENTS DOES NOT HAVE ANY MATCHING EMPLOYEES
SELECT FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
from EMPLOYEES E full outer join DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
