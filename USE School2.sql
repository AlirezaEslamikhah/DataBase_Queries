USE School

--SELECT * FROM Class

--q1 1
-- GO
-- CREATE PROCEDURE question1_2
-- AS 
-- SELECT COUNT(c.ClassID) AS tedad
-- FROM Class c
-- GO
-- EXEC question1_2;


--q1 2 
-- GO
-- CREATE PROCEDURE question1__2
-- AS
-- SELECT c.ClassGrade , COUNT(c.ClassID) AS tedad
-- FROM Class c
-- GROUP BY c.ClassGrade

-- GO
-- EXEC question1__2;

--q1 3 
-- GO
-- CREATE PROCEDURE question1_3
-- AS
-- SELECT COUNT(s.StudentNationalID) AS tedad
-- FROM Student s
-- GO
-- EXEC question1_3;

-- فرض ما برای سوال 2 این بود که جدولی داشته باشیم که کلاس های مختلف را در یک ستون و در ستون دیگر مواردی همچون میانگین و واریانس و .. را نشان دهد
--به روش های دیگر هم میتوانستیم این سوال را بزنیم ولی فرض بنده این بود
--q2 
-- GO 
-- CREATE PROCEDURE question2
-- AS
-- SELECT c.ClassSubject , MIN(s.Score) AS MIN , MAX(s.Score) AS MAX,AVG(Score) AS AVG, VAR(Score) AS variance 
-- FROM Class c,HomeWork h , Scores s 
-- WHERE c.ClassID = h.ClassID AND s.HomeWorkID = h.HomeWorkID
-- GROUP BY (c.ClassSubject)
-- GO 
-- EXEC question2;


--q3
-- GO
-- CREATE PROCEDURE question3
-- AS
-- SELECT  ss.StudentName,MIN(s.Score) AS MIN , MAX(s.Score) AS MAX,AVG(Score) AS AVG, VAR(Score) AS variance 
-- FROM Scores s , Student ss, HomeWorkAnswers h
-- WHERE ss.StudentNationalID = h.StudentID AND s.HomeWorkAnswersID = h.HomeWorkAnswersID
-- GROUP BY (ss.StudentName)
-- GO 
-- EXEC question3;

--q4
-- GO
-- CREATE PROCEDURE question4
-- AS
-- SELECT
--      *
-- FROM
--     Schedule s
-- ORDER BY 
--     CASE
--         WHEN s.ScheduleWeekDay = 'SUN' THEN 1
--         WHEN s.ScheduleWeekDay = 'MON' THEN 2
--         WHEN s.ScheduleWeekDay = 'TUE' THEN 3
--         WHEN s.ScheduleWeekDay = 'WED' THEN 4
--         WHEN s.ScheduleWeekDay = 'THU' THEN 5
--         WHEN s.ScheduleWeekDay = 'FRI' THEN 6
--     END ASC,s.StartHour
-- GO
-- EXEC question4;




