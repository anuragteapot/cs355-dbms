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