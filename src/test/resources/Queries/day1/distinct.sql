--SELECT * FROM EMPLOYEES;

 /*
 it shows different values from query result based provided column
 */

--it returns 107
SELECT FIRST_NAME FROM EMPLOYEES;


--it removed duplicate names and returned 91 result
SELECT Distinct FIRST_NAME FROM EMPLOYEES;


--it will check each row to filter different columns --> * --> all columns
SELECT Distinct * FROM EMPLOYEES;

select * from jobs;

select JOB_ID FROM JOBS;

--since primarily key can not be duplicated it gives the same result with distinct
select distinct JOB_ID from JOBS;




