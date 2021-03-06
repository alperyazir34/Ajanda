USE [master]
GO
/****** Object:  Database [KurumsalAjanda]    Script Date: 27.05.2018 18:13:24 ******/
CREATE DATABASE [KurumsalAjanda]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KurumsalAjanda', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\KurumsalAjanda.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KurumsalAjanda_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\KurumsalAjanda_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [KurumsalAjanda] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KurumsalAjanda].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KurumsalAjanda] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET ARITHABORT OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KurumsalAjanda] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KurumsalAjanda] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KurumsalAjanda] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KurumsalAjanda] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET RECOVERY FULL 
GO
ALTER DATABASE [KurumsalAjanda] SET  MULTI_USER 
GO
ALTER DATABASE [KurumsalAjanda] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KurumsalAjanda] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KurumsalAjanda] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KurumsalAjanda] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KurumsalAjanda] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'KurumsalAjanda', N'ON'
GO
ALTER DATABASE [KurumsalAjanda] SET QUERY_STORE = OFF
GO
USE [KurumsalAjanda]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [KurumsalAjanda]
GO
/****** Object:  Table [dbo].[Departmanlar]    Script Date: 27.05.2018 18:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departmanlar](
	[Departman_ID] [int] IDENTITY(1,1) NOT NULL,
	[Departman_Adi] [nvarchar](100) NULL,
	[Olusturma_Tarihi] [date] NULL,
	[Is_Active] [bit] NOT NULL,
 CONSTRAINT [PK_Departmanlar] PRIMARY KEY CLUSTERED 
(
	[Departman_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is_Detay]    Script Date: 27.05.2018 18:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is_Detay](
	[Is_Detay_ID] [int] IDENTITY(1,1) NOT NULL,
	[Personel_ID] [int] NULL,
	[Is_Turu_ID] [int] NULL,
	[Toplanti_Onemi_ID] [int] NULL,
	[Departman_ID] [int] NULL,
	[Isin_Adi] [nvarchar](100) NULL,
	[Isin_Açiklamasi] [nvarchar](max) NULL,
	[Baslama_tarihi] [date] NULL,
	[Bitis_Tarihi] [date] NULL,
	[Is_Active] [bit] NULL,
 CONSTRAINT [PK_Is_Detay] PRIMARY KEY CLUSTERED 
(
	[Is_Detay_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is_Turleri]    Script Date: 27.05.2018 18:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is_Turleri](
	[Is_Turu_ID] [int] IDENTITY(1,1) NOT NULL,
	[Tur_Adi] [nvarchar](100) NULL,
	[Tur_Aciklama] [nvarchar](max) NULL,
	[Is_Active] [bit] NULL,
 CONSTRAINT [PK_Is_Turleri] PRIMARY KEY CLUSTERED 
(
	[Is_Turu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Izindekiler]    Script Date: 27.05.2018 18:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Izindekiler](
	[Izindekiler_ID] [int] IDENTITY(1,1) NOT NULL,
	[Personel_ID] [int] NULL,
	[Deparman_ID] [int] NULL,
	[Izine_Cikis_Tarihi] [date] NULL,
	[Izinden_Donus_Tarihi] [date] NULL,
	[Is_Active] [bit] NOT NULL,
 CONSTRAINT [PK_Izindekiler] PRIMARY KEY CLUSTERED 
(
	[Izindekiler_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 27.05.2018 18:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[Musteri_ID] [int] IDENTITY(1,1) NOT NULL,
	[Sifre] [nvarchar](max) NULL,
	[Ad] [nvarchar](50) NULL,
	[Soyad] [nvarchar](100) NULL,
	[Bas_Harfler] [nvarchar](50) NULL,
	[Departman_Adi] [nvarchar](100) NULL,
	[Dogum_Tarihi] [date] NULL,
	[E_Mail] [nvarchar](100) NULL,
	[Telefon_No] [nvarchar](50) NULL,
	[Vasfi] [nvarchar](50) NULL,
	[Image] [varbinary](max) NULL,
	[Is_Active] [bit] NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[Musteri_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personeller]    Script Date: 27.05.2018 18:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personeller](
	[Personel_ID] [int] IDENTITY(1,1) NOT NULL,
	[Derpartman_ID] [int] NULL,
	[Sifre] [nvarchar](max) NULL,
	[Ad] [nvarchar](100) NULL,
	[Soyad] [nvarchar](100) NULL,
	[Bas_Harfler] [nvarchar](50) NULL,
	[Dogum_Tarihi] [date] NULL,
	[E_Mail] [nvarchar](100) NULL,
	[Telefon_No] [nvarchar](50) NULL,
	[Vasfi] [nvarchar](50) NULL,
	[Ise_Giris_Tarihi] [date] NULL,
	[Yillik_Izin_Gun_Sayisi] [int] NULL,
	[Image] [varbinary](max) NULL,
	[Admin] [bit] NULL,
	[Is_Active] [bit] NULL,
 CONSTRAINT [PK_Personeller] PRIMARY KEY CLUSTERED 
(
	[Personel_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Saat]    Script Date: 27.05.2018 18:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saat](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[saat] [time](7) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Saat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Toplanti_Onemi]    Script Date: 27.05.2018 18:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Toplanti_Onemi](
	[Toplanti_Onemi_ID] [int] IDENTITY(1,1) NOT NULL,
	[Toplanti_Isim] [nvarchar](50) NULL,
	[Toplanti_Durum] [nvarchar](50) NULL,
 CONSTRAINT [PK_Toplanti_Onemi] PRIMARY KEY CLUSTERED 
(
	[Toplanti_Onemi_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Toplantilar]    Script Date: 27.05.2018 18:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Toplantilar](
	[Toplanti_ID] [int] IDENTITY(1,1) NOT NULL,
	[Toplanti_Tarih] [date] NULL,
	[Saat_ID] [int] NULL,
	[Toplanti_Onemi_ID] [int] NULL,
	[Toplanti_Ad] [nvarchar](max) NULL,
	[Toplanti_Aciklama] [nvarchar](max) NULL,
	[Katılan_Personeller] [nvarchar](max) NULL,
	[Katılan_Musteri] [nvarchar](max) NULL,
	[Is_Active] [bit] NULL,
 CONSTRAINT [PK_Toplantilar] PRIMARY KEY CLUSTERED 
(
	[Toplanti_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departmanlar] ON 

INSERT [dbo].[Departmanlar] ([Departman_ID], [Departman_Adi], [Olusturma_Tarihi], [Is_Active]) VALUES (1, N'Satış                                                                                               ', CAST(N'2018-04-25' AS Date), 1)
INSERT [dbo].[Departmanlar] ([Departman_ID], [Departman_Adi], [Olusturma_Tarihi], [Is_Active]) VALUES (2, N'Mühendislik                                                                                         ', CAST(N'2018-04-25' AS Date), 1)
INSERT [dbo].[Departmanlar] ([Departman_ID], [Departman_Adi], [Olusturma_Tarihi], [Is_Active]) VALUES (3, N'Hizmet                                                                                              ', CAST(N'2018-04-25' AS Date), 1)
INSERT [dbo].[Departmanlar] ([Departman_ID], [Departman_Adi], [Olusturma_Tarihi], [Is_Active]) VALUES (4, N'Pazarlama                                                                                           ', CAST(N'2018-04-25' AS Date), 1)
INSERT [dbo].[Departmanlar] ([Departman_ID], [Departman_Adi], [Olusturma_Tarihi], [Is_Active]) VALUES (5, N'Bilgi İşlem                                                                                         ', CAST(N'2018-04-25' AS Date), 1)
INSERT [dbo].[Departmanlar] ([Departman_ID], [Departman_Adi], [Olusturma_Tarihi], [Is_Active]) VALUES (6, N'Ar-Ge                                                                                               ', CAST(N'2018-04-25' AS Date), 1)
INSERT [dbo].[Departmanlar] ([Departman_ID], [Departman_Adi], [Olusturma_Tarihi], [Is_Active]) VALUES (7, N'Sağlık                                                                                              ', CAST(N'2018-04-25' AS Date), 1)
INSERT [dbo].[Departmanlar] ([Departman_ID], [Departman_Adi], [Olusturma_Tarihi], [Is_Active]) VALUES (8, N'Teknik                                                                                              ', CAST(N'2018-04-25' AS Date), 1)
INSERT [dbo].[Departmanlar] ([Departman_ID], [Departman_Adi], [Olusturma_Tarihi], [Is_Active]) VALUES (9, N'Muhasebe                                                                                            ', CAST(N'2018-04-25' AS Date), 1)
INSERT [dbo].[Departmanlar] ([Departman_ID], [Departman_Adi], [Olusturma_Tarihi], [Is_Active]) VALUES (10, N'İnsan Kaynakları                                                                                    ', CAST(N'2018-04-25' AS Date), 1)
INSERT [dbo].[Departmanlar] ([Departman_ID], [Departman_Adi], [Olusturma_Tarihi], [Is_Active]) VALUES (11, N'Hukuk                                                                                               ', CAST(N'2018-04-25' AS Date), 1)
INSERT [dbo].[Departmanlar] ([Departman_ID], [Departman_Adi], [Olusturma_Tarihi], [Is_Active]) VALUES (12, N'Reklam                                                                                              ', CAST(N'2018-04-25' AS Date), 1)
INSERT [dbo].[Departmanlar] ([Departman_ID], [Departman_Adi], [Olusturma_Tarihi], [Is_Active]) VALUES (13, N'Yönetim                                                                                             ', CAST(N'2018-04-25' AS Date), 1)
INSERT [dbo].[Departmanlar] ([Departman_ID], [Departman_Adi], [Olusturma_Tarihi], [Is_Active]) VALUES (14, N'İşçiler                                                                                             ', CAST(N'2018-04-25' AS Date), 1)
INSERT [dbo].[Departmanlar] ([Departman_ID], [Departman_Adi], [Olusturma_Tarihi], [Is_Active]) VALUES (15, N'Satınalma                                                                                           ', CAST(N'2018-04-25' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Departmanlar] OFF
SET IDENTITY_INSERT [dbo].[Is_Detay] ON 

INSERT [dbo].[Is_Detay] ([Is_Detay_ID], [Personel_ID], [Is_Turu_ID], [Toplanti_Onemi_ID], [Departman_ID], [Isin_Adi], [Isin_Açiklamasi], [Baslama_tarihi], [Bitis_Tarihi], [Is_Active]) VALUES (1, 1, 1, 1, 10, N'Deneme', N'deneme deneme2', CAST(N'2018-05-16' AS Date), CAST(N'2018-05-31' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Is_Detay] OFF
SET IDENTITY_INSERT [dbo].[Is_Turleri] ON 

INSERT [dbo].[Is_Turleri] ([Is_Turu_ID], [Tur_Adi], [Tur_Aciklama], [Is_Active]) VALUES (1, N'Alış-Veriş Merkezi', N'AVM Yapımı', 1)
INSERT [dbo].[Is_Turleri] ([Is_Turu_ID], [Tur_Adi], [Tur_Aciklama], [Is_Active]) VALUES (2, N'Konut', N'Konut Yapmı', 1)
INSERT [dbo].[Is_Turleri] ([Is_Turu_ID], [Tur_Adi], [Tur_Aciklama], [Is_Active]) VALUES (3, N'Park ve Bahçe', N'Park ve Bahçe Yapımı', 1)
INSERT [dbo].[Is_Turleri] ([Is_Turu_ID], [Tur_Adi], [Tur_Aciklama], [Is_Active]) VALUES (4, N'Dekorasyan', N'Dekorasyon Yapımı', 1)
SET IDENTITY_INSERT [dbo].[Is_Turleri] OFF
SET IDENTITY_INSERT [dbo].[Musteriler] ON 

INSERT [dbo].[Musteriler] ([Musteri_ID], [Sifre], [Ad], [Soyad], [Bas_Harfler], [Departman_Adi], [Dogum_Tarihi], [E_Mail], [Telefon_No], [Vasfi], [Image], [Is_Active]) VALUES (2, N'123456', N'mert cemal                                        ', N'aydın                                                                                               ', N'MA        ', N'Pazarlama                                                                                           ', CAST(N'2008-08-28' AS Date), N'enis1903karagoz@gmail.com                                                                           ', N'05111111111', N'Müdür                                             ', NULL, 1)
INSERT [dbo].[Musteriler] ([Musteri_ID], [Sifre], [Ad], [Soyad], [Bas_Harfler], [Departman_Adi], [Dogum_Tarihi], [E_Mail], [Telefon_No], [Vasfi], [Image], [Is_Active]) VALUES (3, N'123456', N'emre                                              ', N'borucu                                                                                              ', N'EB        ', N'İnsan Kaynakları                                                                                    ', CAST(N'1980-09-30' AS Date), N'cimbom_alper_1998@hotmail.com                                                                       ', N'05222313131', N'Müdür                                             ', NULL, 1)
INSERT [dbo].[Musteriler] ([Musteri_ID], [Sifre], [Ad], [Soyad], [Bas_Harfler], [Departman_Adi], [Dogum_Tarihi], [E_Mail], [Telefon_No], [Vasfi], [Image], [Is_Active]) VALUES (4, N'123456', N'Alican                                            ', N'Özşiray                                                                                             ', N'AÖ        ', N'deneme                                                                                              ', CAST(N'2000-12-12' AS Date), N'alicanozsiray@gmail.com                                                                             ', N'555        ', N'sikko                                             ', NULL, 0)
INSERT [dbo].[Musteriler] ([Musteri_ID], [Sifre], [Ad], [Soyad], [Bas_Harfler], [Departman_Adi], [Dogum_Tarihi], [E_Mail], [Telefon_No], [Vasfi], [Image], [Is_Active]) VALUES (5, N'123456', N'Safak                                             ', N'Cifci                                                                                               ', N'SC        ', N'deneme                                                                                              ', CAST(N'2000-12-12' AS Date), N'eniskaragoz2@gmail.com                                                                              ', N'555        ', N'sikko                                             ', NULL, 0)
INSERT [dbo].[Musteriler] ([Musteri_ID], [Sifre], [Ad], [Soyad], [Bas_Harfler], [Departman_Adi], [Dogum_Tarihi], [E_Mail], [Telefon_No], [Vasfi], [Image], [Is_Active]) VALUES (6, N'123456', N'Erkam                                             ', N'Kaya                                                                                                ', N'EK        ', N'deneme3                                                                                             ', CAST(N'1998-03-02' AS Date), N'kaya@gmail.com                                                                                      ', N'1111       ', N'deneme4                                           ', NULL, 1)
SET IDENTITY_INSERT [dbo].[Musteriler] OFF
SET IDENTITY_INSERT [dbo].[Personeller] ON 

INSERT [dbo].[Personeller] ([Personel_ID], [Derpartman_ID], [Sifre], [Ad], [Soyad], [Bas_Harfler], [Dogum_Tarihi], [E_Mail], [Telefon_No], [Vasfi], [Ise_Giris_Tarihi], [Yillik_Izin_Gun_Sayisi], [Image], [Admin], [Is_Active]) VALUES (1, 1, N'123456789', N'Alper                                                                                               ', N'Yazır                                                                                               ', N'AY        ', CAST(N'1998-08-22' AS Date), N'alperyzrr@gmail.com     ', N'05469131998', N'Müdür                                             ', CAST(N'2005-03-20' AS Date), 20, NULL, 0, 1)
INSERT [dbo].[Personeller] ([Personel_ID], [Derpartman_ID], [Sifre], [Ad], [Soyad], [Bas_Harfler], [Dogum_Tarihi], [E_Mail], [Telefon_No], [Vasfi], [Ise_Giris_Tarihi], [Yillik_Izin_Gun_Sayisi], [Image], [Admin], [Is_Active]) VALUES (6, 2, N'123456', N'Enis                                                                                                ', N'Karagöz                                                                                             ', N'EK        ', CAST(N'1998-11-09' AS Date), N'eniskaragoz2@gmail.com                                                                              ', N'05375675329', N'Müdür                                             ', CAST(N'2005-12-08' AS Date), 20, NULL, 1, 1)
INSERT [dbo].[Personeller] ([Personel_ID], [Derpartman_ID], [Sifre], [Ad], [Soyad], [Bas_Harfler], [Dogum_Tarihi], [E_Mail], [Telefon_No], [Vasfi], [Ise_Giris_Tarihi], [Yillik_Izin_Gun_Sayisi], [Image], [Admin], [Is_Active]) VALUES (7, 14, N'1234567', N'Erkam                                                                                               ', N'Kaya                                                                                                ', N'EK        ', CAST(N'1998-02-04' AS Date), N'erkamkayaasasa@outlook.com.tr   ', N'05555555555', N'Personel                                          ', CAST(N'2018-04-25' AS Date), 0, NULL, 1, 1)
INSERT [dbo].[Personeller] ([Personel_ID], [Derpartman_ID], [Sifre], [Ad], [Soyad], [Bas_Harfler], [Dogum_Tarihi], [E_Mail], [Telefon_No], [Vasfi], [Ise_Giris_Tarihi], [Yillik_Izin_Gun_Sayisi], [Image], [Admin], [Is_Active]) VALUES (8, 15, N'1234', N'Mert Cemal', N'Cifci', N'MA', CAST(N'1999-05-10' AS Date), N'mert2@gmail.com', N'1111', N'Personel', CAST(N'2018-05-11' AS Date), NULL, NULL, 0, 0)
INSERT [dbo].[Personeller] ([Personel_ID], [Derpartman_ID], [Sifre], [Ad], [Soyad], [Bas_Harfler], [Dogum_Tarihi], [E_Mail], [Telefon_No], [Vasfi], [Ise_Giris_Tarihi], [Yillik_Izin_Gun_Sayisi], [Image], [Admin], [Is_Active]) VALUES (9, 10, N'123', N'Şafak', N'Cifci', N'SC', CAST(N'1999-07-15' AS Date), N'sfk@gmail.com', N'555', N'Personel', CAST(N'2018-05-13' AS Date), 14, NULL, 0, 0)
INSERT [dbo].[Personeller] ([Personel_ID], [Derpartman_ID], [Sifre], [Ad], [Soyad], [Bas_Harfler], [Dogum_Tarihi], [E_Mail], [Telefon_No], [Vasfi], [Ise_Giris_Tarihi], [Yillik_Izin_Gun_Sayisi], [Image], [Admin], [Is_Active]) VALUES (10, 13, N'123', N'Alican', N'Özşiray', N'AÖ', CAST(N'1999-03-12' AS Date), N'ss@gmail.com', N'555', N'Personel', CAST(N'2018-05-13' AS Date), 15, NULL, 0, 0)
INSERT [dbo].[Personeller] ([Personel_ID], [Derpartman_ID], [Sifre], [Ad], [Soyad], [Bas_Harfler], [Dogum_Tarihi], [E_Mail], [Telefon_No], [Vasfi], [Ise_Giris_Tarihi], [Yillik_Izin_Gun_Sayisi], [Image], [Admin], [Is_Active]) VALUES (11, 15, N'123', N'Safak', N'Cifci', N'SC', CAST(N'1998-02-06' AS Date), N'qwe@gmail.com', N'555', N'Müdür', CAST(N'2018-05-13' AS Date), 17, NULL, 0, 0)
INSERT [dbo].[Personeller] ([Personel_ID], [Derpartman_ID], [Sifre], [Ad], [Soyad], [Bas_Harfler], [Dogum_Tarihi], [E_Mail], [Telefon_No], [Vasfi], [Ise_Giris_Tarihi], [Yillik_Izin_Gun_Sayisi], [Image], [Admin], [Is_Active]) VALUES (12, 8, N'123', N'alpay', N'kocatürk', N'AK', CAST(N'1998-01-01' AS Date), N'yalova77a@gmail.com', N'5000000000', N'Personel', CAST(N'2018-05-13' AS Date), 36, NULL, 0, 0)
INSERT [dbo].[Personeller] ([Personel_ID], [Derpartman_ID], [Sifre], [Ad], [Soyad], [Bas_Harfler], [Dogum_Tarihi], [E_Mail], [Telefon_No], [Vasfi], [Ise_Giris_Tarihi], [Yillik_Izin_Gun_Sayisi], [Image], [Admin], [Is_Active]) VALUES (13, 3, N'123', N'ali', N'veli', N'av', CAST(N'1999-01-01' AS Date), N'aliveli@hotmail.com', N'300', N'Personel', CAST(N'2018-05-13' AS Date), 11, NULL, 0, 0)
INSERT [dbo].[Personeller] ([Personel_ID], [Derpartman_ID], [Sifre], [Ad], [Soyad], [Bas_Harfler], [Dogum_Tarihi], [E_Mail], [Telefon_No], [Vasfi], [Ise_Giris_Tarihi], [Yillik_Izin_Gun_Sayisi], [Image], [Admin], [Is_Active]) VALUES (14, 11, N'123', N'Alican', N'Cifci', N'SC', CAST(N'1995-11-15' AS Date), N'aysefatma@gmail.com', N'555', N'Personel', CAST(N'2018-05-13' AS Date), 13, NULL, 0, 0)
INSERT [dbo].[Personeller] ([Personel_ID], [Derpartman_ID], [Sifre], [Ad], [Soyad], [Bas_Harfler], [Dogum_Tarihi], [E_Mail], [Telefon_No], [Vasfi], [Ise_Giris_Tarihi], [Yillik_Izin_Gun_Sayisi], [Image], [Admin], [Is_Active]) VALUES (15, 12, N'123', N'Safak', N'Cifci', N'SC', CAST(N'1952-03-08' AS Date), N'aaa@gmail.com', N'555', N'Müdür', CAST(N'2018-05-13' AS Date), 14, NULL, 0, 0)
INSERT [dbo].[Personeller] ([Personel_ID], [Derpartman_ID], [Sifre], [Ad], [Soyad], [Bas_Harfler], [Dogum_Tarihi], [E_Mail], [Telefon_No], [Vasfi], [Ise_Giris_Tarihi], [Yillik_Izin_Gun_Sayisi], [Image], [Admin], [Is_Active]) VALUES (16, 13, N'123', N'Alican', N'Cifci', N'AÖ', CAST(N'1997-01-29' AS Date), N'bb@gmail.com', N'555', N'Personel', CAST(N'2018-05-13' AS Date), 17, NULL, 0, 0)
INSERT [dbo].[Personeller] ([Personel_ID], [Derpartman_ID], [Sifre], [Ad], [Soyad], [Bas_Harfler], [Dogum_Tarihi], [E_Mail], [Telefon_No], [Vasfi], [Ise_Giris_Tarihi], [Yillik_Izin_Gun_Sayisi], [Image], [Admin], [Is_Active]) VALUES (17, 10, N'202CB962AC59075B964B07152D234B70', N'Alican', N'Aydın', N'SC', CAST(N'2018-04-30' AS Date), N'a@gmail.com', N'555', N'Personel', CAST(N'2018-05-27' AS Date), 13, NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[Personeller] OFF
SET IDENTITY_INSERT [dbo].[Saat] ON 

INSERT [dbo].[Saat] ([Id], [saat], [IsActive]) VALUES (1, CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[Saat] ([Id], [saat], [IsActive]) VALUES (2, CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[Saat] ([Id], [saat], [IsActive]) VALUES (3, CAST(N'11:00:00' AS Time), 1)
INSERT [dbo].[Saat] ([Id], [saat], [IsActive]) VALUES (4, CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Saat] ([Id], [saat], [IsActive]) VALUES (5, CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[Saat] ([Id], [saat], [IsActive]) VALUES (6, CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[Saat] ([Id], [saat], [IsActive]) VALUES (7, CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[Saat] ([Id], [saat], [IsActive]) VALUES (8, CAST(N'16:00:00' AS Time), 1)
INSERT [dbo].[Saat] ([Id], [saat], [IsActive]) VALUES (9, CAST(N'17:00:00' AS Time), 0)
SET IDENTITY_INSERT [dbo].[Saat] OFF
SET IDENTITY_INSERT [dbo].[Toplanti_Onemi] ON 

INSERT [dbo].[Toplanti_Onemi] ([Toplanti_Onemi_ID], [Toplanti_Isim], [Toplanti_Durum]) VALUES (1, N'Olağan', NULL)
INSERT [dbo].[Toplanti_Onemi] ([Toplanti_Onemi_ID], [Toplanti_Isim], [Toplanti_Durum]) VALUES (2, N'Öncelikli', NULL)
INSERT [dbo].[Toplanti_Onemi] ([Toplanti_Onemi_ID], [Toplanti_Isim], [Toplanti_Durum]) VALUES (3, N'Önemli', NULL)
SET IDENTITY_INSERT [dbo].[Toplanti_Onemi] OFF
SET IDENTITY_INSERT [dbo].[Toplantilar] ON 

INSERT [dbo].[Toplantilar] ([Toplanti_ID], [Toplanti_Tarih], [Saat_ID], [Toplanti_Onemi_ID], [Toplanti_Ad], [Toplanti_Aciklama], [Katılan_Personeller], [Katılan_Musteri], [Is_Active]) VALUES (1, CAST(N'2018-05-09' AS Date), 4, 2, N'Alican', N'csacsz', N'Alper,Enis,Erkam,', N'mert cemal                                        ,emre                                              ,Erkam                                             ,Çetin                                             ', 1)
SET IDENTITY_INSERT [dbo].[Toplantilar] OFF
ALTER TABLE [dbo].[Saat] ADD  CONSTRAINT [DF_Saat_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Is_Detay]  WITH CHECK ADD  CONSTRAINT [FK_Is_Detay_Departmanlar] FOREIGN KEY([Departman_ID])
REFERENCES [dbo].[Departmanlar] ([Departman_ID])
GO
ALTER TABLE [dbo].[Is_Detay] CHECK CONSTRAINT [FK_Is_Detay_Departmanlar]
GO
ALTER TABLE [dbo].[Is_Detay]  WITH CHECK ADD  CONSTRAINT [FK_Is_Detay_Is_Turleri] FOREIGN KEY([Is_Turu_ID])
REFERENCES [dbo].[Is_Turleri] ([Is_Turu_ID])
GO
ALTER TABLE [dbo].[Is_Detay] CHECK CONSTRAINT [FK_Is_Detay_Is_Turleri]
GO
ALTER TABLE [dbo].[Is_Detay]  WITH CHECK ADD  CONSTRAINT [FK_Is_Detay_Personeller] FOREIGN KEY([Personel_ID])
REFERENCES [dbo].[Personeller] ([Personel_ID])
GO
ALTER TABLE [dbo].[Is_Detay] CHECK CONSTRAINT [FK_Is_Detay_Personeller]
GO
ALTER TABLE [dbo].[Is_Detay]  WITH CHECK ADD  CONSTRAINT [FK_Is_Detay_Toplanti_Onemi] FOREIGN KEY([Toplanti_Onemi_ID])
REFERENCES [dbo].[Toplanti_Onemi] ([Toplanti_Onemi_ID])
GO
ALTER TABLE [dbo].[Is_Detay] CHECK CONSTRAINT [FK_Is_Detay_Toplanti_Onemi]
GO
ALTER TABLE [dbo].[Izindekiler]  WITH CHECK ADD  CONSTRAINT [FK_Izindekiler_Departmanlar] FOREIGN KEY([Deparman_ID])
REFERENCES [dbo].[Departmanlar] ([Departman_ID])
GO
ALTER TABLE [dbo].[Izindekiler] CHECK CONSTRAINT [FK_Izindekiler_Departmanlar]
GO
ALTER TABLE [dbo].[Izindekiler]  WITH CHECK ADD  CONSTRAINT [FK_Izindekiler_Personeller] FOREIGN KEY([Personel_ID])
REFERENCES [dbo].[Personeller] ([Personel_ID])
GO
ALTER TABLE [dbo].[Izindekiler] CHECK CONSTRAINT [FK_Izindekiler_Personeller]
GO
ALTER TABLE [dbo].[Personeller]  WITH CHECK ADD  CONSTRAINT [FK_Personeller_Departmanlar] FOREIGN KEY([Derpartman_ID])
REFERENCES [dbo].[Departmanlar] ([Departman_ID])
GO
ALTER TABLE [dbo].[Personeller] CHECK CONSTRAINT [FK_Personeller_Departmanlar]
GO
ALTER TABLE [dbo].[Toplantilar]  WITH CHECK ADD  CONSTRAINT [FK_Toplantilar_Saat] FOREIGN KEY([Saat_ID])
REFERENCES [dbo].[Saat] ([Id])
GO
ALTER TABLE [dbo].[Toplantilar] CHECK CONSTRAINT [FK_Toplantilar_Saat]
GO
ALTER TABLE [dbo].[Toplantilar]  WITH CHECK ADD  CONSTRAINT [FK_Toplantilar_Toplanti_Onemi] FOREIGN KEY([Toplanti_Onemi_ID])
REFERENCES [dbo].[Toplanti_Onemi] ([Toplanti_Onemi_ID])
GO
ALTER TABLE [dbo].[Toplantilar] CHECK CONSTRAINT [FK_Toplantilar_Toplanti_Onemi]
GO
USE [master]
GO
ALTER DATABASE [KurumsalAjanda] SET  READ_WRITE 
GO
