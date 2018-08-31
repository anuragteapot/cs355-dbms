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
