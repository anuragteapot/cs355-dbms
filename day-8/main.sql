-- Drop database
drop database db_lab8;

-- Create database
create database db_lab8;

-- Use database
use db_lab8;

-- Create table
CREATE TABLE LOCATION (
  Location_ID VARCHAR(20),
  Regional_Group VARCHAR(20),
  PRIMARY KEY (Location_ID)
);

CREATE TABLE DEPARTMENT (
  Department_ID VARCHAR(20),
  Name VARCHAR(20),
  Location_ID VARCHAR(20),
  PRIMARY KEY (Department_ID),
  FOREIGN KEY(Location_ID) REFERENCES LOCATION(Location_ID)
);

CREATE TABLE JOB (
  Job_ID VARCHAR(20),
  Function VARCHAR(20),
  PRIMARY KEY (Job_ID)
);

CREATE TABLE EMPLOYEE (
  Employee_ID VARCHAR(20),
  Last_Name VARCHAR(20),
  First_Name VARCHAR(20),
  Middle_Name VARCHAR(20),
  Job_ID VARCHAR(20),
  Manager_ID VARCHAR(20),
  Hire_Date DATE,
  Salary INT,
  Comm INT,
  Department_ID VARCHAR(20),
  PRIMARY KEY (Employee_ID),
  FOREIGN KEY(Job_ID) REFERENCES JOB(Job_ID),
  FOREIGN KEY(Department_ID) REFERENCES DEPARTMENT(Department_ID)
);

-- Insert into LOCATION
insert into LOCATION values ('l1','rg1');
insert into LOCATION values ('l2','rg2');
insert into LOCATION values ('l3','rg3');
insert into LOCATION values ('l4','rg2');
insert into LOCATION values ('l5','rg5');
insert into LOCATION values ('l6','rg6');
insert into LOCATION values ('l7','rg6');
insert into LOCATION values ('l8','rg8');
insert into LOCATION values ('l9','rg9');

-- Insert into DEPARTMENT
insert into DEPARTMENT values ('10','Research','l1');
insert into DEPARTMENT values ('12','Accounting','l2');
insert into DEPARTMENT values ('13','Research','l2');
insert into DEPARTMENT values ('14','Accounting','l4');
insert into DEPARTMENT values ('15','Research','l5');
insert into DEPARTMENT values ('16','Accounting','l5');
insert into DEPARTMENT values ('17','Research','l7');
insert into DEPARTMENT values ('18','Accounting','l7');
insert into DEPARTMENT values ('19','Research','l9');
insert into DEPARTMENT values ('20','Accounting','l9');
insert into DEPARTMENT values ('21','Research','l9');

-- Insert into Job
insert into JOB values ('job1','CLERK');
insert into JOB values ('job2','STAFF');
insert into JOB values ('job3','ANALYST');
insert into JOB values ('job4','SALESPERSON');
insert into JOB values ('job5','MANAGER');
insert into JOB values ('job6','PRESIDENT');
insert into JOB values ('job7','CLERK');
insert into JOB values ('job8','STAFF');
insert into JOB values ('job9','ANALYST');
insert into JOB values ('job10','SALESPERSON');
insert into JOB values ('job11','MANAGER');


