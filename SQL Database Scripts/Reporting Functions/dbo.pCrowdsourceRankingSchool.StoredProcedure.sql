USE [GISPUBLICViewerSettings]
GO
/****** Object:  StoredProcedure [dbo].[pCrowdsourceRankingSchool]    Script Date: 10/04/2015 4:00:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE proc [dbo].[pCrowdsourceRankingSchool]
as
SELECT 
	sc.Name as [School Name],
	count(*)    as [Ranking]
FROM 
	[GISPUBLIC].[dbo].[CROWDSOURCE_NZTM_BUILDINGFOOTPRINT] F

	LEFT JOIN
	[GISPublicViewerSettings].[dbo].[AspNetUsers] U ON
		f.[CAPTURED_BY] = U.UserName
                     
	LEFT JOIN
	[GISPUBLIC].[dbo].[CROWDSOURCE_NZTM_SCHOOLS] sc ON
		U.[School] = sc.[NAME]
                     
	LEFT JOIN
	[GISPUBLIC].[dbo].[CROWDSOURCE_NZTM_SUBURBS] sb ON
		U.[Suburb] = sb.[SUBURB]
WHERE 
		convert(float,[ACCURACY_CLASS])  >= .75 
	AND F.CAPTURED_BY <> 'OSM'
GROUP BY 
	sc.Name                     		 
    order by   count(*) desc

GO
