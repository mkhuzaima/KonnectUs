USE [master]
GO
/****** Object:  Database [KonnectUs]    Script Date: 3/27/2022 9:49:28 AM ******/
CREATE DATABASE [KonnectUs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KonnectUs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KonnectUs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KonnectUs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KonnectUs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KonnectUs] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KonnectUs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KonnectUs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KonnectUs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KonnectUs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KonnectUs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KonnectUs] SET ARITHABORT OFF 
GO
ALTER DATABASE [KonnectUs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KonnectUs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KonnectUs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KonnectUs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KonnectUs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KonnectUs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KonnectUs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KonnectUs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KonnectUs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KonnectUs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KonnectUs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KonnectUs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KonnectUs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KonnectUs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KonnectUs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KonnectUs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KonnectUs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KonnectUs] SET RECOVERY FULL 
GO
ALTER DATABASE [KonnectUs] SET  MULTI_USER 
GO
ALTER DATABASE [KonnectUs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KonnectUs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KonnectUs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KonnectUs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KonnectUs] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KonnectUs] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'KonnectUs', N'ON'
GO
ALTER DATABASE [KonnectUs] SET QUERY_STORE = OFF
GO
USE [KonnectUs]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 3/27/2022 9:49:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hours] [int] NOT NULL,
	[appointmentDate] [datetime] NOT NULL,
	[clinicId] [int] NOT NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clinic]    Script Date: 3/27/2022 9:49:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinic](
	[location] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[openingTime] [time](7) NOT NULL,
	[closingTime] [time](7) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Clinic] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diseases]    Script Date: 3/27/2022 9:49:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diseases](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[severityLevel] [varchar](50) NOT NULL,
	[age] [int] NOT NULL,
 CONSTRAINT [PK_Diseases] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diseasesInVisit]    Script Date: 3/27/2022 9:49:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diseasesInVisit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[visitId] [int] NOT NULL,
	[diseaseId] [int] NOT NULL,
 CONSTRAINT [PK_diseasesInVisit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 3/27/2022 9:49:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[id] [int] NOT NULL,
	[Speciality] [varchar](50) NOT NULL,
	[Experience] [varchar](50) NULL,
	[StartDate] [date] NOT NULL,
	[Rating] [float] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/27/2022 9:49:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[rating] [int] NOT NULL,
	[feedback] [varchar](max) NOT NULL,
	[patientId] [int] NOT NULL,
	[doctorId] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 3/27/2022 9:49:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[id] [int] NOT NULL,
	[Age] [int] NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientHistory]    Script Date: 3/27/2022 9:49:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientHistory](
	[PatientId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[detail] [varchar](50) NOT NULL,
	[dateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_PatientHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 3/27/2022 9:49:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](11) NOT NULL,
	[Address] [varchar](50) NULL,
	[Gender] [bit] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[cnic] [nchar](13) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visit]    Script Date: 3/27/2022 9:49:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visit](
	[DateTime] [datetime] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clinicId] [int] NOT NULL,
	[patientId] [int] NOT NULL,
 CONSTRAINT [PK_Visit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Doctor] ([id], [Speciality], [Experience], [StartDate], [Rating]) VALUES (1, N'Physician', N'20', CAST(N'2022-03-27' AS Date), 4.8)
