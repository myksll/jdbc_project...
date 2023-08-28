create table SalesPerson (
    Sp_id Integer primary key,
    Sp_name  varchar(30)
);

select * from SalesPerson;

create table Sales(
    Sales_id Integer primary key,
    Amount  DECIMAL,
    Sp_id  Integer ,
    Company_id Integer
);

select * from Sales;

create table Company(
    Company_id Integer primary key,
    Company_name varchar(30)
  );
 select * from Company;

insert into SALES VALUES (1,7.99,8,100);
insert into SALES VALUES (2,4.55,8,100);
insert into SALES VALUES (3,6.21,8,100);
insert into SALES VALUES (4,12.99,8,100);
insert into SALES VALUES (5,6.21,3,100);
insert into SALES VALUES (6,7.35,3,100);
insert into SALES VALUES (7,4.88,3,300);
insert into SALES VALUES (8,13.21,2,300);
insert into SALES VALUES (9,15,2,300);
insert into SALES VALUES (10,4,2,300);

commit work;

select * from SALES;