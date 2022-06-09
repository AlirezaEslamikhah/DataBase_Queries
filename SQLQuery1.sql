USE pubs
--QUESTION 2.1
--SELECT T.title , T.type
--FROM titles T
--WHERE T.price > 17 AND T.price < 21 
--AND T.title != 'mod_cook';

--QUESTION 2.2
--SELECT A.au_id , A.phone , (A.au_fname+A.au_lname)
--FROM authors A
--WHERE A.city ='Oakland';

--QUESTION 2.3
--SELECT TOP (1) 
--E.emp_id,E.fname,E.hire_date,E.job_id,E.job_lvl,E.lname,E.minit,E.pub_id
--FROM employee E 
--ORDER BY E.hire_date ASC;

--QUESTION 2.4
--SELECT * 
--FROM titles T
--WHERE (2022 - YEAR(T.pubdate) > 30);  

--QUESTION 2.5
--SELECT COUNT(*) AS SOLD_BOOKS ,A.address,(A.au_fname +'  '+ A.au_lname) 
--FROM authors A , titles T , titleauthor TA , sales S
--WHERE A.au_id = TA.au_id AND TA.title_id = T.title_id AND TA.title_id = S.title_id
--GROUP BY A.address ,A.au_id,A.au_fname,A.au_lname;
