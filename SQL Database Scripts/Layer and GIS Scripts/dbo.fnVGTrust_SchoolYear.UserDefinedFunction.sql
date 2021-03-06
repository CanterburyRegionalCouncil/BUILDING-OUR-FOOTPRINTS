USE [GISPUBLIC]
GO
/****** Object:  UserDefinedFunction [dbo].[fnVGTrust_SchoolYear]    Script Date: 10/04/2015 4:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Elley
-- Create date: 30/05/2014
-- Last update:	30/05/2014	- Ryan Elley	- Initial Development from Jeremy Severinson's Python script
-- Description:	Returns a rating between 1 and 10 based on experience - ie school year. Written for application in a school context, this could also be classified by age bracket for wider public use. The trust rating is a linear function of school year. Forms an aspect of expertise rating of the contributor.
-- =============================================
CREATE FUNCTION [dbo].[fnVGTrust_SchoolYear] 
(
	@year varchar(7)
)
RETURNS int
AS
BEGIN
	DECLARE @Result int;

	-- Set the year text to upper case for comparison purposes.
	SET @year = UPPER(@year);

	SELECT 
		@Result = CASE
			WHEN @year = 'YEAR 13' THEN 10
			WHEN @year = 'STAFF' THEN 10
			WHEN @year = 'YEAR 12' THEN 8
			WHEN @year = 'YEAR 11' THEN 6
			WHEN @year = 'YEAR 10' THEN 4
			WHEN @year = 'YEAR 9' THEN 3
			ELSE 2
		END

	-- Return the result of the function
	RETURN @Result

END



GO
