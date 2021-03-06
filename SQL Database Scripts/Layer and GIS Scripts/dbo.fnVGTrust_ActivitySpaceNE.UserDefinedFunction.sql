USE [GISPUBLIC]
GO
/****** Object:  UserDefinedFunction [dbo].[fnVGTrust_ActivitySpaceNE]    Script Date: 10/04/2015 4:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ryan Elley
-- Create date: 30/05/2014
-- Last update:	13/06/2014	- Ryan Elley/Jereym Severin	- Updated for scale chnages
--				30/05/2014	- Ryan Elley	- Initial Development from Jeremy Severinson's Python script
-- Description:	Returns a trust rating between 1 and 10 based on the features euclidean distance from the contributors activity space. Can be used for more than one activity space. Based in metres on Northing and Easting coordinates. Classification is suitable for city wide scale, can be altered depending on each case study.
-- =============================================
CREATE FUNCTION [dbo].[fnVGTrust_ActivitySpaceNE] 
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
	DECLARE @Result int, @distance float;

	SET @distance = SQRT( SQUARE(@creatorX - @featureX) + SQUARE(@creatorY - @featureY)); 

	SELECT @Result = CASE
		WHEN @distance <=1000 THEN 10
		WHEN @distance > 1000 AND @distance <= 5000 THEN 9
		WHEN @distance > 5000 AND @distance <= 7500 THEN 8
		WHEN @distance > 7500 AND @distance <= 12500 THEN 7
		WHEN @distance > 12500 AND @distance <= 15000 THEN 6
		WHEN @distance > 15000 AND @distance <= 20000 THEN 5
		WHEN @distance > 20000 AND @distance <= 25000 THEN 4
		WHEN @distance > 25000 AND @distance <= 30000 THEN 3
		WHEN @distance > 30000 AND @distance <= 40000 THEN 2
		ELSE 1
	END 	

	-- Return the result of the function
	RETURN @Result

END




GO
