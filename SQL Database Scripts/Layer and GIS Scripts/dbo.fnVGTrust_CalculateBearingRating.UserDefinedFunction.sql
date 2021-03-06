USE [GISPUBLIC]
GO
/****** Object:  UserDefinedFunction [dbo].[fnVGTrust_CalculateBearingRating]    Script Date: 10/04/2015 4:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Elley
-- Create date: 30/06/2014
-- Description:	Returns an integer 'rating' based on a set of predetermined logic.
-- =============================================
CREATE FUNCTION [dbo].[fnVGTrust_CalculateBearingRating] 
(
	@bearing1 float,
	@bearing2 float
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int, @diff float = @bearing2 - @bearing1;
	IF @diff < 0
	BEGIN
		SET @diff = @diff + 360;
	END

	SELECT @Result = CASE
		WHEN @diff > 85 AND @diff <= 95 THEN 10
		WHEN @diff > 175 AND @diff <= 185 THEN 9
		WHEN @diff > 115 AND @diff <= 125 THEN 8
		WHEN @diff > 125 AND @diff <= 135 THEN 6
		WHEN @diff > 265 AND @diff <= 275 THEN 7
		WHEN @diff > 275 AND @diff <= 359 THEN 5
		WHEN @diff > 185 AND @diff <= 195 THEN 4
		WHEN @diff > 45 AND @diff <= 60 THEN 3
		WHEN @diff <= 45 THEN 1
		ELSE 2
	END

	-- Return the result of the function
	RETURN @Result

END


GO
