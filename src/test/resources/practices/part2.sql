--1. Display full addresses from locations table in a single column
select STREET_ADDRESS ||','||city||','||POSTAL_CODE||' '||COUNTRY_ID as "Full adress"
from LOCATIONS;

--2. Display all information of the employee who has the minimum salary in employees table
select *
from EMPLOYEES
where SALARY=(Select min(SALARY) from EMPLOYEES);

--3. Display the second minimum salary from the employees
select min(SALARY)
from EMPLOYEES
where SALARY >(Select min(SALARY) from EMPLOYEES );

--4. Display all information of the employee who has the second minimum salary
select *
from EMPLOYEES
where SALARY = (select min(SALARY) from EMPLOYEES
                                where salary >
                                       (Select MIN(SALARY) from EMPLOYEES ));

--5. List all the employees who are making above the average salary;
select *
from EMPLOYEES
where SALARY > (select avg(SALARY) from EMPLOYEES);

--6. List all the employees who are making less than the average salary
select *
from EMPLOYEES
where salary< (select avg(SALARY) from EMPLOYEES);

--7. Display manager name of 'Neena'
select FIRST_NAME,LAST_NAME
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (select MANAGER_ID from EMPLOYEES
                                         where FIRST_NAME ='Neena');

--8. Find the 3rd maximum salary from the employees table (do not include duplicates)
select min(salary)
from (select distinct salary
      from EMPLOYEES
      order by SALARY desc)
where ROWNUM < 4;

--9. Find the 5th maximum salary from the employees table (do not include duplicates)
select min(sALARY)
from (select distinct SALARY from EMPLOYEES
       order by salary desc)
where rownum< 6 ;

--10. Find the 7th maximum salary from the employees table (do not include duplicates)
select min(salary)
from(select distinct salary from EMPLOYEES
      order by salary desc)
where rownum <8;

--11. Find the 10th maximum salary from the employees table (do not include duplicates)
select min(SALARY)
from(select distinct SALARY from EMPLOYEES
                            order by SALARY desc)
where rownum < 11;

--12. Find the 3rd minimum salary from the employees table (do not include duplicates)
select max(SALARY)
from (select distinct SALARY from EMPLOYEES
                             order by salary asc)
where rownum < 4;

--13. Find the 5th minimum salary from the employees table (do not include duplicates)
select max(salary)
from (select Distinct salary from EMPLOYEES
                             order by SALARY asc)
where ROWNUM <6;
