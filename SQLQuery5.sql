USE BankRefah

--QUESTION 3.1 
--SELECT * 
--FROM final F
--WHERE F.Cars_Count < (SELECT AVG(CAST( FF.Cars_Count AS FLOAT))
--FROM final FF);

--QUESTION 3.2
--SELECT F.Id , F.Gender
--FROM final F
--WHERE F.Sood97 >= F.Sood96 AND F.Sood96 >= F.Sood95;

--QUESTION 3.3
--SELECT F.SenfName
--FROM final F
--WHERE F.SenfName LIKE N'%ن%';

--QUESTION 3.4
--SELECT F.Daramad_Total_Rials , F.Id
--FROM final F 
--WHERE ((2022 - YEAR(F.BirthDate)) = 50)  AND F.ProvinceName = N'تهران'
--ORDER BY F.Daramad_Total_Rials ;

--QUESTION 3.5
--SELECT F.Id
--FROM final F
--WHERE F.Gender = N'مرد' AND F.Bardasht97 > 30000000;