--Q: How to extract first name from Contact Name?

-- A: Well, here is your problem...
--CustomerName = Alejandra Camino -> Camino
--Google search "How to extract first name from combined name tsql stack overflow"
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

WITH s1 --Use a common Table Expression and compare last_name to first_name
     AS (SELECT 
		 SUBSTRING(ContactName, +1, CHARINDEX(' ', ContactName) +1) AS Firstname,     
       SUBSTRING(ContactName,
                 CHARINDEX(' ', ContactName) +1,
                 LEN(ContactName) - CHARINDEX(' ', ContactName)) AS Lastname
			   , dbo.udf_parse_last_name1(ContactName) AS first_name
			   FROM dbo.t_w3_schools_customers)
			SELECT s1.*
			FROM s1
			WHERE s1.first_name <> s1.first_name; --Expected result in 0 rows

		