-- Drop database
drop database db_lab9;

-- Create database
create database db_lab9;

-- Use database
use db_lab9;

-- Create table
CREATE TABLE Customer (
  Customer_Id VARCHAR(20),
  Customer_Name VARCHAR(20),
  City VARCHAR(20),
  Pincode int,
  State VARCHAR(20),
  Balance_Due int,
  PRIMARY KEY (Customer_Id)
);

CREATE TABLE Product (
  Product_Code VARCHAR(20),
  Product_Name VARCHAR(20),
  Qty_Avaliable int,
  Cost_Price int,
  Selling_Price int,
  PRIMARY KEY (Product_Code)
);

CREATE TABLE Orders (
  Order_No VARCHAR(20),
  Order_Date date,
  Product_Code VARCHAR(20),
  Customer_Id VARCHAR(20),
  Quantity int,
  FOREIGN KEY(Product_Code) REFERENCES Product(Product_Code),
  FOREIGN KEY(Customer_Id) REFERENCES Customer(Customer_Id)
);

CREATE TABLE Employees (
  Employee_Id int,
  First_Name VARCHAR(20),
  Last_Name VARCHAR(20) NOT NULL,
  Email VARCHAR(20) NOT NULL,
  Phone_Number int,
  Hire_Date date Not null,
  Job_Id VARCHAR(20),
  Salary int NOT NULL check(Salary > 0),
  Commission_Pct int,
  Manager_Id int,
  Department_Id int,
  dn VARCHAR(20),
  constraint emp_email_uk_demo Unique(Email)
);

-- Insert DATE
insert into Customer values ('c1','cn1','city1',801103,'s1',12124);
insert into Customer values ('c2','cn2','city2',807103,'s2',26124);
insert into Customer values ('c3','cn2','city3',806103,'s3',12124);
insert into Customer values ('c4','cn1','city1',801103,'s4',22124);
insert into Customer values ('c5','cn3','city4',831103,'s1',15124);
insert into Customer values ('c6','cn1','city1',821103,'s3',12124);
insert into Customer values ('c7','cn4','city6',811103,'s4',12124);
insert into Customer values ('c8','cn1','city6',805103,'s5',16124);
insert into Customer values ('c9','cn5','city1',801103,'s3',12124);

insert into Product values ('p1','pn1',231,534,5221);
insert into Product values ('p2','pn2',231,24,3721);
insert into Product values ('p3','pn3',21,534,3221);
insert into Product values ('p4','pn4',251,234,3221);
insert into Product values ('p5','pn5',231,234,3221);
insert into Product values ('p6','pn6',241,434,5221);
insert into Product values ('cd7','pn7',231,234,3821);
insert into Product values ('cd8','pn8',431,234,3921);
insert into Product values ('cd9','pn9',531,234,3121);

insert into Orders values ('o1','2018-08-10','p1','c1',10);
insert into Orders values ('o2','2018-01-20','p2','c1',10);
insert into Orders values ('o3','2318-08-10','p3','c2',25);
insert into Orders values ('o4','2018-12-10','cd8','c1',25);
insert into Orders values ('o5','2018-12-10','p5','c3',25);
insert into Orders values ('o6','2018-08-12','p6','c5',25);
insert into Orders values ('o7','2018-12-12','p1','c1',25);
insert into Orders values ('o8','2018-08-14','cd7','c6',25);
insert into Orders values ('o9','2018-12-10','p1','c7',25);
insert into Orders values ('o10','2018-08-10','p1','c1',25);

insert into Employees values (1,'first1','last1','abc@gmail.com',737643913,NOW(),'job1',6221,123,234,12,'dn1');
insert into Employees values (2,'first2','last2','asc@gmail.com',756643913,NOW(),'job2',13221,323,134,15,'dn2');
insert into Employees values (3,'first3','last3','adc@gmail.com',75643913,NOW(),'job3',2621,143,144,18,'dn3');
insert into Employees values (4,'first4','last4','agc@gmail.com',737643913,NOW(),'job4',23221,173,234,12,'dn4');
insert into Employees values (5,'first5','last5','ahc@gmail.com',734643913,NOW(),'job5',27221,123,834,11,'dn5');
insert into Employees values (6,'first6','last6','ajc@gmail.com',737643913,NOW(),'job6',13221,723,234,16,'dn6');
insert into Employees values (7,'first7','last7','akc@gmail.com',71643913,NOW(),'job7',53221,123,254,12,'dn7');
insert into Employees values (8,'first8','last8','alc@gmail.com',737643913,NOW(),'job8',23221,923,334,11,'dn8');
insert into Employees values (9,'first9','last8','amc@gmail.com',738643913,NOW(),'job9',23221,123,234,13,'dn9');

-- Q.1
Create Unique index index1 on Customer(customer_id);

ALTER TABLE Orders add Type VARCHAR(20) not null;
update Orders set type = Product_Code where Product_Code like 'cd%';

Create Unique index index2 on Orders(Order_No, Customer_Id,Product_Code,Type);

-- Q.2
ALTER TABLE Employees add income_ix int;
update Employees set income_ix = (Salary + (Salary * Commission_Pct));
select First_Name,Last_Name,income_ix from Employees where income_ix > 15000;
Create Unique index index3 on Employees(income_ix);
