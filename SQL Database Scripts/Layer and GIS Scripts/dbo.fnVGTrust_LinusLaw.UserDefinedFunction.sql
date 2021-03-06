USE [GISPUBLIC]
GO
/****** Object:  UserDefinedFunction [dbo].[fnVGTrust_LinusLaw]    Script Date: 10/04/2015 4:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Elley
-- Create date: 30/05/2014
-- Last update:	30/05/2014	- Ryan Elley	- Initial Development from Jeremy Severinson's Python script
-- Description:	Returns a trust rating between 1 and 10 based on Linus' Law. This reflects that the greatest improvement to a VG feature is made in the first six contributions, with minor changes being made up to thirteen contributions. No noticiable change is made by contributions in excess of thirteen edits.
-- =============================================
CREATE FUNCTION [dbo].[fnVGTrust_LinusLaw] 
(
	@noedits int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result float

	SELECT @Result = CASE
		WHEN @noedits >= 13 THEN 10
		WHEN @noedits = 12 THEN 9
		WHEN @noedits = 11 THEN 9.5
		WHEN @noedits = 10 THEN 8
		WHEN @noedits = 9 THEN 7.6
		WHEN @noedits = 8 THEN 7.4
		WHEN @noedits = 7 THEN 7.2
		WHEN @noedits = 6 THEN 7
		WHEN @noedits = 5 THEN 6
		WHEN @noedits = 4 THEN 5
		WHEN @noedits = 3 THEN 4
		WHEN @noedits = 2 THEN 3
		WHEN @noedits = 1 THEN 2
		ELSE 1
	END

	-- Return the result of the function
	RETURN @Result

END



GO
