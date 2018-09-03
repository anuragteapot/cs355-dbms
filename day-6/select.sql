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
