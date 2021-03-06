USE [GISPUBLIC]
GO
/****** Object:  UserDefinedFunction [dbo].[fnVGTrust_VertexRating]    Script Date: 10/04/2015 4:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Elley
-- Create date: 30/06/2014
-- Description:	Calculates the rating value for a shape based on its geometry and the number of vertices and angles bewteen them
-- =============================================
CREATE FUNCTION [dbo].[fnVGTrust_VertexRating] 
(
	@polygon geometry
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result float;

	-- Get the number of points in the supplied shape
	DECLARE @i int = 1, @cnt int, @pointA geometry, @pointB geometry, @delta geometry, @bearing float, @bearing2 float, @rating float = 0; 
	DECLARE	@bearings TABLE (ID int PRIMARY KEY IDENTITY(1,1), bearing float);
	DECLARE	@ratings TABLE (ID int PRIMARY KEY IDENTITY(1,1), rating float);
		 
	DECLARE @bea varchar(MAX) = '';
	DECLARE @rat varchar(MAX) = '';

	SET @cnt = @polygon.STNumPoints();

	-- Iterate through each point in the shape to generate the bearings list 
	WHILE @i <= @cnt
	BEGIN
		-- Get the poinst for comparison
		SET @pointA = @polygon.STPointN(@i);

		IF @i = @cnt
		BEGIN
			SET @pointB = @polygon.STPointN(1);
		END
		ELSE
		BEGIN
			SET @pointB = @polygon.STPointN(@i + 1);
		END

		-- Calculate the delta value
		SET @delta = dbo.fnVGTrust_CalculateDelta(@pointA, @pointB);

		IF @delta.STX <> 0 AND @delta.STY <> 0
		BEGIN
			-- Calculate the bearing
			SET @bearing = [dbo].[fnVGTrust_CalcalateAngle](@delta.STX, @delta.STY);
			INSERT INTO @bearings(bearing) values(@bearing);

			SET @bea =  @bea + CAST(@bearing as varchar(20)) + ';';
		END

		-- Iterate to the next point
		SET @i = @i + 1;
	END

	-- Insert the first bearing again
	INSERT INTO @bearings(bearing) 
	SELECT bearing from @bearings WHERE ID = 1;

	-- Iterate through each bearing in the list
	SELECT @cnt = MAX(ID) FROM @bearings;

	SET @i = 1;
	WHILE @i < @cnt
	BEGIN
		SELECT @bearing = bearing FROM @bearings WHERE ID = @i;
		SELECT @bearing2 = bearing FROM @bearings WHERE ID = @i + 1;

		SET @rating = [dbo].[fnVGTrust_CalculateBearingRating](@bearing, @bearing2);

		INSERT INTO @ratings(rating) VALUES (@rating);

		SET @rat = @rat + CAST(@rating as varchar(20)) + ';';

		-- Iterate to the next point
		SET @i = @i + 1;
	END

	-- Set the rating as the sum of the individual ratings
	SELECT @Result = SUM(rating)/COUNT(rating) FROM @ratings;

	-- Return the result of the function
	RETURN @Result

END


GO
