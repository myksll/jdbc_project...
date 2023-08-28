
/*
   -Percent % --> for matching any sequence of characters. (0  or more)
   - underscore _ -->for matching any single character

   -contains
   -startswith
   -endswith

 */

 --display all employees where first_name startswith B
select * FROM EMPLOYEES
where FIRST_NAME like 'B%';

--display all employees where firstname startswith B and length of it
select * FROM EMPLOYEES
where FIRST_NAME like 'B____';

--display 5 letter firstname from employees where middle char is z
select * from EMPLOYEES
WHERE FIRST_NAME like '__z__';

--display firstname endswith 'e'
select * from EMPLOYEES
where FIRST_NAME like '%e';

--display all employees where job id contains IT
select * from EMPLOYEES
where JOB_ID LIKE '%IT%';

--display all information where firstname startswith H and ending with L
Select * from EMPLOYEES
where FIRST_NAME like 'H%l';

