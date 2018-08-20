-- Drop database
drop database sp;

-- Create database
create database sp;

-- Use database
use sp;

-- Create tables
create table supplier (
  sno varchar(50) NOT NULL,
  sname varchar(50),
  city varchar(50),
  phone BIGINT,
  email varchar(50),
PRIMARY KEY (sno)
);

create table parts (
  pno varchar(50) NOT NULL,
  pname varchar(20) NOT NULL,
  weight int,
  color varchar(50),
PRIMARY KEY (pno)
);

create table sp (
  sno varchar(50) NOT NULL,
  pno varchar(50) NOT NULL,
  qty integer,
PRIMARY KEY (pno, sno),
CONSTRAINT FK_Sno FOREIGN KEY (sno) REFERENCES
supplier(sno),
CONSTRAINT FK_Pno FOREIGN KEY (pno) REFERENCES
parts(pno)
);

-- Alter table
ALTER TABLE sp
ADD dos DATE;

ALTER TABLE parts
ADD dom DATE;

ALTER TABLE supplier
ADD dob DATE;

-- Insert into supplier
insert into supplier values ('s120','sa','c1',9898989897,'abc@gmail.com','2018-08-10');
insert into supplier values ('s121','sb','c4',9898989897,'zyx@gmail.com','2018-07-14');
insert into supplier values ('s122','sa','c2',9898983897,'ffs@gmail.com','2018-06-12');
insert into supplier values ('s123','sd','c1',9898929897,'gdf@gmail.com','1680-04-10');
insert into supplier values ('s124','se','c3',9898979897,'ggd@gmail.com','2012-08-10');

-- Insert into parts
insert into parts values ('p125','pa',23,'red','1980-08-10');
insert into parts values ('p126','pb',54,'black','2018-04-05');
insert into parts values ('p127','pc',23,'white','2012-08-10');
insert into parts values ('p128','pd',45,'yellow','1990-08-10');
insert into parts values ('p129','pe',32,'red','1980-08-10');

-- Insert into orders
insert into sp values ('s120','p125',23,'1980-08-10');
insert into sp values ('s121','p126',53,'2012-08-16');
insert into sp values ('s122','p127',23,'1970-03-12');
insert into sp values ('s123','p128',73,'2019-08-10');
insert into sp values ('s124','p129',13,'2018-03-17');

-- Select

-- 1
select sname from supplier
where dob = (select max(dob) from supplier);

-- 2
select * from supplier
where DATEDIFF(CURDATE(), dob) >= 10950;

-- 3
select city, AVG( DATEDIFF(CURDATE(), dob)/365 ) as avg from supplier
group by city;

-- 4
select sname from supplier
where sno in (select sno from sp where YEAR(dos) = '2012');

-- 5
select sname from supplier
where sno in (select sno from sp where dos > '2015-02-01');

-- 6
select pname from parts
where pno in (select pno from sp where dos = (select max(dos) from sp));

-- 7
select sname from supplier
where sno in (select a.sno from sp as a, sp as b where((a.sno = b.sno) AND (a.pno < b.pno) AND (DATEDIFF(a.dos, b.dos) BETWEEN 0 AND 30)));

-- 8
select *,date_add(dos,interval 90 day) as new_dos from sp;

-- 9
select *,date_add(dos, interval 3 month) as warranty_expiry from sp where sno = 's123' and CURDATE() <= date_add(dos,interval 3 month);

-- 10
select sname from supplier where sno
in (select a.sno from sp as a, parts as b where a.dos >= date_add(b.dom,interval 6  month) AND a.pno = b.pno);
