-- Drop database
drop database db_lab6;

-- Create database
create database db_lab6;

-- Use database
use db_lab6;

-- Create tables
create table branch (
  branchId varchar(50),
  branch_name varchar(50),
  branch_city varchar(50),
  assets int NOT NULL,
  modifiedDate DATE,
CONSTRAINT UN_branch_name UNIQUE (branchId, branch_name)
);

create table account (
  accountId varchar(50) NOT NULL,
  branchId varchar(20) NOT NULL,
  accountNumber varchar(20),
  accountType varchar(50),
  balance int,
  modifiedDate DATE,
PRIMARY KEY (accountId),
CONSTRAINT FK_acc FOREIGN KEY (branchId) REFERENCES branch(branchId)
);

create table customer (
  customerId varchar(50) NOT NULL,
  name varchar(20) NOT NULL,
  street varchar(20),
  city varchar(50),
  state varchar(50),
  zip int,
  country varchar(50),
  modifiedDate DATE,
PRIMARY KEY (customerId)
);

create table loan (
  loanId varchar(50),
  accountId varchar(20),
  branchId varchar(20),
  loanNumber varchar(50),
  loantype varchar(50),
  amount int,
  modifiedDate DATE,
PRIMARY KEY (loanId),
FOREIGN KEY (accountId) REFERENCES account(accountId) ON DELETE CASCADE,
FOREIGN KEY (branchId) REFERENCES branch(branchId) ON DELETE CASCADE
);

create table depositor (
  customerId varchar(50),
  accountId varchar(20),
  modifiedDate DATE,
PRIMARY KEY (customerId, accountId),
FOREIGN KEY (accountId) REFERENCES account(accountId) ON DELETE CASCADE,
FOREIGN KEY (customerId) REFERENCES customer(customerId) ON DELETE CASCADE
);

create table borrower (
  customerId varchar(50),
  loanId varchar(20),
  modifiedDate DATE,
PRIMARY KEY (customerId, loanId),
FOREIGN KEY (customerId) REFERENCES customer(customerId) ON DELETE CASCADE,
FOREIGN KEY (loanId) REFERENCES loan(loanId) ON DELETE CASCADE
);

create table transaction (
  transactionId varchar(50),
  accountId varchar(20),
  tranType varchar(20),
  amount decimal,
  modifiedDate DATE,
FOREIGN KEY (accountId) REFERENCES account(accountId) ON DELETE CASCADE
);

start transaction;

-- Insert into branch
insert into branch values ('b1','ba','bc1',121123,'1980-08-10');
insert into branch values ('b2','bb','bc2',323123,'1930-06-12');
insert into branch values ('b3','bc','bc3',121123,'2018-08-10');
insert into branch values ('b4','bd','bc4',161123,'1980-03-10');
insert into branch values ('b5','be','bc5',181123,'1970-08-12');
insert into branch values ('b6','bf','bc6',121123,'2020-08-10');
insert into branch values ('b7','bg','bc7',721123,'2980-09-15');
insert into branch values ('b8','bh','bc8',731123,'2780-09-15');

-- Insert into account
insert into account values ('a1','b1','ac1','sav',200,'1970-08-10');
insert into account values ('a2','b2','ac2','sav',1200,'1940-08-10');
insert into account values ('a3','b3','ac3','cur',5500,'1920-08-10');
insert into account values ('a4','b4','ac4','sav',3000,'2018-08-10');
insert into account values ('a5','b5','ac5','sav',10200,'1970-08-10');
insert into account values ('a6','b6','ac6','cur',15320,'2970-08-10');
insert into account values ('a7','b7','ac7','cur',1000,'1370-08-10');
insert into account values ('a8','b8','ac8','sav',100,'1570-08-10');

