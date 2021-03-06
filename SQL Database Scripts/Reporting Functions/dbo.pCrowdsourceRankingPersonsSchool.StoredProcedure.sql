USE [GISPUBLICViewerSettings]
GO
/****** Object:  StoredProcedure [dbo].[pCrowdsourceRankingPersonsSchool]    Script Date: 10/04/2015 4:00:16 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE proc [dbo].[pCrowdsourceRankingPersonsSchool]
	@username nvarchar(256)
as


DECLARE @school nvarchar(MAX);
SELECT @school = School FROM [dbo].[AspNetUsers] WHERE UserName = @username;

SELECT 
	U.NickName		as [Nickname],
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
	convert(float,[ACCURACY_CLASS]) >= .75 AND
	U.School = @school
GROUP BY 
	U.NickName,
    sc.Name                     		 
ORDER BY   
	--sc.Name asc, 
	count(*) desc


GO
