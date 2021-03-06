USE [master]
GO
/****** Object:  Database [ASP-LinkedUp]    Script Date: 6/15/2022 11:26:49 PM ******/
CREATE DATABASE [ASP-LinkedUp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASP-LinkedUp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ASP-LinkedUp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASP-LinkedUp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ASP-LinkedUp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ASP-LinkedUp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASP-LinkedUp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASP-LinkedUp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASP-LinkedUp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASP-LinkedUp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ASP-LinkedUp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASP-LinkedUp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET RECOVERY FULL 
GO
ALTER DATABASE [ASP-LinkedUp] SET  MULTI_USER 
GO
ALTER DATABASE [ASP-LinkedUp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASP-LinkedUp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASP-LinkedUp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASP-LinkedUp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASP-LinkedUp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ASP-LinkedUp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ASP-LinkedUp', N'ON'
GO
ALTER DATABASE [ASP-LinkedUp] SET QUERY_STORE = OFF
GO
USE [ASP-LinkedUp]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/15/2022 11:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/15/2022 11:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ParentId] [int] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryTopics]    Script Date: 6/15/2022 11:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryTopics](
	[CategoryId] [int] NOT NULL,
	[TopicId] [int] NOT NULL,
 CONSTRAINT [PK_CategoryTopics] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[TopicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Connections]    Script Date: 6/15/2022 11:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Connections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SenderId] [int] NOT NULL,
	[RecieverId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Connections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExceptionLogs]    Script Date: 6/15/2022 11:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExceptionLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExceptionType] [nvarchar](50) NULL,
	[Exception] [nvarchar](max) NULL,
	[ExceptionDateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ExceptionLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Intercations]    Script Date: 6/15/2022 11:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Intercations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Interaction] [int] NOT NULL,
	[PostIntercationId] [int] NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_Intercations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Media]    Script Date: 6/15/2022 11:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MediaType] [int] NOT NULL,
	[Path] [nvarchar](100) NOT NULL,
	[Size] [float] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Media] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 6/15/2022 11:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Read] [int] NOT NULL,
	[Action] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
	[ActionByUserId] [int] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostMedia]    Script Date: 6/15/2022 11:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostMedia](
	[PostId] [int] NOT NULL,
	[MediaId] [int] NOT NULL,
 CONSTRAINT [PK_PostMedia] PRIMARY KEY CLUSTERED 
(
	[MediaId] ASC,
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 6/15/2022 11:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[PostId] [int] NULL,
	[UserId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostTopics]    Script Date: 6/15/2022 11:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTopics](
	[PostId] [int] NOT NULL,
	[TopicId] [int] NOT NULL,
 CONSTRAINT [PK_PostTopics] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[TopicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 6/15/2022 11:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Topics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 6/15/2022 11:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UseCaseName] [nvarchar](50) NOT NULL,
	[User] [nvarchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[ExecutionDateTime] [datetime2](7) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[Duration] [int] NOT NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInterests]    Script Date: 6/15/2022 11:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInterests](
	[UserId] [int] NOT NULL,
	[TopicId] [int] NOT NULL,
 CONSTRAINT [PK_UserInterests] PRIMARY KEY CLUSTERED 
(
	[TopicId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/15/2022 11:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[UserName] [nvarchar](40) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[MediaId] [int] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 6/15/2022 11:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[UseCaseId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220606151914_complete_db_migration', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220610124551_added_use_case_logger', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220610130547_added_exception_log', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220613195747_updated_users_table', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220615201051_interaction_table_repairs', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[ExceptionLogs] ON 

INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (1, NULL, N'User Anonymous has tried to execute Ef register user command without being authorized to do so.', CAST(N'2022-06-10T13:43:52.0866700' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (2, NULL, N'User Anonymous has tried to execute Ef register user command without being authorized to do so.', CAST(N'2022-06-10T13:43:13.4603955' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (3, NULL, N'User Anonymous has tried to execute Ef register user command without being authorized to do so.', CAST(N'2022-06-10T13:43:53.0464132' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (4, NULL, N'Property of name Username doesn''t exist on resulting type: LinkedUp.Domain.User.', CAST(N'2022-06-13T20:09:19.6062725' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (5, NULL, N'Property of name Username doesn''t exist on resulting type: LinkedUp.Domain.User.', CAST(N'2022-06-13T20:09:33.3161794' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (6, NULL, N'Property of name Username doesn''t exist on resulting type: LinkedUp.Domain.User.', CAST(N'2022-06-13T20:10:36.1758429' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (7, NULL, N'Property of name Username doesn''t exist on resulting type: LinkedUp.Domain.User.', CAST(N'2022-06-13T20:10:47.3536859' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (8, NULL, N'Missing map from LinkedUp.Domain.Post to LinkedUp.Application.DataTransfer.PostDto. Create using CreateMap<Post, PostDto>.', CAST(N'2022-06-13T20:13:00.7510316' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (9, NULL, N'Missing map from LinkedUp.Domain.Post to LinkedUp.Application.DataTransfer.PostDto. Create using CreateMap<Post, PostDto>.', CAST(N'2022-06-13T20:13:12.0541248' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (10, NULL, N'User Anonymous has tried to execute Ef get one user query without being authorized to do so.', CAST(N'2022-06-13T21:20:05.3839712' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (11, NULL, N'User Anonymous has tried to execute Ef get one user query without being authorized to do so.', CAST(N'2022-06-13T21:20:17.3206879' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (12, NULL, N'An error occurred while updating the entries. See the inner exception for details.', CAST(N'2022-06-15T01:08:22.3560501' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (13, NULL, N'An error occurred while updating the entries. See the inner exception for details.', CAST(N'2022-06-15T01:09:38.6951789' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (14, NULL, N'An error occurred while updating the entries. See the inner exception for details.', CAST(N'2022-06-15T01:13:44.1818257' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (15, NULL, N'The instance of entity type ''UserUseCase'' cannot be tracked because another instance with the same key value for {''UseCaseId'', ''UserId''} is already being tracked. When attaching existing entities, ensure that only one entity instance with a given key value is attached. Consider using ''DbContextOptionsBuilder.EnableSensitiveDataLogging'' to see the conflicting key values.', CAST(N'2022-06-15T01:45:05.2021943' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (16, NULL, N'The instance of entity type ''UserUseCase'' cannot be tracked because another instance with the same key value for {''UseCaseId'', ''UserId''} is already being tracked. When attaching existing entities, ensure that only one entity instance with a given key value is attached. Consider using ''DbContextOptionsBuilder.EnableSensitiveDataLogging'' to see the conflicting key values.', CAST(N'2022-06-15T01:47:49.2250496' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (17, NULL, N'The instance of entity type ''UserUseCase'' cannot be tracked because another instance with the same key value for {''UseCaseId'', ''UserId''} is already being tracked. When attaching existing entities, ensure that only one entity instance with a given key value is attached. Consider using ''DbContextOptionsBuilder.EnableSensitiveDataLogging'' to see the conflicting key values.', CAST(N'2022-06-15T01:50:25.8774782' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (18, NULL, N'An error occurred while updating the entries. See the inner exception for details.', CAST(N'2022-06-15T01:56:05.4634849' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (19, NULL, N'An error occurred while updating the entries. See the inner exception for details.', CAST(N'2022-06-15T01:56:53.4492973' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (20, NULL, N'User Anonymous has tried to execute Ef get posts without being authorized to do so.', CAST(N'2022-06-15T01:58:32.4715691' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (21, NULL, N'User Anonymous has tried to execute Ef get posts without being authorized to do so.', CAST(N'2022-06-15T01:58:45.0090897' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (22, NULL, N'No service for type ''LinkedUp.Application.UseCases.Queries.Posts.IGetOnePostQuery'' has been registered.', CAST(N'2022-06-15T16:46:26.8282859' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (23, NULL, N'No service for type ''LinkedUp.Application.UseCases.Queries.Posts.IGetOnePostQuery'' has been registered.', CAST(N'2022-06-15T16:47:00.2632131' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (24, NULL, N'No service for type ''LinkedUp.Application.UseCases.Queries.Posts.IGetOnePostQuery'' has been registered.', CAST(N'2022-06-15T16:47:01.7150727' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (25, NULL, N'No service for type ''LinkedUp.Application.UseCases.Queries.Posts.IGetOnePostQuery'' has been registered.', CAST(N'2022-06-15T16:47:02.5945250' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (26, NULL, N'No service for type ''LinkedUp.Application.UseCases.Queries.Posts.IGetOnePostQuery'' has been registered.', CAST(N'2022-06-15T16:47:52.2331240' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (27, NULL, N'No service for type ''LinkedUp.Application.UseCases.Queries.Posts.IGetOnePostQuery'' has been registered.', CAST(N'2022-06-15T16:47:59.4417852' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (28, NULL, N'No service for type ''LinkedUp.Application.UseCases.Queries.Posts.IGetOnePostQuery'' has been registered.', CAST(N'2022-06-15T16:48:00.6011410' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (29, NULL, N'No service for type ''LinkedUp.Application.UseCases.Queries.Posts.IGetOnePostQuery'' has been registered.', CAST(N'2022-06-15T16:48:38.0085227' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (30, NULL, N'No service for type ''LinkedUp.Application.UseCases.Queries.Posts.IGetOnePostQuery'' has been registered.', CAST(N'2022-06-15T16:48:39.4071402' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (31, NULL, N'No service for type ''LinkedUp.Application.UseCases.Queries.Posts.IGetOnePostQuery'' has been registered.', CAST(N'2022-06-15T16:48:40.2144758' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (32, NULL, N'No service for type ''LinkedUp.Application.UseCases.Queries.Posts.IGetOnePostQuery'' has been registered.', CAST(N'2022-06-15T16:48:40.6274919' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (33, NULL, N'No service for type ''LinkedUp.Application.UseCases.Queries.Posts.IGetOnePostQuery'' has been registered.', CAST(N'2022-06-15T16:48:41.0871398' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (34, NULL, N'No service for type ''LinkedUp.Application.UseCases.Queries.Posts.IGetOnePostQuery'' has been registered.', CAST(N'2022-06-15T16:48:41.4997028' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (35, NULL, N'No applicable method ''ToLower'' exists in type ''User''', CAST(N'2022-06-15T16:49:51.0168264' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (36, NULL, N'No applicable method ''ToLower'' exists in type ''User''', CAST(N'2022-06-15T16:50:02.7278803' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (37, NULL, N'Property of name UserName doesn''t exist on resulting type: LinkedUp.Domain.Post.', CAST(N'2022-06-15T16:55:44.1886551' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (38, NULL, N'Property of name UserName doesn''t exist on resulting type: LinkedUp.Domain.Post.', CAST(N'2022-06-15T16:55:57.0606573' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (39, NULL, N'Validation failed: 
 -- Content: Post content is required. Severity: Error
 -- UserId: User is required. Severity: Error
 -- UserId: Provided user doesn''t exist. Severity: Error', CAST(N'2022-06-15T18:20:47.1542660' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (40, NULL, N'Validation failed: 
 -- Content: Post content is required. Severity: Error
 -- UserId: User is required. Severity: Error
 -- UserId: Provided user doesn''t exist. Severity: Error', CAST(N'2022-06-15T18:20:50.7142678' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (41, NULL, N'Error mapping types.

Mapping types:
CreatePostDto -> Post
LinkedUp.Application.DataTransfer.CreatePostDto -> LinkedUp.Domain.Post

Type Map configuration:
CreatePostDto -> Post
LinkedUp.Application.DataTransfer.CreatePostDto -> LinkedUp.Domain.Post

Destination Member:
PostMedia
', CAST(N'2022-06-15T18:25:33.7731479' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (42, NULL, N'Error mapping types.

Mapping types:
CreatePostDto -> Post
LinkedUp.Application.DataTransfer.CreatePostDto -> LinkedUp.Domain.Post

Type Map configuration:
CreatePostDto -> Post
LinkedUp.Application.DataTransfer.CreatePostDto -> LinkedUp.Domain.Post

Destination Member:
PostMedia
', CAST(N'2022-06-15T18:25:39.4006141' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (43, NULL, N'Error mapping types.

Mapping types:
CreatePostDto -> Post
LinkedUp.Application.DataTransfer.CreatePostDto -> LinkedUp.Domain.Post

Type Map configuration:
CreatePostDto -> Post
LinkedUp.Application.DataTransfer.CreatePostDto -> LinkedUp.Domain.Post

Destination Member:
PostMedia
', CAST(N'2022-06-15T18:29:52.0149372' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (44, NULL, N'Error mapping types.

Mapping types:
CreatePostDto -> Post
LinkedUp.Application.DataTransfer.CreatePostDto -> LinkedUp.Domain.Post

Type Map configuration:
CreatePostDto -> Post
LinkedUp.Application.DataTransfer.CreatePostDto -> LinkedUp.Domain.Post

Destination Member:
PostMedia
', CAST(N'2022-06-15T18:30:03.3037469' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (45, NULL, N'Error mapping types.

Mapping types:
CreatePostDto -> Post
LinkedUp.Application.DataTransfer.CreatePostDto -> LinkedUp.Domain.Post

Type Map configuration:
CreatePostDto -> Post
LinkedUp.Application.DataTransfer.CreatePostDto -> LinkedUp.Domain.Post

Destination Member:
PostMedia
', CAST(N'2022-06-15T18:31:28.1806629' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (46, NULL, N'The entity type ''CreatePostDto'' was not found. Ensure that the entity type has been added to the model.', CAST(N'2022-06-15T18:32:18.3978364' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (47, NULL, N'The entity type ''CreatePostDto'' was not found. Ensure that the entity type has been added to the model.', CAST(N'2022-06-15T18:32:21.4009909' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (48, NULL, N'The entity type ''CreatePostDto'' was not found. Ensure that the entity type has been added to the model.', CAST(N'2022-06-15T18:35:14.9856560' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (49, NULL, N'User Anonymous has tried to execute Ef delete post command without being authorized to do so.', CAST(N'2022-06-15T18:51:56.2174521' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (50, NULL, N'User Anonymous has tried to execute Ef delete post command without being authorized to do so.', CAST(N'2022-06-15T18:52:05.4476627' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (51, NULL, N'User marava@gmail.com has tried to execute Ef delete post command without being authorized to do so.', CAST(N'2022-06-15T18:54:07.4388809' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (52, NULL, N'User marava@gmail.com has tried to execute Ef delete post command without being authorized to do so.', CAST(N'2022-06-15T18:54:16.8522634' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (53, NULL, N'No service for type ''LinkedUp.Application.UseCases.Commands.Users.IUpdateUserCommand'' has been registered.', CAST(N'2022-06-15T19:05:36.7160864' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (54, NULL, N'Validation failed: 
 -- UserId: Provided user doesn''t exist. Severity: Error', CAST(N'2022-06-15T20:29:43.3056080' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (55, NULL, N'Validation failed: 
 -- UserId: Provided user doesn''t exist. Severity: Error', CAST(N'2022-06-15T20:29:45.9394537' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionType], [Exception], [ExceptionDateTime]) VALUES (56, NULL, N'No service for type ''LinkedUp.Application.UseCases.Commands.Interaction.IDeleteInteractionCommand'' has been registered.', CAST(N'2022-06-15T20:44:46.6497999' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ExceptionLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Intercations] ON 

INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (5, 1, 15, 2, NULL, N'Voluptatem vel atque odit excepturi occaecati atque.
Qui nobis est blanditiis alias dolorem officiis quod sed.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (6, 9, 6, 2, NULL, N'Vitae repellat quia consequatur quidem.
Rerum maiores et.
Corrupti enim sit.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (7, 9, 11, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (8, 9, 10, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (9, 10, 14, 2, NULL, N'Consequatur illo voluptate ad fuga est accusantium quia.
Itaque ut voluptas nam.
Sed aut libero.
Velit voluptatum ea placeat praesentium voluptatem facere nemo officiis.
Aspernatur et esse repellendus quasi enim autem.
Iste nam accusantium voluptas minus et.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (10, 10, 11, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (11, 10, 7, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (12, 11, 8, 2, NULL, N'Autem animi quisquam culpa.
Aut tenetur saepe et ex qui quidem veniam consequuntur.
Ratione exercitationem et sit et esse beatae.
Ea officia iure accusantium eaque.
Tenetur consequatur aliquid fuga id voluptatem.
Id dolores facilis quos magni sapiente optio sed.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (13, 11, 7, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (14, 11, 17, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (15, 11, 12, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (16, 12, 8, 2, NULL, N'Ipsum nemo rem iste facere asperiores atque mollitia.
Et et necessitatibus explicabo totam accusamus sit.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (17, 12, 11, 2, NULL, N'Voluptatem doloremque nam est sit.
Sit delectus facere reiciendis quisquam beatae.
Rerum dolor sed occaecati occaecati illo iste sint.
Vel quos est iure culpa.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (18, 9, 12, 2, NULL, N'Quia dolorum facere aut exercitationem.
Sunt quis nemo.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (19, 12, 15, 2, NULL, N'Nisi omnis animi aut id.
Est et numquam ut consequatur id sit cumque ut aspernatur.
Esse repudiandae in laboriosam architecto sint recusandae.
Corrupti sapiente earum et perferendis omnis ducimus maiores.
Eum numquam temporibus soluta accusamus vel sapiente.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (20, 12, 16, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (21, 13, 4, 2, NULL, N'Est consequatur cum.
Placeat itaque sunt quaerat laborum.
Provident quis impedit debitis amet velit.
Deserunt voluptas quas esse eveniet tempore provident debitis et minus.
Repellat ad magnam doloremque et est dolor.
Deleniti doloribus tempora est nemo debitis.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (22, 13, 8, 2, NULL, N'Aliquam cum distinctio perspiciatis deserunt est eos accusantium eius minima.
Suscipit blanditiis vero atque et quis sed ea voluptatem voluptas.
Sapiente suscipit sunt eligendi in at.
Ullam voluptatum ipsa debitis voluptatem eum fugit eaque eum vero.
Nemo omnis sunt fugit.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (23, 13, 17, 2, NULL, N'Modi nam voluptatem aut non a iste qui fuga.
Explicabo atque deleniti nostrum fugiat accusantium.
Dolor molestias velit sunt maxime doloribus in minima.
Unde labore ipsam aut aspernatur cumque necessitatibus omnis aut.
Sequi sed in veritatis eos repellendus quasi aspernatur quisquam.
Quisquam voluptas vel quo aut.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (24, 13, 11, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (25, 13, 10, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (26, 14, 12, 2, NULL, N'Amet aliquam autem nostrum voluptatem ut.
Cumque sapiente possimus quo totam ratione impedit excepturi.
Dolores ut aut harum.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (27, 14, 14, 2, NULL, N'Dolore earum velit et sit dolor autem ut.
Sed voluptas temporibus est blanditiis nihil eos qui libero deserunt.
Qui quam consequatur possimus deleniti.
Quasi corporis aut occaecati et necessitatibus in porro optio.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (28, 14, 13, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (29, 14, 5, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (30, 14, 6, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (31, 15, 8, 2, NULL, N'Amet magni qui et possimus quia ducimus repudiandae.
Occaecati assumenda commodi alias id dolor unde.
Necessitatibus eligendi aliquid non doloremque aliquid quia.
Iste incidunt quidem commodi ex commodi dignissimos.
Qui qui eaque vero et qui.
Sint molestiae qui similique labore sunt.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (32, 12, 7, 2, NULL, N'Itaque dignissimos qui numquam odit quasi dolorem qui illo.
Reprehenderit necessitatibus omnis fuga adipisci voluptatum.
Molestias voluptas sit esse consequatur.
Mollitia illum eum sed et non id harum.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (33, 9, 18, 2, NULL, N'Quibusdam officiis rem.
Quis molestiae at molestiae hic corrupti.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (34, 8, 12, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (35, 8, 6, 2, NULL, N'Voluptas voluptatibus est consequatur et et nobis deleniti magnam.
Recusandae quod ipsum eos.
Quod voluptas aut cumque.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (36, 2, 16, 2, NULL, N'Unde est odit harum sint sequi dolor.
Labore velit sunt consequatur.
Quia sequi voluptas reiciendis unde debitis eos.
Debitis nesciunt tempora fugiat dolor quidem dolor ut.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (37, 2, 10, 2, NULL, N'Sed veniam quibusdam tempora molestiae consectetur non mollitia.
Dicta qui hic sint architecto fugiat.
Corporis non sit in consectetur vitae dolorem est possimus.
Pariatur corporis explicabo aspernatur alias aperiam aliquam maiores fuga et.
Dolores modi dolorum eos voluptas.
Earum enim adipisci eius voluptatibus consequuntur totam magni.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (38, 2, 14, 2, NULL, N'Aperiam praesentium consectetur rem alias laboriosam.
Quas nostrum dicta temporibus.
Non ducimus voluptas dignissimos aut nemo qui quaerat.
Laboriosam aut suscipit natus cumque.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (39, 3, 11, 2, NULL, N'Aliquid exercitationem et.
Harum amet qui possimus.
Eos magni natus eligendi vel adipisci ipsum temporibus quasi et.
Pariatur maiores at sed ea quos maiores perspiciatis id sunt.
Praesentium ipsam qui earum voluptatem aut voluptatum et omnis.
Vitae qui consequatur.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (40, 3, 11, 2, NULL, N'Voluptatum cum facere optio veritatis.
Ipsam ut qui qui qui deserunt.
Ipsam voluptatem accusamus numquam vel ducimus omnis temporibus.
Necessitatibus cum recusandae ratione modi vero id et.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (41, 3, 6, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (42, 4, 16, 2, NULL, N'At veritatis velit.
Illum id facilis illum quo.
Blanditiis eveniet doloremque veniam fugit.
Aut officiis praesentium dolores doloremque consequatur laudantium et soluta sed.
Unde aliquid nulla doloribus beatae consequatur omnis alias.
Rerum qui modi ad cum aut in quo non.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (43, 4, 16, 2, NULL, N'Qui ipsum est ipsa ab at optio provident qui omnis.
Sequi qui assumenda fugiat.
Iste et quod eum iure earum.
Et ipsam eum voluptatem quis reprehenderit reiciendis possimus.
Tempore deserunt optio non ut eaque.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (44, 4, 12, 2, NULL, N'Dolores dolores in quo suscipit et.
Sint magnam nihil quia facere alias aut.
Voluptas libero magni incidunt et.
Et repellendus architecto omnis sint amet praesentium.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (45, 4, 13, 2, NULL, N'Iste voluptate dolores quaerat totam qui culpa exercitationem laudantium.
Molestiae eveniet placeat delectus est consequatur non ut quis.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (46, 4, 14, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (47, 5, 9, 2, NULL, N'Omnis culpa alias voluptate.
Error quasi amet quis quaerat sed error eligendi fugiat.
Reiciendis reprehenderit corrupti voluptatum repellendus sunt quam quas.
Rem aut architecto.
Dolore quisquam et.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (48, 5, 4, 2, NULL, N'Nesciunt magnam qui necessitatibus rem.
Quae quibusdam consequatur enim molestiae.
Aliquid dolor qui numquam.
Voluptas magnam blanditiis temporibus cupiditate delectus eligendi.
Voluptas beatae quam laudantium dicta.
Ut saepe hic deserunt facere amet totam quis exercitationem.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (49, 5, 4, 2, NULL, N'Ipsum a voluptates.
Est et sit iusto.
Quas aliquam ut numquam praesentium.
Unde magni rerum et magnam consequuntur soluta velit voluptatum ut.
Ea repudiandae iste minima.
Totam maiores aut voluptas quod.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (50, 6, 11, 2, NULL, N'Voluptas omnis possimus non.
Perferendis nam sunt quas beatae doloribus voluptatibus.
Ad ullam veniam quia similique nam ullam cumque ut vel.
Ut laudantium consequatur qui sit sint.
At recusandae quis deleniti ipsam.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (51, 6, 11, 2, NULL, N'Dolores rerum eius consequatur.
Voluptate earum labore consequatur sit repudiandae.
Nemo molestiae atque repellendus.
Nisi a sunt consequatur recusandae iure maiores qui eos ab.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (52, 6, 6, 2, NULL, N'Voluptatem non voluptas provident nostrum.
Numquam commodi odio.
Vero eos velit amet.
Enim ea tempore.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (53, 6, 10, 2, NULL, N'Quasi ipsam alias expedita.
Assumenda ea pariatur perspiciatis voluptate recusandae nam reprehenderit consequatur minus.
Dolorem corporis excepturi culpa.
Reiciendis et non in nulla veritatis ad.
Ut nihil deserunt ducimus voluptatibus eos non non.
Sed ducimus a deserunt culpa ducimus sed sed.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (54, 6, 12, 2, NULL, N'Molestiae modi repellat.
Odit reiciendis vel ullam enim voluptatem.
Iure hic sint et optio doloribus ut aut unde consequatur.
Ut et voluptatibus voluptas autem blanditiis eum facere eaque.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (55, 6, 15, 2, NULL, N'Temporibus ea aliquam ullam est ullam culpa asperiores.
Quia voluptates nobis repellat quo maiores.
Omnis et voluptatibus praesentium natus odit.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (56, 6, 18, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (57, 7, 10, 2, NULL, N'Ea ex occaecati in est id dicta eum distinctio iste.
Sunt enim sint asperiores incidunt nesciunt sint est dignissimos.
Iure saepe excepturi libero totam dicta.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (58, 7, 7, 2, NULL, N'Minima voluptate dolore et maxime aliquid consequuntur.
Ratione consequatur nam iusto dolores doloremque explicabo ratione.
Inventore a et et.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (59, 7, 5, 2, NULL, N'Quas earum qui.
Qui sunt optio architecto beatae.
Nihil magni sed.
Nihil laboriosam eius velit rerum quia quisquam non.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (60, 7, 18, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (61, 8, 15, 2, NULL, N'Consequuntur et qui quis inventore qui voluptas nisi libero.
Eos ratione praesentium hic sed inventore quaerat suscipit eos.
Consequuntur voluptatibus explicabo repellendus recusandae et consequatur.
Velit sed illum sit.
Accusantium tempore eum veritatis et eius at nihil ut inventore.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (62, 8, 18, 2, NULL, N'Accusamus est quod in eos facilis dolorem.
Exercitationem reiciendis sint nulla provident.
Ut velit non quis sit vel vero aperiam et voluptas.', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (63, 15, 7, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (64, 15, 18, 0, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Intercations] ([Id], [PostId], [UserId], [Interaction], [PostIntercationId], [Content], [CreatedAt], [DeletedAt], [DeletedBy], [IsActive], [UpdatedAt], [UpdatedBy]) VALUES (68, 1, 4, 2, NULL, N'Neki komentar', CAST(N'2022-06-15T20:37:10.2059671' AS DateTime2), NULL, NULL, 0, CAST(N'2022-06-15T20:51:53.8790383' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Intercations] OFF
GO
SET IDENTITY_INSERT [dbo].[Media] ON 

INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (1, 0, N'2e5ba5d8-89d9-47bf-90ba-5ef844595154.jpg', 1714, CAST(N'2022-06-15T01:25:29.4384266' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (2, 0, N'e62f733a-cd69-4e89-ae8b-7de03187399c.jpg', 907, CAST(N'2022-06-15T01:25:29.4384278' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (3, 0, N'3caa25a0-8c17-42c3-8ec0-15522b9e3afe.jpg', 998, CAST(N'2022-06-15T01:25:29.4384282' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (4, 0, N'03552042-b2c2-47ef-9500-455556d12e9a.jpg', 992, CAST(N'2022-06-15T01:25:29.4384286' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (5, 0, N'daad8042-9635-45c3-af14-344b017f657f.jpg', 1868, CAST(N'2022-06-15T01:25:29.4384290' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (6, 0, N'6622fc0a-e1b8-4256-91e3-1433170a4802.jpg', 1789, CAST(N'2022-06-15T01:25:29.4384294' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (7, 0, N'60ff05f7-f5bc-4fa0-a36e-54100e670b3e.jpg', 331, CAST(N'2022-06-15T01:25:29.4384301' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (8, 0, N'c0bb97b6-7b19-46ab-937c-31412d9dd575.jpg', 1754, CAST(N'2022-06-15T01:25:29.4384305' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (9, 0, N'dbacc9f8-c57a-4540-8aed-69522b0b2b98.jpg', 1605, CAST(N'2022-06-15T01:25:29.4384309' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (10, 0, N'd8df824c-5508-4b17-9121-41c46d47b040.jpg', 888, CAST(N'2022-06-15T01:25:29.4384313' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (11, 0, N'55b70a7a-6c30-45b4-b4b6-fe7b6e4bb6a5.jpg', 1403, CAST(N'2022-06-15T01:25:29.4384317' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (12, 0, N'a9d4138e-075d-4109-9764-a786a3b0ae37.jpg', 431, CAST(N'2022-06-15T01:25:29.4384321' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (13, 0, N'6c359b7d-b7e2-41b9-807b-cf6433291c0f.jpg', 1849, CAST(N'2022-06-15T01:25:29.4384325' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (14, 0, N'499a6905-6f6f-460b-9605-bca939f4587b.jpg', 146, CAST(N'2022-06-15T01:25:29.4384329' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (15, 0, N'9b99ef9b-1fc3-4e34-912c-e2e0f8edc344.jpg', 1783, CAST(N'2022-06-15T01:25:29.4384333' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (16, 0, N'622c8cb5-bc22-443c-a49f-79f7fb92777f.jpg', 1159, CAST(N'2022-06-15T01:25:29.4384337' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (17, 0, N'dc7e82fd-411e-4bb7-8c8e-db6f3a5ecbc6.jpg', 596, CAST(N'2022-06-15T01:25:29.4384341' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (18, 0, N'44622f47-1c18-435d-bd84-7d2323288800.jpg', 1974, CAST(N'2022-06-15T01:25:29.4384344' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (19, 0, N'51a176f3-fddc-4cc1-a0ae-01fe25794063.jpg', 1082, CAST(N'2022-06-15T01:25:29.4384348' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (20, 0, N'eb25600b-9329-49ab-8587-16227ca1451a.jpg', 399, CAST(N'2022-06-15T01:25:29.4384351' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (21, 0, N'c81417a4-9a9e-48cc-b882-7bf8410ed1e2.jpg', 1723, CAST(N'2022-06-15T01:25:29.4384356' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (22, 0, N'91d4bfee-89b7-487e-bbf2-5b32e43b0c8e.jpg', 373, CAST(N'2022-06-15T01:25:29.4384359' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (23, 0, N'6578cb9d-50ab-4fd7-972c-03ef4562d022.jpg', 1295, CAST(N'2022-06-15T01:25:29.4384274' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (24, 0, N'64e64990-5580-4f8d-808b-b5dad7478366.jpg', 1849, CAST(N'2022-06-15T01:25:29.4384270' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (25, 0, N'83d844ba-3e66-450e-9d88-1204e20d2d66.jpg', 777, CAST(N'2022-06-15T01:25:29.4384367' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (26, 0, N'46e5c2d0-cb38-4b4c-8eae-baa091c87429.jpg', 1177, CAST(N'2022-06-15T01:25:29.4384261' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (27, 0, N'd77b7e7b-a1d9-499a-827d-eeb1e20a0e41.jpg', 1204, CAST(N'2022-06-15T01:25:29.4384257' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (28, 0, N'baaedfce-b34c-4504-8dc5-2da071da6bb9.jpg', 970, CAST(N'2022-06-15T01:25:29.4384254' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (29, 0, N'649ef2b5-3b5d-41ce-98cc-3ed0dfac544e.jpg', 1264, CAST(N'2022-06-15T01:25:29.4384250' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (30, 0, N'1ee43cf3-14ab-4c0c-a526-f031a8ca6847.jpg', 1426, CAST(N'2022-06-15T01:25:29.4384246' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (31, 0, N'953006a8-02b3-48df-99b1-744f4e23933e.jpg', 1278, CAST(N'2022-06-15T01:25:29.4384242' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (32, 0, N'37f89c5b-effe-4759-a7bf-99ea176ea8dc.jpg', 1905, CAST(N'2022-06-15T01:25:29.4384238' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (33, 0, N'c0268f76-25fb-4705-8573-bbf8a5f6b1e7.jpg', 303, CAST(N'2022-06-15T01:25:29.4384234' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (34, 0, N'baea6dfd-7ca5-44f9-b578-69b18a636749.jpg', 1760, CAST(N'2022-06-15T01:25:29.4384229' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (35, 0, N'03cd49d5-d495-4938-8557-9c9f6e5837fb.jpg', 1291, CAST(N'2022-06-15T01:25:29.4384364' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Media] ([Id], [MediaType], [Path], [Size], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (36, 0, N'84f7fe37-e413-4be2-97c9-7d93c986fb8b.jpg', 0, CAST(N'2022-06-15T18:44:25.9252538' AS DateTime2), 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Media] OFF
GO
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (1, 16)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (1, 35)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (2, 1)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (2, 17)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (3, 4)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (4, 5)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (4, 21)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (4, 28)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (5, 6)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (6, 9)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (6, 11)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (6, 27)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (6, 30)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (7, 7)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (8, 26)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (9, 18)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (9, 23)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (10, 20)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (10, 29)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (10, 34)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (11, 22)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (11, 25)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (12, 12)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (13, 3)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (13, 8)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (13, 15)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (13, 24)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (13, 32)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (14, 10)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (14, 13)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (14, 19)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (15, 2)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (15, 14)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (15, 31)
INSERT [dbo].[PostMedia] ([PostId], [MediaId]) VALUES (15, 33)
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [Content], [PostId], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (1, N'Qui nulla dolor. Autem itaque exercitationem dolor molestiae. Omnis ea facilis id et fuga qui aut. Sed expedita est voluptatem veniam ipsam debitis.

Non ea ipsum recusandae. Vitae quis voluptatem nisi unde. Quia et voluptate voluptates eius molestiae non fuga. Consequuntur incidunt amet deleniti. Ab autem libero culpa dolores voluptatem dolores aut ratione. Quasi provident nulla magni error.

Veniam ut velit sit suscipit dolore vel quae ea. Aliquam minus voluptatem ullam quia est. Tempora nihil et sunt. Cupiditate adipisci adipisci quisquam voluptatem voluptas nobis beatae et.', NULL, 18, CAST(N'2022-06-15T01:25:29.4384072' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Content], [PostId], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (2, N'Cupiditate voluptate blanditiis rerum ipsa exercitationem. Est natus atque ut vitae adipisci ut tempora. Expedita placeat et ab qui numquam aut optio quibusdam.

Non maiores ab sapiente quia sint ratione dolore eum. Animi aut soluta. Et numquam voluptates rerum.

Qui facilis est. Soluta reiciendis sapiente eos nemo id omnis. Pariatur quos et nihil. Occaecati consequatur error quae quisquam voluptas quod. Facilis aut sint.', NULL, 4, CAST(N'2022-06-15T01:25:29.4384061' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Content], [PostId], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (3, N'Ut repellat est quam deserunt aspernatur vitae consequuntur eos expedita. Quis veritatis quod rerum omnis doloremque blanditiis est delectus qui. Ullam aut et. Quisquam accusamus ipsam vitae saepe. Ipsum veritatis ducimus excepturi architecto iste ipsum.

Nihil aut quia rerum laudantium. Possimus velit dolorem voluptates ipsum repellendus unde velit dolorem. Necessitatibus voluptas ut vel non consequatur dolor voluptas. Velit alias nostrum iusto est rem.

Et nemo inventore sunt repellat. Occaecati delectus libero quos. Quisquam quo dolorum et. Vel sit temporibus itaque voluptates.', NULL, 4, CAST(N'2022-06-15T01:25:29.4384079' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Content], [PostId], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (4, N'Unde molestiae porro tempora nobis. Et explicabo id sint debitis. Voluptatem voluptatem adipisci.

Facilis a ab quaerat. Sit quaerat repellat inventore. Sit nam consequatur.

Natus et laudantium sint temporibus dignissimos corporis. Accusamus nisi asperiores quasi voluptas voluptatibus officia nostrum iusto magnam. Sit similique repellat ipsa vel velit blanditiis.', NULL, 6, CAST(N'2022-06-15T01:25:29.4384039' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Content], [PostId], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (5, N'Non nemo ut quia. Incidunt et esse placeat unde hic occaecati est. Sed et nihil repellat pariatur autem quod voluptatem. Commodi eum et et hic cupiditate dolores molestiae. Id perspiciatis enim nostrum nam rerum asperiores iste. Consequatur ut quia cupiditate.

Cumque et expedita natus quia et consequuntur blanditiis. Quidem accusamus nostrum cumque. Nihil necessitatibus et fuga dolore dolor odit. Repudiandae hic qui consequatur nostrum culpa. Omnis praesentium voluptas tempora minima tenetur aut et sunt quisquam.

Dicta et et quibusdam deserunt nostrum reiciendis. Sint molestiae culpa ad illum sed veniam. Impedit quod sed est. Cupiditate molestiae quia doloremque et nihil fuga. Voluptatem quae et laborum quia sit aliquid quaerat sequi.', NULL, 6, CAST(N'2022-06-15T01:25:29.4384089' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Content], [PostId], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (6, N'Architecto perferendis at aut error. Quod libero qui nesciunt eum sint. Veritatis error quidem voluptatum voluptas non accusamus ex nobis. Debitis cum nam facilis sint recusandae saepe omnis sint corrupti. Rem molestias sunt exercitationem laudantium expedita.

Explicabo eos numquam iure facere aut blanditiis quo repellendus iure. Nulla a reprehenderit sed aut sed ut omnis. Id fugiat est enim. Qui deserunt illo. Dolor corporis accusamus.

Officia doloremque distinctio quis voluptates provident. Eius aut neque. Rerum quas beatae iure mollitia explicabo error eveniet praesentium.', NULL, 6, CAST(N'2022-06-15T01:25:29.4384092' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Content], [PostId], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (7, N'Excepturi non incidunt. Esse sunt nesciunt. Ad perferendis omnis recusandae rem eos. Architecto facere nihil minima omnis in quo aperiam aperiam. Consequatur qui aspernatur aliquam quia fuga doloribus.

Fuga omnis vel reprehenderit mollitia velit autem quos sit expedita. Corrupti illum nulla eveniet enim modi molestiae cupiditate at. Tempore quia velit laudantium quae ut inventore incidunt. Iure temporibus velit atque. Minima eligendi ea eum vitae iure voluptates.

Enim inventore omnis reiciendis sed maiores. Cumque totam rerum ad hic autem dolor non unde non. Quaerat eos ut ut quis. Suscipit et in eos explicabo. Totam et at quibusdam molestiae ea. Nostrum at et magnam est quia.', NULL, 7, CAST(N'2022-06-15T01:25:29.4384053' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Content], [PostId], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (8, N'Dolores perferendis velit fugiat omnis est et ipsum consequatur. Maiores reiciendis et quaerat. Maiores qui accusantium saepe.

Consequatur est ex assumenda consequatur id enim. Dicta sapiente id. Placeat consequatur et officiis praesentium accusantium assumenda doloribus cupiditate nam. Neque molestiae qui aperiam recusandae facere. Sint placeat laboriosam ipsum nobis. Nulla et sit doloribus et.

Adipisci eum repellat placeat aliquam non aut soluta. Quia necessitatibus et ratione neque consectetur laboriosam sint nihil suscipit. Quibusdam quae vero rerum culpa.', NULL, 7, CAST(N'2022-06-15T01:25:29.4384070' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Content], [PostId], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (9, N'Rerum quis quasi qui quo. Vero provident eos quidem. Minima quia a saepe. Eligendi ut vero cumque velit odio autem numquam dolores. Explicabo ut ea minima qui consectetur vero. Aliquid necessitatibus dolorum cumque sint culpa omnis eaque.

Tenetur sint animi adipisci rerum nulla iure ut sed quia. Quas voluptates at ipsam. Doloremque rerum quia. Illo ab nihil blanditiis id consequatur eius asperiores eum. Earum neque minus corrupti voluptatem.

Ut voluptatem sint. Nobis maiores soluta molestias nulla reiciendis voluptas eum quam unde. Eos pariatur fugiat ut dolores ratione officia earum fuga.', NULL, 8, CAST(N'2022-06-15T01:25:29.4384076' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Content], [PostId], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (10, N'Ut excepturi molestiae minima sequi quasi est. Fugit ullam assumenda numquam facilis officia velit ipsa id accusantium. Voluptatum aspernatur culpa aliquam non illo.

Perferendis laborum in est reiciendis magni. Quo veritatis et illum quis in sequi saepe nobis. Quidem minima est ut fugiat non dicta exercitationem. Minus laudantium quia quaerat ut modi sint id quidem ut. Et autem dicta accusamus officiis ut est.

Voluptatem quia sed eveniet et necessitatibus omnis doloribus. Sit in quos ex. Qui enim reprehenderit. Non deserunt est autem sint unde ratione aut voluptas. Omnis reprehenderit corrupti animi. Omnis officiis velit quaerat molestiae.', NULL, 12, CAST(N'2022-06-15T01:25:29.4384057' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Content], [PostId], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (11, N'Placeat minima sunt eius error vel ducimus veniam velit iste. Earum dolor corporis qui aliquam. Harum quibusdam nihil iure. A inventore et et et perspiciatis aperiam. Quae dolor nemo. Aut accusamus possimus ad itaque quia veritatis ut.

Voluptas dolor veritatis. Id reprehenderit temporibus quis veniam exercitationem. Quia voluptatem aperiam ex voluptas excepturi ut.

Molestias quas harum architecto. Culpa dolores voluptates optio voluptatum. Voluptatem voluptate hic exercitationem vitae quod molestiae earum.', NULL, 12, CAST(N'2022-06-15T01:25:29.4384066' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Content], [PostId], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (12, N'Voluptates molestiae consequatur ullam sit. Nisi iste minima consequatur est nisi. Dolor repudiandae quia rerum quam sit totam repellendus eveniet esse. Adipisci reiciendis natus debitis vitae quas suscipit numquam cum. A repudiandae fuga assumenda molestias ut et minus.

Dolorem cum deserunt illum consequuntur quia totam eaque non nesciunt. Aut perferendis mollitia odit ex aut. Rem est aperiam iste libero enim.

Omnis quia voluptates deleniti modi illo quod provident rerum occaecati. Maxime facere debitis eaque exercitationem alias. Numquam hic ut accusantium nam sequi expedita.', NULL, 10, CAST(N'2022-06-15T01:25:29.4384045' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Content], [PostId], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (13, N'Pariatur ut consequatur voluptatem mollitia consequuntur. Nostrum consequuntur minus recusandae iusto enim atque et. Delectus dolores quo mollitia minus id iste. Inventore ad aspernatur non.

Qui dignissimos autem ex soluta cum excepturi quasi voluptatem. Modi placeat dolorem ut qui dolor cum esse. Beatae amet occaecati et nam. Aut quo vero voluptatem quia accusantium consequuntur omnis. Repudiandae corrupti rerum repudiandae et.

Eveniet maiores dicta. Maiores sunt quis similique ad. Nobis sequi et similique ullam vel magni. Sunt delectus expedita consequatur dolorem animi aspernatur ut. Aliquid aspernatur eos voluptas laborum in aut quis sed. Nostrum libero ut nihil quis maiores est nisi aut ut.', NULL, 14, CAST(N'2022-06-15T01:25:29.4384049' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Content], [PostId], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (14, N'Officia rerum quia maxime. Ipsum aut sed et. Esse nostrum quam magni quos autem architecto cumque. Ea illo vero officiis magnam ut. Exercitationem deserunt iure earum neque labore ut recusandae voluptas aut.

Veritatis quod odio dignissimos et aperiam. Nobis officiis architecto autem voluptatibus. Omnis culpa neque dolores minus architecto quasi voluptas ad.

Voluptatem cum error dolor. Atque et occaecati quo et quidem. Delectus est nihil quo hic eius ipsa modi. Ea consequuntur laborum expedita quod quibusdam mollitia ut consequatur. Temporibus et modi nostrum possimus rem quia. Iure enim ad ut sed.', NULL, 15, CAST(N'2022-06-15T01:25:29.4384086' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Content], [PostId], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (15, N'Odio quam voluptatem quo. Voluptas eos odio rerum laudantium sint. Aut est saepe in porro velit ut voluptatem est ipsa. Culpa eos aut dolorum molestias soluta nisi esse quas. Dolorem et culpa molestiae soluta quas et aliquid.

Magnam cumque aut quia quia nostrum numquam modi dolores. Nostrum dolorum in libero nobis cumque qui. Harum possimus perspiciatis ab. Adipisci veniam tenetur enim est aperiam. Quidem ut debitis quia et debitis neque fugiat esse numquam.

Sint et ea. Aliquam repudiandae et voluptatibus. Omnis porro aut. Sed quis omnis saepe magnam.', NULL, 16, CAST(N'2022-06-15T01:25:29.4384082' AS DateTime2), 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Content], [PostId], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (16, N'Test ', NULL, 4, CAST(N'2022-06-15T18:23:33.8058681' AS DateTime2), 0, CAST(N'2022-06-15T19:00:41.3132246' AS DateTime2), N'marava@gmail.com', CAST(N'2022-06-15T19:00:41.3711888' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Content], [PostId], [UserId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy]) VALUES (17, N'Test 2', NULL, 4, CAST(N'2022-06-15T18:44:25.9251786' AS DateTime2), 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (1, N'Ef register user command', N'Anonymous', 0, CAST(N'2022-06-10T13:43:05.6244303' AS DateTime2), N'{"Email":"marava@gmail.com","FirstName":"Milos","LastName":"Maravic","UserName":"marava23","Password":"sifra123$"}', 0)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (2, N'Ef register user command', N'Anonymous', 0, CAST(N'2022-06-10T13:43:51.9922766' AS DateTime2), N'{"Email":"marava@gmail.com","FirstName":"Milos","LastName":"Maravic","UserName":"marava23","Password":"sifra123$"}', 0)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (3, N'Ef register user command', N'Anonymous', 0, CAST(N'2022-06-12T23:55:03.1452577' AS DateTime2), N'{"Email":"marava@gmail.com","FirstName":"Milos","LastName":"Maravic","UserName":"marava23","Password":"sifra123$","Id":0,"CreatedAt":"0001-01-01T00:00:00","IsActive":false,"DeletedAt":null,"DeletedBy":null,"UpdatedAt":null,"UpdatedBy":null}', 6501)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (4, N'Ef get users', N'Anonymous', 0, CAST(N'2022-06-13T20:57:06.8765777' AS DateTime2), N'{"Keyword":null,"PerPage":15,"Page":1}', 11806)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (5, N'Ef get users', N'Anonymous', 0, CAST(N'2022-06-13T21:03:50.1246250' AS DateTime2), N'{"Keyword":"ne","PerPage":15,"Page":1}', 6730)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (6, N'Ef get one user query', N'Anonymous', 0, CAST(N'2022-06-13T21:21:27.6684352' AS DateTime2), N'3', 3812)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (7, N'Ef get posts', N'Anonymous', 0, CAST(N'2022-06-15T02:00:05.2381188' AS DateTime2), N'{"Keyword":null,"PerPage":15,"Page":1}', 3505)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (8, N'Ef get posts', N'Anonymous', 0, CAST(N'2022-06-15T02:02:21.2106407' AS DateTime2), N'{"Keyword":null,"PerPage":15,"Page":1}', 3264)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (9, N'Ef get posts', N'Anonymous', 0, CAST(N'2022-06-15T16:43:26.3164469' AS DateTime2), N'{"Keyword":null,"PerPage":15,"Page":1}', 5284)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (10, N'Ef get posts', N'Anonymous', 0, CAST(N'2022-06-15T16:49:04.3947066' AS DateTime2), N'{"Keyword":null,"PerPage":15,"Page":1}', 1031)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (11, N'Ef get posts', N'Anonymous', 0, CAST(N'2022-06-15T16:49:20.5869482' AS DateTime2), N'{"Keyword":null,"PerPage":15,"Page":1}', 54)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (12, N'Ef get one post', N'Anonymous', 0, CAST(N'2022-06-15T16:58:10.2899343' AS DateTime2), N'4', 3593)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (13, N'Ef Get one post query', N'Anonymous', 0, CAST(N'2022-06-15T17:06:31.6318728' AS DateTime2), N'{"Keyword":null,"PerPage":15,"Page":1}', 3447)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (14, N'Ef Get one post query', N'Anonymous', 0, CAST(N'2022-06-15T17:06:46.5621966' AS DateTime2), N'{"Keyword":"eve","PerPage":15,"Page":1}', 74)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (15, N'Ef Get one post query', N'Anonymous', 0, CAST(N'2022-06-15T17:06:54.1994493' AS DateTime2), N'{"Keyword":"e","PerPage":15,"Page":1}', 46)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (16, N'Ef create post command', N'Bria.Dickens45@example.com', 4, CAST(N'2022-06-15T18:23:34.0566566' AS DateTime2), N'{"Images":[],"Content":"Test ","UserId":4,"PostMedia":[]}', 3525)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (17, N'Ef create post command', N'Bria.Dickens45@example.com', 4, CAST(N'2022-06-15T18:44:26.1102478' AS DateTime2), N'{"Content":"Test 2","UserId":4,"PostMedia":[{"Path":"84f7fe37-e413-4be2-97c9-7d93c986fb8b.jpg","MediaType":"Image","Id":0,"CreatedAt":"2022-06-15T18:44:20.6678201Z"}]}', 4324)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (18, N'Ef delete post command', N'marava@gmail.com', 3, CAST(N'2022-06-15T19:00:41.4884425' AS DateTime2), N'16', 3378)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (19, N'Ef update user', N'marava@gmail.com', 3, CAST(N'2022-06-15T19:07:30.6406910' AS DateTime2), N'{"Email":"marava@gmail.com","FirstName":"Milos","LastName":"Maravic","UserName":"marava23","Password":"Sifra123$","Id":3,"CreatedAt":"0001-01-01T00:00:00"}', 3896)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (20, N'EfDelete user command', N'marava@gmail.com', 3, CAST(N'2022-06-15T19:11:28.2256891' AS DateTime2), N'19', 3316)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (21, N'Ef get users', N'marava@gmail.com', 3, CAST(N'2022-06-15T19:12:17.3612078' AS DateTime2), N'{"Keyword":null,"PerPage":15,"Page":1}', 27452)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (22, N'Ef get users', N'marava@gmail.com', 3, CAST(N'2022-06-15T19:13:30.5530382' AS DateTime2), N'{"Keyword":"milos","PerPage":15,"Page":1}', 25647)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (23, N'Ef create interaction command', N'Bria.Dickens45@example.com', 4, CAST(N'2022-06-15T20:30:04.3279629' AS DateTime2), N'{"PostId":1,"UserId":4,"Content":"Neki komentar","InteractionType":2,"Id":0,"CreatedAt":"0001-01-01T00:00:00"}', 202)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (24, N'Ef get one post', N'Anonymous', 0, CAST(N'2022-06-15T20:30:20.8359114' AS DateTime2), N'1', 355)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (25, N'Ef get one post', N'Anonymous', 0, CAST(N'2022-06-15T20:31:20.1137160' AS DateTime2), N'1', 19)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (26, N'Ef create interaction command', N'Bria.Dickens45@example.com', 4, CAST(N'2022-06-15T20:31:30.7385816' AS DateTime2), N'{"PostId":1,"UserId":4,"Content":"Neki komentar","InteractionType":2,"Id":0,"CreatedAt":"0001-01-01T00:00:00"}', 23)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (27, N'Ef create interaction command', N'Bria.Dickens45@example.com', 4, CAST(N'2022-06-15T20:34:40.9361536' AS DateTime2), N'{"PostId":1,"UserId":4,"Content":"Neki komentar","InteractionType":2,"Id":0,"CreatedAt":"0001-01-01T00:00:00"}', 3605)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (28, N'Ef create interaction command', N'Bria.Dickens45@example.com', 4, CAST(N'2022-06-15T20:37:10.3737745' AS DateTime2), N'{"PostId":1,"UserId":4,"Content":"Neki komentar","InteractionType":2,"Id":0,"CreatedAt":"0001-01-01T00:00:00"}', 3893)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (29, N'Ef delete interaction command', N'Bria.Dickens45@example.com', 4, CAST(N'2022-06-15T20:45:51.7960174' AS DateTime2), N'68', 4173)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (30, N'Ef delete interaction command', N'Bria.Dickens45@example.com', 4, CAST(N'2022-06-15T20:49:35.5082667' AS DateTime2), N'68', 65076)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (31, N'Ef delete interaction command', N'Bria.Dickens45@example.com', 4, CAST(N'2022-06-15T20:50:44.3764505' AS DateTime2), N'68', 41328)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (32, N'Ef delete interaction command', N'Bria.Dickens45@example.com', 4, CAST(N'2022-06-15T20:51:53.8910560' AS DateTime2), N'68', 18)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (33, N'Ef get one post', N'Anonymous', 0, CAST(N'2022-06-15T21:20:13.8788256' AS DateTime2), N'1', 330)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (34, N'Ef search logs', N'marava@gmail.com', 3, CAST(N'2022-06-15T21:20:48.1459908' AS DateTime2), N'{"From":null,"To":null,"Keyword":null,"PerPage":15,"Page":1}', 32)
INSERT [dbo].[UseCaseLogs] ([Id], [UseCaseName], [User], [UserId], [ExecutionDateTime], [Data], [Duration]) VALUES (35, N'Ef search logs', N'marava@gmail.com', 3, CAST(N'2022-06-15T21:22:25.4342613' AS DateTime2), N'{"From":null,"To":null,"Keyword":null,"PerPage":15,"Page":1}', 3002)
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [UserName], [Password], [MediaId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [IsAdmin]) VALUES (3, N'marava@gmail.com', N'Milos', N'Maravic', N'marava23', N'$2a$11$FqGCJW4fZ2sgVGrQ8/Z9oOC0gU8.GELf/HNYWTV5agpyRTeCIRTVy', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL, CAST(N'2022-06-15T19:07:30.4930783' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [UserName], [Password], [MediaId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [IsAdmin]) VALUES (4, N'Bria.Dickens45@example.com', N'Rachel', N'Kunde', N'Muriel6', N'$2a$11$cp7a9EYjqIam9aHBw/SPkOx5cuhv4aVQ3s/Y7v9W7GX/PmkCee4qK', NULL, CAST(N'2022-06-15T01:25:29.4383931' AS DateTime2), 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [UserName], [Password], [MediaId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [IsAdmin]) VALUES (5, N'Pearlie.Mitchell@example.net', N'Harrison', N'Mills', N'Wilbur_Will83', N'$2a$11$.6jwNrMlVZSSYILMjT5uwugPMZCv5jG1EnAUHiAahqPVbCXmQbpEe', NULL, CAST(N'2022-06-15T01:25:29.4383941' AS DateTime2), 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [UserName], [Password], [MediaId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [IsAdmin]) VALUES (6, N'Desiree.Kessler@example.org', N'Rossie', N'Morissette', N'Edna.Hauck', N'$2a$11$5OvYbnQB4hIWOIVNQna6fu.sS7XTKYylGSpRlYNKdjHKuCYbNlZD6', NULL, CAST(N'2022-06-15T01:25:29.4383945' AS DateTime2), 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [UserName], [Password], [MediaId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [IsAdmin]) VALUES (7, N'Madie.Nader@example.org', N'Clara', N'Johnston', N'Sherry_Torphy46', N'$2a$11$V722SeDjqyxMlZvaMk1AseX.lFQtIr5IO6MrmJ57i.QhRXpnl3b.O', NULL, CAST(N'2022-06-15T01:25:29.4383951' AS DateTime2), 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [UserName], [Password], [MediaId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [IsAdmin]) VALUES (8, N'Gillian_Walsh@example.com', N'Jacinto', N'Casper', N'Carla.Rutherford47', N'$2a$11$DabQ3CKOiZPGQXMlM806QOrOKRzRU9c5qpSkMnX0Xru2mgnnWJCDa', NULL, CAST(N'2022-06-15T01:25:29.4383958' AS DateTime2), 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [UserName], [Password], [MediaId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [IsAdmin]) VALUES (9, N'Jesse_Auer62@example.org', N'Lilliana', N'Weissnat', N'Arturo12', N'$2a$11$7wTvOAGI5zlCluHUxQEEF.ALioRA7JY/8.H839yGypvZx9bgDiNoq', NULL, CAST(N'2022-06-15T01:25:29.4383967' AS DateTime2), 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [UserName], [Password], [MediaId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [IsAdmin]) VALUES (10, N'Moriah.Kovacek@example.com', N'Tobin', N'Strosin', N'Melody63', N'$2a$11$1FiCWalHINTXQAxXAsA/Q.QQP8sSqUBvaCYcflyum2mBkR29XXWcS', NULL, CAST(N'2022-06-15T01:25:29.4384022' AS DateTime2), 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [UserName], [Password], [MediaId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [IsAdmin]) VALUES (11, N'Willard_Bins22@example.org', N'Desiree', N'Huel', N'Beverly.Fadel', N'$2a$11$sE1uzodFtb7uipDjc2h3Re9B202zNoXLcSpPb50wZKzvb6lrLvHFO', NULL, CAST(N'2022-06-15T01:25:29.4384000' AS DateTime2), 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [UserName], [Password], [MediaId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [IsAdmin]) VALUES (12, N'Ransom_Reynolds7@example.net', N'Leatha', N'Wisoky', N'John90', N'$2a$11$1n/gfJjASARcRLsN8PdvfOsInRBEVVRvI1U.7jHHvpJEYNFqnm.Se', NULL, CAST(N'2022-06-15T01:25:29.4384011' AS DateTime2), 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [UserName], [Password], [MediaId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [IsAdmin]) VALUES (13, N'Niko_Kiehn@example.net', N'Kelvin', N'Tromp', N'Hubert_Crist89', N'$2a$11$sghfHAF3..8xHJ7aNR89luaXpK8DBQe9JUN7Tc8mEkILqQCiPDLC2', NULL, CAST(N'2022-06-15T01:25:29.4384017' AS DateTime2), 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [UserName], [Password], [MediaId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [IsAdmin]) VALUES (14, N'Kiel.Greenholt@example.org', N'Kaylin', N'Herman', N'Hugh.Abshire', N'$2a$11$s25qaBQs5pG89ATgwemD.uNGQ5HoDc3NtffKGAU1VQd5L65gGjfpG', NULL, CAST(N'2022-06-15T01:25:29.4384026' AS DateTime2), 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [UserName], [Password], [MediaId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [IsAdmin]) VALUES (15, N'Scarlett31@example.org', N'Annamae', N'Hand', N'Janet.Kuhlman', N'$2a$11$GfIUiwFpTA4lcF3xd2SeBeDQTTN3CEDl0Vr7ytPLVdxprujCb3xrO', NULL, CAST(N'2022-06-15T01:25:29.4384029' AS DateTime2), 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [UserName], [Password], [MediaId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [IsAdmin]) VALUES (16, N'Guy_Schroeder@example.com', N'Leanne', N'Nolan', N'Kayla.McKenzie', N'$2a$11$tB2UsAbjdTe.gdHNh8TEn.kSJdQE6oO8Un3ERg/P7qKkDBvm.s6w2', NULL, CAST(N'2022-06-15T01:25:29.4384033' AS DateTime2), 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [UserName], [Password], [MediaId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [IsAdmin]) VALUES (17, N'Blaze_Cassin2@example.net', N'Timothy', N'Hudson', N'Jeanette64', N'$2a$11$rif1Wr52lbdgz32gvPqt..h5NL6Sl8dzKNqbv22c3qxINiscUnQ4.', NULL, CAST(N'2022-06-15T01:25:29.4383975' AS DateTime2), 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [UserName], [Password], [MediaId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [IsAdmin]) VALUES (18, N'Jonatan_Shanahan@example.org', N'Van', N'O''Conner', N'Everett_Conroy29', N'$2a$11$CuKdy6uhDE8p/YiAMXkcMu7YAEPp0d/RMc5F5O0hJeRWCy7kS8.o2', NULL, CAST(N'2022-06-15T01:25:29.4383032' AS DateTime2), 1, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [UserName], [Password], [MediaId], [CreatedAt], [IsActive], [DeletedAt], [DeletedBy], [UpdatedAt], [UpdatedBy], [IsAdmin]) VALUES (19, N'zxz', N'zXz', N'ZXzX', N'ZxzX', N'ZXzxx', NULL, CAST(N'2022-06-15T21:09:38.6233333' AS DateTime2), 0, CAST(N'2022-06-15T19:11:28.0342514' AS DateTime2), N'marava@gmail.com', CAST(N'2022-06-15T19:11:28.0749813' AS DateTime2), NULL, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (3, 1)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (3, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (3, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (3, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (3, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (3, 6)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (3, 51)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (3, 52)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (3, 53)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (3, 54)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (3, 60)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (3, 61)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (3, 62)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (3, 63)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (3, 100)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (3, 101)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (3, 102)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 53)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 60)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 61)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 62)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (4, 63)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 53)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 60)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 61)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 62)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (5, 63)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 53)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 60)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 61)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 62)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 63)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 53)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 60)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 61)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 62)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (7, 63)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 53)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 60)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 61)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 62)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (8, 63)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (9, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (9, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (9, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (9, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (9, 53)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (9, 60)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (9, 61)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (9, 62)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (9, 63)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (10, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (10, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (10, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (10, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (10, 53)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (10, 60)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (10, 61)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (10, 62)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (10, 63)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (11, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (11, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (11, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (11, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (11, 53)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (11, 60)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (11, 61)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (11, 62)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (11, 63)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (12, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (12, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (12, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (12, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (12, 53)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (12, 60)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (12, 61)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (12, 62)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (12, 63)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (13, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (13, 3)
GO
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (13, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (13, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (13, 53)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (13, 60)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (13, 61)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (13, 62)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (13, 63)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (14, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (14, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (14, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (14, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (14, 53)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (14, 60)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (14, 61)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (14, 62)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (14, 63)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (15, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (15, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (15, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (15, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (15, 53)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (15, 60)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (15, 61)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (15, 62)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (15, 63)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (16, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (16, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (16, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (16, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (16, 53)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (16, 60)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (16, 61)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (16, 62)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (16, 63)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (17, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (17, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (17, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (17, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (17, 53)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (17, 60)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (17, 61)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (17, 62)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (17, 63)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (18, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (18, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (18, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (18, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (18, 53)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (18, 60)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (18, 61)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (18, 62)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (18, 63)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Categories_ParentId]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_Categories_ParentId] ON [dbo].[Categories]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryTopics_TopicId]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryTopics_TopicId] ON [dbo].[CategoryTopics]
(
	[TopicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Connections_RecieverId]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_Connections_RecieverId] ON [dbo].[Connections]
(
	[RecieverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Connections_SenderId]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_Connections_SenderId] ON [dbo].[Connections]
(
	[SenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Intercations_PostId]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_Intercations_PostId] ON [dbo].[Intercations]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Intercations_PostIntercationId]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_Intercations_PostIntercationId] ON [dbo].[Intercations]
(
	[PostIntercationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Intercations_UserId]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_Intercations_UserId] ON [dbo].[Intercations]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Media_Path]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Media_Path] ON [dbo].[Media]
(
	[Path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Notifications_ActionByUserId]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_Notifications_ActionByUserId] ON [dbo].[Notifications]
(
	[ActionByUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Notifications_UserId]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_Notifications_UserId] ON [dbo].[Notifications]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostMedia_PostId]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostMedia_PostId] ON [dbo].[PostMedia]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_UserId]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_UserId] ON [dbo].[Posts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostTopics_TopicId]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostTopics_TopicId] ON [dbo].[PostTopics]
(
	[TopicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Topics_Name]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Topics_Name] ON [dbo].[Topics]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UseCaseLogs_User]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_UseCaseLogs_User] ON [dbo].[UseCaseLogs]
(
	[User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_FirstName]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_FirstName] ON [dbo].[Users]
(
	[FirstName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_LastName]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_LastName] ON [dbo].[Users]
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_MediaId]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_MediaId] ON [dbo].[Users]
(
	[MediaId] ASC
)
WHERE ([MediaId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_UserName]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_UserName] ON [dbo].[Users]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 6/15/2022 11:26:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Connections] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Connections] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Connections] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Intercations] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Intercations] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Media] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Media] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [Read]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Topics] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Topics] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories_ParentId]
GO
ALTER TABLE [dbo].[CategoryTopics]  WITH CHECK ADD  CONSTRAINT [FK_CategoryTopics_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[CategoryTopics] CHECK CONSTRAINT [FK_CategoryTopics_Categories_CategoryId]
GO
ALTER TABLE [dbo].[CategoryTopics]  WITH CHECK ADD  CONSTRAINT [FK_CategoryTopics_Topics_TopicId] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topics] ([Id])
GO
ALTER TABLE [dbo].[CategoryTopics] CHECK CONSTRAINT [FK_CategoryTopics_Topics_TopicId]
GO
ALTER TABLE [dbo].[Connections]  WITH CHECK ADD  CONSTRAINT [FK_Connections_Users_RecieverId] FOREIGN KEY([RecieverId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Connections] CHECK CONSTRAINT [FK_Connections_Users_RecieverId]
GO
ALTER TABLE [dbo].[Connections]  WITH CHECK ADD  CONSTRAINT [FK_Connections_Users_SenderId] FOREIGN KEY([SenderId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Connections] CHECK CONSTRAINT [FK_Connections_Users_SenderId]
GO
ALTER TABLE [dbo].[Intercations]  WITH CHECK ADD  CONSTRAINT [FK_Intercations_Intercations_PostIntercationId] FOREIGN KEY([PostIntercationId])
REFERENCES [dbo].[Intercations] ([Id])
GO
ALTER TABLE [dbo].[Intercations] CHECK CONSTRAINT [FK_Intercations_Intercations_PostIntercationId]
GO
ALTER TABLE [dbo].[Intercations]  WITH CHECK ADD  CONSTRAINT [FK_Intercations_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Intercations] CHECK CONSTRAINT [FK_Intercations_Posts_PostId]
GO
ALTER TABLE [dbo].[Intercations]  WITH CHECK ADD  CONSTRAINT [FK_Intercations_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Intercations] CHECK CONSTRAINT [FK_Intercations_Users_UserId]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Users_ActionByUserId] FOREIGN KEY([ActionByUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Users_ActionByUserId]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Users_UserId]
GO
ALTER TABLE [dbo].[PostMedia]  WITH CHECK ADD  CONSTRAINT [FK_PostMedia_Media_MediaId] FOREIGN KEY([MediaId])
REFERENCES [dbo].[Media] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostMedia] CHECK CONSTRAINT [FK_PostMedia_Media_MediaId]
GO
ALTER TABLE [dbo].[PostMedia]  WITH CHECK ADD  CONSTRAINT [FK_PostMedia_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostMedia] CHECK CONSTRAINT [FK_PostMedia_Posts_PostId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users_UserId]
GO
ALTER TABLE [dbo].[PostTopics]  WITH CHECK ADD  CONSTRAINT [FK_PostTopics_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[PostTopics] CHECK CONSTRAINT [FK_PostTopics_Posts_PostId]
GO
ALTER TABLE [dbo].[PostTopics]  WITH CHECK ADD  CONSTRAINT [FK_PostTopics_Topics_TopicId] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topics] ([Id])
GO
ALTER TABLE [dbo].[PostTopics] CHECK CONSTRAINT [FK_PostTopics_Topics_TopicId]
GO
ALTER TABLE [dbo].[UserInterests]  WITH CHECK ADD  CONSTRAINT [FK_UserInterests_Topics_TopicId] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topics] ([Id])
GO
ALTER TABLE [dbo].[UserInterests] CHECK CONSTRAINT [FK_UserInterests_Topics_TopicId]
GO
ALTER TABLE [dbo].[UserInterests]  WITH CHECK ADD  CONSTRAINT [FK_UserInterests_Users_TopicId] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserInterests] CHECK CONSTRAINT [FK_UserInterests_Users_TopicId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Media_MediaId] FOREIGN KEY([MediaId])
REFERENCES [dbo].[Media] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Media_MediaId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [ASP-LinkedUp] SET  READ_WRITE 
GO
