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

INSERT INTO paper_author VALUES ('1' , '1');
INSERT INTO paper_author VALUES ('2' , '2');
INSERT INTO paper_author VALUES ('3' , '3');
INSERT INTO paper_author VALUES ('4' , '4');
INSERT INTO paper_author VALUES ('5' , '5');
INSERT INTO paper_author VALUES ('6' , '6');
INSERT INTO paper_author VALUES ('7' , '7');
INSERT INTO paper_author VALUES ('8' , '8');
INSERT INTO paper_author VALUES ('9' , '9');
INSERT INTO paper_author VALUES ('10', '0');

/* Insert into author_details */

insert into author_details values ('1' , 'student');
insert into author_details values ('2' , 'faculty');
insert into author_details values ('3' , 'student');
insert into author_details values ('4' , 'faculty');
insert into author_details values ('5' , 'faculty');
insert into author_details values ('6' , 'faculty');
insert into author_details values ('7' , 'student');
insert into author_details values ('8' , 'faculty');
insert into author_details values ('9' , 'student');
insert into author_details values ('0' , 'faculty');

/* Insert into student_details */

insert into student_details values ('1','ramesh Kumar','aaa','cse','1980-09-11','AI');
insert into student_details values ('2','suresh Kumar','bbb', 'ece','1980-09-16','AI');
insert into student_details values ('3','aman','aaa','cse','1980-04-11','Cybersecurity');
insert into student_details values ('4','kajal singh','aaa','cse','1980-02-11','AI');
insert into student_details values ('5','pritesh Kumar','aaa','cse','1980-06-11','bigdata');
insert into student_details values ('6','ramesh Kumar','aaa','cse','1980-02-11','bigdata');
insert into student_details values ('7','amann Kumar','aaa','cse','1980-07-11','AI');
insert into student_details values ('8','raja','aaa','cse','1980-05-11','bigdata');
insert into student_details values ('9','ramash','aaa','cse','1980-02-11','bigdata');
insert into student_details values ('0','sontosh Kumar','aaa','cse','1980-05-11','Cybersecurity');

/* Insert into faculty_details */

insert into faculty_details values ('1', 'Dr. ramesh kumar','abc','cse','1980-09-11','Cybersecurity');
insert into faculty_details values ('2','Dr. aksh','abc','cse','1980-09-11','AI');
insert into faculty_details values ('3', 'Dr. aaman','abc','cse','1680-09-11','bigdata');
insert into faculty_details values ('4', 'Dr. maahesh kumar','abc','cse','1920-02-11','bigdata');
insert into faculty_details values ('5', 'Dr. raaja kumar','abc','cse','1980-09-11','AI');
insert into faculty_details values ('6', 'Dr. santosh singh','abc','cse','1980-09-11','bigdata');
insert into faculty_details values ('7', 'Dr. ramaesh kumar','abc','cse','1980-05-11','AI');
insert into faculty_details values ('8', 'Dr. abcadh','abc','cse','1980-09-11','bigdata');
insert into faculty_details values ('9', 'Dr. ggh singh','abc','cse','1950-09-11','AI');
insert into faculty_details values ('0', 'Dr. addd singh','abc','cse','1980-09-11','AI');

/* Insert into supervisor */

insert into supervisor values ('1','1');
insert into supervisor values ('2','2');
insert into supervisor values ('3','3');
insert into supervisor values ('4','4');
insert into supervisor values ('5','5');
insert into supervisor values ('6','6');
insert into supervisor values ('7','7');
insert into supervisor values ('8','8');
insert into supervisor values ('9','9');
insert into supervisor values ('0','0');

/* PRIMARY Key */

ALTER TABLE author_details ADD PRIMARY KEY (author_id);
ALTER TABLE student_details ADD PRIMARY KEY (student_id);
ALTER TABLE faculty_details ADD PRIMARY KEY (faculty_id, research_area);
ALTER TABLE paper_author ADD PRIMARY KEY (paper_id,author_id);
ALTER TABLE supervisor ADD PRIMARY KEY (faculty_id,student_id);

/* FOREIGN KEY */

ALTER TABLE paper_author ADD FOREIGN KEY (paper_id) REFERENCES paper_details(paper_id);
ALTER TABLE paper_author ADD FOREIGN KEY (author_id) REFERENCES author_details(author_id);
ALTER TABLE supervisor ADD FOREIGN KEY (faculty_id) REFERENCES faculty_details(faculty_id);
ALTER TABLE supervisor ADD FOREIGN KEY (student_id) REFERENCES student_details(student_id);

/* 3 */
select * from paper_details where paper_type = 'conference';

/* 4 */
select * from student_details where research_area = 'BIG DATA';

/* 5 */
select count(paper_type) from paper_details where paper_type = 'journal';

/* 6 */
select * from student_details where DOB > '1990-04-01' and DOB < '2000-03-31';

/* 7 */
select * from faculty_details where research_area = 'AI';

/* 8 */
select * from faculty_details where research_area like '%AI%' and research_area like '%BIG DATA%';

/* 9 */
select * from student_details where student_name like '%Kumar';

/* 10 */
select faculty_id,count(*) from supervisor group by faculty_id;

/* 11 */
select paper_id,count(*) as cn from paper_author group by paper_id having cn>1;
