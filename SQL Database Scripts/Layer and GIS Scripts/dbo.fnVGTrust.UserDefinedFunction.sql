USE [GISPUBLIC]
GO
/****** Object:  UserDefinedFunction [dbo].[fnVGTrust]    Script Date: 10/04/2015 4:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Ryan Elley
-- Create date: 05/06/2014
-- Last update: 17/07/2014	- Chnage to alter modifiactions to zoom level rating changes.  Order changed of calculation of factors to reflect this. 
--				13/06/2014	- Update for Jeremy's scaling changes

-- Description:	Trust model for determining the accuracy of the captured crowdsourced daa
-- =============================================
CREATE FUNCTION [dbo].[fnVGTrust] 
(
	@featureX float,
	@featureY float,
	@homeX float,
	@homeY float,
	@schoolX float,
	@schoolY float,
	@subject varchar(50),
	@year varchar(7),
	@zoomscale int,
	--@vertexcount int,
	@noedits int,
	@firstedit datetime,
	@lastedit datetime,
	@shape geometry
)
RETURNS float
AS
BEGIN
	DECLARE @Result float

	DECLARE @homerate float, @schoolrate float, @expertise float, @age float, @scale float, @corners float, @linusLaw float, @ratio float, @anglemeasure float, @timedifference bigint;

	-- Calculate the home rating factor
	SET @homerate = dbo.fnVGTrust_ActivitySpaceNE(@featureX, @featureY, @homeX, @homeY);

	-- Calculate the school rating factor
	SET @schoolrate = dbo.fnVGTrust_ActivitySpaceNE(@featureX, @featureY, @schoolX, @schoolY);

	-- Calculate the expertise factor
	SET @expertise = dbo.fnVGTrust_Expertise(@subject);

	-- Calculate the age factor
	SET @age = dbo.fnVGTrust_SchoolYear(@year);

	-- Calculate the linus law factor
	SET @linusLaw = dbo.fnVGTrust_LinusLaw(@noedits);

	-- Calculate the edits ratio
	SET @timedifference = DATEDIFF(minute,@firstedit,@lastedit);

	-- Rates the number of vertices
	SET @corners = dbo.fnVGTrust_Vertices(@shape.STNumPoints());

	-- Rates the angles
	SET @anglemeasure = [dbo].[fnVGTrust_VertexRating](@shape);

	-- Calculate the scale factor
	SET @scale = dbo.fnVGTrust_ZoomLevel(@zoomscale, @shape.STNumPoints(), @anglemeasure);

	/*
	IF @noedits <= 1
	BEGIN
		SET @ratio = 0; --dbo.fnVGTrust_Vertices(@vertexcount);
	END
	ELSE
	BEGIN
		SET @ratio = LOG10(@timedifference)/LOG10(@noedits)*10
	END
	*/

	-- Calculate the result value 
		SET @Result = 
					(
						  (
								 (((@homerate * 0.25) + (@schoolrate * 0.25) + (@expertise * 0.35) + (@age * 0.15)) * 0.30) + 
								 (((@scale * 0.60) + (@corners * 0.20) + (@anglemeasure * 0.20)) * 0.60) + 
								 (@linusLaw * 0.10)
						  ) / 10
					);


	-- Return the result of the function
	RETURN @Result;

END




GO
