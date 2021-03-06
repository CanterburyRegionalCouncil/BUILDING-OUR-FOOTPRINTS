USE [GISPUBLICViewerSettings]
GO
/****** Object:  StoredProcedure [dbo].[pCrowdsourceRankingPersonAll]    Script Date: 10/04/2015 4:00:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE proc [dbo].[pCrowdsourceRankingPersonAll]
as

SELECT 
	U.NickName		as [Nickname],
    sc.Name			as [School Name],
	u.ClassYear		as [Class Year],
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
		U.NickName is not null
GROUP BY 
	U.NickName,
    sc.Name,
	u.ClassYear                     		 
ORDER BY   
	--sc.Name asc, 
	count(*) desc


GO