-- Insert into customer
insert into customer values ('c1','ca','s1','city1','st1',33414,'cou1','2019-08-10');
insert into customer values ('c2','cb','s2','city2','st2',33214,'cou2','2970-08-10');
insert into customer values ('c3','cc','s3','city3','st3',33414,'cou1','1970-08-10');
insert into customer values ('c4','cd','s4','city4','st4',63414,'cou3','1970-03-10');
insert into customer values ('c5','ce','s5','city5','st5',33414,'cou1','1970-02-10');
insert into customer values ('c6','cf','s6','city6','st6',23414,'cou6','1930-08-10');
insert into customer values ('c7','cg','s7','city7','st7',33514,'cou1','1970-08-10');
insert into customer values ('c8','ch','s8','city8','st8',33514,'cou1','1970-08-10');

-- Insert into loan
insert into loan values ('l1','a1','b1','ln1','personal',23414,'2019-08-10');
insert into loan values ('l2','a2','b2','ln2','car',103414,'1929-08-10');
insert into loan values ('l3','a2','b3','ln4','home',102414,'1919-08-10');
insert into loan values ('l4','a4','b4','ln5','personal',23414,'1019-08-10');
insert into loan values ('l5','a5','b5','ln4','personal',23414,'2019-08-10');
insert into loan values ('l6','a6','b6','ln1','car',33414,'2019-08-10');
insert into loan values ('l7','a8','b7','ln2','home',23414,'2019-08-10');
insert into loan values ('l8','a8','b8','ln1','car',13414,'1918-08-10');

-- Insert into depositor
insert into depositor values ('c1','a1','2018-08-10');
insert into depositor values ('c2','a2','1920-04-10');
insert into depositor values ('c3','a3','1970-08-10');
insert into depositor values ('c4','a4','1930-03-20');
insert into depositor values ('c5','a5','1970-08-13');
insert into depositor values ('c6','a6','2010-02-17');
insert into depositor values ('c7','a7','2070-08-10');
insert into depositor values ('c8','a8','1970-03-10');

-- Insert into borrower
insert into borrower values ('c1','l1','2010-03-10');
insert into borrower values ('c2','l2','1970-03-10');
insert into borrower values ('c3','l3','2010-03-10');
insert into borrower values ('c4','l4','1970-03-10');
insert into borrower values ('c5','l5','1930-03-10');
insert into borrower values ('c6','l6','1970-03-10');
insert into borrower values ('c7','l7','1970-03-10');
insert into borrower values ('c8','l8','2018-03-10');

-- Insert into transaction
insert into transaction values ('t1','a1','loan payment',3020,'2018-03-10');
insert into transaction values ('t2','a2','loan taken',9000,'1958-09-10');
insert into transaction values ('t3','a4','simple deposit',800,'1918-03-10');
insert into transaction values ('t4','a5','simple withdraw',500,'2018-07-10');
insert into transaction values ('t5','a6','simple withdraw',3000,'2038-06-10');
insert into transaction values ('t6','a7','simple deposit',500,'1918-02-10');
insert into transaction values ('t7','a8','simple withdraw',1000,'1938-03-10');
insert into transaction values ('t8','a1','loan taken',3200,'2018-03-10');
insert into transaction values ('t9','a2','simple deposit',3000,'1918-03-10');
insert into transaction values ('t10','a3','loan taken',1000,'2018-03-10');

-- Select

-- 1
update account set balance = 0.97*balance where balance < 3000;
select * from account;

-- 2
delete from customer where customerId in (select customerId from depositor where accountId in (select accountId from account where balance < 500));
savepoint sp1;
select * from customer;

-- 3
select * from customer where customerId in (select customerId from borrower group by customerId having count(*) > 1);

-- 4
delete from customer where customerId in (select customerId from borrower left join loan on loan.loanId = borrower.loanId group by customerId having count(distinct loantype) = 3);
select * from customer;

-- 5
rollback to sp1;
commit;

-- 6
lock table account read;
update account set balance = 1.05*balance
where balance > 10000;

-- 7
unlock tables
lock table account write;
update account set balance = 1.05*balance
where balance > 10000;

-- 8
unlock tables;
