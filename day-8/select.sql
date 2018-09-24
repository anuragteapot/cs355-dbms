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
