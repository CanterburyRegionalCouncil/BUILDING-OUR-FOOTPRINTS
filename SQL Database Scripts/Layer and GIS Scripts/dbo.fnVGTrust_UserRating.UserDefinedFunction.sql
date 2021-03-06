USE [GISPUBLIC]
GO
/****** Object:  UserDefinedFunction [dbo].[fnVGTrust_UserRating]    Script Date: 10/04/2015 4:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Elley
-- Create date: 30/05/2014
-- Last update:	30/05/2014	- Ryan Elley	- Initial Development from Jeremy Severinson's Python script
-- Description:	returns a total weighting for user trust based on activity space and expertise. The below function has been written accounting for two activity spaces - home and work, or in this case, school. Expertise is reflected also for school students, based on their year at school (experience), and their best subject. This could be altered based on the individual case study. In total activity space accounts for 50% of the user trust rating, with expertise accounting for the other 50%.
-- =============================================
CREATE FUNCTION [dbo].[fnVGTrust_UserRating] 
(
	@schooldist float,
	@homedist float,
	@year float,
	@subject float
)
RETURNS float
AS
BEGIN
	DECLARE @Result float

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = ((@schooldist * 0.25) + (@homedist * 0.25) + (@year * 0.15) + (@subject * 0.35))

	-- Return the result of the function
	RETURN @Result

END



GO
