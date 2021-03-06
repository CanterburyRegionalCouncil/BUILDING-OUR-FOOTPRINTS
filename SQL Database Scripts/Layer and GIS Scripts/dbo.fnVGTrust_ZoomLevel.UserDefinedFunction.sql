USE [GISPUBLIC]
GO
/****** Object:  UserDefinedFunction [dbo].[fnVGTrust_ZoomLevel]    Script Date: 10/04/2015 4:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Elley
-- Create date: 30/05/2014
-- Last update:	17/07/2014	- Ryan Elley	- Cahnges as per Jeremy severin to include aspects of vertices and anngle measurement into the zoom factor rating.
--				30/05/2014	- Ryan Elley	- Initial Development from Jeremy Severinson's Python script
-- Description:	Returns a rating between 1 and 10 for the zoom level at which a feature is captured. The function below is written to reflect esri zoom parameters, ie: 1:250, 1:500 etc. This would need to be altered to suit other applications such as Google Maps, where zoom is classified as an integer between 1 and 17.
-- =============================================
CREATE FUNCTION [dbo].[fnVGTrust_ZoomLevel] 
(
	@zoomscale int,
	@vertexcount int,
	@anglemeasure float
)
RETURNS float
AS
BEGIN
	DECLARE @Result float

	IF @vertexcount <= 3
    BEGIN
		SET @Result = 0;
		RETURN @Result;
	END

	IF @anglemeasure <= 3
    BEGIN
		SET @Result = @anglemeasure;
		RETURN @Result;
	END


	SELECT @Result = CASE
		WHEN @zoomscale = 250 THEN 10
		WHEN @zoomscale = 500 THEN 8
		WHEN @zoomscale = 1000 THEN 6
		WHEN @zoomscale = 2000 THEN 5
		WHEN @zoomscale = 4000 THEN 4
		WHEN @zoomscale = 8000 THEN 3
		WHEN @zoomscale = 16000 THEN 2
		WHEN @zoomscale = 32000 THEN 1
		ELSE 0
	END

	-- Return the result of the function
	RETURN @Result

END



GO
