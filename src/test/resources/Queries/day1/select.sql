SELECT * FROM EMPLOYEES;

SELECT * FROM DEPARTMENTS;

--SQL is not case sensitive

select FIRST_NAME from EMPLOYEES;

select FIRST_NAME, LAST_NAME from EMPLOYEES;

select salary, email from EMPLOYEES;

--display all information from locations table
--* means everything

select * from LOCATIONS;

--display country name and region id countries table

select  country_name , REGION_ID from COUNTRIES;

--display job id and job title from jobs table

select job_id, JOB_TITLE from JOBS
