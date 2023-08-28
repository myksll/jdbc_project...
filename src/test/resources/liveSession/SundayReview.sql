select * from employees;


--------------- SELECT ,WHERE, LIKE -------------------

--TASK 1 - display department names  from departments table
select DEPARTMENT_NAME from DEPARTMENTS;
--SQL commands are insensitive
--Table and COLUMN names are depending database -->HR it is cae insensitive
--WHERE FIRSTNAME = '' is case sensitive


--TASK 2 - display first_name, last_name, department_id, salary from employees
select FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY from EMPLOYEES;

--TASK 3 - display first_name, last_name, department_id, salary from employees whose salary is higher than 9000
select FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
from EMPLOYEES
where salary > 9000;


--TASK 4 - display first_name, last_name, department_id, salary from employees  whose salary equals or more than 9000 and salary equals or less than 15000  sort result based on salary asc
select FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
from EMPLOYEES
where SALARY between 9000 and 15000  -- = where salary >=9000 and salary<=15000
order by SALARY asc;  -- = order by 4 asc


--TASK 5 -  display first_name, last_name, department_id, salary from employees whose firstname is Peter and salary is bigger than 5000  sort result based on salary desc
select FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
from EMPLOYEES
where FIRST_NAME='Peter' and salary>5000
order by salary desc ;

--TASK 6 - display country_id, country_name from countries table for region id 2 or 4  sort result based on region_id desc and country_name asc
select country_id, country_name , REGION_ID
from COUNTRIES
where REGION_ID in(2,4)
order by region_id desc , COUNTRY_NAME asc;


--TASK 7 -  display employee firstname and lastname as fullname , salary as annual salary  , job_id  whose job ID starts with S
select FIRST_NAME||' '||LAST_NAME as Fullname ,  SALARY*12 as annual_salary, JOB_ID
from EMPLOYEES
where JOB_ID like 'S%';
--% --> 0 or more letter
-- _ --> refers only one letter

-- whose job ID starts with S AND TOTAL 6 LETTER
select FIRST_NAME||' '||LAST_NAME as Fullname ,  SALARY*12 as annual_salary, JOB_ID
from EMPLOYEES
where JOB_ID like 'S_____';

-- TASK 8 - display country id and country name where country name ends with a
select COUNTRY_ID , COUNTRY_NAME
from COUNTRIES
where COUNTRY_NAME like '%a';

-- TASK 9 -  display country id and country name where country name ends with a and third letter is i
select COUNTRY_ID , COUNTRY_NAME
from COUNTRIES
where COUNTRY_NAME like '__i%a';

--IQ-->GET ME EMPLOYEES WHERE EMPLOYEE IDs ARE even number
select EMPLOYEE_ID
from EMPLOYEES
where MOD(EMPLOYEE_ID,2)=0;
--where EMPLOYEE_ID%2=0;

------ INTERVIEW QUESTION  -->
/*
    Write a query to print first_name and salary for all employees in the Employee table
    who earn a salary larger than 3000
    Sort your results in ascending order of the last 3 characters in the employees first_name
    if two or more employees have first_names ending with same 3 characters, then sort them by highest salary
*/

SELECT FIRST_NAME,SALARY, substr(FIRST_NAME,-3)
FROM EMPLOYEES
WHERE SALARY > 3000
ORDER BY lower(substr(FIRST_NAME,-3)) asc, SALARY desc;

--------------- GROUP BY, HAVING  -------------------

-- TASK 10- 1 -  how many city we have in each country from locations table
select COUNTRY_ID, count(CITY) from LOCATIONS group by COUNTRY_ID;

--count(*)(it counts row including null values) vs count(column name)(it ignores null values)
select FIRST_NAME, DEPARTMENT_ID from EMPLOYEES;
select count(DEPARTMENT_ID) from EMPLOYEES; --it will ignore null values-->106
select count(*) from EMPLOYEES; --it counts row -->107

-- TASK 10- 2  - order them based on city count in desc
select COUNTRY_ID, count(*) as CITY_COUNT
from LOCATIONS
group by COUNTRY_ID
order by count(*) desc;

-- TASK 10- 3 -  filter result where country id starts with C
--WHERE -->better to use here
select  COUNTRY_ID, count(*) as CITY_COUNT
from LOCATIONS
where COUNTRY_ID like 'C%'
GROUP BY COUNTRY_ID
order by CITY_COUNT dESC;

--having--bad practice
select  COUNTRY_ID, count(*) as CITY_COUNT
from LOCATIONS
GROUP BY COUNTRY_ID
having COUNTRY_ID like 'C%'
order by CITY_COUNT dESC;

-- TASK 10- 4 -  display country id if city count is bigger than 1
select COUNTRY_ID,count(*)
from LOCATIONS
group by COUNTRY_ID
having count(*) > 1
order by count(*) desc;


-- TASK 11 -1  How many employees is working for each department
Select DEPARTMENt_Id ,count(*)
from EMPLOYEES
group by DEPARTMENt_Id;

-- TASK 11 -2  ignore null departments
Select DEPARTMENt_Id ,count(*)
from EMPLOYEES
where DEPARTMENT_ID is not null
group by DEPARTMENt_Id;


