-- /* SELECT query */

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
  INNER JOIN Paper_author pa  ON sd.student_id = pa.author_id AND pa.author_id = '102'
  INNER JOIN Paper_details pd ON pd.paper_id = pa.paper_id
  WHERE pd.paper_type = 'conference';

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
