USE [GISPUBLICViewerSettings]
GO
/****** Object:  StoredProcedure [dbo].[pCrowdsourceRankingPerson]    Script Date: 10/04/2015 4:00:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE proc [dbo].[pCrowdsourceRankingPerson]
as
SELECT 
	U.NickName		as [Nickname],
    sc.Name			as [School Name],
	count(*)		as [Ranking]
FROM 
	[GISPUBLIC].[dbo].[CROWDSOURCE_NZTM_BUILDINGFOOTPRINT] F

    LEFT JOIN
    [GISPublicViewerSettings].[dbo].[AspNetUsers] U ON
		F.[CAPTURED_BY] = U.UserName
                     
	LEFT JOIN
	[GISPUBLIC].[dbo].[CROWDSOURCE_NZTM_SCHOOLS] sc ON
		U.[School] = sc.[NAME]
                     
	LEFT JOIN
	[GISPUBLIC].[dbo].[CROWDSOURCE_NZTM_SUBURBS] sb ON
		U.[Suburb] = sb.[SUBURB]
WHERE 
	convert(float,[ACCURACY_CLASS])  >= .75 AND
	NOT u.ClassYear IN ('STAFF','Other')
GROUP BY 
	U.NickName,
    sc.Name                     		 
ORDER BY   
	--sc.Name asc, 
	count(*) desc

GO
