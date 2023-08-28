--your manager is asking all jobs and their average salary

select * FROM EMPLOYEES;

select distinct JOB_ID
from EMPLOYEES;

--get me average salary for IT_PROG
select avg(SALARY) from EMPLOYEES
WHERE JOB_ID='IT_PROG';

--get me average salary for 'AC_ACCOUNT'
select avg(SALARY) from EMPLOYEES
WHERE JOB_ID='AC_ACCOUNT';

--EASIEST WAY-->--your manager is asking all jobs and their average salary
select JOB_ID, avg(salary), Count(*), SUM(SALARY), MIN(SALARY) , max(SALARY)
from employees
GROUP BY JOB_ID;

--Display how many departments we have in each location--each means, look group
select * from locations;  -- we do not have department info so look department part
select  * FROM DEPARTMENTS;

select LOCATION_ID, count(*)
from DEPARTMENTS
group by LOCATION_ID;

--order result based on number of departments in desc
select LOCATION_ID, count(*)
from DEPARTMENTS
group by LOCATION_ID
order by count(*) DESC; --=order by 2 DESC; 2 MEANS --> column 2 so count(*) column 1-LOCATION_ID


--Display how many countries we have in each regions
select REGION_ID, count(*)
from COUNTRIES
group by REGION_ID;

--order them based on number of countries in desc
select REGION_ID, count(*)
FROM COUNTRIES
group by REGION_ID
ORDER BY 2 desc ;  --2 is count(*)

--get me total salary for each department from employees table
select * from EMPLOYEES;  --department_id and salary important

select DEPARTMENT_ID, sum(salary),count(*)
from EMPLOYEES
where DEPARTMENT_ID IS NOT NULL
group by DEPARTMENT_ID
order by 1 asc;

--display job ids where their avg salary more than 5K
select JOB_ID, avg(SALARY), count(*)
from EMPLOYEES
group by JOB_ID
having avg(SALARY) >5000
order by 2 asc;

--display departments where their average salary more than 6K
select DEPARTMENT_ID, ROUND(AVG(SALARY))
from EMPLOYEES
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID
having avg(SALARY) > 6000
order by 2 asc;

--Interview question-->display duplicate(more than one) firstname from employees table(how many repeating names)
select FIRST_NAME, count(*)
from EMPLOYEES
group by FIRST_NAME
having count(*) > 1
order by FIRST_NAME asc ;

--display department id where employees count is bigger than 5
select DEPARTMENT_ID, count(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*)> 5
order by 2 desc;