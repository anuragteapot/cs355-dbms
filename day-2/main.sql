DROP DATABASE DBLAB;
create database DBLAB;
use DBLAB;

/*CREATE table */
create table Paper_details(
    paper_id varchar(25),
    paper_title varchar(100),
    paper_type varchar(25) check (paper_type in ('conference','journal') ),
    publication date
);

create table Paper_author(
    paper_id varchar(25),
    author_id varchar(25)
);

create table Author_details(
    author_id varchar(25),
    author_type varchar(25) check(author_type in ('student','faculty'))
);

create table Student_details(
    student_id varchar(25),
    student_name varchar(100),
    student_institute varchar(100),
    department varchar(25),
    DOB date,
    research_area varchar(100)
);

create table Faculty_details(
    faculty_id varchar(25),
    faculty_name varchar(100),
    faculty_institute varchar(100),
    department varchar(25),
    DOB date,
    research_area varchar(100)
);

create table Supervisor (
    faculty_id varchar(25),
    student_id varchar(25)
);

/*insert query */

insert into Paper_details values ('pid1','title1','conference','2017-05-04');
insert into Paper_details values ('pid2','abc2','conference','2016-05-04');
insert into Paper_details values ('pid3','abc3','journal','2015-05-04');
insert into Paper_details values ('pid4','abc4','conference','2014-05-04');
insert into Paper_details values ('pid5','title5','conference','2000-05-04');
insert into Paper_details values ('pid6','title6','journal','1995-09-23');
insert into Paper_details values ('pid7','abc7','conference','1998-05-04');
insert into Paper_details values ('pid8','abc8','journal','2002-05-14');
insert into Paper_details values ('pid9','title9','journal','2004-05-24');
insert into Paper_details values ('pid10','title10','conference','2006-05-14');
insert into Paper_details values ('pid11','title1','journal','2008-05-24');
insert into Paper_details values ('pid12','abc12','conference','2007-8-04');
insert into Paper_details values ('pid13','title13','conference','2017-09-04');
insert into Paper_details values ('pid14','title14','journal','2017-11-04');
insert into Paper_details values ('pid15','title15','journal','2017-12-20');

insert into Paper_author values ('pid1','1501CS10' );
insert into Paper_author values ('pid1','1501CS20' );
insert into Paper_author values ('pid1','101' );
insert into Paper_author values ('pid2','1501CS10' );
insert into Paper_author values ('pid3','1501CS10' );
insert into Paper_author values ('pid4','1501CS20' );
insert into Paper_author values ('pid5','101' );
insert into Paper_author values ('pid5','1501CS25' );
insert into Paper_author values ('pid6','1501CS25' );
insert into Paper_author values ('pid6','1501CS60' );
insert into Paper_author values ('pid6','102' );
insert into Paper_author values ('pid7','102' );
insert into Paper_author values ('pid8','1501CS30' );
insert into Paper_author values ('pid9','1501CS30' );
insert into Paper_author values ('pid10','1501CS30' );
insert into Paper_author values ('pid11','104' );



insert into Author_details values ('1501CS10','student') ;
insert into Author_details values ('1501CS20','student') ;
insert into Author_details values ('101','faculty') ;
insert into Author_details values ('1501CS25','student') ;
insert into Author_details values ('1501CS60','student') ;
insert into Author_details values ('102','faculty') ;
insert into Author_details values ('1501CS30','student') ;
insert into Author_details values ('104','faculty') ;


insert into Student_details values ('1501CS10','Anurag kumar','IIT Patna','CSE','2006-05-14','AI');
insert into Student_details values ('1501CS20','raj kumar','IIT-k','CSE','2006-05-14','AI');
insert into Student_details values ('1501CS30','naveen singh','IIT Patna','CSE','2006-12-19','Big Data');
insert into Student_details values ('1501CS05','piyush singh','IIT-k','ME','1998-09-18','machin');
insert into Student_details values ('1501CS15','mehta mani','IIT Patna','CSE','2000-11-20','SNAA');
insert into Student_details values ('1501CS25','Kanna kumar','IIT Patna','CSE','2006-05-14','ML');
insert into Student_details values ('1501CS60','rajesh','IIT Patna','CSE','2006-05-14','Big Data');

