USE [master]
GO
/****** Object:  Database [SoberLivingAmericaNew]    Script Date: 03-Jul-20 10:50:32 AM ******/
CREATE DATABASE [SoberLivingAmericaNew]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SoberLivingAmericaNew', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SoberLivingAmericaNew.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SoberLivingAmericaNew_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SoberLivingAmericaNew_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SoberLivingAmericaNew] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SoberLivingAmericaNew].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SoberLivingAmericaNew] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET ARITHABORT OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET RECOVERY FULL 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET  MULTI_USER 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SoberLivingAmericaNew] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SoberLivingAmericaNew] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SoberLivingAmericaNew', N'ON'
GO
ALTER DATABASE [SoberLivingAmericaNew] SET QUERY_STORE = OFF
GO
USE [SoberLivingAmericaNew]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 03-Jul-20 10:50:32 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 03-Jul-20 10:50:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[GroupName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleClaims]    Script Date: 03-Jul-20 10:50:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 03-Jul-20 10:50:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 03-Jul-20 10:50:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 03-Jul-20 10:50:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 03-Jul-20 10:50:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03-Jul-20 10:50:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[ActivatedDate] [datetime2](7) NULL,
	[Active] [bit] NULL,
	[CompanyId] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[DeactivatedDate] [datetime2](7) NULL,
	[FirstName] [nvarchar](max) NULL,
	[JobTitle] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[ModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTokens]    Script Date: 03-Jul-20 10:50:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200623103833_AddingIdentity', N'2.2.6-servicing-10079')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200623121652_Extend_IdentityUser', N'2.2.6-servicing-10079')
GO
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [ActivatedDate], [Active], [CompanyId], [CreatedBy], [CreatedDate], [DeactivatedDate], [FirstName], [JobTitle], [LastName], [ModifiedBy], [ModifiedDate]) VALUES (N'EE77486B-91F9-48F0-BEAF-F0E240A63300', NULL, NULL, N'admin@admin.com', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, N'', NULL, 0, NULL, N'asdfdsda', CAST(N'2020-07-02T14:42:38.8300000' AS DateTime2), NULL, N'Pavan', N'dasf', N'Antala', NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [ActivatedDate], [Active], [CompanyId], [CreatedBy], [CreatedDate], [DeactivatedDate], [FirstName], [JobTitle], [LastName], [ModifiedBy], [ModifiedDate]) VALUES (N'fdf2724d-62c8-46ca-bc8f-1a77e3c2b409', N'pavan.a@simformsolitions.com', N'PAVAN.A@SIMFORMSOLITIONS.COM', N'pavan.a@simformsolitions.com', N'PAVAN.A@SIMFORMSOLITIONS.COM', 0, N'AQAAAAEAACcQAAAAEGZ+/b/VWY52OE4ko0MOG2heIqVa931qNZQvf9xWto0nA9vxg/xx42xpMAGqTpMbvQ==', N'PJENJSLDJURGCRSSEYFHBLGSNMSQSBLK', N'2d180ad8-51bf-4e49-ab34-644bb171a6f5', NULL, 0, 0, NULL, 1, 0, N'', NULL, 0, N'ALT', NULL, CAST(N'2020-06-24T06:35:50.8956455' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleClaims_RoleId]    Script Date: 03-Jul-20 10:50:35 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleClaims_RoleId] ON [dbo].[RoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 03-Jul-20 10:50:35 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[Roles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserClaims_UserId]    Script Date: 03-Jul-20 10:50:35 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserClaims_UserId] ON [dbo].[UserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserLogins_UserId]    Script Date: 03-Jul-20 10:50:35 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserLogins_UserId] ON [dbo].[UserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserRoles_RoleId]    Script Date: 03-Jul-20 10:50:35 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserRoles_RoleId] ON [dbo].[UserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 03-Jul-20 10:50:35 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[Users]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 03-Jul-20 10:50:35 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[Users]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[RoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_RoleClaims_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleClaims] CHECK CONSTRAINT [FK_RoleClaims_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_Users_UserId]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_Users_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users_UserId]
GO
ALTER TABLE [dbo].[UserTokens]  WITH CHECK ADD  CONSTRAINT [FK_UserTokens_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTokens] CHECK CONSTRAINT [FK_UserTokens_Users_UserId]
GO
/****** Object:  StoredProcedure [dbo].[GetAllUser]    Script Date: 03-Jul-20 10:50:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllUser]
AS
begin
select * from Users
end
GO
/****** Object:  StoredProcedure [dbo].[InsertUser]    Script Date: 03-Jul-20 10:50:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbo].[InsertUser]   
@FirstName nvarchar(250),  
@LastName nvarchar(250),  
@UserName nvarchar(250),  
@Email nvarchar(250),  
@Active bit,  
@CreatedBy nvarchar(250),  
@JobTitle nvarchar(20),  
@CompanyId nvarchar(5),  
@AccessFailedCount int  
AS  
BEGIN  
   
 IF NOT EXISTS(SELECT 1 from Users where Email = @Email)  
 BEGIN  
 INSERT INTO   
  Users  
  ( 
  Id 
   ,FirstName  
   ,LastName  
   ,UserName  
   ,Email  
   ,Active  
   ,CreatedBy  
   ,CreatedDate  
   ,JobTitle  
   ,CompanyId  
   ,AccessFailedCount
   ,EmailConfirmed
   ,PhoneNumberConfirmed
   ,TwoFactorEnabled
   ,LockoutEnabled  
  )   
 VALUES  
  ( 
	newid() 
   ,@FirstName   
   ,@LastName   
   ,@UserName   
   ,@Email   
   ,@Active   
   ,@CreatedBy  
   ,GETDATE()   
   ,@JobTitle   
   ,@CompanyId   
   ,@AccessFailedCount
   ,0
   ,0
   ,0
   ,0  
  )  
  
  SELECT SCOPE_IDENTITY()  
  END  
  SELECT 0 as result  
END  
GO
/****** Object:  StoredProcedure [dbo].[UserExists]    Script Date: 03-Jul-20 10:50:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserExists]    
@Email nvarchar(500)
,@Active bit
--,@Result int output    
AS    
BEGIN    
    
 if not exists(select 1 from Users where Email = @Email)    
 begin    
 select 2 as Result --@Result = 2   
 end    
 else    
 begin    
 select 4 as Result -- @Result= 4   
    
 end    
    
END 
GO
USE [master]
GO
ALTER DATABASE [SoberLivingAmericaNew] SET  READ_WRITE 
GO
