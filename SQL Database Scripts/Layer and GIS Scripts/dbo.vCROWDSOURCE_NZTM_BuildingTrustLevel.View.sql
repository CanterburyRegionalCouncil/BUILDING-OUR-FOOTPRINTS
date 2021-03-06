USE [GISPUBLIC]
GO
/****** Object:  View [dbo].[vCROWDSOURCE_NZTM_BuildingTrustLevel]    Script Date: 10/04/2015 4:09:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vCROWDSOURCE_NZTM_BuildingTrustLevel]
AS

/***********************************************
 * View:		[dbo].[vCROWDSOURCE_NZTM_BuildingTrustLevel] 
 * Date:		11/07/2014
 * Author:		Ryan Elley
 *
 * Description: Trust rating value points for features captured as part of the Building our Footrpuints collabration. 
 *
 * ------------ --------------- ----------------------------------------------------
 * Date			Author			Description
 * ------------ --------------- ----------------------------------------------------
 * 21/07/2012	Ryan Elley		Changes to hide OSM related features.
 * ------------ --------------- ----------------------------------------------------
 */ 

SELECT
	F.OBJECTID, 
	F.BLD_OCCUPATON, 
	F.BLD_CLASS, 
	CAST(F.ACCURACY_CLASS as float) as ACCURACY_CLASS, 
	F.CAPTURE_SCALE, 
	F.CAPTURED_DATE, 
	F.DATE_LAST_CHANGE, 
	F.NUMBER_OF_EDITS, 
	F.BLD_FLOORS, 
	F.GEOM_AREA, 
	F.[EDITOR_NICKNAME],
	geometry::Point(F.NZTMX, F.NZTMY, 2193) as SHAPE,
	F.COMMENTS, 
	F.GlobalID
FROM            
	dbo.CROWDSOURCE_NZTM_BUILDINGFOOTPRINT F
WHERE
	F.CAPTURED_BY <> 'OSM';

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CROWDSOURCE_NZTM_BUILDINGFOOTPRINT"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 315
               Right = 305
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vCROWDSOURCE_NZTM_BuildingTrustLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vCROWDSOURCE_NZTM_BuildingTrustLevel'
GO
