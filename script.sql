USE [KonnectUs]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 26/03/2022 6:15:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppointmnetId] [int] NOT NULL,
	[NoOfHours] [int] NOT NULL,
	[DateOfAppointment] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clinic]    Script Date: 26/03/2022 6:15:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinic](
	[DoctorId] [int] NOT NULL,
	[Place] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[TimeStart] [time](7) NOT NULL,
	[TimeEnd] [time](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Details]    Script Date: 26/03/2022 6:15:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Details](
	[Date] [datetime] NOT NULL,
	[Detail] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diseases]    Script Date: 26/03/2022 6:15:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diseases](
	[Id] [int] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[SeverityLevel] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 26/03/2022 6:15:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Speciality] [varchar](50) NOT NULL,
	[Experience] [varchar](50) NULL,
	[StartDate] [date] NOT NULL,
	[IsAvailable] [binary](50) NULL,
	[Rating] [float] NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 26/03/2022 6:15:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Rating] [float] NOT NULL,
	[Feedback] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 26/03/2022 6:15:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Id] [int] NOT NULL,
	[Age] [int] NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientHistory]    Script Date: 26/03/2022 6:15:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientHistory](
	[PatientId] [int] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Id] [int] NOT NULL,
	[NameofDisease] [varchar](50) NOT NULL,
	[ClinicVisited] [varchar](50) NOT NULL,
	[DetailsId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 26/03/2022 6:15:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[Address] [varchar](50) NULL,
	[Gender] [int] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visit]    Script Date: 26/03/2022 6:15:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visit](
	[DateTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
