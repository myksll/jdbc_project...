SELECT * from Employees;

/*
   AGGREAGTE FUNCTIONS - MULTI ROWS - GROUP FUNCTIONS
   - count --> IT WILL COUNT ROWS
   - max --> it will max value
   - min --> it will min value
   - sum --> it will give total value
   - avg --> it will give average value
--hjkhlöjkhj

   Aggregate function takes multi row and return one result
   All of them ignore null values
 */

--how many departments we have?
SELECT * from DEPARTMENTS;
SELECT Count(*) from DEPARTMENTS;

--how many locations we have?
SELECT * from LOCATIONS;
select count(*) FROM LOCATIONs;

SELECT * FROM EMPLOYEES;
SELECT COUNT(DEPARTMENT_ID) FROM EMPLOYEES;


--Task
--how many different firstname we have?
select Count(distinct First_Name) from employees;

--how many employees working as IT_PROG or SA_REP
select * from EMPLOYEES
WHERE JOB_ID IN('IT_PROG','SA_REP') ;

--max
SELECT MAX(SALARY)
FROM EMPLOYEES;

--min
SELECT MIN(SALARY)
FROM EMPLOYEES;

--avg
SELECT AVG(SALARY)
from EMPLOYEES;

--we can decide how many numbers will be after comma
SELECT ROUND(AVG(SALARY)) from EMPLOYEES;
SELECT ROUND(AVG(SALARY),1) from EMPLOYEES;
SELECT ROUND(AVG(SALARY),2) from EMPLOYEES;
SELECT ROUND(AVG(SALARY),3) from EMPLOYEES;

--SUM
SELECT SUM(SALARY) from EMPLOYEES;

