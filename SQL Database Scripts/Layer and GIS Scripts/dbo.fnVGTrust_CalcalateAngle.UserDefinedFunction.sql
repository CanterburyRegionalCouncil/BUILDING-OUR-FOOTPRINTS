USE [GISPUBLIC]
GO
/****** Object:  UserDefinedFunction [dbo].[fnVGTrust_CalcalateAngle]    Script Date: 10/04/2015 4:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Elley
-- Create date: 30/06/2014
-- Last update:	30/06/2014	- Ryan Elley	- Initial Development from Jeremy Severinson's javascript
-- Description:	Calculates the angle of a point feature
-- =============================================
CREATE FUNCTION [dbo].[fnVGTrust_CalcalateAngle] 
(
	@ptx float,
	@pty float
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result float = null;

	IF @ptx = 0
	BEGIN
		IF @pty > 0
		BEGIN
			SET @Result = 90.0;
		END 
		ELSE
		BEGIN
			SET @Result = 270.0;
		END
	END

	IF @pty = 0
	BEGIN
		IF @ptx > 0
		BEGIN
			SET @Result = 0.0;
		END
		ELSE
		BEGIN
			SET @Result = 180.0;
		END
	END

	IF @Result IS NULL
	BEGIN
		SET @Result = ATAN(@pty/@ptx) * 180 / PI();

		IF @ptx < 0
		BEGIN
			SET @Result = @Result + 180;
		END
		ELSE 
		BEGIN
			IF @pty < 0
			BEGIN
				SET @Result = @Result + 360;
			END
		END
	END

	-- Return the result of the function
	RETURN @Result

END


GO
