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
