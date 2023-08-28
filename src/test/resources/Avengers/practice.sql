-- TASK 1
-- From the employees table, find those employees whose first name
-- contains the letters C, Y, or D. Return all fields.
Select * from EMPLOYEES
where lower(FIRST_NAME) Like '%c%' or lower(FIRST_NAME) Like '%d%' or lower(FIRST_NAME) Like '%y%';
--  =
Select * from EMPLOYEES
where upper(FIRST_NAME) Like '%C%' or upper(FIRST_NAME) Like '%D%' or upper(FIRST_NAME) Like '%Y%';

----------------------------------
-- TASK 2
-- From the employees table, find those employees whose first name does not contain the letter ‘M’.
-- Sort the result-set in ascending order by department ID.
-- Return full name (first and last name together), salary and department_id.
Select FIRST_NAME||' '||LAST_NAME as Full_name , SALARY, DEPARTMENT_ID from EMPLOYEES
where lower(FIRST_NAME) not like '%m%'
ORDER BY DEPARTMENT_ID;

----------------------------------
-- TASK 3
-- From the job history table, find those employees
-- who worked more than one jobs in the past. Return employee id.

select EMPLOYEE_ID,count(*)
from JOB_HISTORY
group by EMPLOYEE_ID
having count(*) >1
order by EMPLOYEE_ID;


--GIVE NAME  --> From the job history table, find those employees
-- who worked more than one jobs in the past. Return employee id.
select JOB_HISTORY.EMPLOYEE_ID,First_name ,count(*)
from JOB_HISTORY join EMPLOYEES
ON JOB_HISTORY.EMPLOYEE_ID=EMPLOYEES.EMPLOYEE_ID
group by JOB_HISTORY.EMPLOYEE_ID,FIRST_NAME
having count(*) >1
order by EMPLOYEE_ID;

----------------------------------
-- TASK 4
-- Get me how many employees getting more than employees avg
select AVG(SALARY)
from EMPLOYEES;  --6461

--employees getting more than employees avg
select FIRST_NAME, SALARY from EMPLOYEES
where SALARY>(select AVG(SALARY)
              from EMPLOYEES);
--how many
select count(*) from EMPLOYEES
where SALARY>(select AVG(SALARY)
              from EMPLOYEES);

----------------------------------
-- TASK 5
-- Get me all employees who is jobtitle is  'Sales Manager'

SELECT * FROM EMPLOYEES;
SELECT * FROM JOBS;

-- FIND ME SALES MANAGER JOB ID
SELECT * FROM JOBS
WHERE JOB_TITLE='Sales Manager'; --SA_MAN

-- EMPLOYEES WHO IS WORKING AS SALES MANAGER
SELECT * FROM EMPLOYEES
WHERE JOB_ID='SA_MAN';

--DYNAMIC
SELECT * FROM EMPLOYEES
WHERE JOB_ID=(SELECT JOB_ID FROM JOBS
              WHERE JOB_TITLE='Sales Manager');

-- GET ME ALL EMPLOYEES FIRSTNAME AND JOBTITLE
SELECT FIRST_NAME,JOB_TITLE FROM EMPLOYEES E
                                     INNER JOIN JOBS J ON E.JOB_ID = J.JOB_ID;


----------------------------------
-- TASK 6
-- Get me all employees who is manager name is Neena Kocchar
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,MANAGER_ID FROM EMPLOYEES;

-- FIND ME Neena Kochhar manager_id
SELECT EMPLOYEE_ID FROM EMPLOYEES
WHERE FIRST_NAME='Neena' AND LAST_NAME='Kochhar'; --101

-- WHO IS WORKING FOR MANAGER ID 101
SELECT * FROM EMPLOYEES
WHERE MANAGER_ID=101;

-- DYNAMIC
SELECT * FROM EMPLOYEES
WHERE MANAGER_ID=(SELECT EMPLOYEE_ID FROM EMPLOYEES
                  WHERE FIRST_NAME='Neena' AND LAST_NAME='Kochhar');

--self join
select * from EMPLOYEES workers  join EMPLOYEES managers
on workers.MANAGER_ID=managers.EMPLOYEE_ID
where managers.FIRST_NAME='Neena' AND managers.LAST_NAME='Kochhar';