-- Insert into EMPLOYEE
insert into EMPLOYEE values ('ed1','ln1','fn1','mn1','job1','mi1','1950-01-10',9000,500,'10');
insert into EMPLOYEE values ('ed2','ln2','fn2','mn2','job2','mi2','1990-01-10',50000,500,'12');
insert into EMPLOYEE values ('ed3','ln3','sfn3','mn3','job3','mi3','1930-08-10',10700,500,'13');
insert into EMPLOYEE values ('ed4','ln4','sfn4','mn4','job4','mi4','2018-08-10',14000,500,'14');
insert into EMPLOYEE values ('ed5','ln5','sfn5','mn5','job5','mi5','1990-08-10',3000,600,'15');
insert into EMPLOYEE values ('ed6','ln6','fn6','mn6','job6','mi6','1985-04-10',3400,500,'16');
insert into EMPLOYEE values ('ed7','ln7','sfn7','mn7','job7','mi7','2020-08-10',4400,510,'16');
insert into EMPLOYEE values ('ed8','ln8','fn8','mn8','job8','mi8','1990-08-10',80000,570,'18');
insert into EMPLOYEE values ('ed9','ln9','fn9','mn9','job9','mi9','1950-01-10',100000,500,'10');
insert into EMPLOYEE values ('ed10','ln10','fn10','mn10','job10','mi10','1950-08-10',100000,500,'20');
insert into EMPLOYEE values ('ed11','ln11','fn11','mn11','job11','mi11','1985-04-10',100000,500,'21');
insert into EMPLOYEE values ('ed12','ln11','fn11','mn11','job11','mi11','1950-08-10',100000,500,'21');
insert into EMPLOYEE values ('ed13','ln11','fn11','mn11','job11','mi11','1985-04-10',100000,500,'21');
insert into EMPLOYEE values ('ed14','ln11','fn11','mn11','job11','mi11','1985-04-10',100000,500,'21');

-- Select

-- Q1
CREATE OR REPLACE VIEW Q1 as select First_Name, Last_Name, Salary, Comm from EMPLOYEE;
select * from Q1;

-- Q2
CREATE OR REPLACE VIEW Q2 as select First_Name, Salary from EMPLOYEE;
select * from Q2;

-- Q3
CREATE OR REPLACE VIEW Q3 as select * from EMPLOYEE WHERE Department_ID = '20';
select * from Q3;

-- Q4
CREATE OR REPLACE VIEW Q4 as select * from EMPLOYEE WHERE Salary BETWEEN 3000 AND 4500;
select * from Q4;

-- Q5
CREATE OR REPLACE VIEW Q5 as select * from EMPLOYEE WHERE Department_ID = '20' OR Department_ID = '10';
select * from Q5;

-- Q6
CREATE OR REPLACE VIEW Q6 as select * from EMPLOYEE WHERE left(First_Name,1) = 's';
select * from Q6;

-- Q7
CREATE OR REPLACE VIEW Q7 as select * from EMPLOYEE WHERE left(First_Name,1) = 's' AND length(First_Name) = 4;
select * from Q7;

-- Q8
CREATE OR REPLACE VIEW Q8 as select * from EMPLOYEE ORDER BY Salary DESC, First_Name ASC;
select * from Q8;

-- Q9
CREATE OR REPLACE VIEW Q9 as select count(*) AS Num, Department_ID, AVG(Salary), MIN(Salary), MAX(Salary) from EMPLOYEE GROUP BY Department_ID;
select * from Q9;

-- Q10
CREATE OR REPLACE VIEW Q10 as select count(*) AS Num, YEAR(Hire_Date) AS year from EMPLOYEE GROUP BY YEAR(Hire_Date),MONTH(Hire_Date) ORDER BY YEAR(Hire_Date),MONTH(Hire_Date);
select * from Q10;

-- Q11
CREATE OR REPLACE VIEW Q11 as select Department_ID from EMPLOYEE GROUP BY Department_ID HAVING count(*) >= 4;
select * from Q11;

-- Q12
CREATE OR REPLACE VIEW Q12 as select count(*) as NUM ,MONTH(Hire_Date) As Jan from EMPLOYEE WHERE MONTH(Hire_Date) = 1 GROUP BY MONTH(Hire_Date);
select * from Q12;

-- Q13
CREATE OR REPLACE VIEW Q13 as select Department_ID from EMPLOYEE WHERE MONTH(Hire_Date) = 4 AND YEAR(Hire_Date) = 1985 GROUP BY Department_ID HAVING count(*) >= 3;
select * from Q13;

-- Q14
CREATE OR REPLACE VIEW Q14 as select First_Name from EMPLOYEE WHERE
  Job_ID in (select Job_ID from EMPLOYEE e NATURAL JOIN DEPARTMENT d where d.Name  = 'Research')
  AND
  Job_ID in (select Job_ID from EMPLOYEE e NATURAL JOIN DEPARTMENT d where d.Name  = 'Accounting');
select * from Q14;
