---- PRACTICE 1 ------------------------------------------------------------------------


--4. List all the different region_ids in countries table
select DISTINCT REGION_ID from COUNTRIES;

--Get me all different firstname from employees table
select distinct FIRST_NAME from EMPLOYEES; --91
select distinct FIRST_NAME,LAST_NAME from EMPLOYEES; --107

--5. Display the salary of the employee Grant Douglas (lastName: Grant, firstName: Douglas)
SELECT SALARY
FROM EMPLOYEES
WHERE FIRST_NAME='Douglas' and LAST_NAME='Grant';

--6. Display all department information from departments table
select * from DEPARTMENTS;

-- if the department name values are as below
-- IT , Public Relations , Sales , Executive
select * from DEPARTMENTS
where DEPARTMENT_NAME in ('IT', 'Public Relations', 'Sales','Executive');
--where DEPARTMENT_NAME ='IT' or  'Public Relations' or 'Sales' or 'Executive';

-- 16 . Display all unique job_id that end with CLERK in employee table
select distinct JOB_ID from EMPLOYEES
where JOB_ID like '%CLERK';

--Can we retrieve same data by using jobs table
select  JOB_ID from JOBS
where JOB_ID like '%CLERK'; --job_id in jobs is already primary key so unique so not needed to write distinct

-- 20-4 How many employees are there in each group that have minimum
-- salary of 5000 ?
SELECT count(*) ,JOB_ID from EMPLOYEES
where SALARY>=5000
GROUP BY JOB_ID;

SELECT  JOB_ID,SALARY from EMPLOYEES
where SALARY>=5000;


-- 21. display all job_id and average salary who work as any of these jobs
-- IT_PROG,SA_REP, FI_ACCOUNT, AD_VP
select  JOB_ID, avg(SALARY)
from EMPLOYEES
where JOB_ID in ('IT_PROG','SA_REP','FI_ACCOUNT','AD_VP')
group by JOB_ID;

--Display job ids where their avg salary is less than 10000
select  JOB_ID, avg(SALARY)
from EMPLOYEES
where JOB_ID in ('IT_PROG','SA_REP','FI_ACCOUNT','AD_VP')
group by JOB_ID
having avg(SALARY)<10000;

-- 23. Display total salary for each department except department_id 50, and where total salary more than 30000
select sum(SALARY),DEPARTMENT_ID
from EMPLOYEES
where DEPARTMENT_ID != 50 --  <>50 , not in 50 -->they have same meaning
group by DEPARTMENT_ID
having sum(SALARY)>30000
order by sum(SALARY) desc;



---- PRACTICE 2 ------------------------------------------------------------------------
--8.  Find the 3rd maximum salary from the employees table (do not include duplicates)
select min(salary)
from (select distinct salary
      from EMPLOYEES
      order by SALARY desc)
where ROWNUM < 4;

--step 1 --> Find all salary in desc order
select distinct SALARY from EMPLOYEES
order by salary desc;

--step 2 -->Find all 3RD HIGHEST SALARY
SELECT  min(SALARY) FROM (select distinct SALARY from EMPLOYEES
               order by salary desc)
where rownum <4 ;--14000

--step 3 --> get me all employees who is getting 3rd Max salary
select * from EMPLOYEES
where SALARY= (SELECT  min(SALARY) FROM (select distinct SALARY from EMPLOYEES
                                             order by salary desc)
                   where rownum <4);
-->IQ--> get me all employees who is getting 213rd Max salary
select * from EMPLOYEES
where SALARY= (SELECT  min(SALARY) FROM (select distinct SALARY from EMPLOYEES
                                         order by salary desc)
               where rownum < 214);


--12. Find the 3rd minimum salary from the employees table (do not include duplicates)
--STEP 1
select max(SALARY)
from(select distinct SALARY
     from EMPLOYEES order by SALARY asc)
where ROWNUM < 4;

--STEP 2
select * FROM EMPLOYEES
WHERE SALARY=(select max(SALARY)
              from(select distinct SALARY
                   from EMPLOYEES order by SALARY asc)
              where ROWNUM < 4);


---- PRACTICE 3 --------------------------------------------------------------------------
-- 1. FIND OUT COUNTRY NAME AND REGION NAME FROM COUNTRIES AND  REGION TABLE
select C.COUNTRY_ID,COUNTRY_NAME,REGION_NAME
from COUNTRIES C inner join REGIONS R
ON C.REGION_ID = R.REGION_ID;

--how many country we have for each region?
select  REGION_NAME , count(*)
from COUNTRIES C inner join REGIONS R
 ON C.REGION_ID = R.REGION_ID
group by REGION_NAME;

--Display regions which has more than 5 country
select  REGION_NAME , count(*)
from COUNTRIES C inner join REGIONS R
ON C.REGION_ID = R.REGION_ID
group by REGION_NAME
having count(*) >5;

-- 3.  FIND OUT DEPARTMENT_NAME AND CITY
select DEPARTMENT_NAME, CITY
from DEPARTMENTS D join LOCATIONS L
ON D.LOCATION_ID= L.LOCATION_ID;

--how many departments we have each city?
select CITY, COUNT(*)
from DEPARTMENTS D join LOCATIONS L
ON D.LOCATION_ID= L.LOCATION_ID
GROUP BY CITY;

-- 5.  FIND OUT FIRST_NAME, LAST NAME, DEPARTMENT ID , DEPARTMENT NAME FOR DEPARTMENT ID 80 OR 40
SELECT  FIRST_NAME, LAST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
from EMPLOYEES E join DEPARTMENTS D
on E.DEPARTMENT_ID=D.DEPARTMENT_ID
where D.DEPARTMENT_ID IN (80 , 40);

-- 7. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME ,  CITY
SELECT FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME ,  CITY
FROM JOBS J
         INNER JOIN EMPLOYEES E ON J.JOB_ID = E.JOB_ID
         INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
         INNER JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID;

-- 8. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME ,CITY , COUNTRY_NAME , REGION_NAME


-- 11 .FIND OUT DEPARTMENT_NAME , LOCATION_ID , AND COUNTRY_NAME INCLUDING THOSE COUNTRIES WITH NO DEPARTMENT


----- SELF JOIN ---
-- Display all managers and their managers information
SELECT Workers.FIRST_NAME, Workers.LAST_NAME, Workers.MANAGER_ID,
       Managers.EMPLOYEE_ID, Managers.FIRST_NAME,Managers.LAST_NAME
from EMPLOYEES Workers inner join EMPLOYEES Managers
On Workers.MANAGER_ID = Managers.EMPLOYEE_ID;


-- IQ--Given the Employee table, write a SQL query that finds out employees who earn more than their managers
SELECT Workers.FIRST_NAME,Workers.LAST_NAME,Workers.SALARY,
       Managers.FIRST_NAME,Managers.LAST_NAME,Managers.SALARY
from EMPLOYEES Workers inner join EMPLOYEES Managers
                                  On Workers.MANAGER_ID = Managers.EMPLOYEE_ID
WHERE Workers.SALARY>Managers.SALARY;