-- TASK 11 -3  display department id where employees count is less than 5
Select DEPARTMENt_Id ,count(*)
from EMPLOYEES
group by DEPARTMENt_Id
having count(*) >5;

------- SUBQUERY -------

-- TASK 12 - Display those employees firstname,lastname and salary
--           who get higher salary than the employee whose employee_id is 104
--step1
select SALARY
from EMPLOYEES
where EMPLOYEE_ID =104;  --6000
--step2
select * from EMPLOYEES where salary >6000;

--step3-dynamic
select FIRST_NAME, LAST_NAME, SALARY
from EMPLOYEES
where salary > (select SALARY
                from EMPLOYEES
                where EMPLOYEE_ID =104);

-- TASK 13 -  Display Manager firstname,lastname of Peter,Vargas from employees table
select EMPLOYEE_ID,FIRST_NAME,LAST_NAME,MANAGER_ID from EMPLOYEES;

--step 1
select MANAGER_ID
from EMPLOYEES
where FIRST_NAME='Peter' and LAST_NAME='Vargas'; --124

--step2
select FIRST_NAME, LAST_NAME
from EMPLOYEES
where EMPLOYEE_ID =(select MANAGER_ID  from EMPLOYEES
                    where FIRST_NAME='Peter' and LAST_NAME='Vargas');

-- TASK 14 -  display all information who is getting 11th highest salary
--step 1
select distinct salary from EMPLOYEES
order by salary desc;

--step 2
select min (SALARY)
from (select distinct salary from EMPLOYEES
      order by salary desc)
 where ROWNUM <12;


-- TASK 15 - Display employees first_name,last_name who is working in Marketing department
select * from DEPARTMENTS
where DEPARTMENT_ID = 20;

select FIRST_NAME,LAST_NAME
from EMPLOYEES join DEPARTMENTS
on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
where DEPARTMENTS.DEPARTMENT_nAME = 'Marketing';

--- DDL / DML ---

-- DQL --> DATA QUERY LANGUAGE  --> SELECT
-- DML --> DATA MANIPULATION LANGUAGE
-- DDL --> DATA DEFINITION LANGUAGE

----- JOINS ----
--inner join = join
--outer left/right/full
--self join

-- INNER JOIN RETURN ONLY THE DATA THAT MATCH FROM BOTH TABLE ACCORDING TO CONDITION
-- Display all first_name and  related department_name

select * from EMPLOYEES;
select * from DEPARTMENTS;

--Table aliases--> E for employees D for departments
select FIRST_NAME, E.DEPARTMENT_Id, DEPARTMENT_NAME
from EMPLOYEES E inner join DEPARTMENTS D
On E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- LEFT OUTER JOIN RETURN EVERYTHING THAT MATCH + UNIQUE FOR LEFT
-- Display all first_name and department_name including the  employee without department
--FIRST Table--left   second -right
select FIRST_NAME , DEPARTMENT_NAME
from EMPLOYEES E left join DEPARTMENTS D
on E.DEPARTMENT_ID= D.DEPARTMENT_ID;

--Display employees who is working for department that starts with S
select FIRST_NAME , DEPARTMENT_NAME
from EMPLOYEES E left join DEPARTMENTS D
on E.DEPARTMENT_ID= D.DEPARTMENT_ID
where DEPARTMENT_NAME like 'S%';


-- RIGHT OUTER JOIN RETURN EVERYTHING THAT MATCH + UNIQUE FOR RIGHT
-- Display all first_name and department_name including the department without employee
select FIRST_NAME , DEPARTMENT_NAME
from EMPLOYEES E right join DEPARTMENTS D
 on E.DEPARTMENT_ID= D.DEPARTMENT_ID;

--same result
select FIRST_NAME , DEPARTMENT_NAME
from DEPARTMENTS D left join EMPLOYEES E
on E.DEPARTMENT_ID= D.DEPARTMENT_ID;

-- FULL OUTER JOIN RETURNS EVERYTHING
-- Display all firstname and department name including the department without employees
-- and also employees without the department
select FIRST_NAME , DEPARTMENT_NAME
from EMPLOYEES E full join DEPARTMENTS D
on E.DEPARTMENT_ID= D.DEPARTMENT_ID;

----- SELF JOIN ---
-- Display all managers and their managers information
select Workers.FIRST_NAME,Workers.LAST_NAME, Workers.MANAGER_ID,Managers.EMPLOYEE_ID, Managers.FIRST_NAME,Managers.LAST_NAME
from EMPLOYEES Workers join EMPLOYEES Managers
on Workers.MANAGER_ID=Managers.EMPLOYEE_ID;

-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers.
select Workers.FIRST_NAME,Workers.LAST_NAME, Workers.MANAGER_ID,Workers.SALARY,Managers.SALARY,Managers.EMPLOYEE_ID, Managers.FIRST_NAME,Managers.LAST_NAME
from EMPLOYEES Workers join EMPLOYEES Managers
on Workers.MANAGER_ID=Managers.EMPLOYEE_ID
WHERE  Workers.SALARY> Managers.SALARY;


select country_Id , Country_name from COUNTRIES;