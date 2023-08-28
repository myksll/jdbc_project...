select * from EMPLOYEES;

/*
    1. Column alieases --> it is temporary name to show in display
    2. Table  alieases --> which we will learn later
       Employees --> E
 */

--the query below second column name is "ROUND(AVG(SALARY))" which is not nice.
select DEPARTMENT_ID, ROUND(AVG(SALARY))   --1.
from EMPLOYEES
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID
having avg(SALARY) > 6000
order by 2 asc;

select DEPARTMENT_ID, ROUND(AVG(SALARY)) as "Average salary"  --2.
from EMPLOYEES
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID
having avg(SALARY) > 6000
order by 2 asc;

select DEPARTMENT_ID, ROUND(AVG(SALARY)) as Average_salary    --3.
from EMPLOYEES
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID
having avg(SALARY) > 6000
order by 2 asc;


--manager is asking display annual salary for all employees as annual-salary
SELECT FIRST_NAME, SALARY*12 as annual_salary  --as is for title of salary*12
from EMPLOYEES;

--Note --> we are just displaying and nothing will change it DB

------------------------STRING MANIPULATION-----------------------------------
    /*
        CONCAT
        --JAVA --> +  --> first_name+" "+last_name
        --SQL  --> || --> first_name||' '||last_name
     */

-- I WANT TO GET FULL NAME COLUMN WHERE WE HAVE FIRSTNAME + ' ' + LASTNAME
SELECT FIRST_NAME||' '||LAST_NAME AS full_name
FROM EMPLOYEES;

--add @cydeo.com to all the emails in the employee table.
select EMAIL||'@cydeo.com' as email
from EMPLOYEES;

--concat()
select concat(email, '@cydeo.com') from EMPLOYEES;

--lowercase
select lower(email||'@cydeo.com') from EMPLOYEES;

--uppercase
select UPPER(EMAIL||'@cydeo.com') from EMPLOYEES;

--initcap
--it makes first letter uppercase
select INITCAP(EMAIL||'@cydeo.com') from EMPLOYEES;

--LENGTH
SELECT EMAIL, length(email) as email_length from EMPLOYEES;


--display all employees where firstname length equals 6
SELECT FIRST_NAME
from EMPLOYEES
where length(FIRST_NAME) =  6  ;

--another solution
select FIRST_NAME from EMPLOYEES
where FIRST_NAME like '______';

--how many question??
select count(*) from EMPLOYEES
where FIRST_NAME like '______';

--display initial from firstname and lastname --> S.K. --- N.K.

--SUBSTR(columnName, beginningIndex, numberOfChar)
select * from EMPLOYEES;
select substr(FIRST_NAME,0,1)||'.'||substr(LAST_NAME,0,1) as initials from EMPLOYEES;

select FIRST_NAME,LAST_NAME,substr(FIRST_NAME,0,1)||'.'||substr(LAST_NAME,0,1) as initials from EMPLOYEES;

select FIRST_NAME,LAST_NAME,substr(FIRST_NAME,0,1)||'.'||substr(LAST_NAME,0,1) as initials from EMPLOYEES;
select FIRST_NAME,LAST_NAME,substr(FIRST_NAME,0,2)||'.'||substr(LAST_NAME,0,1) as initials from EMPLOYEES;
select FIRST_NAME,LAST_NAME,substr(FIRST_NAME,1,1)||'.'||substr(LAST_NAME,1,1) as initials from EMPLOYEES; --it does not give error

select FIRST_NAME, substr(FIRST_NAME,-3) from EMPLOYEES; --it gives last 3(-3) letters of first_name
select FIRST_NAME, substr(FIRST_NAME,-2,2) from EMPLOYEES; --it gives last 2 letters of first_name


/*
  -if beginning index is 0 , it is treated as 1
  -if the beginning index negative, it will start from backwards
  -if we do not specify number of char it will work till the end
 */

