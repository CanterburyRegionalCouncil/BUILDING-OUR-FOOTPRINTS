USE [GISPUBLIC]
GO
/****** Object:  Table [dbo].[CROWDSOURCE_NZTM_BUILDINGFOOTPRINT]    Script Date: 10/04/2015 4:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CROWDSOURCE_NZTM_BUILDINGFOOTPRINT](
	[OBJECTID] [int] NOT NULL,
	[BLD_FLOORS] [smallint] NULL,
	[CAPTURE_SCALE] [numeric](38, 8) NULL,
	[GEOM_AREA] [numeric](38, 8) NULL,
	[ACCURACY_CLASS] [nvarchar](50) NULL,
	[CAPTURED_BY] [nvarchar](50) NULL,
	[CAPTURED_DATE] [datetime2](7) NULL,
	[DATE_LAST_CHANGE] [datetime2](7) NULL,
	[NUMBER_OF_EDITS] [smallint] NULL,
	[BLD_OCCUPATON] [nvarchar](50) NULL,
	[NZTMX] [numeric](38, 8) NULL,
	[NZTMY] [numeric](38, 8) NULL,
	[BLD_CLASS] [int] NULL,
	[COMMENTS] [nvarchar](255) NULL,
	[GlobalID] [uniqueidentifier] NOT NULL,
	[RETURNANGLE] [numeric](38, 8) NULL,
	[Shape] [geometry] NULL,
	[EDITOR_NICKNAME] [nvarchar](256) NULL,
 CONSTRAINT [R477_pk] PRIMARY KEY CLUSTERED 
(
	[OBJECTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CROWDSOURCE_NZTM_BUILDINGFOOTPRINT_CAPTURED_BY]    Script Date: 10/04/2015 4:09:15 p.m. ******/
