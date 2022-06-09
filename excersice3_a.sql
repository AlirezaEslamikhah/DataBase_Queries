-- question 1

SELECT InstructorID
-- or 
-- SELECT InstructorID 
FROM INstructors i 
WHERE i.age > 55 ;

--question 2
CREATE TABLE Class
(
    ClassID INT NOT NULL,
    PRIMARY KEY(ClassID),
    ClassName VARCHAR(250),
    InstructorName VARCHAR(250),
    InstructorID INT NOT NULL,
    FOREIGN KEY(InstructorID) REFERENCES Instructor(InstructorID),
    ClassTime DATETIME,
    ClassDays VARCHAR(250),
    FirstSession DATE,
    ExamDay DATE
);

CREATE TABLE Instructor
(
    InstructorID INT NOT NULL,
    PRIMARY KEY(InstructorID),
    InstructorName VARCHAR(250),
    InstructorFullName VARCHAR(250),
    NationalCode long NOT NULL,
    PhoneNumber INT,
    Age INT,
    Income INT,
    YearsActive INT
);

CREATE TABLE Student
(
    StudentName VARCHAR(250),
    StudentFullName VARCHAR(250),
    StudentFatherName VARCHAR(250),
    StudentNationalCode INT,
    StudentCode INT,
    PRIMARY KEY(StudentCode),
    PhoneNumber INT , 
    Age INT,
    Arrival date,
    NumberOfVahed INT,
    LastSemesterScore FLOAT,
    TotalScore FLOAT
);

--question 3

--الف 
SELECT ItemName , ItemPrice 
FROM Item ; 
--ب 
SELECT orderNo, orderDate
FROM Orders o
WHERE o.tax > 10 ;
--پ
SELECT o.ordernum , item.*
FROM item AS i , orders AS o , contain AS c
WHERE c.orderno = o.ordernum AND c.ino = i.ino AND c.quantity > 0;
--ت
SELECT c.CustomerID ,p.PhoneNumber
FROM  Customer c, Phone p, Addresses a 
WHERE c.PhoneNumber = p.id AND c.Addr = a.id AND a.city = "Tehran";
--ث 
SELECT c.*
FROM customer c
WHERE c.custId NOT IN (
    SELECT custId
    FROM(customers))
--ج
SELECT Suppliers.Sno 
FROM supplier s , item i 
WHERE NOT EXISTS (
    SELECT sno 
    FROM supplies ss
    WHERE s.sno = ss.sno 
);
--چ
SELECT customer.* 
FROM orders o1 , orders o2 , orders o3 , customer c1 , customer c2 , customer c3 , buys b1 , buys b2 , buys b3 , 
address_table a1 , address_table a2, address_table a3
WHERE ((b1.orderid = o1.orderid AND b1.customerid = c1.customerid AND o1.addressid = a1.addressid AND a1.city = "TEHRAN" )
AND (b2.orderid = o2.orderid AND b2.customerid = c2.customerid AND o2.addressid = a2.addressid AND a2.city = "YAZD" )
AND (b3.orderid = o3.orderid AND b3.customerid = c3.customerid AND o3.addressid = a3.addressid AND a3.city != "ISFAHAN" ));
--ح 
SELECT Items.INO 
FROM customer c ,buys b, 
orders o , addresses a , contains_table cc , item i , supplier s , supllies ss 
WHERE c.cid = b.custid AND b.ordernum = o.ordernum AND o.addressid = a.adressid AND cc.ordernum = o.ordernum AND 
cc.ino = i.ino AND ss.sno = s.sno AND ss.SNo = i.INo AND s.addid = a.addid AND s.city = a.city;
--خ 
SELECT c.*
FROM Customer c
WHERE
    NOT EXISTS
        (SELECT I.INo
        FROM Buys B JOIN Contains_Table CO
        ON B.custId = C.custId AND CO.orderNo = B.orderNo
        JOIN Item I ON CO.INo = I.INo
        GROUP BY I.INo
        HAVING COUNT(*) >= 2);

--question 4
--الف
SELECT student.name 
FROM student AS s JOIN friends AS f ON s.student_id = f.student_id 
GROUP BY (s.name)
ORDER BY COUNT(*) DEsC;
--ب 
SELECT student.* 
FROM friends f , student s , db_grades db
WHERE (f.student_id = s.student_id AND db.student_id = s.student_id AND s.grade < 10) AND (f.friend_id = db.student_id AND f.grade > 10);
--پ
SELECT student.*
FROM  student s1 
WHERE 10> ALL(
    SELECT grade
    FROM friends f , student s2,db_grades db 
    WHERE f.student_id = s1.student_id AND f.friend_id = s2.student_id AND db.student_id = s2.student_id );

--ت
SELECT student.*
FROM db_grades AS d1 JOIN student AS s1 ON s1.student_id = d1.student_id,student s2 , friends f
WHERE d1.grade > ANY (
    SELECT d2.grade
    FROM db_grades d2 
    WHERE f.friend_id = s2.student_id)
    AND 
    d1.grade  < ANY (
    SELECT d3.grade
    FROM db_grades d3 
    WHERE f.friend_id = s2.student_id);