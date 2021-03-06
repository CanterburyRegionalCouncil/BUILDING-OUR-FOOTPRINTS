USE [GISPUBLIC]
GO
/****** Object:  UserDefinedFunction [dbo].[fnVGTrust_Expertise]    Script Date: 10/04/2015 4:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Elley
-- Create date: 30/05/2014
-- Last update:	30/05/2014	- Ryan Elley	- Initial Development from Jeremy Severinson's Python script
-- Description:	Classifies expertise based on school subject, and returns a higher trust rating if subject is one associated with greater spatial ability. Expertise in decending order from aList to dList. Returns a trust rating between 1 and 10.
-- =============================================
CREATE FUNCTION [dbo].[fnVGTrust_Expertise] 
(
	@subject varchar(50)
)
RETURNS float
AS
BEGIN
	DECLARE @Result float

	-- Set the subject text to upper case for comparison purposes.
	SET @subject = UPPER(@subject);

	SELECT @Result = CASE
		WHEN @subject IN ('MATHEMATICS', 'SCIENCE', 'GRAPHICS', 'PHYSICS', 'CALCULUS', 'STATISTICS') THEN 10
		WHEN @subject IN ('SOCIALSTUDIES', 'ART', 'CHEMISTRY', 'BIOLOGY', 'GEOGRAPHY') THEN 7.5
		WHEN @subject IN ('ENGLISH', 'LANGUAGES', 'MATERIALS TECHNOLOGY', 'HISTORY', 'ECONOMICS', 'ACCOUNTING', 'BUSINESS STUDIES', 'CLASSICS') THEN 5
		ELSE 2.5
	END

	-- Return the result of the function
	RETURN @Result

END



GO