CREATE NONCLUSTERED INDEX [IX_CROWDSOURCE_NZTM_BUILDINGFOOTPRINT_CAPTURED_BY] ON [dbo].[CROWDSOURCE_NZTM_BUILDINGFOOTPRINT]
(
	[CAPTURED_BY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UUID_477]    Script Date: 10/04/2015 4:09:15 p.m. ******/
CREATE NONCLUSTERED INDEX [UUID_477] ON [dbo].[CROWDSOURCE_NZTM_BUILDINGFOOTPRINT]
(
	[GlobalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CROWDSOURCE_NZTM_BUILDINGFOOTPRINT]  WITH CHECK ADD  CONSTRAINT [g467_ck] CHECK  (([SHAPE].[STSrid]=(2193)))
GO
ALTER TABLE [dbo].[CROWDSOURCE_NZTM_BUILDINGFOOTPRINT] CHECK CONSTRAINT [g467_ck]
GO
/****** Object:  Trigger [dbo].[trCROWDSOURCE_NZTM_BuildingFootprint_Insert]    Script Date: 10/04/2015 4:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ryan Elley
-- Create date: 04/06/2014
-- Description:	Updates the geometry statistics and calculates the trust details for the captured buildings
-- =============================================
CREATE TRIGGER [dbo].[trCROWDSOURCE_NZTM_BuildingFootprint_Insert] 
   ON  [dbo].[CROWDSOURCE_NZTM_BUILDINGFOOTPRINT] 
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE dbo.CROWDSOURCE_NZTM_BuildingFootprint
	SET
		NZTMX = i.SHAPE.STCentroid().STX,
		NZTMY = i.SHAPE.STCentroid().STY,
		NUMBER_OF_EDITS = 1,
		GEOM_AREA = i.SHAPE.STArea()
		,Editor_NickName = U.NickName
		,ACCURACY_CLASS = dbo.fnVGTrust(i.SHAPE.STCentroid().STX, i.SHAPE.STCentroid().STY, sb.NZTMX, sb.NZTMY, sc.NZTMX, sc.NZTMY, u.[FavouriteSubject], u.[ClassYear], i.CAPTURE_SCALE, 1, i.[CAPTURED_DATE], i.[DATE_LAST_CHANGE], i.Shape) 
	FROM
		dbo.CROWDSOURCE_NZTM_BuildingFootprint F

		INNER JOIN
		inserted i ON
			F.OBJECTID = i.OBJECTID

		LEFT JOIN
		[GISPublicViewerSettings].[dbo].[AspNetUsers] U ON
			i.[CAPTURED_BY] = U.UserName
			
		LEFT JOIN
		[dbo].[CROWDSOURCE_NZTM_SCHOOLS] sc ON
			U.[School] = sc.[NAME]
			
		LEFT JOIN
		[dbo].[CROWDSOURCE_NZTM_SUBURBS] sb ON
			U.[Suburb] = sb.[SUBURB];

	-- Insert a record in the change log
	INSERT INTO dbo.CROWDSOURCE_NZTM_BUILDINGFOOTPRINT_ChangeLog(GlobalID, BLD_CLASS, BLD_OCCUPATON, BLD_FLOORS, CAPTURE_SCALE, GEOM_AREA, ACCURACY_CLASS, CHANGE_BY, CHANGE_DATE, SHAPE, COMMENTS)
	SELECT
		F.GlobalID, F.BLD_CLASS, F.BLD_OCCUPATON, F.BLD_FLOORS, F.CAPTURE_SCALE, F.GEOM_AREA, F.ACCURACY_CLASS, F.[CAPTURED_BY], GETDATE(), F.SHAPE, F.Comments 
	FROM
		inserted i

		INNER JOIN
		dbo.CROWDSOURCE_NZTM_BuildingFootprint F ON
			F.OBJECTID = i.OBJECTID;
END


GO
/****** Object:  Trigger [dbo].[trCROWDSOURCE_NZTM_BuildingFootprint_Update]    Script Date: 10/04/2015 4:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ryan Elley
-- Create date: 04/06/2014
--Last Update:	17/07/2014	- Modification do Editor nickname can't be overwritten when modified.
-- Description:	Updates the geometry statistics and calculates the trust details for the captured buildings
-- =============================================
CREATE TRIGGER [dbo].[trCROWDSOURCE_NZTM_BuildingFootprint_Update] 
   ON  [dbo].[CROWDSOURCE_NZTM_BUILDINGFOOTPRINT] 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF UPDATE(SHAPE)
	BEGIN
		UPDATE dbo.CROWDSOURCE_NZTM_BuildingFootprint
		SET
			NZTMX = i.SHAPE.STCentroid().STX,
			NZTMY = i.SHAPE.STCentroid().STY,
			NUMBER_OF_EDITS = ISNULL(d.NUMBER_OF_EDITS,1) + 1,
			GEOM_AREA = i.SHAPE.STArea()
			,Editor_NickName = U.NickName
			,ACCURACY_CLASS = dbo.fnVGTrust(i.SHAPE.STCentroid().STX, i.SHAPE.STCentroid().STY, sb.NZTMX, sb.NZTMY, sc.NZTMX, sc.NZTMY, u.[FavouriteSubject], u.[ClassYear], i.CAPTURE_SCALE, ISNULL(d.NUMBER_OF_EDITS,1) + 1, i.[CAPTURED_DATE], i.[DATE_LAST_CHANGE], i.Shape) 

		FROM
			dbo.CROWDSOURCE_NZTM_BuildingFootprint F

			INNER JOIN
			inserted i ON
				F.OBJECTID = i.OBJECTID

			INNER JOIN
			deleted d ON
				D.OBJECTID = d.OBJECTID

			LEFT JOIN
			[GISPublicViewerSettings].[dbo].[AspNetUsers] U ON
				i.[CAPTURED_BY] = U.UserName
			
			LEFT JOIN
			[dbo].[CROWDSOURCE_NZTM_SCHOOLS] sc ON
				U.[School] = sc.[NAME]
			
			LEFT JOIN
			[dbo].[CROWDSOURCE_NZTM_SUBURBS] sb ON
				U.[Suburb] = sb.[SUBURB];

		-- Insert a record in the change log
		INSERT INTO dbo.CROWDSOURCE_NZTM_BUILDINGFOOTPRINT_ChangeLog(GlobalID, BLD_CLASS, BLD_OCCUPATON, BLD_FLOORS, CAPTURE_SCALE, GEOM_AREA, ACCURACY_CLASS, CHANGE_BY, CHANGE_DATE, SHAPE, COMMENTS)
		SELECT
			F.GlobalID, F.BLD_CLASS, F.BLD_OCCUPATON, F.BLD_FLOORS, F.CAPTURE_SCALE, F.GEOM_AREA, F.ACCURACY_CLASS, F.[CAPTURED_BY], GETDATE(), F.SHAPE, F.Comments 
		FROM
			inserted i

			INNER JOIN
			dbo.CROWDSOURCE_NZTM_BuildingFootprint F ON
				F.OBJECTID = i.OBJECTID;
	END
END


GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [S467_idx]    Script Date: 10/04/2015 4:09:15 p.m. ******/
CREATE SPATIAL INDEX [S467_idx] ON [dbo].[CROWDSOURCE_NZTM_BUILDINGFOOTPRINT]
(
	[Shape]
)USING  GEOMETRY_GRID 
WITH (BOUNDING_BOX =(1329298.4302, 4953722.9982, 1675167.0558, 5332458.6684), GRIDS =(LEVEL_1 = MEDIUM,LEVEL_2 = MEDIUM,LEVEL_3 = MEDIUM,LEVEL_4 = MEDIUM), 
CELLS_PER_OBJECT = 16, PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
