USE [master]
GO
/****** Object:  Database [MEB]    Script Date: 29.11.2016 14:53:10 ******/
CREATE DATABASE [MEB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MEB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MEB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MEB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MEB_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MEB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MEB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MEB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MEB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MEB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MEB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MEB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MEB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MEB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MEB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MEB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MEB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MEB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MEB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MEB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MEB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MEB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MEB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MEB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MEB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MEB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MEB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MEB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MEB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MEB] SET RECOVERY FULL 
GO
ALTER DATABASE [MEB] SET  MULTI_USER 
GO
ALTER DATABASE [MEB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MEB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MEB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MEB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MEB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MEB', N'ON'
GO
ALTER DATABASE [MEB] SET QUERY_STORE = OFF
GO
USE [MEB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [MEB]
GO
/****** Object:  UserDefinedFunction [dbo].[TRIM]    Script Date: 29.11.2016 14:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TRIM] (@STR NVARCHAR(MAX)) RETURNS NVARCHAR(MAX)
BEGIN
    RETURN(LTRIM(RTRIM(REPLACE(REPLACE(@STR ,CHAR(10),''),CHAR(13),''))))
END;

GO
/****** Object:  Table [dbo].[Il]    Script Date: 29.11.2016 14:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Il](
	[No] [int] NOT NULL,
	[Ad] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Il] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ilce]    Script Date: 29.11.2016 14:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ilce](
	[No] [int] IDENTITY(1,1) NOT NULL,
	[IlNo] [int] NOT NULL,
	[Kod] [int] NOT NULL,
	[Ad] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Ilce] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Okul]    Script Date: 29.11.2016 14:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Okul](
	[No] [int] IDENTITY(1,1) NOT NULL,
	[IlceNo] [int] NOT NULL,
	[Ad] [nvarchar](max) NOT NULL,
	[Url] [varchar](250) NOT NULL,
	[HakkindaUrl] [varchar](250) NOT NULL,
	[KurumKodu] [varchar](50) NOT NULL,
	[Tel] [varchar](50) NULL,
	[Faks] [varchar](50) NULL,
	[Adres] [nvarchar](max) NULL,
	[Vizyon] [nvarchar](max) NULL,
	[Misyon] [nvarchar](max) NULL,
	[Basarilar] [nvarchar](max) NULL,
	[OgretmenSayi] [int] NOT NULL,
	[RehberSayi] [int] NOT NULL,
	[OgrenciSayi] [int] NOT NULL,
	[OgretimSekli] [nvarchar](max) NULL,
	[DersSaati] [nvarchar](max) NULL,
	[DerslikSayi] [int] NOT NULL,
	[AtolyeSayi] [int] NOT NULL,
	[LabSayi] [int] NOT NULL,
	[BtSayi] [int] NOT NULL,
	[ResimSayi] [int] NOT NULL,
	[MuzikSayi] [int] NOT NULL,
	[YabanciDil] [nvarchar](max) NULL,
	[Internet] [nvarchar](max) NULL,
	[Hazirlik] [bit] NOT NULL,
	[Konferans] [bit] NOT NULL,
	[Spor] [bit] NOT NULL,
	[Yemekhane] [bit] NOT NULL,
	[Misafirhane] [bit] NOT NULL,
	[Kutuphane] [bit] NOT NULL,
	[Kantin] [bit] NOT NULL,
	[Revir] [bit] NOT NULL,
	[Bahce] [bit] NOT NULL,
	[Lojman] [nvarchar](max) NULL,
	[Isinma] [nvarchar](max) NULL,
	[Uzaklik] [nvarchar](max) NULL,
	[Ulasim] [nvarchar](max) NULL,
	[Servis] [nvarchar](max) NULL,
	[Yerlesim] [nvarchar](max) NULL,
	[Kontenjan] [nvarchar](max) NULL,
	[PuanBilgi] [nvarchar](max) NULL,
	[BasariDurumu] [nvarchar](max) NULL,
	[YerlestirmeYuzde] [nvarchar](max) NULL,
	[SporEtkinlik] [nvarchar](max) NULL,
	[BilimEtkinlik] [nvarchar](max) NULL,
	[Projeler] [nvarchar](max) NULL,
	[YurtdisiProje] [nvarchar](max) NULL,
 CONSTRAINT [PK_Okul] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[Ilcelerdeki Okul Sayısı]    Script Date: 29.11.2016 14:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Ilcelerdeki Okul Sayısı]
AS
SELECT        TOP (100) PERCENT dbo.Ilce.IlNo, dbo.Ilce.Kod, dbo.Il.Ad AS Il, dbo.Ilce.Ad AS Ilce, COUNT(dbo.Okul.No) AS Okul
FROM            dbo.Okul INNER JOIN
                         dbo.Ilce ON dbo.Okul.IlceNo = dbo.Ilce.No INNER JOIN
                         dbo.Il ON dbo.Ilce.IlNo = dbo.Il.No
GROUP BY dbo.Il.Ad, dbo.Ilce.Ad, dbo.Ilce.IlNo, dbo.Ilce.Kod
ORDER BY dbo.Ilce.IlNo DESC, dbo.Ilce.Kod DESC

GO
/****** Object:  View [dbo].[RowCount]    Script Date: 29.11.2016 14:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[RowCount]
AS
SELECT        TOP (100) PERCENT t.name AS TableName, s.name AS SchemaName, p.rows AS RowCounts, SUM(a.total_pages) * 8 AS TotalSpaceKB, SUM(a.used_pages) 
                         * 8 AS UsedSpaceKB, (SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB
FROM            sys.tables AS t INNER JOIN
                         sys.indexes AS i ON t.object_id = i.object_id INNER JOIN
                         sys.partitions AS p ON i.object_id = p.object_id AND i.index_id = p.index_id INNER JOIN
                         sys.allocation_units AS a ON p.partition_id = a.container_id LEFT OUTER JOIN
                         sys.schemas AS s ON t.schema_id = s.schema_id
WHERE        (t.name NOT LIKE 'dt%') AND (t.is_ms_shipped = 0) AND (i.object_id > 255)
GROUP BY t.name, s.name, p.rows
ORDER BY TableName






GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_OgretmenSayi]  DEFAULT ((0)) FOR [OgretmenSayi]
GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_RehberSayi]  DEFAULT ((0)) FOR [RehberSayi]
GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_OgrenciSayi]  DEFAULT ((0)) FOR [OgrenciSayi]
GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_DersSaati]  DEFAULT ((0)) FOR [DersSaati]
GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_DesrlikSayi]  DEFAULT ((0)) FOR [DerslikSayi]
GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_AtolyeSayi]  DEFAULT ((0)) FOR [AtolyeSayi]
GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_LabSayi]  DEFAULT ((0)) FOR [LabSayi]
GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_BtSayi]  DEFAULT ((0)) FOR [BtSayi]
GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_ResimSayi]  DEFAULT ((0)) FOR [ResimSayi]
GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_MuzikSayi]  DEFAULT ((0)) FOR [MuzikSayi]
GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_Hazirlik]  DEFAULT ((0)) FOR [Hazirlik]
GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_Konferans]  DEFAULT ((0)) FOR [Konferans]
GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_Spor]  DEFAULT ((0)) FOR [Spor]
GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_Yemekhane]  DEFAULT ((0)) FOR [Yemekhane]
GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_Misafirhane]  DEFAULT ((0)) FOR [Misafirhane]
GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_Kutuphane]  DEFAULT ((0)) FOR [Kutuphane]
GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_Kantin]  DEFAULT ((0)) FOR [Kantin]
GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_Revir]  DEFAULT ((0)) FOR [Revir]
GO
ALTER TABLE [dbo].[Okul] ADD  CONSTRAINT [DF_Okul_Bahce]  DEFAULT ((0)) FOR [Bahce]
GO
ALTER TABLE [dbo].[Ilce]  WITH CHECK ADD  CONSTRAINT [FK_Ilce_Il] FOREIGN KEY([IlNo])
REFERENCES [dbo].[Il] ([No])
GO
ALTER TABLE [dbo].[Ilce] CHECK CONSTRAINT [FK_Ilce_Il]
GO
ALTER TABLE [dbo].[Okul]  WITH CHECK ADD  CONSTRAINT [FK_Okul_Ilce] FOREIGN KEY([IlceNo])
REFERENCES [dbo].[Ilce] ([No])
GO
ALTER TABLE [dbo].[Okul] CHECK CONSTRAINT [FK_Okul_Ilce]
GO
/****** Object:  StoredProcedure [dbo].[GetIlceAd]    Script Date: 29.11.2016 14:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Hüseyin Sekmenoğlu
-- Create date: 24.11.2016
-- Description:	il ve ilçemnin adını getirir
-- =============================================
CREATE PROCEDURE [dbo].[GetIlceAd]
	@IlNo int,
	@IlceNo int

AS
BEGIN
	SET NOCOUNT ON;

	SELECT        Il.Ad + ' - ' + Ilce.Ad + ' - ' AS Ad
	FROM            Ilce INNER JOIN
							 Il ON Ilce.IlNo = Il.No
	WHERE        (Ilce.IlNo = @IlNo) AND (Ilce.Kod = @IlceNo)

END




GO
/****** Object:  StoredProcedure [dbo].[GetIlceNo]    Script Date: 29.11.2016 14:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Hüseyin Sekmenoğlu
-- Create date: 24.11.2016
-- Description:	sıradaki ilçe noyu getirir
-- =============================================
CREATE PROCEDURE [dbo].[GetIlceNo]
	@IlNo int,
	@IlceNo int

AS
BEGIN
	SET NOCOUNT ON;

	SELECT        TOP (1) Kod
	FROM            Ilce
	WHERE        (IlNo = @IlNo) AND (Kod >= @IlceNo)
	ORDER BY Kod

END



GO
/****** Object:  StoredProcedure [dbo].[InsertSchool]    Script Date: 29.11.2016 14:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Hüseyin Sekmenoğlu
-- Create date: 24.11.2016
-- Description:	okulun genel bilgileriin ekler
-- =============================================
CREATE PROCEDURE [dbo].[InsertSchool]
	@IlNo int,
	@IlceNo int,
	@Ad nvarchar(MAX),
	@Url varchar(250),
	@HakkindaUrl varchar(250),
	@KurumKodu varchar(50)

AS
BEGIN
	SET NOCOUNT ON;

	declare @ilce int
	set @ilce=(SELECT No FROM Ilce WHERE (IlNo = @IlNo) AND (Kod = @IlceNo))
	--ekle
	if (CASE WHEN EXISTS (SELECT No FROM Okul WHERE (IlceNo = @ilce) AND (Ad = @Ad)) THEN '1' ELSE '0' END)=0 --daha önce eklenmemişse
	BEGIN
		INSERT INTO Okul (IlceNo, Ad, [Url], HakkindaUrl, KurumKodu)
		VALUES        (@ilce, @Ad, @Url, @HakkindaUrl, @KurumKodu)
	END
	--göster
	select SCOPE_IDENTITY()

END




GO
/****** Object:  StoredProcedure [dbo].[UpdateSchool]    Script Date: 29.11.2016 14:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Hüseyin Sekmenoğlu
-- Create date: 26.11.2016
-- Description:	okulun bilgilerini günceller
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSchool]
	@OkulNo int,
	@Madde varchar(50),
	@deger nvarchar(max)

AS
BEGIN
	SET NOCOUNT ON;

	if (@Madde='Tel')
		UPDATE Okul Set Tel=@deger where No=@OkulNo
	else if (@Madde='Faks')
		UPDATE Okul Set Faks=@deger where No=@OkulNo
	else if (@Madde='Adres')
		UPDATE Okul Set Adres=@deger where No=@OkulNo
	else if (@Madde='Vizyon')
		UPDATE Okul Set Vizyon=@deger where No=@OkulNo
	else if (@Madde='Misyon')
		UPDATE Okul Set Misyon=@deger where No=@OkulNo
	else if (@Madde='Basarilar')
		UPDATE Okul Set Basarilar=@deger where No=@OkulNo
	else if (@Madde='OgretimSekli')
		UPDATE Okul Set OgretimSekli=@deger where No=@OkulNo
	else if (@Madde='DersSaati')
		UPDATE Okul Set DersSaati=@deger where No=@OkulNo
	else if (@Madde='Internet')
		UPDATE Okul Set Internet=@deger where No=@OkulNo
	else if (@Madde='YabanciDil')
		UPDATE Okul Set YabanciDil=@deger where No=@OkulNo
	else if (@Madde='Lojman')
		UPDATE Okul Set Lojman=@deger where No=@OkulNo
	else if (@Madde='Isinma')
		UPDATE Okul Set Isinma=@deger where No=@OkulNo
	else if (@Madde='Uzaklik')
		UPDATE Okul Set Uzaklik=@deger where No=@OkulNo
	else if (@Madde='Ulasim')
		UPDATE Okul Set Ulasim=@deger where No=@OkulNo
	else if (@Madde='Servis')
		UPDATE Okul Set Servis=@deger where No=@OkulNo
	else if (@Madde='Yerlesim')
		UPDATE Okul Set Yerlesim=@deger where No=@OkulNo
	else if (@Madde='Kontenjan')
		UPDATE Okul Set Kontenjan=@deger where No=@OkulNo
	else if (@Madde='PuanBilgi')
		UPDATE Okul Set PuanBilgi=@deger where No=@OkulNo
	else if (@Madde='BasariDurumu')
		UPDATE Okul Set BasariDurumu=@deger where No=@OkulNo
	else if (@Madde='YerlestirmeYuzde')
		UPDATE Okul Set YerlestirmeYuzde=@deger where No=@OkulNo
	else if (@Madde='SporEtkinlik')
		UPDATE Okul Set SporEtkinlik=@deger where No=@OkulNo
	else if (@Madde='BilimEtkinlik')
		UPDATE Okul Set BilimEtkinlik=@deger where No=@OkulNo
	else if (@Madde='Projeler')
		UPDATE Okul Set Projeler=@deger where No=@OkulNo
	else if (@Madde='YurtdisiProje')
		UPDATE Okul Set YurtdisiProje=@deger where No=@OkulNo

	else if (@Madde='OgretmenSayi')
		UPDATE Okul Set OgretmenSayi=CONVERT(int, @deger) where No=@OkulNo
	else if (@Madde='RehberSayi')
		UPDATE Okul Set RehberSayi=CONVERT(int, @deger) where No=@OkulNo
	else if (@Madde='OgrenciSayi')
		UPDATE Okul Set OgrenciSayi=CONVERT(int, @deger) where No=@OkulNo
	else if (@Madde='DerslikSayi')
		UPDATE Okul Set DerslikSayi=CONVERT(int, @deger) where No=@OkulNo
	else if (@Madde='AtolyeSayi')
		UPDATE Okul Set AtolyeSayi=CONVERT(int, @deger) where No=@OkulNo
	else if (@Madde='LabSayi')
		UPDATE Okul Set LabSayi=CONVERT(int, @deger) where No=@OkulNo
	else if (@Madde='BtSayi')
		UPDATE Okul Set BtSayi=CONVERT(int, @deger) where No=@OkulNo
	else if (@Madde='ResimSayi')
		UPDATE Okul Set ResimSayi=CONVERT(int, @deger) where No=@OkulNo
	else if (@Madde='MuzikSayi')
		UPDATE Okul Set MuzikSayi=CONVERT(int, @deger) where No=@OkulNo
	else if (@Madde='Hazirlik')
		UPDATE Okul Set Hazirlik=CONVERT(bit, @deger) where No=@OkulNo
	else if (@Madde='Konferans')
		UPDATE Okul Set Konferans=CONVERT(bit, @deger) where No=@OkulNo
	else if (@Madde='Spor')
		UPDATE Okul Set Spor=CONVERT(bit, @deger) where No=@OkulNo
	else if (@Madde='Yemekhane')
		UPDATE Okul Set Yemekhane=CONVERT(bit, @deger) where No=@OkulNo
	else if (@Madde='Misafirhane')
		UPDATE Okul Set Misafirhane=CONVERT(bit, @deger) where No=@OkulNo
	else if (@Madde='Kutuphane')
		UPDATE Okul Set Kutuphane=CONVERT(bit, @deger) where No=@OkulNo
	else if (@Madde='Kantin')
		UPDATE Okul Set Kantin=CONVERT(bit, @deger) where No=@OkulNo
	else if (@Madde='Revir')
		UPDATE Okul Set Revir=CONVERT(bit, @deger) where No=@OkulNo
	else if (@Madde='Bahce')
		UPDATE Okul Set Bahce=CONVERT(bit, @deger) where No=@OkulNo

END


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
         Begin Table = "Okul"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ilce"
            Begin Extent = 
               Top = 6
               Left = 272
               Bottom = 136
               Right = 458
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Il"
            Begin Extent = 
               Top = 6
               Left = 496
               Bottom = 102
               Right = 682
            End
            DisplayFlags = 280
            TopColumn = 0
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
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Ilcelerdeki Okul Sayısı'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Ilcelerdeki Okul Sayısı'
GO
USE [master]
GO
ALTER DATABASE [MEB] SET  READ_WRITE 
GO