insert into Faculty_details values ('101','suresh','IIT Patna','CSE','2006-05-14','AI');
insert into Faculty_details values ('102','hanum','IIT-k','CSE','2006-05-14','ML');
insert into Faculty_details values ('104','danush','IIT-k','CSE','2006-05-14','Big Data');

insert into Faculty_details values ('105','Jimmy','IIT Patna','CSE','1977-05-14','VL');
insert into Faculty_details values ('109','hassan','IIT-k','CSE','1997-05-09','ML');
insert into Faculty_details values ('104','danush','IIT Patna','CSE','2006-05-14','AI');


insert into Supervisor values ('101','1501CS10');
insert into Supervisor values ('102','1501CS20');
insert into Supervisor values ('104','1501CS25');
insert into Supervisor values ('101','1501CS60');
insert into Supervisor values ('102','1501CS30');
insert into Supervisor values ('104','1501CS10');
insert into Supervisor values ('101','1501CS20');
insert into Supervisor values ('102','1501CS25');
insert into Supervisor values ('104','1501CS20');


alter table Paper_details add primary key (paper_id);
alter table Author_details add primary key (author_id);
alter table Student_details add primary key (student_id);
alter table Faculty_details add primary key (faculty_id,research_area);
alter table Paper_author add primary key (paper_id,author_id);
alter table Supervisor add primary key (faculty_id,student_id);

alter table Paper_author add CONSTRAINT FK_paper foreign key (paper_id) references Paper_details(paper_id);
alter table Paper_author add CONSTRAINT FK_author foreign key (author_id) references Author_details(author_id);
alter table Supervisor add foreign key (faculty_id) references Faculty_details(faculty_id);
alter table Supervisor add foreign key (student_id) references Student_details(student_id);

/* SELECT query */

-- 1
select * from Faculty_details fd
  LEFT JOIN Supervisor s ON fd.faculty_id = s.faculty_id
  WHERE s.student_id is NULL;

-- 2
select sd.* from Student_details sd
  INNER JOIN Author_details ad ON sd.student_id = ad.author_id AND ad.author_type = 'student'
  WHERE sd.student_institute = 'IIT Patna';

-- 3
select pd.* from Paper_details pd
  INNER JOIN Paper_author pa  ON pd.paper_id = pa.paper_id
  INNER JOIN Author_details ad ON pa.author_id = ad.author_id
  WHERE ad.author_type = 'student' AND ad.author_id ='1501CS60';

-- 4
select sd.* from Student_details sd
  inner join Paper_author pa on sd.student_id = pa.author_id
  inner join Paper_details pd on pd.paper_id = pa.paper_id
  inner join Supervisor s on s.student_id  =  pa.author_id
  where s.faculty_id = '102' AND pd.paper_type = 'conference';

-- 5
SELECT pd.paper_title FROM Paper_details pd
  INNER JOIN Paper_author pa  ON pd.paper_id = pa.paper_id
  GROUP BY pa.paper_id HAVING count(pa.paper_id) = '1';

-- 6
select fd.faculty_id, count(pa.author_id) from Faculty_details fd inner
  join Paper_author pa on fd.faculty_id = pa.author_id
  group by fd.faculty_id;

-- 7
select author_id from Paper_author
  group by author_id
  order by count(*) desc limit 1;

-- 8
select sd.* from Student_details sd left
  join Paper_author pa on pa.author_id=sd.student_id
  where pa.author_id is NULL;

-- 9
select sd.* from Student_details sd
  inner join Supervisor s on s.student_id = sd.student_id
  group by sd.student_id having count(sd.student_id) = 2;

-- 10
select count(pa.author_id) from Paper_author pa
  inner join Faculty_details fd on pa.author_id = fd.faculty_id
  where fd.research_area = 'Big date';

-- 11
select fd.research_area from Faculty_details fd
  inner join Paper_author pa on pa.author_id = fd.faculty_id
  group by fd.research_area order by count(fd.research_area) DESC;

-- 12
select fd.* from Supervisor s
  inner join Faculty_details fd on fd.faculty_id = s.faculty_id
  group by s.faculty_id order by count(*) DESC LIMIT 1;
