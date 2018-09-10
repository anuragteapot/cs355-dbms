-- Drop database
drop database db_lab7;

-- Create database
create database db_lab7;

-- Use database
use db_lab7;

-- Create tables
create table student (
  id INT,
  firstName varchar(50),
  lastName varchar(50),
  department varchar(50),
  primary key (id)
);

-- Insert into student
insert into student values (1,'first1','last1','dept1');
insert into student values (2,'first2','last2','dept1');
insert into student values (3,'first3','last3','dept3');
insert into student values (4,'first4','last4','dept5');
insert into student values (5,'first5','last5','dept5');
insert into student values (6,'first6','last6','dept6');
insert into student values (7,'first7','last7','dept8');
insert into student values (8,'first8','last8','dept7');

-- Create a function
DELIMITER //

CREATE FUNCTION full_name ( firstName varchar(50), lastName varchar(50) )
RETURNS varchar(100)

BEGIN
   RETURN CONCAT(lastName ,', ' , firstName);
END; //

select id, firstName, lastName, full_name(firstName, lastName) as new_name from student;

CREATE FUNCTION root_calculation ( a decimal, b decimal, c decimal )
RETURNS varchar(50)

BEGIN
   declare roots varchar(100);
   declare r1 decimal(5, 2);
   declare r2 decimal(5, 2);
   declare d decimal(5,2);

   set d = b*b - 4*a*c;

  if a=0 and b=0 then
  set roots = 'NULL_NULL';
  elseif a=0 then
  set r1 = (-1*c) /b;
  set roots = CONCAT(r1,'_', 'NULL');
  elseif d<0 then
    set roots = 'Roots are imaginary';
  else
    set r1 = (-1*b + sqrt(d))/(2*a);
    set r2 = (-1*b - sqrt(d))/(2*a);
    set roots = CONCAT(r1, '_', r2);
  end if;
  return roots;
END; //

DELIMITER ;

select root_calculation(1, 2, 2) as roots;
select root_calculation(1, 2, 1) as roots;
select root_calculation(0, -2, 1) as roots;
select root_calculation(0, 0, 1) as roots;
