USE [master]
GO
/****** Object:  Database [DebuggingSystem]    Script Date: 27.2.2013 ã. 23:06:12 ******/
CREATE DATABASE [DebuggingSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DebuggingSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DebuggingSystem.mdf' , SIZE = 5200KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DebuggingSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DebuggingSystem_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DebuggingSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DebuggingSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DebuggingSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DebuggingSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DebuggingSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DebuggingSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DebuggingSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [DebuggingSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DebuggingSystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DebuggingSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DebuggingSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DebuggingSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DebuggingSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DebuggingSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DebuggingSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DebuggingSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DebuggingSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DebuggingSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DebuggingSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DebuggingSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DebuggingSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DebuggingSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DebuggingSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DebuggingSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DebuggingSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DebuggingSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [DebuggingSystem] SET  MULTI_USER 
GO
ALTER DATABASE [DebuggingSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DebuggingSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DebuggingSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DebuggingSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DebuggingSystem', N'ON'
GO
USE [DebuggingSystem]
GO
/****** Object:  Table [dbo].[Bugs]    Script Date: 27.2.2013 ã. 23:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bugs](
	[BugId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Priority] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[FindDate] [datetime] NOT NULL,
	[Debugger_UserId] [int] NULL,
	[Project_ProjectId] [int] NULL,
 CONSTRAINT [PK_dbo.Bugs] PRIMARY KEY CLUSTERED 
(
	[BugId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Projects]    Script Date: 27.2.2013 ã. 23:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 27.2.2013 ã. 23:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[LastAction] [nvarchar](max) NULL,
	[LastActivity] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.UserProfile] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProjects]    Script Date: 27.2.2013 ã. 23:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProjects](
	[UserID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UserProjects] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 27.2.2013 ã. 23:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 27.2.2013 ã. 23:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 27.2.2013 ã. 23:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 27.2.2013 ã. 23:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Bugs] ON 

INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (1, N'";" missing on line -33', N'Normal', N'Deleted', CAST(0x0000A17201031CCB AS DateTime), 1, 1)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (2, N'Add reference to&amp;nbsp;System.Linq!', N'Critical', N'New', CAST(0x0000A1720104D70C AS DateTime), 1, 1)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (3, N'Another bug at line -22.', N'Low', N'New', CAST(0x0000A17201050779 AS DateTime), 1, 1)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (5, N'Extention method .Where() doesn''t work line -55', N'Critical', N'New', CAST(0x0000A17201096D7D AS DateTime), 2, 2)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (7, N'Missing reference to WebMatrix.WebData', N'Normal', N'New', CAST(0x0000A1720109F762 AS DateTime), 2, 3)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (8, N'";" missing at line -22', N'Low', N'New', CAST(0x0000A172010A3C43 AS DateTime), 1, 3)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (9, N'Missing reference to Kendo.Mvc.Extensions', N'High', N'In Progress', CAST(0x0000A172010A3DB2 AS DateTime), 1, 4)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (10, N'Wrong instance of class String', N'Normal', N'New', CAST(0x0000A172010A8403 AS DateTime), 2, 5)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (11, N'Bug found at line -43', N'Normal', N'Deleted', CAST(0x0000A172010C26ED AS DateTime), 2, 5)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (12, N'The instance of class Math chrashes...&amp;nbsp;', N'Critical', N'New', CAST(0x0000A172010C9D29 AS DateTime), 2, 4)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (13, N'Bug found at line -56', N'Low', N'In Progress', CAST(0x0000A1720114A424 AS DateTime), 3, 1)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (14, N'Missing reference to Kendo.Mvc.Extensions&lt;br /&gt;', N'High', N'New', CAST(0x0000A1720114D719 AS DateTime), 3, 2)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (15, N'Missing reference to WebMatrix.WebData&lt;br /&gt;', N'Normal', N'New', CAST(0x0000A1720114FDAB AS DateTime), 3, 3)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (16, N'";" missing on line -36&lt;br /&gt;', N'Normal', N'New', CAST(0x0000A17201151785 AS DateTime), 3, 4)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (17, N'Wrong instance of class BigInteger&lt;br /&gt;', N'Normal', N'New', CAST(0x0000A172011538BE AS DateTime), 3, 5)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (18, N'Missing reference to WebMatrix.WebData&lt;br /&gt;', N'High', N'New', CAST(0x0000A1720116071B AS DateTime), 4, 1)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (19, N'";" missing on line -33&lt;br /&gt;', N'Low', N'New', CAST(0x0000A172011619C7 AS DateTime), 4, 2)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (20, N'Extention method .Select() doesn''t work&lt;br /&gt;', N'Normal', N'Deleted', CAST(0x0000A17201163244 AS DateTime), 4, 3)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (21, N'Add reference to System.Linq&amp;lt;br /&amp;gt;', N'Low', N'Fixed', CAST(0x0000A1720116437F AS DateTime), 4, 4)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (22, N'Bug found at line -103&lt;br /&gt;', N'Critical', N'New', CAST(0x0000A17201165849 AS DateTime), 4, 5)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (23, N'Missing reference to Kendo.Mvc.Extensions&lt;br /&gt;', N'Critical', N'New', CAST(0x0000A17201172787 AS DateTime), 5, 1)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (24, N'";" missing on line -33&lt;br /&gt;', N'Critical', N'New', CAST(0x0000A172011738BD AS DateTime), 5, 2)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (25, N'Add reference to System.Linq&lt;br /&gt;', N'Normal', N'New', CAST(0x0000A17201174BC4 AS DateTime), 5, 3)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (26, N'Extention methods doesn''t work', N'High', N'Closed', CAST(0x0000A172011766F4 AS DateTime), 5, 4)
INSERT [dbo].[Bugs] ([BugId], [Description], [Priority], [Status], [FindDate], [Debugger_UserId], [Project_ProjectId]) VALUES (27, N'Bug found at line -24&amp;lt;br /&amp;gt;', N'Normal', N'Closed', CAST(0x0000A17201177961 AS DateTime), 5, 5)
SET IDENTITY_INSERT [dbo].[Bugs] OFF
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([ProjectId], [Name], [Description]) VALUES (1, N'Explain Videos', N'An application that can make short video with marketing purpose.')
INSERT [dbo].[Projects] ([ProjectId], [Name], [Description]) VALUES (2, N'Text editor', N'Useful text editor with a lot of features.')
INSERT [dbo].[Projects] ([ProjectId], [Name], [Description]) VALUES (3, N'Movie maker', N'Edit, cut and add effects to a video file and many other good things.')
INSERT [dbo].[Projects] ([ProjectId], [Name], [Description]) VALUES (4, N'SchoolAcademyCMS', N'A content management system made by Telerik School Academy. Great for e-commerse applications.')
INSERT [dbo].[Projects] ([ProjectId], [Name], [Description]) VALUES (5, N'Electronic scheme builder', N'Software for easy build electronic schemes for any electronic devices.')
SET IDENTITY_INSERT [dbo].[Projects] OFF
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserId], [UserName], [FullName], [Email], [PhoneNumber], [LastAction], [LastActivity]) VALUES (1, N'admin', N'Vesko Dimitrov', N'vidimitrov94@gmail.com', N'0896677678', N'edit bug: #27', CAST(0x0000A17201722955 AS DateTime))
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FullName], [Email], [PhoneNumber], [LastAction], [LastActivity]) VALUES (2, N'sobieski9494', N'Veselin Dimitrov', N'veselindimitrov94@abv.bg', N'0896677670', N'add bug: #12 project: SchoolAcademyCMS', CAST(0x0000A172010C9D29 AS DateTime))
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FullName], [Email], [PhoneNumber], [LastAction], [LastActivity]) VALUES (3, N'stoyan123', N'Stoyan Stoyanov', N'tankata@gmail.com', N'0897677779', N'add bug: #17 project: Electronic scheme builder', CAST(0x0000A172011538BE AS DateTime))
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FullName], [Email], [PhoneNumber], [LastAction], [LastActivity]) VALUES (4, N'ivd19', N'Ivan Dimitrov', N'ivd19@abv.bg', N'0897654321', N'add bug: #22 project: Electronic scheme builder', CAST(0x0000A17201165849 AS DateTime))
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FullName], [Email], [PhoneNumber], [LastAction], [LastActivity]) VALUES (5, N'marti94', N'Martin Borisov', N'marti_94@abv.bg', N'0897897876', N'delete bug: #20', CAST(0x0000A1720174897A AS DateTime))
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (1, 1)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (2, 1)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (3, 1)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (4, 1)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (5, 1)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (1, 2)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (2, 2)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (3, 2)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (4, 2)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (5, 2)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (1, 3)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (2, 3)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (3, 3)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (4, 3)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (5, 3)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (1, 4)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (2, 4)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (3, 4)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (4, 4)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (5, 4)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (1, 5)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (2, 5)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (3, 5)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (4, 5)
INSERT [dbo].[UserProjects] ([UserID], [ProjectID]) VALUES (5, 5)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(0x0000A17200DE91DA AS DateTime), NULL, 1, NULL, 0, N'AFvIwWv+ZFx6k1+0Q6u6NsCxB8TFhgJIwPIul4ujJw60EVqlKL+fySi7QVXhAQsQDQ==', CAST(0x0000A17200DE91DA AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (2, CAST(0x0000A17200DE91EC AS DateTime), NULL, 1, NULL, 0, N'AEJJXY0P4CvR7JvSlKTEcMe6p68vRDJcHkIA7CU2Q3W+wtyA6+zx7n4lt0RbqZUGcg==', CAST(0x0000A17200DE91EC AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (3, CAST(0x0000A17200EC3AEB AS DateTime), NULL, 1, NULL, 0, N'APPXAur0IwwZ8H99XUvzEEE94kGgwjaoGpiQoIma9Pj2tvIhxByKVDhYy4HTYLtrtA==', CAST(0x0000A17200EC3AEB AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (4, CAST(0x0000A17200F4A229 AS DateTime), NULL, 1, NULL, 0, N'AHFhOnuEcrDjFbN5bCpfXdEQSkBEJ+sB3MNG2h9GPuzHjvsbBczJLhGjiUwdHG1anw==', CAST(0x0000A17200F4A229 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (5, CAST(0x0000A17200F62293 AS DateTime), NULL, 1, NULL, 0, N'ABwDF66EluDO1mnKv/Lhp4YluHvD9q+uc1urfOlpm73Ytm6ttLFtjZX5BWHG8XTCbQ==', CAST(0x0000A17200F62293 AS DateTime), N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON 

INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (1, N'Administrator')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (2, N'Debugger')
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (2, 2)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (3, 2)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (4, 2)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (5, 2)
/****** Object:  Index [IX_Debugger_UserId]    Script Date: 27.2.2013 ã. 23:06:12 ******/
CREATE NONCLUSTERED INDEX [IX_Debugger_UserId] ON [dbo].[Bugs]
(
	[Debugger_UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Project_ProjectId]    Script Date: 27.2.2013 ã. 23:06:12 ******/
CREATE NONCLUSTERED INDEX [IX_Project_ProjectId] ON [dbo].[Bugs]
(
	[Project_ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProjectID]    Script Date: 27.2.2013 ã. 23:06:12 ******/
CREATE NONCLUSTERED INDEX [IX_ProjectID] ON [dbo].[UserProjects]
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 27.2.2013 ã. 23:06:12 ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [dbo].[UserProjects]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__webpages__8A2B6160E35D5D13]    Script Date: 27.2.2013 ã. 23:06:12 ******/
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Bugs_dbo.Projects_Project_ProjectId] FOREIGN KEY([Project_ProjectId])
REFERENCES [dbo].[Projects] ([ProjectId])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_dbo.Bugs_dbo.Projects_Project_ProjectId]
GO
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Bugs_dbo.UserProfile_Debugger_UserId] FOREIGN KEY([Debugger_UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_dbo.Bugs_dbo.UserProfile_Debugger_UserId]
GO
ALTER TABLE [dbo].[UserProjects]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserProjects_dbo.Projects_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ProjectId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserProjects] CHECK CONSTRAINT [FK_dbo.UserProjects_dbo.Projects_ProjectID]
GO
ALTER TABLE [dbo].[UserProjects]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserProjects_dbo.UserProfile_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfile] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserProjects] CHECK CONSTRAINT [FK_dbo.UserProjects_dbo.UserProfile_UserID]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
USE [master]
GO
ALTER DATABASE [DebuggingSystem] SET  READ_WRITE 
GO
