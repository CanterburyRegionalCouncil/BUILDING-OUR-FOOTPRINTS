USE [GISPUBLIC]
GO
/****** Object:  UserDefinedFunction [dbo].[fnVGTrust_Vertices]    Script Date: 10/04/2015 4:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jeremy Severinsen
-- Create date: 30/05/2014
-- Last update:	30/05/2014	- Jeremy Severinsen	
-- Description:	Returns a rating between 1 and 10 for the zoom level at which a feature is captured. The function below is written to reflect esri zoom parameters, ie: 1:250, 1:500 etc. This would need to be altered to suit other applications such as Google Maps, where zoom is classified as an integer between 1 and 17.
-- =============================================
CREATE FUNCTION [dbo].[fnVGTrust_Vertices] 
(
	@VertexCount int
)
RETURNS int
AS
BEGIN
	DECLARE @Result int

	SELECT @Result = CASE
		WHEN @VertexCount = 3 THEN 1
		WHEN @VertexCount = 4 THEN 5
		WHEN @VertexCount > 4 AND @VertexCount <= 6 THEN 6
		WHEN @VertexCount > 6 AND @VertexCount <= 8 THEN 7
		WHEN @VertexCount > 8 AND @VertexCount <= 10 THEN 8
		WHEN @VertexCount > 10 AND @VertexCount <= 12 THEN 9
		ELSE 10		


	END

	-- Return the result of the function
	RETURN @Result

END




GO