----------------------------------
--- JOINS
-- TASK  1
-- From the employees and jobs tables,
-- find the difference between maximum salary of the job and
-- salary of the employees.
-- Return job title, employee name, and salary difference.
SELECT JOB_TITLE, FIRST_NAME, MAX_SALARY-SALARY as Salary_Diff
from EMPLOYEES E join JOBS J
on E.JOB_ID = J.JOB_ID;

----------------------------------
--TASK 2-1
-- From the departments and locations tables,
-- display the department name, city, and state province for each department.

SELECT DEPARTMENT_NAME,CITY,STATE_PROVINCE,D.LOCATION_ID
from DEPARTMENTS D join LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID;

------------------------------------
--Left outer join -left join
--Reason-> there is no department without any location information
SELECT DEPARTMENT_NAME,CITY,STATE_PROVINCE,D.LOCATION_ID
from DEPARTMENTS D left join LOCATIONS L
                        ON D.LOCATION_ID = L.LOCATION_ID;
--=

SELECT DEPARTMENT_NAME,CITY,STATE_PROVINCE
from  LOCATIONS L right join DEPARTMENTS D
                             ON D.LOCATION_ID = L.LOCATION_ID;

-----------------------------------
--right outer join -right join
--Reason-> there is location information without  department
SELECT DEPARTMENT_NAME,CITY,STATE_PROVINCE,D.LOCATION_ID
from DEPARTMENTS D right join LOCATIONS L
                        ON D.LOCATION_ID = L.LOCATION_ID;
-------------------------------------
--full outer join -full join
SELECT DEPARTMENT_NAME,CITY,STATE_PROVINCE
from DEPARTMENTS D full join LOCATIONS L
                        ON D.LOCATION_ID = L.LOCATION_ID;

----------------------------------------
--TASK 2-2
-- display only department names ends with Sales
SELECT DEPARTMENT_NAME,CITY,STATE_PROVINCE
from DEPARTMENTS D join LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID
where DEPARTMENT_NAME like '%Sales';

----------------------------------------
--TASK 2-3
-- How many department we have for each city
SELECT CITY, count(*)
from DEPARTMENTS D join LOCATIONS L
                        ON D.LOCATION_ID = L.LOCATION_ID
group by CITY;

------------------------------------------
--Task 2-4
--GET ME names where we have more than one department

SELECT CITY, count(*)
from DEPARTMENTS D join LOCATIONS L
                        ON D.LOCATION_ID = L.LOCATION_ID
group by CITY
having count(*)>1;
------------------------------------------
-- TASK 3
-- From employees, departments, and locations tables,
-- find those employees whose first name contains a letter 'z'.
-- Return first name, last name, department, city, and state province.

SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_NAME,CITY,STATE_PROVINCE
from EMPLOYEES E join DEPARTMENTS D
                      on E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 JOIN LOCATIONS L
                      ON D.LOCATION_ID = L.LOCATION_ID
WHERE lower(FIRST_NAME) like '%z%';

------------------------------------------
--TASK 3-1
-- how many employees are working for each city
SELECT CITY, count(*)
from EMPLOYEES E join DEPARTMENTS D
                      on E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 JOIN LOCATIONS L
                      ON D.LOCATION_ID = L.LOCATION_ID
group by city ;
------------------------------------------
--TASK 3-2
-- get me cities where we have more than 10 employees
SELECT CITY, count(*)
from EMPLOYEES E join DEPARTMENTS D
                      on E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 JOIN LOCATIONS L
                      ON D.LOCATION_ID = L.LOCATION_ID
group by city
having count(*)>10
ORDER BY COUNT(*) DESC ;

------------------------------------------
--TASK 3-3
-- From the employees, departments, and locations tables,
-- find full name (first and last name), and salary of those employees
-- who work in any department located in Oxford .
--jkjkj
SELECT FIRST_NAME||' '||LAST_NAME as Full_Name , SALARY, STATE_PROVINCE
from EMPLOYEES E join DEPARTMENTS D
                      on E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 JOIN LOCATIONS L
                      ON D.LOCATION_ID = L.LOCATION_ID
where STATE_PROVINCE='Oxford';




--self join
select * from EMPLOYEES workers  join EMPLOYEES managers
                                      on workers.MANAGER_ID=managers.EMPLOYEE_ID
where workers.SALARY> managers.SALARY;