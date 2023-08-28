select * from employees;

/*
 create table syntax:
    colName1 DataType Constraints
    colName1 DataType Constraints(Optional)
    colName1 DataType Constraints,
    ...
 );
 */
 ---CREATE TABLE---

CREATE TABLE scrumteam_merve(

    emp_id Integer PRIMARY KEY,
    first_name varchar(30) not null,
    last_name varchar(20) not null ,
    job_title varchar(20),
    salary Integer

);

select * from scrumteam;

/*
 INSERT INTO tableName (column1, column2,..)
 VALUES (value1, value2 ...);
 */

INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
VALUES (1,'Severus','Snape','Tester',130000);

INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
VALUES (2,'Harold','Finch','Developer',140000);

INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
VALUES (3,'Phoebe','Buffay','Scrum Master',90000);

INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
VALUES (4,'Michael','Scofield','PO',150000);

--save changes so that other people , connections can get the updates
commit;

/*
 UPDATE table_name
 SET column1= value1,
 column2 = value2 , ..
 WHERE condition;
 */
select * from scrumteam;

UPDATE SCRUMTEAM
SET SALARY = SALARY+5000;

UPDATE SCRUMTEAM
SET SALARY = 110000
WHERE emp_id = 3 ;

commit work;

/*
 DELETE FROM table-name
 WHERE condition;
 */

 DELETE FROM SCRUMTEAM
 WHERE EMP_ID = 4;

commit;
--CRUD
--CREATE (INSERT)
--READ (SELECT)
--UPDATE (UPDATE)
--DELETE (DELETE)

/*
 ALTER TABLE table_name action;
 */

--ADD NEW COLUMN
ALTER TABLE SCRUMTEAM ADD gender varchar(10);

select * from scrumteam;

UPDATE SCRUMTEAM
SET gender = 'Male'
WHERE EMP_ID = 1 ;

--RENAME THE COLUMN
ALTER TABLE SCRUMTEAM RENAME COLUMN salary TO annual_salary;

--DROP THE COLUMN
ALTER TABLE SCRUMTEAM DROP COLUMN gender;

--RENAME THE TABLE
ALTER TABLE SCRUMTEAM RENAME TO AGILETEAM;
select * from AGILETEAM;

--TRUNCATE
TRUNCATE TABLE AGILETEAM;

--DROP TABLE -it is dangerous comment not use it
DROP TABLE AGILETEAM;
select * from AGILETEAM;
commit;

/*
 IQ --> what is the difference between TRUNCATE and DROP
 TRUNCATE---> it will delete content , but keep the table
 DROP    ---> it will delete all content and table itself
 */

