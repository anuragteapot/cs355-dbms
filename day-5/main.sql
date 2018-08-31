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

-- Insert into supplier
insert into supplier values ('s120','saa','c1',9898989897,'abc@gmail.com');
insert into supplier values ('s121','sb','c4',9898989897,'zyx@gmail.com');
insert into supplier values ('s122','saa','c2',9898983897,'ffs@gmail.com');
insert into supplier values ('s123','sd','c1',9898929897,'gdf@gmail.com');
insert into supplier values ('s124','se','c3',9898979897,'ggd@gmail.com');

-- Insert into parts
insert into parts values ('p125','pa',23,'red');
insert into parts values ('p126','pb',54,'black');
insert into parts values ('p127','pc',23,'white');
insert into parts values ('p128','pd',45,'yellow');
insert into parts values ('p129','pe',32,'red');

-- Insert into orders
insert into sp values ('s120','p125',23);
insert into sp values ('s121','p126',53);
insert into sp values ('s122','p127',23);
insert into sp values ('s123','p128',73);
insert into sp values ('s124','p129',13);

-- Select

-- 1
select substring(sno,2,length(sno)-1) as Only_number from supplier;

-- 2
select sname from supplier where length(sname)-length(replace(sname, 'a', '')) = '2';

-- 3
select sno,concat("sp",substring(sno,2,length(sno)-1), substring(pno,2,length(sno)-1)) as combination from sp;

-- 4
select sno from supplier where substring(sno,2,length(sno)-1) =  REVERSE(substring(sno,2,length(sno)-1));

-- 5
select sno,concat("suppl",substring(sno,2,length(sno)-1)) as New from supplier;

-- 6
select phone,concat(substring(phone,5,length(phone)-5),"-",substring(phone,6,length(phone)-1)) as New_Format from supplier;

-- 7
select sno,phone,concat(right(sno,1),substring(phone,5,1),substring(phone,8,1),round((rand() * (99-0))+99)) as key_generate from supplier;

-- 8
select weight,round(weight/1000,2) as Weight from parts;

-- 9
select email,substring(email, position("@" IN email)+1, position("." IN email)-position("@" IN email)-1) as Domain from supplier;

-- 10
select pno,repeat("*", truncate(weight/10,0)+1) as new_weight from parts;
