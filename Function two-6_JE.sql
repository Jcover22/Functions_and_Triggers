--Q: How to extract last name from Contact Name?

--A: Well, here is your problem...
--CustomerName = Alejandra Camino -> Camino
-- Google search "How to extract first name from combined tsql stack overflow"
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-lastname


 SELECT SUBSTRING(ContactName, +1, CHARINDEX(' ', ContactName) +1) AS Firstname,     
       SUBSTRING(ContactName,
                 CHARINDEX(' ', ContactName) +1,
                 LEN(ContactName) - CHARINDEX(' ', ContactName)) AS Lastname
				 , dbo.udf_parse_last_name1(contactName) AS first_name
              FROM t_w3_schools_customers;
			 