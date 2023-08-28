Select * from employees;

/*
  it limits rows based on provided number
 */
SELECT * FROM EMPLOYEES
WHERE ROWNUM < 11;

--------------------------------------------------------------------------------------------------------------
--display all information from employees who is getting first 5 highest salary
---------------
--Bad practice
--it is getting data before order them based on salary
--and cut the list from line 6 then it tries to order them between first 5 rows
--that is why we are getting wrong list
SELECT *
FROM EMPLOYEES
where rownum < 6
order by salary desc;
----------------

select * FROM EMPLOYEES ORDER BY SALARY DESC;

----------------
--correct answer
--using ordered by salary desc employees table as an input,
--after From keyword then cutting first 5 with rownum
SELECT *
FROM (select * FROM EMPLOYEES ORDER BY SALARY desc)   -- NOT FROM EMPLOYEES
where rownum < 6;

--------------------------------------------------------------------------------------------------------------
--display all information who is getting 5th highest salary
select distinct salary   --distinct -->for not duplicating
from employees
order by salary desc;

--first we need to find what is 5th highest salary
select SALARY
from (select distinct salary from  employees order by salary desc)
where rownum < 6;

-- 5th highest salary
select min(SALARY)
from (select distinct salary from  employees order by salary desc)
where rownum < 6; --13000

--who is making 5th highest salary
Select * from EMPLOYEES
where salary = 13000;

--dynamic way
Select * from EMPLOYEES
where salary = (select min(SALARY)
from (select distinct salary from  employees order by salary desc)
where rownum < 6);

----------------------------------------------------------------------------------------------------------------------
--INTERVIEW QUESTION--> HOW DO YU FIND WHO IS MAKING 37TH HIGHEST SALARY
--for the Nth highest salary formula is rownum < N+1
Select * from EMPLOYEES
where salary = (select min(SALARY)
from (select distinct salary from  employees order by salary desc)
where rownum < 38);

---------------------------------------------------------------------------------------------------------------------
--display all information who is getting 3th lowest salary

SELECT distinct salary from EMPLOYEES order by salary asc; --without duplicating

--3th lowest salary
Select max(SALARY)
from (SELECT distinct salary from EMPLOYEES order by salary asc)
where ROWNUM <4;

--who is getting 3th lowest salary
Select *
from EMPLOYEES
where salary = 2400;

--dynamic way
Select *
from EMPLOYEES
where salary = (Select min(SALARY)
                from (SELECT distinct salary from EMPLOYEES order by salary asc)
                where ROWNUM <4);
---------------------------------------------------------------------------------------------------------------------




















