--question 1 , 1

--SELECT Phone
--  FROM Suppliers s
--  WHERE s.ContactName LIKE 's%';


--question 1,2

--SELECT e.FirstName,e.LastName
--  FROM Orders o , Employees e
--  WHERE o.EmployeeID = e.EmployeeID   
--  GROUP BY e.FirstName,e.FirstName,e.LastName
--  HAVING COUNT(*) > 3;

--question 1,3

--SELECT e.LastName , DATEDIFF(YEAR,e.HireDate,GETDATE())
--FROM Employees e 
--WHERE e.Title != 'Sales Representative';

--question 1,4
--SELECT C.Address , C.ContactName
--FROM Customers C 
--WHERE( 
--SELECT SUM (OD.UnitPrice * OD.Quantity) 
--FROM Orders O , [Order DetailS] OD
--WHERE C.CustomerID = O.CustomerID AND OD.OrderID = O.OrderID) > 6000;

--question 1,5

--SELECT SUM(OD.Quantity)
--FROM Products P , [Order Details] OD , Orders O
--WHERE OD.ProductID  = P.ProductID AND OD.OrderID = O.OrderID 
--GROUP BY O.ShipCountry 
--HAVING O.ShipCountry = 'France';

