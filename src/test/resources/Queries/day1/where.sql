SELECT * FROM Employees ;

--display all information of where first name is david
select * FROM EMPLOYEES
where FIRST_NAME='David';

-- '' --> whatever inside this is case sensitive.

--it will return ony David Lee
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME='David' AND LAST_NAME='Lee';

--it will return all Davids.
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME='David' OR LAST_NAME='Lee';

--display firstname, lastname, salary where firstname is Peter
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE FIRST_NAME ='Peter';

--display all information from employees where salary is bigger than 6000
SELECT *
FROM EMPLOYEES
WHERE SALARY > 6000;

--display email of who is making less than 5000
SELECT EMAIL
FROM  EMPLOYEES
WHERE SALARY < 5000;

--display all info from employees who is making than 7000 and department id is 60
SELECT *
FROM EMPLOYEES
WHERE SALARY>7000 and DEPARTMENT_ID=60;

--display all info from employees where salary equals or more than 3000 and salary equals or less then 7000.
SELECT *
from EMPLOYEES
WHERE SALARY >= 3000 AND SALARY<= 7000;

--THAT GIVES SAME RESULT LIKE PREVIOUS ONE
SELECT *
FROM EMPLOYEES
WHERE SALARY between 3000 AND 7000;

--display all information from employees who is working as IT_PROG or MK_MAN
--Solution 1
select *
FROM EMPLOYEES
where JOB_ID='IT_PROG' or JOB_ID='MK_MAN';

--Solution 2
select *
FROM EMPLOYEES
where JOB_ID in ('IT_PROG','MK_MAN');


--display all info where employee id 121, 142, 154, 165,187
--solution 1
SELECT *
FROM EMPLOYEES
where EMPLOYEE_ID= 121 or EMPLOYEE_ID= 142 or EMPLOYEE_ID= 154 or EMPLOYEE_ID= 165 or EMPLOYEE_ID= 187;

--solution 2
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (121,142,154,165,187);


--display all information where country id is US and IT
Select *
FROM COUNTRIES
WHERE COUNTRY_ID in('US' , 'IT');


--display all information expect where country id is US and IT
Select *
FROM COUNTRIES
WHERE COUNTRY_ID not in('US' , 'IT');

--is null
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID is null;

SELECT * FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

--is not null
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID is not null;



