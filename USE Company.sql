-- CREATE DATABASE Company;
-- USE Company 


--q1,q2
-- CREATE TABLE family_tree
-- (
--     id INT PRIMARY KEY,
--     first_name VARCHAR(50) NOT NULL,
--     last_name VARCHAR(50) NOT NULL,
--     parent_id INT,
--     national_id BIGINT ,
--     check (national_id like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
--     c_role VARCHAR(50),
--     FOREIGN KEY(parent_id) REFERENCES family_tree(id)
-- );
-- DROP TABLE family_tree
--q7
-- insert into family_tree values
-- (1,   'Ali',	'Jafari',  NULL,1234567890,'CEO'),
-- (2,   'Zahra',	'Kazemi',  1,1236547524,'HRM'),
-- (3,   'Saleh',	'Akbari',  1, 1236523654,'FM'),
-- (4,   'Reza',	'Bageri',  1,1246578125 ,'TM'),
-- (5,   'Sina',	'Ahmadi',  3,4512547856,'E'),
-- (6,   'Melika',	'Zare',    4,2365478941,'E'),
-- (7,   'Maryam',	'Askari',  4,1230212015 ,'E'),
-- (8,   'Mehrdad','Moradi',  4,1203201458,'E')


--q3
-- GO
-- CREATE FUNCTION sub_tree (@id INT)
-- RETURNS TABLE 
-- AS 
-- RETURN
--     with cte as
--     (  
--     select f.*
--     from family_tree as f
--     where f.id = @Id
--     union all
--     select f.*
--     from family_tree f
--         inner join cte C
--         on f.parent_id = C.id
--     )
--     SELECT * FROM cte

-- GO
-- select * from sub_tree(3);

--q4
-- GO
-- CREATE PROCEDURE question4 @id1 int,@id2 int
-- AS
--     DECLARE @father_1 INT = ( SELECT f.parent_id FROM family_tree f WHERE f.id = @id1)
--     DECLARE @father_2 INT =(SELECT f.parent_id FROM family_tree f WHERE f.id = @id2)
--     DECLARE @role_1 VARCHAR(50) = ( SELECT f.c_role FROM family_tree f WHERE f.id = @id1)
--     DECLARE @role_2 VARCHAR(50) =(SELECT f.c_role FROM family_tree f WHERE f.id = @id2)
--     DECLARE @temp TABLE(id int ,role1 varchar(50) ,father1 int);
--     INSERT INTO @temp VALUES (1,@role_1,@father_1);
--     DECLARE @role_1_new varchar(50) = (SELECT t.role1 FROM @temp t WHERE t.id = 1)
--     DECLARE @father_1_new INT = (SELECT t.father1 FROM @temp t WHERE t.id = 1)
--     UPDATE family_tree 
--     SET c_role=@role_2 , parent_id = @father_2
--     WHERE id = @id1
--     UPDATE family_tree 
--     SET c_role=@role_1_new , parent_id = @father_1_new
--     WHERE id = @id2
--     UPDATE family_tree
--     SET parent_id = @id1 
--     WHERE parent_id = @id2
--     UPDATE family_tree
--     SET parent_id = @id2
--     WHERE parent_id = @id1
--     SELECT * FROM family_tree

-- GO
-- EXEC question4 @id1 = 3 , @id2=4


--q5 
-- GO 
-- CREATE PROCEDURE question5_4 @id1 int,@id2 int
-- AS
--     BEGIN
--         DECLARE @count INT = (SELECT COUNT(id) FROM sub_tree(@id1));
--         -- PRINT(@count)
--         IF (@count > 1)
--             BEGIN
--                 UPDATE family_tree
--                 SET parent_id = @id2
--                 WHERE parent_id = @id1
--                 DELETE FROM family_tree WHERE id = @id1
--             END
--         ELSE IF (@count <= 1)
--             BEGIN
--             DELETE FROM family_tree WHERE id = @id1
--             END
--     END
-- GO
-- EXEC question5_4 @id1 = 8 , @id2=6
-- SELECT * FROM family_tree;

--q6
-- GO
-- CREATE PROCEDURE question6 @id INT,@parent_id INT,
--         @first_name VARCHAR(50) ,
--     @last_name VARCHAR(50),
--     @national_id BIGINT,
--     @c_role VARCHAR(50)

--     AS 
--     insert into family_tree values (@id, @first_name,@last_name,@parent_id,@national_id,@c_role)

-- GO 
-- EXEC question6 @id= 9,@parent_id= 2,
--         @first_name= 'reza' ,
--     @last_name= 'noori',
--     @national_id =1234567890,
--     @c_role ='Senior'
-- SELECT * FROM family_tree






















