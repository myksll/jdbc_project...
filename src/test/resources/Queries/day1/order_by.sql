Select * from Employees;


/*
  ORDER BY
  - it allows us to sort data based on provided column
  - As a default it will order the result ASCENDING ORDER (A-Z,0-9)
  - If you want to sort it Descending order we need to specify right after column name
 */

--display all employees based on salary in ASC order
SELECT * FROM EMPLOYEES
ORDER BY SALARY ;

--same quary
SELECT * FROM EMPLOYEES
ORDER BY SALARY ASC ;

--display all employees based on salary in DESC order
SELECT * FROM EMPLOYEES
ORDER BY SALARY DESC;

--display all the employees based on their firstname desc

SELECT * FROM EMPLOYEES
ORDER BY FIRST_NAME DESC;

--display all information where employee_id is less than 120 and order them based on salary desc
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID < 120
ORDER BY SALARY DESC;

--display all info from employees and order them based on firstname asc and lastname desc
SELECT * FROM EMPLOYEES
ORDER BY  FIRST_NAME ASC ,LAST_NAME DESC;


