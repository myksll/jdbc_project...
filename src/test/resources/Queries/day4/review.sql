Select * from employees;

--display all information who is getting 3th lowest salary

select distinct salary from employees order by salary asc;

select max(salary)
from (select distinct salary from employees order by salary asc)
where ROWNUM < 4;

select * from EMPLOYEES
where salary = 2400;

--dynamic way
select * from EMPLOYEES
where salary = (select max(salary)
                from (select distinct salary from employees order by salary asc)
                where ROWNUM < 4);

