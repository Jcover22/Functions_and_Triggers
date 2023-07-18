CREATE FUNCTION [dbo].[udf_parse_last_name1]
(@v_combined_name AS VARCHAR(500)
)
RETURNS VARCHAR(100)

/************************************************************************************************************************
Name:  dbo.udf_parse_last_name
PURPOSE: Parse First Name from combined name

MODIFICATION LOG:
Ver      Date         Author     Description
----    ----------   ---------   ---------------------------------------------------------------------
1.0     07/07/2023    JESCOBAR   1. Built this script for EC IT440


RUNTIME:
1s

NOTES:
Adapted from the following...
https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

****************************************************************************************************************************/


       BEGIN

	       DECLARE @v_last_name1 AS VARCHAR(100);

		   SET @v_last_name1 = LEFT(@v_combined_name, CHARINDEX(' ', @v_combined_name + ' ') -1);
		   
		   RETURN @v_last_name1;

		   END;

		   Go
