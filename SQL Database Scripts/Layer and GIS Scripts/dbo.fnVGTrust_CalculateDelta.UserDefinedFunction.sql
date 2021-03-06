USE [GISPUBLIC]
GO
/****** Object:  UserDefinedFunction [dbo].[fnVGTrust_CalculateDelta]    Script Date: 10/04/2015 4:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Elley
-- Create date: 30/06/2014
-- Description:	Returns a point object representation of the difference between two points 
-- =============================================
CREATE FUNCTION [dbo].[fnVGTrust_CalculateDelta] 
(
	@pt geometry,
	@compareWithPt geometry
)
RETURNS geometry
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result geometry

	-- Check the geometry types
	IF (@pt.STGeometryType() = 'Point' AND @compareWithPt.STGeometryType() = 'Point')
	BEGIN
		SET @Result = geometry::Point(@compareWithPt.STX - @pt.STX,@compareWithPt.STY - @pt.STY,2193);
	END

	-- Return the result of the function
	RETURN @Result

END


GO
