select * from Employees;

--Display all information who is making max salary

--max salary: 24000
SELECT max(salary)
from EMPLOYEES;

--if we know max salary can we find who is getting it?
select *
from EMPLOYEES
where salary = 24000;  --Steven King

--if the steven king salary changes we can not find person who is getting max salary with the query above

--dynamic result
select *
from EMPLOYEES
where SALARY =(select max(salary) from employees);  --Steven King but it is dynamic in this situation.

--Task: Give me all information who is getting min salary

--min salary?
select min(salary)
from EMPLOYEES;

--who is making min salary?
select *
from EMPLOYEES
where salary = 2100;

--dynamic query
select *
from EMPLOYEES
where SALARY = (Select  min(salary) from EMPLOYEES);

--display all information who is getting second highest salary ?
--find max salary
select max(SALARY) from EMPLOYEES;

--second max salary
select max(SALARY) from EMPLOYEES
where SALARY < 24000;

--who is making 17000
select * from EMPLOYEES
where SALARY=17000;

--dynamic query
select * from EMPLOYEES
where SALARY = (select max(SALARY) from EMPLOYEES where SALARY <                                       --17000
                                                                        (select max(SALARY) from EMPLOYEES)); --24000

--display all information who is getting second minimum salary ?
select *
from EMPLOYEES
where salary = (select min(salary) from EMPLOYEES where salary > (select min(salary) from employees));




-- TASK: Display all information who is getting more than average?

--avg salary = 6462
select round(avg(salary))
from EMPLOYEES;

--who is making more than average salary
select *
from EMPLOYEES
where SALARY> 6452;

--dynamic query
SELECT *
from EMPLOYEES
where SALARY > (select round(avg(salary)) from EMPLOYEES);

