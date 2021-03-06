USE [master]
GO
/****** Object:  Database [LobbyistRegistryDM]    Script Date: 12/10/2014 10:53:04 PM ******/
CREATE DATABASE [LobbyistRegistryDM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LobbyistRegistryDM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\LobbyistRegistryDM.mdf' , SIZE = 3042304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LobbyistRegistryDM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\LobbyistRegistryDM_log.ldf' , SIZE = 102144KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LobbyistRegistryDM] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LobbyistRegistryDM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LobbyistRegistryDM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET ARITHABORT OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LobbyistRegistryDM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LobbyistRegistryDM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LobbyistRegistryDM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LobbyistRegistryDM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LobbyistRegistryDM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET RECOVERY FULL 
GO
ALTER DATABASE [LobbyistRegistryDM] SET  MULTI_USER 
GO
ALTER DATABASE [LobbyistRegistryDM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LobbyistRegistryDM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LobbyistRegistryDM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LobbyistRegistryDM] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LobbyistRegistryDM', N'ON'
GO
USE [LobbyistRegistryDM]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 12/10/2014 10:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[CNumber] [varchar](500) NULL,
	[ENameOFClient] [varchar](500) NULL,
	[FNameOfClient] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Date]    Script Date: 12/10/2014 10:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Date](
	[DCode] [varchar](500) NULL,
	[RNumber] [varchar](500) NULL,
	[RLastName] [varchar](500) NULL,
	[RFirstName] [varchar](500) NULL,
	[CDate] [datetime] NULL,
	[CerDate] [datetime] NULL,
	[PToRegistryDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimClient]    Script Date: 12/10/2014 10:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimClient](
	[ClientNumber] [varchar](500) NOT NULL,
	[EnglishNameOfClient] [varchar](500) NULL,
	[FrenchNameOfClient] [varchar](500) NULL,
 CONSTRAINT [PK_DimClient] PRIMARY KEY CLUSTERED 
(
	[ClientNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 12/10/2014 10:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateCode] [varchar](500) NOT NULL,
	[RegistrantNumber] [varchar](500) NULL,
	[RegistrantLastName] [varchar](500) NULL,
	[RegistrantFirstName] [varchar](500) NULL,
	[CommunicationDate] [datetime] NULL,
	[CertifiedDate] [datetime] NULL,
	[PostedToRegistryDate] [datetime] NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[DateCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimInstitution]    Script Date: 12/10/2014 10:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimInstitution](
	[InstitutionID] [varchar](500) NOT NULL,
	[ManuallyEnteredInstitution] [varchar](500) NULL,
	[Institution] [varchar](500) NULL,
 CONSTRAINT [PK_DimInstitution] PRIMARY KEY CLUSTERED 
(
	[InstitutionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimSender]    Script Date: 12/10/2014 10:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimSender](
	[SenderID] [varchar](500) NOT NULL,
	[SenderLastName] [varchar](500) NULL,
	[SenderFirstName] [varchar](500) NULL,
	[SenderPositionTitle] [varchar](500) NULL,
	[SenderBranch] [varchar](500) NULL,
 CONSTRAINT [PK_DimSender] PRIMARY KEY CLUSTERED 
(
	[SenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimSubject]    Script Date: 12/10/2014 10:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimSubject](
	[SubjectID] [varchar](500) NOT NULL,
	[SubjectOfCommunication] [varchar](500) NULL,
 CONSTRAINT [PK_DimSubject] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fact]    Script Date: 12/10/2014 10:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fact](
	[FID] [varchar](500) NULL,
	[COfCommunication] [int] NULL,
	[CNumber] [varchar](500) NULL,
	[DCode] [varchar](500) NULL,
	[SID] [varchar](500) NULL,
	[IID] [varchar](500) NULL,
	[SendID] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Institution]    Script Date: 12/10/2014 10:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Institution](
	[IID] [varchar](500) NULL,
	[MEnteredInstitution] [varchar](500) NULL,
	[Instit] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LobbyistRegistryFact]    Script Date: 12/10/2014 10:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LobbyistRegistryFact](
	[FactID] [varchar](500) NULL,
	[CostOfCommunication] [int] NULL,
	[ClientNumber] [varchar](500) NULL,
	[DateCode] [varchar](500) NULL,
	[SubjectID] [varchar](500) NULL,
	[InstitutionID] [varchar](500) NULL,
	[SenderID] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sender]    Script Date: 12/10/2014 10:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sender](
	[SendID] [varchar](500) NULL,
	[SLastName] [varchar](500) NULL,
	[SFirstName] [varchar](500) NULL,
	[SPositionTitle] [varchar](500) NULL,
	[SBranch] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 12/10/2014 10:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subject](
	[SID] [varchar](500) NULL,
	[SOfCommunication] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[LobbyistRegistryFact]  WITH CHECK ADD  CONSTRAINT [FK_LobbyistRegistryFact_DimClient] FOREIGN KEY([ClientNumber])
REFERENCES [dbo].[DimClient] ([ClientNumber])
GO
ALTER TABLE [dbo].[LobbyistRegistryFact] CHECK CONSTRAINT [FK_LobbyistRegistryFact_DimClient]
GO
ALTER TABLE [dbo].[LobbyistRegistryFact]  WITH CHECK ADD  CONSTRAINT [FK_LobbyistRegistryFact_DimDate] FOREIGN KEY([DateCode])
REFERENCES [dbo].[DimDate] ([DateCode])
GO
ALTER TABLE [dbo].[LobbyistRegistryFact] CHECK CONSTRAINT [FK_LobbyistRegistryFact_DimDate]
GO
ALTER TABLE [dbo].[LobbyistRegistryFact]  WITH CHECK ADD  CONSTRAINT [FK_LobbyistRegistryFact_DimInstitution] FOREIGN KEY([InstitutionID])
REFERENCES [dbo].[DimInstitution] ([InstitutionID])
GO
ALTER TABLE [dbo].[LobbyistRegistryFact] CHECK CONSTRAINT [FK_LobbyistRegistryFact_DimInstitution]
GO
ALTER TABLE [dbo].[LobbyistRegistryFact]  WITH CHECK ADD  CONSTRAINT [FK_LobbyistRegistryFact_DimSender] FOREIGN KEY([SenderID])
REFERENCES [dbo].[DimSender] ([SenderID])
GO
ALTER TABLE [dbo].[LobbyistRegistryFact] CHECK CONSTRAINT [FK_LobbyistRegistryFact_DimSender]
GO
ALTER TABLE [dbo].[LobbyistRegistryFact]  WITH CHECK ADD  CONSTRAINT [FK_LobbyistRegistryFact_DimSubject] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[DimSubject] ([SubjectID])
GO
ALTER TABLE [dbo].[LobbyistRegistryFact] CHECK CONSTRAINT [FK_LobbyistRegistryFact_DimSubject]
GO
USE [master]
GO
ALTER DATABASE [LobbyistRegistryDM] SET  READ_WRITE 
GO
