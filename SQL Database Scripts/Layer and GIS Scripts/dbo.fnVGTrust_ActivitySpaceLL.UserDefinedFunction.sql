USE [GISPUBLIC]
GO
/****** Object:  UserDefinedFunction [dbo].[fnVGTrust_ActivitySpaceLL]    Script Date: 10/04/2015 4:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Elley
-- Create date: 30/05/2014
-- Last update:	30/05/2014	- Ryan Elley	- Initial Development from Jeremy Severinson's Python script
-- Description:	Returns a trust rating between 1 and 10 based on the features euclidean distance from the contributors activity space. Can be used for more than one activity space. Based in kilometres on latitude and longitude coordinates. Classification is suitable for city scale, can be altereed depending on each case study.
-- =============================================
CREATE FUNCTION [dbo].[fnVGTrust_ActivitySpaceLL] 
(
	@featureX float,
	@featureY float,
	@creatorX float,
	@creatorY float
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int, @r float = 6373.0, @lat1 float, @lon1 float, @lat2 float, @lon2 float, @dlon float, @dlat float, @a float, @c float, @distance float;

	SET @lat1 = RADIANS(@featureX);
	SET @lon1 = RADIANS(@featureY);
	SET @lat2 = RADIANS(@creatorX);
	SET @lon2 = RADIANS(@creatorY);

	SET @dlon = @lon2-@lon1;
	SET @dlat = @lat2-@lat1;
	SET @a = SQUARE(SIN(@dlat/2)) + COS(@lat1)*COS(@lat2)*SQUARE(SIN(@dlon/2));
	SET @c = ATN2(SQRT(@a),SQRT(1-@a));
	SET @distance = @r * @c;

	SELECT @Result = CASE
		WHEN @distance <=1 THEN 10
		WHEN @distance > 1 AND @distance <= 2 THEN 9
		WHEN @distance > 2 AND @distance <= 5 THEN 8
		WHEN @distance > 5 AND @distance <= 10 THEN 7
		WHEN @distance > 10 AND @distance <= 20 THEN 6
		WHEN @distance > 20 AND @distance <= 30 THEN 5
		WHEN @distance > 30 AND @distance <= 50 THEN 4
		WHEN @distance > 50 AND @distance <= 100 THEN 3
		WHEN @distance > 100 AND @distance <= 200 THEN 2
		ELSE 1
	END 	

	-- Return the result of the function
	RETURN @Result

END



GO
