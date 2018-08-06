/*
 Creation of database.
*/

DROP DATABASE DBLAB ;

CREATE DATABASE DBLAB;

/* Select database */

USE DBLAB;

/* Create Table */

create table paper_details(
	paper_id varchar(200),
	paper_title varchar(200),
	paper_type varchar(200),
	publication DATE
);

create table paper_author(
	paper_id varchar(200),
	author_id varchar(200)
);

create table faculty_details(
	faculty_id varchar(200),
	faculty_name varchar(200),
	faculty_institute varchar(200),
	department varchar(200),
	dob DATE,
	research_area varchar(200)
);

create table student_details(
	student_id varchar(200),
	student_name varchar(200),
	student_institute varchar(200),
	department varchar(200),
	dob DATE,
	research_area varchar(200)
);

create table author_details(
	author_id varchar(200),
	author_type varchar(200)
);

create table supervisor(
	faculty_id varchar(200),
	student_id varchar(200)
);


/* Insert into paper_details*/

INSERT INTO paper_details VALUES ('1' , 'physics' , 'conference' , '1980-08-10');
INSERT INTO paper_details VALUES ('2' , 'ext3' , 'journal' , '1980-06-16');
INSERT INTO paper_details VALUES ('3' , 'ext2' , 'conference' , '1980-09-11');
INSERT INTO paper_details VALUES ('4' , 'ext2' , 'journal' , '1980-08-16');
INSERT INTO paper_details VALUES ('5' , 'physics' , 'conference' , '1980-04-16');
INSERT INTO paper_details VALUES ('6' , 'ext8' , 'journal' ,  '1880-08-16');
INSERT INTO paper_details VALUES ('7' , 'physics' , 'conference' , '1980-08-13');
INSERT INTO paper_details VALUES ('8' , 'ext9' , 'journal' ,  '2001-07-16');
INSERT INTO paper_details VALUES ('9' , 'ext3' , 'conference' , '2000-08-19');
INSERT INTO paper_details VALUES ('0' , 'physics' , 'journal', '1990-02-16');

/* Insert into paper_author */

INSERT INTO paper_author VALUES ('1' , '1501CS10');
INSERT INTO paper_author VALUES ('2' , '1501CS20');
INSERT INTO paper_author VALUES ('3' , '101');
INSERT INTO paper_author VALUES ('4' , '1501CS10');
INSERT INTO paper_author VALUES ('5' , '1501CS40');
INSERT INTO paper_author VALUES ('6' , '102');
INSERT INTO paper_author VALUES ('7' , '106');
INSERT INTO paper_author VALUES ('8' , '1501CS30');
INSERT INTO paper_author VALUES ('9' , '104');
INSERT INTO paper_author VALUES ('10', '108');

/* Insert into author_details */

insert into author_details values ('102' , 'student');
insert into author_details values ('1501CS30' , 'faculty');
insert into author_details values ('1501CS30' , 'student');
insert into author_details values ('104' , 'faculty');
insert into author_details values ('1501CS10' , 'faculty');
insert into author_details values ('1501CS20' , 'faculty');
insert into author_details values ('104' , 'student');
insert into author_details values ('102' , 'faculty');
insert into author_details values ('1501CS40' , 'student');
insert into author_details values ('1501CS10' , 'faculty');

/* Insert into student_details */

insert into student_details values ('1501CS60','ramesh Kumar','aaa','cse','1980-09-11','AI');
insert into student_details values ('1501CS20','suresh Kumar','bbb', 'ece','1980-09-16','AI');
insert into student_details values ('1501CS60','aman','aaa','cse','1980-04-11','Cybersecurity');
insert into student_details values ('1501CS30','kajal singh','aaa','cse','1980-02-11','AI');
insert into student_details values ('1501CS50','pritesh Kumar','aaa','cse','1980-06-11','bigdata');
insert into student_details values ('1501CS60','ramesh Kumar','aaa','cse','1980-02-11','bigdata');
insert into student_details values ('1501CS70','amann Kumar','aaa','cse','1980-07-11','AI');
insert into student_details values ('1501CS10','raja','aaa','cse','1980-05-11','bigdata');
insert into student_details values ('1501CS20','ramash','aaa','cse','1980-02-11','bigdata');
insert into student_details values ('1501CS60','sontosh Kumar','aaa','cse','1980-05-11','Cybersecurity');

/* Insert into faculty_details */

insert into faculty_details values ('102', 'Dr. ramesh kumar','abc','cse','1980-09-11','Cybersecurity');
insert into faculty_details values ('101','Dr. aksh','abc','cse','1980-09-11','AI');
insert into faculty_details values ('102', 'Dr. aaman','abc','cse','1680-09-11','bigdata');
insert into faculty_details values ('100', 'Dr. maahesh kumar','abc','cse','1920-02-11','bigdata');
insert into faculty_details values ('106', 'Dr. raaja kumar','abc','cse','1980-09-11','AI');
insert into faculty_details values ('107', 'Dr. santosh singh','abc','cse','1980-09-11','bigdata');
insert into faculty_details values ('108', 'Dr. ramaesh kumar','abc','cse','1980-05-11','AI');
insert into faculty_details values ('102', 'Dr. abcadh','abc','cse','1980-09-11','bigdata');
insert into faculty_details values ('105', 'Dr. ggh singh','abc','cse','1950-09-11','AI');
insert into faculty_details values ('102', 'Dr. addd singh','abc','cse','1980-09-11','AI');

/* Insert into supervisor */

insert into supervisor values ('102','1501CS60');
insert into supervisor values ('102','1501CS30');
insert into supervisor values ('106','1501CS60');
insert into supervisor values ('102','1501CS60');
insert into supervisor values ('101','1501CS40');
insert into supervisor values ('105','1501CS70');
insert into supervisor values ('102','1501CS60');
insert into supervisor values ('106','1501CS50');
insert into supervisor values ('100','1501CS10');
insert into supervisor values ('108','1501CS10');

/* PRIMARY Key */

ALTER TABLE author_details ADD PRIMARY KEY (author_id);
ALTER TABLE student_details ADD PRIMARY KEY (student_id);
ALTER TABLE faculty_details ADD PRIMARY KEY (faculty_id, research_area);
ALTER TABLE paper_author ADD PRIMARY KEY (paper_id,author_id);
ALTER TABLE supervisor ADD PRIMARY KEY (faculty_id,student_id);

/* FOREIGN KEY */
--
-- ALTER TABLE paper_author ADD FOREIGN KEY (paper_id) REFERENCES paper_details(paper_id);
-- ALTER TABLE paper_author ADD FOREIGN KEY (author_id) REFERENCES author_details(author_id);
-- ALTER TABLE supervisor ADD FOREIGN KEY (faculty_id) REFERENCES faculty_details(faculty_id);
-- ALTER TABLE supervisor ADD FOREIGN KEY (student_id) REFERENCES student_details(student_id);

--select * from faculty_details where research_area like '%AI%' and research_area like '%BIG DATA%';

--select * from faculty_details as A where A.faculty_id not in (select faculty_id from supervisor );