INSERT [dbo].[Doctor] ([id], [Speciality], [Experience], [StartDate], [Rating]) VALUES (2, N'Physician', N'20', CAST(N'2022-03-27' AS Date), 4.8)
INSERT [dbo].[Doctor] ([id], [Speciality], [Experience], [StartDate], [Rating]) VALUES (3, N'Physician', N'20', CAST(N'2022-03-27' AS Date), 4.8)
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([id], [Name], [PhoneNumber], [Address], [Gender], [DateOfBirth], [Password], [cnic]) VALUES (5, N'Muhammad Khuzaima Umair', N'03011234567', N'Lahore', 1, CAST(N'2022-03-27' AS Date), N'abc@xyz', NULL)
INSERT [dbo].[Person] ([id], [Name], [PhoneNumber], [Address], [Gender], [DateOfBirth], [Password], [cnic]) VALUES (6, N'Muhammad Khuzaima Umair', N'03011234567', N'Lahore', 1, CAST(N'2022-03-27' AS Date), N'abc@xyz', NULL)
INSERT [dbo].[Person] ([id], [Name], [PhoneNumber], [Address], [Gender], [DateOfBirth], [Password], [cnic]) VALUES (7, N'Muhammad Khuzaima Umair', N'03011234567', N'Lahore', 1, CAST(N'2022-03-27' AS Date), N'abc@xyz', NULL)
INSERT [dbo].[Person] ([id], [Name], [PhoneNumber], [Address], [Gender], [DateOfBirth], [Password], [cnic]) VALUES (10, N'khuzaima', N'03131234567', N'Lahore', 1, CAST(N'2003-08-15' AS Date), N'abc', N'3510206140327')
INSERT [dbo].[Person] ([id], [Name], [PhoneNumber], [Address], [Gender], [DateOfBirth], [Password], [cnic]) VALUES (11, N'khuzaima', N'03131234567', N'Lahore', 1, CAST(N'2003-08-15' AS Date), N'abc', N'3510211223347')
INSERT [dbo].[Person] ([id], [Name], [PhoneNumber], [Address], [Gender], [DateOfBirth], [Password], [cnic]) VALUES (12, N'Muhammad Khuzaima Umair', N'03011234567', N'Lahore', 1, CAST(N'2022-03-27' AS Date), N'abc@xyz', NULL)
INSERT [dbo].[Person] ([id], [Name], [PhoneNumber], [Address], [Gender], [DateOfBirth], [Password], [cnic]) VALUES (13, N'khuzaima', N'03131234567', N'Lahore', 1, CAST(N'2003-08-15' AS Date), N'abc', N'3510211223347')
INSERT [dbo].[Person] ([id], [Name], [PhoneNumber], [Address], [Gender], [DateOfBirth], [Password], [cnic]) VALUES (15, N'khuzaima', N'03131234567', N'Lahore', 1, CAST(N'2003-08-15' AS Date), N'abc', N'3510206140327')
INSERT [dbo].[Person] ([id], [Name], [PhoneNumber], [Address], [Gender], [DateOfBirth], [Password], [cnic]) VALUES (16, N'khuzaima', N'03131234567', N'Lahore', 1, CAST(N'2003-08-15' AS Date), N'abc', N'3510211223347')
INSERT [dbo].[Person] ([id], [Name], [PhoneNumber], [Address], [Gender], [DateOfBirth], [Password], [cnic]) VALUES (17, N'khuzaima', N'03131234567', N'Lahore', 1, CAST(N'2003-08-15' AS Date), N'abc', N'3510211223347')
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Clinic] FOREIGN KEY([clinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Clinic]
GO
ALTER TABLE [dbo].[diseasesInVisit]  WITH CHECK ADD  CONSTRAINT [FK_diseasesInVisit_Diseases] FOREIGN KEY([diseaseId])
REFERENCES [dbo].[Diseases] ([id])
GO
ALTER TABLE [dbo].[diseasesInVisit] CHECK CONSTRAINT [FK_diseasesInVisit_Diseases]
GO
ALTER TABLE [dbo].[diseasesInVisit]  WITH CHECK ADD  CONSTRAINT [FK_diseasesInVisit_Visit] FOREIGN KEY([visitId])
REFERENCES [dbo].[Visit] ([id])
GO
ALTER TABLE [dbo].[diseasesInVisit] CHECK CONSTRAINT [FK_diseasesInVisit_Visit]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Doctor] FOREIGN KEY([doctorId])
REFERENCES [dbo].[Doctor] ([id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Doctor]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Patient] FOREIGN KEY([patientId])
REFERENCES [dbo].[Patient] ([id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Patient]
GO
ALTER TABLE [dbo].[PatientHistory]  WITH CHECK ADD  CONSTRAINT [FK_PatientHistory_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([id])
GO
ALTER TABLE [dbo].[PatientHistory] CHECK CONSTRAINT [FK_PatientHistory_Patient]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Clinic] FOREIGN KEY([clinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Clinic]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Patient] FOREIGN KEY([patientId])
REFERENCES [dbo].[Patient] ([id])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Patient]
GO
USE [master]
GO
ALTER DATABASE [KonnectUs] SET  READ_WRITE 
GO
