CREATE TABLE Suppliers
(
    s_ID long NOT NULL,
    PRIMARY KEY(s_ID),
    sname string,
    s_address string
)
CREATE TABLE Parts
(
    p_ID long NOT NULL,
    PRIMARY KEY(p_ID),
    pname string,
    color string
)
CREATE TABLE _catalog
(
    s_ID long,p_ID long,
    FOREIGN KEY(s_ID) REFERENCES Suppliers(s_ID),
    FOREIGN KEY(p_ID) REFERENCES Parts(p_ID),
    PRIMARY KEY(s_ID,p_ID)
)
-- question 1
SELECT DISTINCT P.pname
FROM Parts P, Ccatalog C
WHERE P.pid = C.cid
-- question 2
SELECT DISTINCT C.ssid
FROM Ccatalog C, Parts P
WHERE C.pid = P.pid AND P.color = "Red"

INTERSECT

SELECT DISTINCT C1.ssid
FROM Ccatalog C1, Parts P1
WHERE C1.pid = P1.pid AND P1.color = "Green"

--question 3 

SELECT DISTINCT C.ssid
FROM Catalog C, Parts P
WHERE C.pid = P.pid AND P.color = "Red"

UNION

SELECT DISTINCT C1.ssid
FROM Catalog C1, Parts P1
WHERE C1.pid = P1.pid AND P1.color = "Green"