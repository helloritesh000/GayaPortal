USE [PORTAL]
GO
/****** Object:  FullTextCatalog [SearchContent]    Script Date: 7/7/2017 10:25:42 AM ******/
CREATE FULLTEXT CATALOG [SearchContent]WITH ACCENT_SENSITIVITY = OFF
AS DEFAULT

GO
/****** Object:  Table [dbo].[Cateogry]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cateogry](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CateogryName] [nvarchar](100) NULL,
	[IsVisitorCateogry] [bit] NULL DEFAULT ((0)),
	[Status] [int] NULL,
	[CreatedOn] [datetime] NULL DEFAULT (getdate()),
	[CreatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdateBy] [bigint] NULL,
	[ParentCateogry] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DARBHANGAPORTAL]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DARBHANGAPORTAL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TITLE] [varchar](200) NULL,
	[DESCRIPTION] [nvarchar](max) NULL,
	[IMAGES_PATH] [varchar](max) NULL,
	[CREATED_DATE] [datetime] NULL,
	[MODIFIED_DATE] [datetime] NULL,
	[CREATED_BY] [varchar](80) NULL,
	[MODIFIED_BY] [varchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Enquiry]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Enquiry](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmailTo] [varchar](100) NOT NULL,
	[EmailFrom] [varchar](100) NOT NULL,
	[FromMobileNumber] [varchar](13) NOT NULL,
	[EnquirySubject] [varchar](13) NOT NULL,
	[EnquiryDescription] [varchar](500) NOT NULL,
	[EnquiryDocument] [varchar](max) NULL,
	[Status] [int] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdateBy] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExceptionLogger]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExceptionLogger](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ExceptionPath] [varchar](max) NULL,
	[ExceptionMessage] [varchar](max) NULL,
	[ExceptionStackTrace] [varchar](max) NULL,
	[ExceptionLoggedBy] [varchar](max) NULL,
	[ExceptionLoggedOn] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Logo]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageContent] [image] NOT NULL,
	[TagContent] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Logon]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logon](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Memory]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Memory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[ProfilePic] [image] NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[EmailId] [varchar](100) NULL,
	[MobileNo] [varchar](13) NULL,
	[Title] [nvarchar](300) NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedOBy] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MemoryPicture]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemoryPicture](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemoryId] [bigint] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PageContent]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PageType] [nvarchar](100) NOT NULL,
	[PageText] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdateBy] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PopularSearch]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PopularSearch](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SearchParameter] [varchar](500) NULL,
	[SearchedId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Post]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PostTitle] [nvarchar](200) NOT NULL,
	[PostContent] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdateBy] [bigint] NULL,
	[PostType] [varchar](max) NULL,
	[UserId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostCateogryMapping]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostCateogryMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PostId] [bigint] NULL,
	[CateogryId] [bigint] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdateBy] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostImage]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PostImage](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PostId] [bigint] NULL,
	[ImageUrl] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pvc]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pvc](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[NumberofCopies] [int] NOT NULL,
	[PinCode] [varchar](20) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdateBy] [bigint] NULL,
	[IsTermAccepted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PvcAdharDocument]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PvcAdharDocument](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentUrl] [varchar](max) NULL,
	[PvcId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SearchYourNeed]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SearchYourNeed](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[LinkId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[MobileNo] [varchar](13) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[PinCode] [nvarchar](20) NULL,
	[ProfilePic] [image] NULL,
	[Status] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdateBy] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SearchYourNeedLink]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SearchYourNeedLink](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[LinkType] [nvarchar](150) NOT NULL,
	[LinkText] [nvarchar](200) NOT NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
	[CreatedOn] [datetime] NULL DEFAULT (getdate()),
	[CreatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdateBy] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SliderConfig]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SliderConfig](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](500) NULL,
	[ImageUrl] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StatusCondition]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StatusCondition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRegistration]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserRegistration](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[MiddleName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Address] [nvarchar](300) NULL,
	[EmailId] [varchar](100) NULL,
	[MobileNo] [varchar](13) NULL,
	[UserName] [varchar](100) NOT NULL,
	[ProfilePic] [image] NULL,
	[IsVisitor] [bit] NULL DEFAULT ((0)),
	[Status] [int] NULL,
	[CreatedOn] [datetime] NULL DEFAULT (getdate()),
	[CreatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdateBy] [bigint] NULL,
	[PinCode] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VisitorCateogry]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitorCateogry](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VisitorId] [bigint] NOT NULL,
	[CateogryId] [bigint] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdateBy] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL DEFAULT ((0)),
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL DEFAULT ((0)),
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
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 7/7/2017 10:25:42 AM ******/
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
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 7/7/2017 10:25:42 AM ******/
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
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 7/7/2017 10:25:42 AM ******/
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
/****** Object:  View [dbo].[Search]    Script Date: 7/7/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Search] WITH SCHEMABINDING AS 
select ROW_NUMBER() OVER ( ORDER BY ContentId,Title,SearchType) AS Id, ContentId, Title, SearchContent, SearchType FROM (
SELECT Id AS ContentId, 'Share Your Memory' AS Title, ISNULL(Title + ' | ', '') + ISNULL([Description],'') AS SearchContent, 'Memory' AS SearchType 
FROM [dbo].[Memory]
UNION ALL
SELECT p.Id AS ContentId, ISNULL(p.PostTitle, '') AS Title, ISNULL(p.PostTitle + ' | ', '') + ISNULL(p.PostContent + ' | ', '') + ISNULL(c.CateogryName, '') AS SearchContent, 'Post' AS SearchType 
FROM [dbo].[Post] p
JOIN [dbo].[PostCateogryMapping] pc ON p.Id = pc.PostId
JOIN [dbo].[Cateogry] c ON c.Id = pc.CateogryId
UNION ALL
SELECT sn.Id AS ContentId, ISNULL(snl.LinkText, '') AS Title, ISNULL(sn.FirstName + ' | ', '') + ISNULL(sn.LastName + ' | ', '') + ISNULL(sn.MobileNo + ' | ', '') + ISNULL(sn.[Address] + ' | ', '') + ISNULL(sn.PinCode + ' | ', '') + ISNULL(snl.LinkText, '') AS SearchContent, 'SearchYourNeed' AS SearchType 
FROM [dbo].[SearchYourNeed] sn
JOIN [dbo].[SearchYourNeedLink] snl ON sn.LinkId = snl.Id) A;


GO
SET IDENTITY_INSERT [dbo].[Cateogry] ON 

INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (1, N'Furniture', 0, 1, CAST(N'2016-02-03 00:00:00.000' AS DateTime), -6, NULL, NULL, 2)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (2, N'Hotels', 0, 1, CAST(N'2015-05-03 00:00:00.000' AS DateTime), NULL, NULL, NULL, 2)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (3, N'Resturant', 0, 1, CAST(N'2014-02-24 00:00:00.000' AS DateTime), NULL, NULL, NULL, 3)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (4, N'School', 0, 1, CAST(N'2013-05-22 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (5, N'Hospital', 0, 2, CAST(N'2016-05-15 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (6, N'Electrician', 1, 1, CAST(N'2016-03-26 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (7, N'Pandit', 1, 1, CAST(N'2016-03-25 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (8, N'Doctor', 1, 1, CAST(N'2016-03-23 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10006, N'Advertisement-Agencies', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10007, N'Beauty-Parlour-Saloon', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10008, N'Books-Stationaries', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10009, N'Computer&Accessories', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10010, N'Clothes', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10011, N'Design & Printing', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10013, N'Education & Learning', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10014, N'Electronics & Electricals', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10015, N'Feature Ads', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10016, N'Finnancial Services', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10017, N'Flowerist', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10018, N'Food & Beverages', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10020, N'Gift Shop', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10021, N'Health Club & Gym', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10022, N'Home Appliances', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10023, N'Insurance', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10024, N'Jewellery Shop', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10025, N'Leather Items', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10026, N'Medical Facilities', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10027, N'Medical Stores', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10028, N'Mineral Water', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10029, N'Mobile & Recharge', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10030, N'Movies', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10031, N'Optician & Opticals', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10032, N'Plywood', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10033, N'Real Estate', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10034, N'Room On Rent', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10035, N'Sanitaryware', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10036, N'Software Developement', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10037, N'Sports', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10038, N'Stock & Share', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10039, N'Tent House', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10040, N'Tour & Travels', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10041, N'Vehicles', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10042, N'Wine Shop', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10043, N'Xerox and Scannng', 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cateogry] ([Id], [CateogryName], [IsVisitorCateogry], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [ParentCateogry]) VALUES (10044, N'Hardware Shop', 0, 1, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Cateogry] OFF
SET IDENTITY_INSERT [dbo].[ExceptionLogger] ON 

INSERT [dbo].[ExceptionLogger] ([Id], [ExceptionPath], [ExceptionMessage], [ExceptionStackTrace], [ExceptionLoggedBy], [ExceptionLoggedOn]) VALUES (9, N'Action : Index, Controller : Home, Type : GET', N'Value cannot be null or empty.
Parameter name: contentPath', N'   at System.Web.Mvc.UrlHelper.GenerateContentUrl(String contentPath, HttpContextBase httpContext)
   at System.Web.Mvc.UrlHelper.Content(String contentPath)
   at ASP._Page_Views_Home__Slider_cshtml.Execute() in e:\Projects\TFSOnline_Sumit\Darbhanaga_Portal\Dekhlo\Dekhlo.Web\Views\Home\_Slider.cshtml:line 25
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.HtmlHelper.RenderPartialInternal(String partialViewName, ViewDataDictionary viewData, Object model, TextWriter writer, ViewEngineCollection viewEngineCollection)
   at System.Web.Mvc.Html.RenderPartialExtensions.RenderPartial(HtmlHelper htmlHelper, String partialViewName)
   at ASP._Page_Views_Shared_LayoutResponsive_cshtml.Execute() in e:\Projects\TFSOnline_Sumit\Darbhanaga_Portal\Dekhlo\Dekhlo.Web\Views\Shared\LayoutResponsive.cshtml:line 218
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.WebPages.WebPageBase.<>c__DisplayClass7.<RenderPageCore>b__6(TextWriter writer)
   at System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)
   at System.Web.WebPages.WebPageBase.Write(HelperResult result)
   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)
   at System.Web.WebPages.WebPageBase.PopContext()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<InvokeActionResultWithFilters>b__17()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<>c__DisplayClass1c.<InvokeActionResultWithFilters>b__19()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)', N'test', CAST(N'2017-05-25 02:07:50.763' AS DateTime))
SET IDENTITY_INSERT [dbo].[ExceptionLogger] OFF
SET IDENTITY_INSERT [dbo].[Logo] ON 

INSERT [dbo].[Logo] ([Id], [ImageContent], [TagContent]) VALUES (19, 0x89504E470D0A1A0A0000000D494844520000046D000000E70806000001D30D9BFC000000097048597300000B1300000B1301009A9C1800000A4F6943435050686F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE17BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C007BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08801400407A8E42A600404601809D98265300A0040060CB6362E300502D0060277FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00305188852900047B0060C8232378008499001446F2573CF12BAE10E72A00007899B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC27999193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEABF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF3500B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D4280803806883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC708000044A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F821C14804128B2420C9881451224B91354831528A542055481DF23D720239875C46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD06474319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C46C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704128145C0093604774220611E4148584C584ED848A8201C243411DA093709038451C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C437241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CDD97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE753D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC535716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B86549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D6167621767B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563ADE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD347671767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F59D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF437F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE690E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3FC62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA8168C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB561D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51DD23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8BE73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393DDDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECBAE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C61EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553D0A7FB93199393FF040398F3FC63332DDB000000206348524D00007A25000080830000F9FF000080E9000075300000EA6000003A980000176F925FC54600006F0F4944415478DAEC5BDD6DDB30103E0679AF03E7CD06E26EE04E607582DA5AC0EE06D920CA06C906CA02763A41E409AA6E9002D15B84B8135C1F4CA634C35F89FAAB748060493CF28EE4C7E31D7526880800008410E81231BD076A86880A38DBF1E46466C23C53226B3B9E24009000C0010052094B40DB88B83A81D07E62597647E5241239337A05619E050EE3A0E34D6C70CC8FA9673923007803805B812700801B00D80BEDB2B948E938A974882CF54B640BF5037044C05802C76AF9F36DE880E9526623CB71E2B50B4D788E01606DC95B540E56C0EFA21F915A78447C7FB91D4F0EDBF104B7E3492C02437C670B205A177575C4F222755C406500103A94C9DEA5867674931B2B64989E379632D00258918C87E1845DE742F927BA5A372556AF138579461810D87DD5320BD0523331A29E7387552FD2DAD23298CAE7B5F938BBCB69A909A37ECEA2E8D6C15B0B175E0FDB94CB56422C8063538E05C0C0D7251EFB21B33837228FB8559D7B04E1423569D4A2CCC33C4B4D96C776D255727C2D284BBEAF1E65A083DC32FDF0324667359AFB9F3E1AA196ADF1D3008788CB85829AF47FEE1270BC5AB60ED08F1603E7CA3770F61D3F97FADD42873A76A873D39581F66D71FE34D99930CF662D1CE37543726FEB04CE42776E623A5F09F36CA4287AA873C4C493E79E52D4B8C5E1231845341318EA6F6A1EB4A71E03E6D153C458CB56F5646909BCAC82961D0EB68DBED5EDE37CAF415E29E76FD8822A395228079C30CF62E6CFB4B8B35DDC8256FF23EAC4ADEA4B07C063A27DCB56F4A3253FE92C70F84F02365FC3DB488E79384589F830F7556C214D591CDEF15C3B5A9E7B4379DD217904FDA58BDA8123462D0E8953D72D0BC9AB3E85D5591DD39773157D2E6975D81C1C2CE5C86826ED2C21EC42004DEAA80A382650D97EB57669C7414E2402C63274C7123E073AF82C36725469A8A6BAE841072BC0222239C9003498FE59C79DE62A29807FD97533C3A077F2A294B03E90E1DF020379F371061AC844E77DE8E4EE725AD471458D1FE2E2F83E9BB6B002213B29A84B215ABDBEF4DAE2A0C6194503EF088E49E001E7D7F0BC31E501EE17E9FD9542160A6DDC71CF29FD8D24BA118D638B824E09F72E55F01E0CFAE1EE72FA9E977E1255F5C4E288110B0F8E6B61E274BC7361128845B4C2B711C3314F8748CA96703C6DE6E58DB8C90DE034657506F2545094E82DB3561770FCC39F2A523B6983599EB31E5A1B021FD33A9712D030DE5F9276528555228AAD8D0800DCD0FB11C7C312AF761279FCB90C6F4112CEF28956E3C1108633DDDF24FA198F1D86A8AA597F4B478F14D0BE7D980DB8A5B30200E0EAF5E54487BF000000FFFFEC5DDD51DB40105E6978C719F12666E274402A40549040057605712AC0AE207605380D284E05111D4005F821BC85195381F220DD787DDCFF9F4E583BC320CBF723DF7E77BBF7B39F92BAAE85840365962F65ABC29D0C1F03E03B152670740807DAF415EC83DD5952004504C0231690100E68D7A328A2F495242FF1574061B65618D45143B3E3BFA4FC9C029AA3BE09A32C691B319EE582329D07CFC5241DC0C0E99A74A003C20100F3407D9DED06D57AA6942991E5F90987B1E3A6BFA582B767CE13EE088F6FD804F38BF2F2F297593ED1251D28B3BC32213750048F2DE180AC1CDD7A68C798FE7EA2F90C35C80FB133F3D25B10290D0E566FF575C6F7E6E5798D471AA4FCA9A0CED803F25C9ED54918E6833693BABA71726AC0F9CAB149AF3761A9F0B8E1AA627E4C8F4DD898399775B8014E99E5E3F6F30707A3481242C18C7ABE32D6406C460C1B9902C09D463DB507D02C1866C9992E88A97A6A95B173A9CC9072F3F2BC89C85CAD7DF7780599FB2C3CC4CAF1A790ADD5D7B3D28100B38A0A3892B0E0AD6F334549A858ED45A4C01139BFB33E8D38045CBB77D2A38B10A620763376A2A0F05AB3C7F3E4B48B199B47E0F4596E6DC1231D715A905C91EB216EDB0B70167D6B84148F203C9A34BC5F14B95C05A8C3475BCC7B091C2436ABB29D87DE0602B84F25D77DE940A92BC58B76A4439BB740BE50CCE73A2ADF6631A515AFDBE86596CF02374ADF790A7D8ACACC75EE143894AFA3039E1F21478240A402AE6415B83E9D996BE50C3816E009617E627220653BE0E4FECC6199AEE5D2297068F04404A058A95C2F38A0797C4F3690100E1C900E0808072A8C4C132200565AD90EBAC20EFB02BFFBCAE499248E2EFD0E2813075925E03F61F81FB79CEF457975481378E5548AA35013E0A07AE87B201C900248E5953E7D261D28C8EF1B48070671EBE30C32884C8E8D74A08086B954C5EF9940738A2FE17CB7D63465AE8F840EA40301E50FC7A964D9EB3B41DA35A805EC8F058EACEE7F1E08C9F5C6B27C9C7F879CF50DE97CBFCECE1F8E6AC46134D4AA5D63B95748FB1D9A60385EAF2E601F774E2B798B14BD6D8144E2B3EF05B3A04A7314618D3AE433FD62164284FE5B30D31A21E030EB488F083409FAFB86942E4B4B56C6979CB40F2D08AFDBF4AF9CE9F047AAFC4B940E2BEE33EC192958E6F01529940554BABC11BA1EC3FE10FD170424D9D2C11B600EB3AAEEFCAD903E916DB9A3EB7F7F77F8C67F000000FFFFEC5DE1712A390CD666F21F32FCE4C7DBAB2049058F74C0A581D041920A02155C5241780DF0A002B80ADE5E05C7CD5CFE5D265081EF07EB4108AFD76BCBBB66B1669809C35A9615FBB3247BA58389A34B3E5010DB59CB95142F7819FEE7E2428D74C6640438F93DF3D2835717D0E10E4C9B9E7E98B4B3AD565DD798987D0757A23910747403E6357E9386C693D4D04F52C338AAE8710586A74F5537542DE02816CC96164F9CF5FA5D4019E4381605E9F7872E997FD54C3E9AB12DEE3F3F8615DBDCEA2AA9AB2CC13219F3EC40CB9A40C674922716C0B185E27409077346D38760009E03DD1BB6576DB026F25DC1716E91A2F6C2625CB8CD6FA02F028E9F5DC0BEB4B0D7B9600D38B60B998370DF06A9C09CE4A4804979CC7AFD39905A85167D544D6F264E0C70AAB4A300401729A73C260B1F0C4151D52E855DD285C4A15F01BB00E09C791CAE3A933486E27B3E9501E7D26081282F4C79049B814FB744E1A66CA412655F8C6FAE3ABB8FB35E7F5CA7FE19CDFAA283E1AA60237961A072098E72CEA735B807694DDBCF3DBB5ACDC4709AB46C6C2D166E8BA0697E3466D680956333994D76694E4BC5C5F232211737C4C5B2E21C3B47FFAC16CE05A77BE28126168B7B1512A2DB5449A771B2103626834F19D8640C267EC20024BA31601A42B864A3BB410882077D11A7822B816F438596C77609910000AE4F4CDE41CBF41FC43C0C0A706C5FEF3DA1F7C827967A69DBE51D97841174774F3DC9380E485F82495741034E135944585E0BCF73649FB2C506504F52B136580F7F7B92F13B4462A74B0E859BECC016F1A0678771FD0C01DD5D12B2DC7F7EAC66BD7E5BE6D9382E353672AD1AD2E8BA6071A934B96BB7B6796DEF3F3F5EABCA10E0E4604BE4135A30BC418BC6276D0394C9D5650C2AFF31059C5B57E021DFBB67B2A07C596C2107C3DB48DD006572751983B22E69A2D1ACAAAB14AACF1C5AA0B5AAC596B719B464214FA32BC8421C71D5D72607705166A534B4706D03A66FA1CC0C1F165BA8C1700BC0E15CC83EDDA0D072DB726C408F41014E08A0635BBDE3FEF3E329A0C9E1C305FA09ED2097853CF6EC063D07A4A711139F60E29B179AC57B043AB35E3FF3640D084F7C4331E5EF1A6A1B12DD3101856FAB83BA1C9B0675F6EE89EF4D708023418700CF750E3C9B1399E40F2108E1526FED848A1196111DC797050FAE37A0CB089FEC7402D1DF8291D7AFA606716138E929F074641D19EEB2660CC7DB574DCF0C9F2EE889DF3A56BD0B651A97A80B6C546E5B083A1F3AB6AF25BE99D714C29F0D4E7B7351150C7240C0C7E77F20F011AE0B88C16DCB5C1628B5DE2CDA7BB748F21C3DBE4805002933E860B05882BECC8E70041B61091E89811C3ADA3882167DDE75637FB494E7C562FEE0D2491DDC97534E63B400462A7FD335F566156BC7F5B6731DEDA1426EA1FC96F20BA78E2A4E701599167BE3EE57BA396366BE89039FC443BFB660C8AD8715F01D7ABC01C093C499987D3F52A448B551AC85172952A4DAE832AAA01DA4A95B244D5859998DDB15BA83E31328DDF33E83BD6B388C3799BEAC38847A5EF85DC3618A55A84127B512ADB5192D9CF32299A0FB0DF615FD542030856A415101BB83833FA138B193E4B7260BABA81F0187590345C9B300BBC02C7EEE1B1C96BFFC07B59916C80439D8DC2250104486A9667C199149A78B14D4990669DB4CD377A690AF4B642F0A94CBDF541BC454A3F3AE82C746313E59A3557E44049CF3A015DADDE7A03EE1C8D0DF2338AC3AADDBA125DF0C8A4B978ED0624A419F5BB78B780E89259428406A40DAE2532F7A029622991E884C92C6441FDF605FD7563EFF5060A925B0BB44A7D3D9C0C08AC1BA5FE73C25FF11E17F4DE4FB01FB3B4D29E23552FC3F25CFA942E6910604BF143C3AA02E668D41318980731E56CD7728AFA3745DF08CEE04A50B66F599A6067CE542FA42BF15B966CFE89925A88FAC27E4FB02F19CC0718577B9205F607F774B28E41704C829A5257A5B21700403DDA59ADF370AF91E48DF23C53354B677D8BF082A0AFA94FABB51F078451B906A3CD3227DC4184E7B28057D8DA48498C565131FEFD04B43BEF4FB1BA85F16BC85DD6DD7A4C01AC0FCAED0047F2A90619B03C71A2DB421E2392EB0B2E664214309080F482CE62AD779D90BA42AEBF12F64C9E0E732D8E77F5E90DF3BE47BA6E8EB1DB98742F1FF9D28FA54E946EAF157EE96637A54E8690200E2F7FFFED5C6A3E2B178A4569326986E436338BE1B651A346FCADA4D6AE80372D76E541634FE1F0000FFFFEC5D6F52DB3A105F67FABD61E8373A433841C3093027207081861334EF04C009C83B01E1029077828613144E409829DFCA249C40EF0372D92C9225CB522C2BFB9BF1B438D6BFB5F4D3EE5A5AFD259C1A8BFEBAF2303986CDDB6182676C286AF96FE4CADA458B367232188C8660ADD9C8A04FDA382C7597D6CBBD475825ADA29EF6E1DD1997CBFAE48A327A60D80F447765CB33C7FB55D2A0F6408D36E5E4FF231A89D133728734BE4C089DBA770A6E510273C77ACC6AD4FD0EDE7C3AF3927C7279E1ED0299A15F8F3DF6215BD9E4AEB22AD3DCADC826C47E27D7326CA1AA8BCD9E2445EC9F1C0C078769CAF26D2F1D060E4FE1ABBE5980326DCF1DF7DD966B3007BE1201CB30F6BD40EFC7790F5819D9740C04D04FF0D035465808B08B4C57A55F2DA09938C8DFC1BC80CF47199B6D4649F361517506F7604E2D01053832ECC61E02DA915E6727B929ADAD3C2CCABA2B0B841EC159EEB30A6A7E81957766918E0ED2078DA94A9F73F9FA53358C854A9B78D298DF2BEF95981F65E58E607595B7CDAEF72AED98C3EA7689BAE75659CBCF55B3B11A58F2BECF80D5D67E89939767E7D9AE4A7CE69BED9D3991C7750D1218453E01B9F83BBA607FCED1D49268541D7B1DE760CF14E5EE1A066156516E635286EFF0A8E340B2A9753A44C7C7EC7AF2F2DC753DD44E81B59DB1A489CD3C54C86217A73979791ED628F31ED2C4B925691D91BFFB157D03B198F5C5D681AD9A793C81FFF530E3183B88CDA7EF7F216148C27940B7AE24E90C1A32695E5B2A4AA1D010C0702F8B5426C30ACF2D6B96D5734873D1C60EF2C167D3B4CFA0A643DA3A5A9EA2DC21E823E0BF56392194E4DB05B760E08DC8DFA3F660B39FAACE97ABACE1B684AA6F8876F8F2D918A3393A7F8D02BF11E0D781B31A837AA219D8FBAE44233181CD82AD59D0168D793F8177721E43253E9159784E06E020021327A426645387FB9A591CC5D6A600F80FCC2705507363E4303B63B9DC43D83393F640BDC3390A8BA4A246721603E150CD66B785ACFD0F240CB9A8B0E98E6DBA6C2625DFE7357DF3DC1E8A9888C6A50F44E7FBEB4436B0860E9AC7B845DC71ED90A64DED6384814B1F18C6D68832B269E2A8D8F3C43BCDC821CDB704E5E0EAAF3984CD844B1F98464B3672DF10D618660DD46737E51E532114476ACB0D720FA40BF0F1D3F93D2B3DED01D66CCE52681025CD9692D228B17E16EA9DF8D4FAEE5A22CB8BB676824E82428D86347D9F99DE621CB4A08ECB96C8D295B81B37ABA2251BD7C57991E19279A63548DD243B62B2F183D3947B096B486BC12CC1363DB119E55F0B9A243E1058437A4728DF4AAC645347C31FC6D410BC82F8151C165E59AE7635EE59BAD9DE19273E482E80E18B140E36A8BD67356515A566D3F460FFE1D1ECE846A87D559DA1989C9A1D40398B3A10D9B83A64511C1BD5B6812DF9FBF99ADB354DC0343CE7EED928D90C226C7B5D1F4CA304DA29D10EA61507C758716FE958AF879AED6A5CCD8E51BB6234A3697BC479C3E9C3900D34FBA9CC4528B16D3C1BF3786578C6A4CD9370945FA34E5E9E5DCCA06164CDF01A353F8595D19E90B3082A219A95D11D32C8694CDE5E5B24EA48506DC2198F9B8D231B1F6D8D66923269368FEBA84404315B42E309186D209BD8BE00FA208A59CC64D34428D071E204364AA4F3C78083C807775BDADA3CD9D050A06B0A51192266CB381621BB9A78FCF9BB710C126CD3303633EA9A10CEA88542FDC663251AB435E8D56D4475F1E5E8BD8A8A6C1487B05DB644A80F31F48A9BED9D41A07C7B2D1DB4D46F30F794EF036C0E5AAFE5764A5478EBE36923126A2C1A5828136E92C8C0D9F5F47EFB01EA16EBF145B308B4A230642371BA6EC2A9138EB4A150A63E0793096D7618FA5874B90E0D9B6AA53D683FA2D08A3A86C13B01F2D9B685671A31E24097FCDD967EF4D850B93E09228A49D8B882F8E4E5B94767257916B6179325E4CAD8481CDB75D572FEFCAD26A72CF1F626B788D36ABB823C7E960E9A4B4F5A4E48A1C61074AA16E125F6F93B73D46EBA0DD77399D8B80FD6A7B22CC397C8B2AC9B65993DD9C84E3F00802D85F620E8B1BD8C15B979954D02BBC9EF1C0867D1B056F339B16EB90EAD6989DE9DA8443672E02C356755EFBA683937DB3BF7A15B7CB3BD33A999BE57F17941FE5ED62CFFDE30F0429B2BBE7D2BB9A6CC81E2FE4451FE56CDB26CC9FA5451C73A7DA9E73050436260F1CCD421DFA994D5673A39644288BFEA8FC340100672CA5CD215BE0A5B1342FA7D8C6C5D529F19587CE9A9D91E6D7AD73CABE4E7403236E645E8F24041344B4F795F589813A2A21CACFA51497ADFEFC026BF3B0529FB9C609E00A02784A817620245E963305CFC225B159F5FB7EFE4945F536DBC6B74420828B41B4F66CB58FA71F81339A30A667246C5D7B46EA645FFE66B3D97C4B97C7F397E0F994FA26130180C1D3A2C020683C164C36030986C180C06A30A3EB108D2C0ED97AFBA9F0AA79CEFAF8655F3151076315E17DE9CCC7D54DE2BD8ADAB1100700CE1CF1B533948F7C05FC88DC671FCE7376B361B0A016162BE08A8B6E72B5F435B17B01A722203FB057C5960A2994899FD23CB2AAE7D686EA3279B510C6F58CA7FFB68E6C798A199B6F8D43CA9303B0F4A9E19A23C01007E1A66F701B97F0EFACFDF7D45BD85226FD54AE8E2EA29EA4AD34D49DE2AF2A0F5D0E1BBD460C6E4FEBDA2AE5D45BB54F29F936770BA217A7E8EEE95D55368D217BF754BF21058C39697B8FDF25530D9A48F2EBC2D17CF48A7C3384003A798694D675DF514A6D34CD1F1AE509E45873B56E4F3B78FA23C05BCAD062FD2E7A473FF92E6D1123DF34AEA35D39870C5F588EA70A51978035227D56FB87D7B06729E976855B89C05BAB75742383D926E2CFF3E256DDA45E499C15BC85F9CE758219F2B457D17288F3B03B9AAFA09934DA258C0C70D8FAACD8417502D00F62390F8D4B0BA3C7FA2E86419EAEC7446C7BE159D1FA85B42A8B86DD7A44E0F0A6D04D7694EFC26581B346D27E82ADA57E677B18994A71AA0730D616525EF51550FBCCD63484CDB91A6BD4B45BD968A7789B551DC4F3E902F2FEA4B04C8412C0CBE093ADB63F3E417B8EDDBC9882F675092EF446A50859FE448A341949591693417303C63928390A43524BF1F23B32A539880B706B9DD59F8AD740E777C5F255F55DBB1CF6A61901795F92BD18A854666A07966E537EC3066CD262D8C886A9E11359DCE5A40CC131DC696F952AD45952F1EC8478A3C68FE17F07E3AC3B04423D061A6315700D4B1A255654CCB78DEE2BD1C18FC24266484DC4CF53A441A2E45AED09CB0BC55BEB8538DB654609FC84E49BC4C3669E112DEBE78E8906BCC0E50F855307E40F9712CD8AC3853CC807B9A81766AD0A0E632BF19F2AFBC2A4CBB32223D80D50066AFA45D65E6DAC8503F9BCFFF3A0D82A63DD4945516BBF908D4A7AD529F551FB5F1272287A582B87F2AF29B9498597882B92A93059B51E99851A68E4F555D9329623BA084ECF03DD4D10F2CCAD2E559985920FD2EFD8A75D4994205B019222A9A0BD86C2A4C23DBF54385C988FD447305692F4ACC3D93293C92130E3539E7F0EE28CE149AE83744783D441A2A13119BC1F41D3C1CFFF9DD67B2616CBA2FAB2E7239EB9B082016F4A1DC07E713059965658BFA78053183618799C61C8A359ED3AF35928C951CFE070000FFFFEC5DDD71DBBA125E66F26E7974DE7466AC5460A502D315445103562A885C81E90AA25460B90145A920740547AEE0D833576F5763B902DE074157304CFC90040980FCBE19CDD8A24882BB4BECB78B0590CB6CCAACDA57146CB9CD1547E1080B7101B601E60E0000D03DD44E6E96FDC188F6B9A698FB5AB554EB27DB9B120000001440CCFAAC514E34BD208FE6CE82BC034003E466D91FC4943F5A5F1497AE76EFF67D05E582FB34245471A72093FBD9D0BBEDFD271CE3D2A3DDE70BFB4B0FDA704FFB49104D908894CCF6C550C164BF8E36E96646F6B62078A2E35083333F588104FFF1FC7D8E3C7A4F0AB7A90A79AF5C4ABCEC0F7ADCB60AB614FDC7930DBB0100681E57B42F11E7D7BF882D5E7FCE5DD746877D43F2753ADAA89B174137A380898D2FA411B0CDEACA666ED870934911D1FD64BB994AAEA16383D2739BC0B23F18D33E0DED6ADFE757229A4EB69B55C5E718D1BEBEC9A4237964F75C57949BC964C567228AAB0C43B645471EA2C722F41BCFDA65BA436A1EA694BF9691886BCA9FB0DBA3FD540F93F7A8CE6C8EAFBA299225B09909F025CB31A3FDD4215778603697D67C9F983DEB17C3DFDFB33EBA70BBAA646E4A911B836181C2A464D91FEC240EEA61B2DDC42E2D5E43C2BE96756C3A82585781F5B23F581357C89D477026DBCDA8E4B575C4E675B2DDF46A78A644D1D95F4FB69B79856B674DEBC843A2F352A353E061123495B99FB6CFA2E25917DD7B645B3665E465F3FE31E9B3F326F75B907C91D0A8A22E4DCE9FD3DB05206CCB2BAB491F2AB93535345A84A49A2CEBE507B959F607BAC8A73211618EE4E764BB99F9D2B3D7E9DC5C3A4EC3ECDBE964BBD969AE3324FDBE019FAB64830C9EE549165187AC238F5057875DE67E9705A3405D0F59B5FDB2C0EC809F94BF5A521B75A3BB9FCC41470E9ED7465B9AD487AABFAE4C244A4215543A2537C6EB4EE886906C75F2980EDE1C18D988340EFC65D91F10E564730C3278A533402570068DB6060B8368D186A3B1E5107A9AACC677DACFBE1AB6403769C5F3A7E44F5D52D36D79A878BE2A38BC20E02D8B34C9DC34456C7C85C3D9398DCFBA59F607B268A608B4D91EE82838D4991D18B2CCC67783DF8ABB4E946DF3734D64C3B77B36A99BA6B2074D67AA8A6046EEEA6E5C3C7B42A1666E98B3EB32B1491CDE3EA186538DAC566A6A38D4C4C359F1371B2EED8C8E02233EAE3A6F5D9B8635B5F194E4F54967B4CF4A4D5BA89BCF9ACC4257E0B2A038A6FA8B8983C1478DD318A9A2F88E0C21B99C91E02CD5C86630E986AC7CB181BB2EEAA8032892A5E1A1230F75DAEC8EDEEFC6CEE38AECAE13E312658AB001045AEEC90DA98B4DEFBB2E3C5B8EDD604A3CE05E470BAA3E5CD756F816E428273D3470FF05ED67E4C88A8C5F1A9499ED9965A8892C079B437619022D3D3E683A7395D3683D635FF607BD863AC9A9A20D09CCB4349E2D9224E8280CE8FAA5A622DB9EE6F81CAA6A1D543AB5D947DC43D415C88D264AFD0D63B567AC9A45EC6E60A64A029A34D4A11074140454599B5707D1BA0CDFA1AAD641A5D3B421020FD2AC22376CAF2095331E77443EAA7AA314E6E3056E143A5A58BED72BC41D349AEEB762CDF15980328C6146C1122C901B72B3D261D7712D3BA0239B807BE7C8566606DC42D76FF91690FC0850C6E88BF231521CABA3CEEB19222F476E3A5F98A42114D68D55B33DC01CA69AABA361C33A5239C70534E21C3E0E0F7E0D508EAA77A707332BDC47D7912C98963CD6797253D6F0BB1205260DB7E51CA6EA4587A2C209D4E1355C1561AE2A3829575091F8114CA97042206D58477750473972D37963ADB1DEE637C45E085F1CE8E8A7EC80269304B8C5C2D376CD022337986E0C80DC0085315538CE05C4E31E9A0D5DA12377185570D875435588EE63563685391542AC3856E748C7ADE258E703AD8F25CEB12E348BFB02DD4EB69BC4427BC68AC3B5655726DBCD8E6D5299872BC2582AAF23571D0A21AA0D92DCB8C49CB05C409BA1F239B39AEF7BA308B4E22E2BE54309E7D085DD97E78E8C5517E501661D4A52F3BD1F217EEFE073A49A423DAD862AA85923D0F28BDC240DB7C3D6B4B6274BD7911238CD827B3630951D58F6073302B42F6F036B10CD143A4AA01A27882182C6807EC81F20D02A426E74CEC1F6BA2B93ED6638D96E22FE438AC24D764E94F35984AE90C976B3521CFE0193F54247AAF703C30F808834C036ABB2F763A8D488E8DD3BBE7FA7032D5541B1AAB6E44F036D73A2184DE4FD13EFB27B2CFB836949BB0500A07AFF8BDA32B38073E69838773AD0FAA0884EC71A0733AC393ADE3992896A39FF59436DB857C87D84FEC48BF56D6E153A8AA12280432FC036A7505B65EC20020FC90D832A53F12FC4571BB19B9674EC5DC1894276EB8674A422510BA808CE98431B031210787F700B3D152437BA4CC5B23F78825D350EA484FDC719440072D30207A3AABB4960724A19DC7AD28ECE065ADA45FC5871AFB4136FD3E2729A7A9BDB869B838DD18AEBA8E99AA80768241872E39260845AFB304390555AAFBE90BFCE065A462B146B08CED5B23F48DB6EAC3616072C886949078F0EC58388092B4A071565BBC4BDC7325BC36C8201363B2D436E0C08CEC5B23FD8C1BEEC01D38D4BC96CE7918EAEA011AF8882AB4C83CEB14C3D97A96A1D9555876D6D181079EF64A055686F290DC13959F607D9B23F08922562161200048F69C5E375601DB84C55FDE2970EDBDA5C71ECD6417B52E8A902B9E1088E8ACDBF049AC5F1CD5895F7D5EC7FD54A2CFB83D0743403DF681CAABEE9CE417B54350F5F3B4028DB0A156148F01A06486E18C11911D1A9E227872CCE222059A896F37762AC986EFC0EDF03D3115694F62BD3A08B706D43B721F02A10997EF68C3002C503BCCE11AE0F654F9C6C373B96C55115325D3192B386DD59C709440000859DF14543D9069D33890292E7BAE2F1B621561C73B9F1B1CAE63A57A7F9A1EA0526DB4DCC488E4AA9E78CE4785993A35951D6F5C664AF8A760FBB62A89EAFFAFB1868BBDB8AB5268ABDA37AA786C71A677219A04C5564EC9CDAB95061191231C3EBD71272C3919C9E413D0ED1BE2627F3AC2EC7676355DD7F810E858888BE79ACA3840057F6A222387FA89E21AA84D47BEF7DA370B736B8561CFB87BA33E5F8C2E33EF95143BA416E2A909C1123393A8773C2657332C7590855BD8DD38E48B3D3799716D2BA2829A32674944247DE121CDD105566D12967A4CED87C0E3C2099933A43FF42D896C1E7203038DB8BA248F6D9455194719F5D1445BD5AC90DEF7026DB4D6498CD2122FA97233A4F4D092FF42D245CD73335414A5BA0A3A0DB4F44E380DBBE267D7DCB0B2326F312D7EFB17375C5C311D5539B326D589E3A22F8C73261F44D1E59C0EFC2590DF29935D8FE21F7AE8935A727623F15655996CB966AECE8E7A498F552803C4505EF9B5A88A49F89E88988E693ED6655836CC6CC5886547ED9EC67227A9A6C377149DD8C2ACAE891887625EFBF629D2274E40E29B381938A36B0223F87E48A38A757467852EEBB988A15679E92BDDDA153AA9E097C64CFB468508E44FB892745ED3D61E7D8E80FE212B2AEEA2F1E389BA90336FACB0746BA752465CE9EE3DC53E2764A443B9ECF7C6CBA056C33CE19E72C16D4CC6AAE368607CED827A57AA6718E2CB4F3AC82D3B571FF2AC6FF053A720E1BEFC9B945876E1B11E71874F676C288CC4D85FBF8A89BA125396635B73D76F8AE5D78A2AFBAFB4BD3368E3C2636B9EFDA47D7AD9A6C37531252656CF133AC110200405D18737F0F59F45A255B754FDD5BD0AE28C1018046880D9164580A000000000020547C8008000000000000B901000000000000B9010000000000A81F1F210200F007BFFEFABBE8293D7A3B8D33F1FC1147F4B698D7767BA7749C0D94B4D44C929AE477B8D613B567F5F3317B3FF85941AFECF912F277561F40445FFFFB9FD2E7A2A01800C225376B7A3F3DF399EC4CF5AD033B7A3F23E937D95D24300B400E3A7276D869FB92DE6FD53024A27FD9DFD7546EE1419D2D4501BF42BCFC0EB86764E620CB98FDCF4F11FF46DDDACE06E40600002FC90DFFE2460271F0D13989ED15FFB781948BD04375D075C8A50B10498DE9E289333A2E3B629B68030EC90D6A6E00202C24F4363B71708063E1373A079AD17EF821E1FECFFBEC2AB677C1B5F7816B2FBF09A3CEA1F4346D3C2CF77F2036FC762F2B32DB1E8184EB898E3333F84C25D7E5DB106BAE91D71EE2320EB27BF50CDB98979DD8296474F83EA57D964875ED278DCDAA3E23EEEF5509527B27D898A9DDCED9EF23891D3E19CA756460538981EE53CD6F62C53DD686EF894C0E99E147777EAFC435728FFDFAEB6FF1B3FAF5D7DF19FB8C91B9018076646EF897F533BDDFABC824EA1F13D12FEEFF4F12A764230B9269226993F69AFC26A1B7AB0847926BDC4A881F7F3E3FD433A2FD6ED744FB3A8D9EC1B33EE6383AFE19548BFDE99E35337846D5701C4F32E39CEFC5B6F1590D5536E4898E433C91E4FC47050158D0DB55EAA30A76662BDBB5A3632654356435A4E330A198F931C926F1E7AB642CD39DA8A3C8E079A292F233B13F531B17DFC598F6FB9299C8E0FFF7576576406E00C07F72C33B595507C413923CF253A623D33975130225BB8FCC2996715A99C4C114E9942385D379D0DCFF42729D351D6B59544325733AEEB997F73B5EA679B538A28D9081632E2B1B1362C73BF69FA4DFBB282BF05B92384519792D0A9D5D9ACAD01679E76D282AF99EEAECE7A0B39823C7B2AD19449BE2C9A9ACDF2942DE4522CCDBF69BF75B456E305B0A00FC061F71E5751232FC93D3814C85CC0F2948D20145894D66F85D5E072E8BEC6F35E7A642272EE29273803D26D31EED77039711A285A56CC039E7B4778ADF7D1774FE8EF74A9E97975F24E82D6504E34EF22CBC6E7F0AD74B846C828A08F04EE8803B21BBA0B371D3DFAA747F5390DCF0590F3EE355642FAAA944863383778D97D7B5810D3DE61062D3F734CF7EF877E0D0FEA9C17B2D92E52B8E60C9884D4FC8ECE4E19E5DEB5CD2FF157A0F91B901007F333765D2ED7545E23A881D6553ED2D9A0EFF4D6FEB734C86EF54D7E5A3569124996600F86B441A272C46C626C351433A66A1F8EC864D5B119F9D979F6A47F04C20B165322FBCFC4C6C4FB4D5AFF4B6CEC7F4D9F98C8A6CA8AF6AD6466543A6B2AB9259127F27667D52321BBE2E7A2F3E209166A554991B141403807F58D1DB74739188E5521261F11DDF274D879D1759EAB22E2F1C212AD2DE6B491BF33AE2BCCF6F49142DE210557F619DF1B3A69D2B2E6371A5B8FF151D8B58C5ECCF9941544E8263CE2BCEFD21D10F9F553913DA95727F1F88CD374EC64345D66061E88876029911E57738F782CC8AD59392EFCB94DDEB51632B87CF0B27BB88DE1730475C764126D38C119B83EE634946E554419E797225C319471E653A3A65592B55F1EEA71C5D4612BB13CF7FCCC9FA10A7DBBCAC9248AE791266823F5C7FD62B6314C8DC000000048A128B3EFA84391D87E3BE52F159525D46959AB8109E8B8828C25470000000C03727259B263D66DF7FE7A273101B73A4DCDF21139B29ED335E311D972320DA67772ACF7A434131000000601B07E734A37D86869F79F340C8D454C50385BF754442C761B76746829F6C5DFC7F000000FFFFEC9DEF51E33A17C64F76F67BC2E47ECB9D215480A9005301D934B0A6820D156CA8604305840642A8609D0A6E52C186999B6F6F86A402DE0F512EC2E89F6DD996ECE737C3CC2E36B6AC73A4F3483E923FBD966AB5CADF1473D6ED0D86DB0D1C1DD81F3EE2B52B0000344B5957256C66DDDE983E6EBAF532DC6EFA300980B0010000E0A3B011459C93E176B3835900840D0000802C149E6733EBF6223A248D75D8AF2E15A7BF123E10076C2AF716DC09A4A24FEFC98D3C4B3AE485C410EE0038DEEF17316333EBF6E674D83F220B17C3ED66594565CCBABD097DCCE417756245766CA1E07701270A69B8DD84299E27CC599E9D892DF2DE67B8DDC49EDBA84FDCDE0D696CE4181D32DFCB262F4B72270132A4F77D344C29FB8BD11F7CAC46B6D9D1E71DB71782761C67F463BEDE4483EA3C018F2FD39AE4DF642BB3ADF27DCF94D49FDAC8DBEFD9A8B74284BBD5199B59B7B7A674DB548BF887AA9BB50912CE2F6A083F3D0A54BF73FEFDC2D0A1F3DEA7D5601BB94460C1967959D16125CDB4847B85399EF79A0ECB54CBDA532472C0AF8BB04D5BF0BB4B41DB2EEAD9E31C415BD70F55DD17D9145536FB85C2E3BB95FD6C66DDDE80E5CC9C5ABA5E841803402339A7C3F7878E7BA114354BB1B6D459B75939270DB3CDCE826DD60E3CD3259A5CFDC82D6C66DDDE923E7E78CB060F300D00800E9F07D859BEA6B54118C70FF27F6F91B482EE4F4E7172EAC8B34CD1CC206C7851B3A38F5FE8B4065B0E0E0000C759115BA2C68772FAC269C6678E1D7A86EF6862F52273F23013356D835385C9C0EC7593726666B8DD54B6A465D6EDF5E9B073E68F0AED734F4493E176B3CEF92C9314CF7133DC6EA639EED561232093E4F1BBE17633F6DC468F4434CE6B23070959DD5E3B5426D557AD6D899AE32EA83BC1316D9FC577A505DB6652D4A0322369BE0E5FB4C0CC42D6AF8DF3361953B5AFB66EA9F857A21DD62F98E60EEDD9F999624AD6E4E14CC286BD7ED235AA6F26BB09CFBABDA942313F0FB79B4195DECE02F56B11E24BB297CF9133DBC152B029622162D26055DC6AB8DD04969FEDAD021B7D6BC88ED9AA3AB8B234FA3615DF596D6932103B23B3572BDA765482B8390699D7126C33359CD5307DDE5823006E14813024756E94AC0C7D76DFD382EDA513BFAD82DA61159300BA7690572C661636A95F45B1D1FFB92E389A76F8C3ED26620D5044E5A3C5AA360C2C620680CD8E9CE8023913735985C04E63B75BDBA2A642DF6882A8298B11EB9CF7064136CBB575A2A645E6F922DA76C458165C6765F54D91A16D4C670B2E15330E2D2A26E765CDC4CD89C6AE36EE231DD0D5ACCD8E731E2F8C54C2864DFDFFB03DE267FB985C080EED67DD5E40F5655FF60D87DBCDCEC046AF6957A6CDBABD90CD6EB4358277E2998D169AF600ECCF42A8C8920FF1CBD24C435254E8C4CD39D9DDFFC375DB98CCB8C944CB0595B3B26CA7B077D14BB363346F07850D1DB2E0AD8A1AEE6F97CCB95FE830C5DF1A6E379DAA36EBCB1BF40C59AA8442C1024737027B60AF1C4D44CD92D4D3C32F15E64BBD1465232A6FC3B4A6F162F15A6BCDF1AB9C41F24273CE6F98532B4C6FA9F8D92D53311BE5BCAEAADF9EC3FC8E091BF60A4AC545DEC20CB79BE570BBE9BB34C5AF11187915789CB181D812371D3A24BF4A479CAA1C9359B7D761C755AF26EF8AFEB8A9E6D5595E5F5A5669A386725AD2B5F616DAF0920E49FE18A99B0B8A161DF268F6EC675251598EA2F6910EB36F365E8305F0038F840DA9A719578ECFACB8EAA8950A1B266E22D6C9A884C3A7BC1B9688FCAAB9FC599E554F964649DEDB086466AD39DEB1749F91E6785336814B33D33665F5DFA9B0BC31133311D9CB572AB24F58A02FB2286C66DD5EAC098E418DEB28543C77AEA0A9F9FBD2EA942DEFD6CDB8FD9777C31284B5ABAB4A5C02ADB2D13C67DDAC11B04A4517606E535CEB346390C8822EDF665D03DBE896A84CE0BE465BA060905530A6DF8A5275E07735AFA35021F8DE3C6D20A200BE24A296E6991E66DD9E6E1F8F45051F81ACCA46C00E033AACA030D997C534784E4B1E59EFD88CC5690691E5BA6D2686E587B0C9270C0BE903216CC48121D604C43114787D186E37AD149B2F26A96A5F977334E5CA28333936CD204AB57AAAA8D5887D4DF08A4B0E4065DAE6194DA152307BCCF1256785DDA30A6B296E3A947ECF8513ECEB020AE491CCF7C5E8688E0F0A2CE7BE81C1675F709D02604FD8CCBABD9126008E5085B5153701A9574CFDD7A9B17C9A5D13EB29CF6686C0982B4AB70C77AA391E1758D640733CAA996D56546D02B04B84A8020F840DA937B6DAA3FA0A0F9A953614B6624A352BB762B33B4D0623D5E2B8A1C3AA95B44244B5F3F54BC1655E6B8E3FD4C83E6754E22207081B60CAD71C7F1BD5BD7234C2E2CE567E9122C17540D5EF7DB0CB78CC051B59FBD698C64653027959305F9F52B12B8846253CCB23D5F78BD1657C68B18EC2E6C4527F3926F98AD48E0B7DB20B7C5174E413CD687EDE70472D43706036C07D1B5D37BCFEAFE87DD3B53C3F21EBB4F38A1A9D7029A3DF8A721EAFD236BA9D98216AE45C9630088C112F72081B32FBEE47DD1928845D1941F31426C8256CE6A89EC631F6A08C0F30132840D844A81EBDB051D194D5505846ECF128A9C40D02813BA8B6295894588E154C015CE90B216CC8E8ABC563541D3AC186B1401578CFA4C47B8D34C73B300700250A1B5DA36CEAD2DE0299A30A9C27961D98757B01AAC7094287DA598CC161A3E86350E4BEB0895035CE044DD8C2711B1192F65CC1273BB89AC3B8841B5917D5B1E57B4128651436EDA6578C66146ED5B13489C8089AD9589568A310D5ED04519D7DB024767023E7858DEA7A014C912D79F8198E5AEADE32D77053A9F81C38622324EDB9816A40F6524179A630496328B32F9A63206C5FD82CE1A8956F9A07F4E2738EEA0115FBC344731CA3EB66886ADB2C33F689103608EACA65C410368E8B4FD80878207431BA06A5C5AD460B1BDD526F048CC2C092EFF494BD812192F6FCC5C57E0BC2068032840DA997AD810A469406FB0A818A8363D51F2C055E4EC1630350004A1236C0BD116584EA715B7C12DE6D43D888C12C5FB37D6F01BF82B0692C584EEC858D96B011848DC5010BA8BFEFC515F855E3FB22081B019AD70A5528652484C146404D07C2A6D1F5DC34613387B081B0F1C151016C04B2E36ABE4ADD7C3180ABA51AD41465FFA5E2D800C206A40D9A73540F840D0025F831840DA893C887B07155816BF22CF28284303B368A6123E089CDFA9ED56507EE045CE7AB2828CCBABDD20A30EBF6C644F4D3C6B586DB4DCB737BC4B2803DEBF642EC21E40473D808D45CD82C140387102603AE83191BF7840DA143715ED8C818A07ABC6B5755133858A6A5E25807EE645C1FFB120428B0216CB011597160C9B717365A43D88092026355EC14C7B0A9A079BF5CB4A0C620CB96B0A19A278F6976F97DA9B068584EEC3EA7A80250036254813103089B7A089BD07219D696AEF35203470566E253E583989E053EE1E24011FD9C9D78382FF8DE6B081B315F15224136FABCB65980E1763325A22917B43ACC60BACFC0DFB0BF2DD351D1E0DDEF4C6023E0934FB4611EAF392D61D00EBF4A896CC6665A558186DBCD6EB8DD7434A7DD17246AAA56E0449871306150711093DA8809730000001036A928B27C6D95E8AA727489C4EDFF3857D8A80C6133CF28BA00000054216C342B3F7409B68553F02679551323683A0F840D68321860B9C3B3E25807C2261D63F85361A20DC2C67D1BA984FF356A0840D834BE1E560E0CB222089B744AF03B7CBA12B09C1880F404A882D42C206C72099BD80161D3D881B04AD88C9A56195846EC858D54416A8F1A02023A9E0A882A510566ECA9A51736F392CAB0839D52081B833C9B080A1C54C0C081CE0480BA83FE4ECF25EACF3361C3506D7AF7006153FE280ECB899DB1D1B3C24601BA166F7C0620308386099BA6750852055EF2579B55F71A6094E444673C878DBCC1E5C100040400650A1B83D7516894089ACEA0F3D7126D841902B770F9C38DE843415E540B7D02081B31F71947CF207B805E2A0E6339B11B36DAA15D3885AFC9FD6B4FCB0DF18E81B0BFC266B8DD8C54C767DDDE147E0500A898A5A3E5D28D985D1636AA1CCBA8E1FE163A24B2E710A029858D81A16AB1A70D927201A8EDA8B54A7C1E314FEBDEEF1764D7B8E4B2EC14C71A397B6C246C86DB4DA81105EB9A3B2AF6B071437C868ED908FBE6B8832E98F41D1CD9432CFA4BE890B00159848D41E038ADFAFB51357454D592EF009D8913369A671461A07CA28AEEEBF3887909B791720E61530361A39BB521A23F9ED7C5C031478D339615C2C68D112D848D5B8C1C2CD3A3E775DA815B3903668FB3081BC6ADEAE0ACDBF359E1B715A2AE8AA03945D0341FFD5661A3E1763387F8748A5596F65D21538845804156C5C266B8DD4C34A79CD7F4530BA5A3D99305CB89DDE71C55503A63C7CAA313B7B10775FA08610361536B61C338D11C7FA841BE0D00A05E9D7B15817852833A553D43BBA17E1678E6FB83A61928B5B0611B93DD694EFB83E5D30000C7F855F2FD4E15C77C5969B984DBA4120A2EDAB571B3C759666C68B8DD8C499FACF4EA4B2560058B1736EA3B5A3424EDB9852B09B9BA81DDA826F53D6AA08FA9E2458C26E8A9B061E246D77069D6EDBDD5C051AB54E00B8831E74749316CE41491E6F8B8A472CC35C7971ED5A9EA5B44BF1AE863AE7C8817D816364CDCB44CC48D07AFA5C21C1D542541939A9710E6EA2829CE28C64035FC7420F8BD78566723B88D95FE00F8206C182706E7BCCEBA3D973BF94B081BE7B976B43399E7983D00C570934324DB20AAF8FEB65943F878C102832C4BC28625135F189CFA34EBF6E6BE559066D975D1F78E338AB14651D13E4326FED186752A61AA39FEBBE0FB3FE4140A2EA29A65FA0597738239848D2561C33AF7A5A1B8B9F628EF0600E02FBA24E27141F78D34C76F3CAD4F5D60ECC0E5206C6A256C528A9B63DECD007E0800A8486014956BA39BAD997A5A9F4BCDF17543FC2A541CAB7AA9B7CA068D9A3DFE62F3624CDC9C189EFE34EBF676E87F419DC17E4E9572AB396E7BF65817FCBF795E9F0B4DE06C82AFAB844D8C26679756AB25FB895AADD65BABD51AF3BF2F44D83071B363ABA54CF6F768B3D99BCA4631B36E6FE4B00227527CFFA6299FAFD0CCEEB9B0C2649163E60014C724E728370D23D26F8436AF715027F268EFB29C7686B0A99680DE67467FB201CA983FE14B517766FBDC3C1B9EFE9D099C2A82C0D871475D662C7B5302D4D281F2C50DB691EBA374DD9614A716C44D44FA04DA5643DAEABCE6CFD7F658D88C6A226AFE11FCFE27DFD77E29B204C3ED66408679378C8732050E7B4DD0CE314229CB90AA4EB968068A6365ADCC523D67DFF1916CBBE6AFA37CE82CAF0CFCEB2DA3489B923EAFE6B6A2E72EA21FD5BD4EBBA662F38822877D7DE0783BB0BD7AADEC7E2D96889A4F83C8D6DBDBC7D7CCFC7B2ACB2222B615084D360634284F9F88FE189C7A56D592EF59B717680C79E4842DBBB77DFF914163786602B688E737B5D105CBEFAAC246A6652CC44625B024FD2B967B0F04CE84887E189CB7301CD098DA7D45C57D34716D30B8B923FBB386A6B949676437A93824FD52FDA2EADBA42F24AA76666E4CFAA4F8BD254162E2FF2D0BF60E59DDEB929FAF88283EEA99D2840D374392FB3D6C1661C384553FE72CC782DD3F2CA87E620B33210B221A6509F496C4E78288A22C62B061369A0CB79BB963C13F6002C0860F84E41E5322FA9EE2FC673ABC5A59739D7994A27E6C0591E36CC0C811DB9804D0643D4494FE3555CC7CB29DB7ADA5BCB7CDBADE51713339B6FAA2D0F05EAEEE9DF65F3B3BEA99AF65DE9D8D585BEC1B3ABF4B7EF84B47AE5146193B15DFBF9F71A4D6241BC5E45E3E42C7131B642562F5FE6078FE35A977BC2E73E62070C83669854D9B957FEE495B0BA8597D91CF6D9A44F1EE4B15A5186E37319B75B9220000288F29996F4991953B2AEEF5932BDCC19580030857A47EA9B2444781C344CE0236020094C08E0EEFFFEF0BB8F6093563B5E2186E041C20744ED824444EC804CE0529F66E0100004B8C2C0A9C3376AD5D83EAEF1B5C08548874B561A9C9C359604BBF23E2DEF1D9581505000002C664963FF24287A4D44995854DF6DF00D409A647FA7478B51B322D704C266FC9DA430B0D030000000075E10BAA000000000010360000000000103600000000001036000000000010360000000080B0010000000080B00100000000A882AFA80200DCE1E9AFBFD3FEC958F37FD728BABCC7EBADE9F05DA8BAD1A7C3266544878F3BC696AE1BB16BFBE043A674E8B0BBF48088CEB9DF67F9E237A8806FFFFB37D3DF61833E00FC1536117DFE52B5CBBB724F88E84781E50D88E81FF6EF5BAA7857E09C22E34152375322FA5E40DDBD79E24359DB858C67267C00840D00C00161236ABCAE06A50E11BD165CDE39115D7B1E9C7502A3280172BCEE82241F16F4841DBD6FB94F44B4A7C3ACCD94FDBFCFFEFFC3937603619301E4D800E07F00BCE0FEED6A50E245CD15F7EFBEC57B5CD7C8BE0BD96094FBB1C9F19AA1E76DA2CD099A1613D453EE9C35BD7FFC94FFD8F2125D4A7D80B001C03FF88EFA31D1298F1C2C2F5FBEBBC4FFA302EEF7E2A95D23C7EDE88BD05F3141A323E0FE7D8E2A84B0010054439FDE732C44C2C064D6E28DFD1CFF36E47EC7FFF42D94374C048D311D5E176409E04B41198FCF30105CB3CF9D3748512F6F927A5F4AEA2932BCEE92AB03D175F8BC907FD8EFD6DCEF6245F98E75BD935C7B9CF1B98FBF0F15BEB2331012B2B245827B05297D2CE6FEBD4FF9F7F789328A1849EA7467D04692B68F04D79926FE46E41F6B837B1C7D7C2DF8FBD0B0ADCAFC27D6D858E443B1A11F8E65FEF7F4D7DFC99FF0E9AFBFDFD8CF5C5618E4D800E0100639367C833DE1448269EE454844BFB9F3741DC0494288E41949B70C7E2F0B5C978AE3ABC4A85B741F5DEEC89C1385578960B9A38F791B22F68A8EFF58866F2C88B553D4DF0D17F85475B6349C7550E5ED241369234E6C9D9038478A0CECA8F3B117F68C3F0DFDC1D4C76C88F2DF06E7BD4804CE80889E38DB3F697C38CC50C72322FAC589B41F9A7B04196D74E45122E4DFB832F43503AC645BEC13D11F81BF6B6D2DCBC1C18C0D00FEB04C8C347789CED58489A09338A38FB91B7789809F15BE7CB719AFB1E644CD2A51CE161314E706415D258CF88E789510357CDEC69DE0FEC77CA1B66454CD0792A3A8E1AF73439F73661EB9DF4D258154362B762328E38D22808D12236799AFBC4A7CE531F17CAA40F44D503622A2534ED4A4652410B8368812A2E64C50F61557FE583213F1DF9845721DE244F9ABE61CD2DCE307EB175A8A7B041A1B89FC87BFC677C1DF771265B896B415595B5C27EADDA43F3951550A840D007E304804EF51E2F83471AE8CF3C42C434B1090C716CA3BA68F899C13C1C84F14FC93D738E5467981A6533D9E472905DF1F49599209DA63C96CD22317E05442B2CDEA7B2CB0DB5853FF0385EDC71A213A55D4C358229C2931B3B492F84AA4B0457276716E3003F198D2CF7E19FA7D1A3AF4F1B560CB40B45E6ADADA4A711DDD392AC1D64E889291E09C9384BFCA064B178AD9927BC3C112097C3C0D970A01CB0F3076103600F8CF932218243B97518A0E9C341D7696199B4E6204DE91045BDD28ED67625642C68B42144C35655D4A02007FBF6752AF9A8914E5BC341C65FE948C604DC4CB3C31B322AAABBE6406C0F4B558A010DCA2BAE6FF7D4BE6AF33F388EAB5A5B6F6AA696B3C7706ED49557F26E798BC62DC2B7C7DA7B077C0F985CAC755EDEF7B421C65413700F9C53DA7D647206C00709F5D2248E8CEB93408C07786C1659233305C49CEE1478E3F3465BD4971EF5821F84241677DCE8D48F93AFC9D0858B1E6C724F0EC72F8C0B966C4BC4F94FD98B0DA31BCFEA3C2076E0C7D652E09761383BAB12D4E6CB037386729112626FEDB57D4BF8895A2EEFB399F3560D73BFAF38E3E26FD9AAE1A5B66F0359D8FBC198AC777358AE46100DC41903C3C217542A0B46D4B46B4A70623D13CC99831A9F3594CCB6B5A5693F2CA9263DFB800D6515C33EB730CE87DA6ED42D1E9773831784FE219379324E880D5BF6816E64A22FA8EBE954C1237F5015D72F8DE2018E5F1B73C7F1B086CC2DBEC1BE9672CE724DE1472C7D9A195F26F4DCB93E6D965E7F26590B1E0DA7432513A20B3DDBEC7F43E2B792611B06F025FE57DF4930F23791800FFE8641435324E539E9F763F9820A3A8B151D6A37051719D083C26A34051C2B2EA4736A25E1ACE7A8C05C723CD71FE1E1D568EE4CCDE6FFAFCCAEF87A43EB2B0C83882E7EBFEDE427B49C33FF47999719008FA94C2A778DA39FE56E61BF38CF53290D4F19A2BC39E0907914FF3F71D29CAA79A75D1BD6A159597EFFF5694E2BB68103600B84BF2958E2EA8DE4982611A01101A065159A0206E54A62BEFB3E4BE6988159D2E2F4E28715E9BAB5715BA29F83EABA75010584DA7EF7502632279DE98E4AFC226F471D51691F9F7934CC58689E00A34F75A1BD84FC55D0A1125F39B4546A13450F8D81193574CFB0CFE9746C43D49EAF834713D9970F8A5105745ECF61D09FABF20CD05206C00709365A2D33419AD4C144162642858F86B4C53947797104EEB94E58D1433001D45D0BC3418094E251D75AA51A0843F6C34FA5B31EB7197F31EB2D1FF25F76312C093824C56BEB1A1AF8C0DEEA39AB99852BA3D7D74653825B39DACA7893A0B25BE32D788BF2749E035A9BF30A5A05B28DA8EEE5945222B30F44F53B1F96241282F389FE1FDE924AD5320C7060087603936217D4C5E4D933B207B97BE23FD3B7FD5DF93A6F3FB65B9BC7DFAB80C5BF49A27B9F789C973BD9059EE4EC4CD7088F24492364AE6D0F07FDFD274FAAF9CD00A1465576DA027BB4F40EF3369FC734C49FE95F0BCF935C7D90C3EF0F3F9117C9928A3DFC89EF1F89C7D81D04C964976CFE4BE2ED394B637A9BF9813572D031F4CE6972403B7C847791BEBF2C85A9A321EDB4E5F520FAA8DF554BE460A7F3E8A31A95895E5D840D800E09EB0E11BE519A55B299277A7DF374D90D5DD33ED4EC5AA72C59AD9083EA9F15E33BA4C767426E55C92D9EB24D1B54C856452C025EB821770225F1095712529B7A93FA4F595A4E0E267155439628F5CC0BBA56C2BF048239654F78E52F8CB9EC4B34B229B98D49FC9392A1FE293B3D71A3F95B5655E7088DAD4D1B6D71261C3FB9EADC1D25B1AB18BE46100FC6097E854D629FF7E95980D1075E8AA11133F0B9356986837CE4A4948E21C983D1313516206C714D372062C70C972208EBBB48AAEC56F4EA8624DEA5701BAA4CB80D5056FF773493949529749A1C5D7938CB181AF8CE8F3EEC4471193FC92F824A7AF2CE9F32ECB228EF78E34E725AF951435C75D949336E1DBDC7DCAF62AF32191CD793B0492E73EB69340D1DEBF257E77C9F53DAD84604D26F4A7FD70E83EE5F9AD6FFFFB97543FD23FC48C0D0000F889C1B7C55CA6A86F3CD59D39E99789FBC89813F2B74434518917155FE1230000004A162C63EEDF77A8B2545CD7F0993A9CA8117D8205C20600004065F0F9284BFAFC2A24A68F791C635459265E3C2FFF800EAF7103FAB8F8A093F7C210360000006C8FBE8FB336E724DFC539998C0AF4843512844F82DF5979B586E461000000B669D121F13AB919E49E0E49B52D889A4C0CE8B0726941E9F699729D47B2982FF47FF6CEEEB86D6479FB8F547B2F6EF17FC7B74ADC080447203802D34CC07004E689C054044B47B054025C2A028311988AC054D5E1DD61998C40EF05061645CD80400F3E0698E757A5DAB56C7C4C4FF74C7763A627D7E2E18B8B6EAEEB5AF40743A528215E7FB7FC3CDE6DE7B4214288CB70F307218410420821DDC6BBA4CDA23F9821DFD98277E3DD764A152184B80A9336841042082184741B6F92368BFEA0876487FCA70297317143087116266D082184104208E936AD4BDAA8E4CB082FDB9AAE2A7EE4FD78B78DA82A84104208E938BD23FF2AC4DBC3C28A7240529D73A97EF61431718811926AA1EB23DDDCA0F8819D2E13E07505D4F4CF4BD56E4248419AF868EA7CD266D11F4448AA2D5E37D837ABF16E1BFAA6908BFE20C6EB32E8A420E3DDF6A2A2BE99E2F529D0ADB68B457F1002F8DED1BEA21DD9F37EBCDBC61443AD346E93758E65EABF7B15C4A4419B0F3A170198A0F8C9EDB6A4E783CDD0AD448E0B7373DD76B339F9698BDD4CF0FA68172FE7D606FACBA7B9A52AEEE0DE4904AEFABA95F8F64D246D9C3B3A4A15079EC1AD034D6F17FD41EC63E286104208E938C78EE639DFE311C9E91673B433D9D053CEFE9786DFE30A4972234D703C214920C554C7D6D94D9E402D3D1566E988DD4460C2064892277FA15B2B8B08E9244E1C8BB9E80F7A8BFE60BEE80F9E01FC845B099BDF93D3A23FE0A046082184F8CB8D0AF67E2139CBFE19C987A69EE3EF1DA977FD85E613363AAE5500F98C64B5534055EB14B700FE39B19B69437613A97721093FC163AA09719E4693368BFE2058F4077B35887F6A81BCAE17FDC15ED5D52184104208F972148C468EBDDB5CBD579B82D41B003F1C9527298FAFCA6EF635F67304266C7430714388E334B23D6AD11F044896C0965944F8092F45B5369ABF0F917CB9092D9F7B0560B3E80F86E3DD76DF71FD989FFC7988666B0BB9CED389EEAD2B7C56AC7419A8770FE9E1A85D7189F7DD00F886D75F577BA8A7CEC213AA5D923F574E698F765458C79031A6936AD90078507A5B972D76817FD44F13B5228E99A1FC15350FCA1E75EDEA1DF958B715C8F31EED48E0C47829F44ABBC9EF57FFA37436ACD0770AC1844D163F01FC89EAB7AF6D943D0F8F7EC7BA7FD9AC8EFE7F0F37B7912E1D89178F7DC84EF98EB516222E3959F3006032DE6D3716EF13AA804AAA587FD93CBF0B088F527F351035512BC8B290EF2380D0D5A45DC9C5BB9DD171A56BBF4AB8D51D80994BFD57821D3D8E77DBA081F79E405E17E011C0C8F731B4E50C615F83AE89E446EF28B00E50CE071DD35833ADB96D21CA29F299160AB67DFF32E72300F88CB71F94DA68374BD825745CB09B50FDB76CBBA9A28FCBB28B950A08D72A20DC233BC964F3DC8B1C6DC2D11816C03E497850FAE9827F142A3BB96A918D00C90A419FC7B77363C814E57C50B8438385EC3B7D7A544927A8AC94935F7A07A940579281E7A92676FD7B37DE6DA70DBCAF7822ADEA94A18ADA19A849CFC6616EF4D87B559CDCD6C1BD4792E4DD3BDE5F33E164463B224D3202F06FCB1CEB738EE504E59C0254A7135E869F75AFDA5EC55819A09C0F770775AF4DCBED46EA77BA6C37650564EF50DE8A9B00C9763B49CC31B594B3788E84FDA93711640953D712374DC9AFEE71D8C513A1AA646F3117FCD9B47E3691B4A9BCA6CDA23F18A902C3368EC4FD78B7BD18EFB695AD6E18EFB6731544BC5303565EBE2FFA83117D76ABC1AD767C49B48D77DBF578B71D2ADDBE17DEE6D3A23F7856F59C829A9201BD457FB03C2A4E2E49D83C2259297431DE6DA3966C67ECD18E480B5976D0999C2AA7BFA84F704A1D4E781A6059F959AABD5185CEF05A8D717FAAF159CA959A17662DD7B37907ED6672643736CC4AB48D22099B837AF70B9530885BAE5F43D596CF05ED6BD3725D5CF916D778E437ACD0CE931BADA93469A3565FFC6B718B345913D51CE4F6321CB583726E3EAA77BB18EFB64BDA9EAC8059C341DF4AA8D7C33676904A5C5C00F8280C42AE00FC50099C794563C654256A7E41B6E5E200E0B3B2CBA0855B6F7CB2A390C32669016BD815E8BC46B52721852A8121FD6279409244896A94E95EC9C43679F34505973DAAA993766393B829A3C6C950D9465EDE295D5A77B03FE62896BC71257123B5ED267D22E9B303CFC6880D48212A2944ACEA336C2C9C88270041935FC6C7BBED1A404F151CA662E5734C8BF2D0F03BC742C760D8E6C14625197BCA4E63C856B17C5AF4079F94C31F2A7B918E171192AF6A364BE61F00441D280E2ED1C7554BED2800BF489176B057C905E916CDAA920A11EC0AAB7E43B232A249B906B0DB5E778D24C95FE6761A520E4DF7C706C947AA50FDDC64F80F234FFA648E97435BAE337C8A186EACA00C84D735F9EE52BF66C8218364517AD246AD42F869718B466A336404B81BAAC9D93E0F5B38A8A603ABA46641D8856053253802D58733C8F6A1A7AB6F8002B56F4A28020E2409A3A82B2BDD2CEC286EA91D0520A41D04B0ABA95545F01AC12E61E352C1CB259255006B0B39FF5001FA92EAEA0C2347746B9961D7430F7566AFDA3D82FBA7334AFCA2039A4F18AE50FC63164F9A239994BA3D4A051D36099B772E256C48A5832A1C9828D735B7D759C6BBED446D9D7A0F79FD86CCDA378BFE60B8E80FD66AFBD377C81336F700FE1CEFB6BD8E6D4D94EA55DCB0EEC4B423D2F1F9ED87C5F555ECBF8F6097B0790F37EBA9044856FF48F917ED3816DC0722D89547A86325F61A7E27F996707FD5F8ADB05D4D43BF88944E692B6D6C4E115141E2B0035B1B7C766A25FC522B34DAC66D573B5205E0B65BA75EADBE51BFFB64F96A4F484E8E5BD38EDEF0BDA57674CDEDA7C451022405843F9470AFA88277B349D87C84DB2B452748925CD293BB52D9CCA9C68DCC61D3927CA409C5497D125EF7A9049FB3C936C7EC7AA2A394A40D1336DE73EB5B8317FD41D8E593734EB64E4D2D1C68DB89F3DB78B79DD08E3ACB08ED3F0186D811A1BEAF8B3DBCDE96D743B54BD2FF42B95FB27B960EFD67B46365C154C94D9A9CFA0749E26749BB2985215ED7DB18C26E6BF339DE83454A899FAB4E46F0EBD86F5200EBA48DAA61C3848DA7787CDCF9089E64C3D596C5A9DAF214C3AE60701E1E91D4AA597B6447A1A7761482491BDFF9D4C136DDA39A6D3A738BF1F71EED5A7D3257C901E907837F517ED28C76532D07BC1C5F4F888F7ED10D92E43C6D80BCC1AAA68DDA42611358054CD870506D2923DF1A3CDE6DD7E3DDB687E498D62A4E2CFACFD151DD6BDA91177C0021DDE11B9282BA5105F78E2CECE509EDACF532C5CB165B096BAA642B38E0E5B86DC604044A176E3D6DFB88DD4F74D816228E21FFEAF391B50C38B8B4986B5DB15D1F18EFB6FBF16E1BAAC2C59F2D6FF788A4A8F0C578B79D796C47A1AF0DF7789511693F4F6A0CBC503F930A03189B3A366D9EA723C83F125C81A749B9CC9DB29B1E9860238C2DD8769289787B943A2258BA17FCBE63A7BEF81A6C0590ED6B5E8D77DBD0B176484E0719F9EE688C77DBB9DA22F9B5ED7AD0A0FEF520FBA2E49CFCD4C9604509C1C27BC46D9E948EC62A09B0AFF9F9338B6BEF3B304F8D00FC125EFB0149326D46356E9447245BDEE6E06A1A92CFE625BC77CC9F98A3F85646AE40265A44491B15E47E113EF330DE6D238ADEEB41D5A9006DBCDBAE17FDC1138A27A042AA002981B00B76A458A178028A76E437F7A8BFEEC81EAF13191BB85BFB24805DFD92490774648FE4D42BE911D27F7730595097DD0C2DF4EF82C31BF1DC2F5A0AED27043F669113A42B6DE616CF8C28760EAA0EB66589E289C85BAA0029815187EC2816D8C52D8FFEF69A399DD34CA616D7DEA13B898A258007C8BF42CFD1AD6D0775D94D886E163D266EC71692D21B2B07DBB2B49001E745F28AC2356D16FD4104F9B6A8476E8BEA1492A4C5C1D1A3B2457AE9F1E959A45C07A5308EDA91F49D684784BC2580DD52F969C7E411595CFB015CD54748677D22B89BE4902493E8139137480A11DB3801538ABC1B58140F757250B5088039B0121B3B0A20AC0BE5B01D1D68478494C2C4E2DA6F1D94C71EC9EA212933AA1421CED3A9F842F85E3748B62612F29B42491BB5CAE65AF8AC27AEB2E1A00AB797FB311B4E6847F648C6796E3524E42D36DB52661D95C9D4E2DA1BCED984388F68153FBA95B4617C41DE5074A54D64F1AC39C5CD60B383C1E6158F2C26B4236B3BE2D1DF84BC666271ED0AEE16562E83BB86E44A8A31A408087D22C4E00A645202B9933616C7D2A6CC29EE4E21D185A7F16EBBEE5AB009EE93277244F52A1CAD6793BE9BD48EE8A010528E3D74DDDF9A5AFA2E9CB3EB098687141FA9C99F8E1D6F97C42FE20A64F28A222B6D228BE7AC78324877E85A3D9BA3607303E0B1C64986D08E44E3690B9AC7AD8684C8E9811FC9CE716F716D441523C4493A195F588CC9F48BC86F2E6B30A4361813E1A09AB2145C73AB56A211423B92BFE335B7481162EDA8AF3C91D1DCE25A1E615D0FF48B48617F5A70CD138075077D22DBB980748C22499BA00165250C36DB32B046540B423BFACDB2669910D2256C1C755FFCAD18B295B10C866441B18480A223F4897EC315C8C48A22499B6B8BE76C28EA6E6051DBE8B10D5BE478F437A991DB9A75B44E3B5A0B1DFD906A4188ACD655CB029832585A5C1B51CDE8C313A790CEFF6D19F324EF7945BF88A4E44ADAD82E59673D1B0EAA2D73241FEA0AC0899F74BC9E8D4D40C5AD8684736CFD81415BB169EB07AA9AF3BA4CFC62D4F1316F493B22365CD6F08C15C5CC41B5658EA46860653D0E52C324BCECBA1D81ABD688DF0CE96F15F22B0E16D773CEEE9EFF46DA490FC08DE0BA47B46725D81A5C814C2CB8A408484D83479B267D069B84766409B71A122262C8E0BA96F99AC150F5700532A97ADE6FDB98B714DA518F2A4298B421B959F4070164B58D56E3DD76DFA260730F160C23EE39B307552BA64D48EC88DB1688CF8416D7C61ECA6BDD90AC7D6243111047C7BDB68D794BE17511558430694338A896F7CED72AB14588118B6D74BED811B71A129FE1EA8462AC29EBCAD934E03712C6177958FAE013811F850998B421F50CAADE049B1C5849853AB26C615BA5EF4C479F103FE6DAA6DB3CA4DA9C654D11900A09205CC5DFD2F64ADE9B0966C2A40D298468DB421B8E282EF19D196C92AA74A48D76B486ACF0DE886A42383614E2C963B9D9046F43AADD59F60DE934E1B8D7299F48B1A42D11097993361B8ACA6F3C39A2F8141EFD4DCAB6A3216427243C8D77DBB68EC373C13537DC6A4848217CF6D3F60D048CBE21F5E586141D39C348785DDCD2F62E6B9613E9087FE4F947E3DD76B3E80FA4CF703E885DF40753005F1D7BADBBF16E3B75E87DA48E4DDC62FB5842B0BA68D11F44E3DD760E426847E9BB4BC6D711B82C9F707C20E7598305CC5D654811908AE2C4B6FA451B24479517FD80370230A1BAF84B91ED512B8A8BCEA467C1E65278DD88EA424AD68D655B1BCCAD8684D442EC71DBF70DF836D4AF6A0372C2D8A2CB31A9C4A7BB4652FF87784A91A4CD5AFA109E04D20944136F1BEBD91CBDFB1E3CB298B8E1A0B43D2063E13D424855AC2902A7653CA4F8087DA252DE7F4495F197CB9A0C24A4A8DB8BA7F56CACF49E894A62D0892BC1A58F2A81D866964299D141213E115004C4516CE6A021C5474A8E0FE396B73BAE595EA403FC91F71F8E77DBA5455D1BA7954CD58E999E04573DE54085A8E68BEF4119ED5AFDEC1D5E95E2EBA09AB6E1AB50663108B1B7A36507DABE04F0B7E0BA5147DA4F481E7A16D76E283E115CD157BD3F477F88946D7F5DD0A795A0FD1CAF3CE68F1A140C006E17FDC1B02DA79F1C254F5E050BEA349318B2AFE54092A809D531B83E049BAD1F54C7BB6DBCE80F0E823E1FE128114888E776B459F407D2C27B8490F36C3C6E3B1302EE069936731FA14F64D2C32EB014DA5304D9A99CA4E55C16FCF7338B67451D083CD696ED18B53061037858CF4633B016E5461DEF4C08ED486E4757DC6A4808214E20F55F038A8E6890CEED3EFB44003F66794BA1A4CD78B75D22592D2221EA88CCF6D20BDB187C795ECFC676608D4008EDC8D6D10AA9418410D2386BE17557B0DBFA47BA89746E8F3BD2FE0D92A3BF8BC2C34E3CE55270CD54F8ACEB457FD0FA20B6435FBDF332F27C504D93950C36099D9366C6CE11D58710421A676D716D40F191137CAE6793C2F882E4A670D266BCDBCE205F6D33A5C8196CB6141E594C6847F63C08AEE156434208699E75037320E926A31A7D719789694F242F97C2EBA6C2EBAE17FDC184626F072A50BA915CDBC11549B15086236A1201EBD9A42C6B76F00869137B06C56CBBE3ACD847A4419B656C419FC85B44491BB5DAE651F8CCBF17FD418FA2EFF4A0BAEAA02C38B01211AC67F38A25ED8810236B8AA0765614412DBE10571E9332E6F4B883B210AD400630A41AF9C5A5C5B551038E3B69C7A0DAB9FE552B1E9E186C1201219D93DF76B407B71A12520574E0491DD8CC4B21C547D458754DBFC83A668AA84A7E214EDAA8A3ABEF8497DF2EFA8329C5CF60D3838195471613DA5109EDA21D1106C46703218EB11C67EBD051695DCB11C547C07A3665C416B6E31E6921362B6D30DE6DA71646F495F53EDC65D11F04488E692CCA4125F438B07260A51D255B4159CFA69C2089F305E93A1B8B6B7D5E8D36A4EAB4C217E2184E6C7CE26547E5B1075720931C5C96708F11E459F77F557280B8877472ED6AA06913448754273A270559D18EDE10519D48C7D9585EEFAB3F35B4B836A6DAD5163C5F83477F13AE3E2EB36D23AA933F58276D548D029B41F8078F73EDD4A0BAECB85C44D970EAB8B74827D4AE071292C27BDC6A487CC02661EB6B406CF3C539A6CAD5EAE731C8646C215AC58F6E176A8F694FE41C65ACB4C178B7DD00786F718B9F0C6A3BE30475DD01E2C04A8A3A28B4A3F29CFE902A4538C7709E29694CE0C951F5CB8E63387D22FA44FAF64976AD30B6F088CBB26EA496BCDB266E38983B80453F3CA9041E834D0EACB4A364EBA7E884840ED7B349DB37A7C34F48A9730C007CF0505E36736B4C751333135E770BD620F219E91CBEF4403692365ED12FF287CB326F5642E2E63B4F956AF5A0DA7907481559961CFDCD8261B4A3BCF8F2F557BAD5B047D5221D660DE0D1E2FA9167F28A6A0E9288BDEC228ACF5BB88ABF7C9B0AA9567E7059F60D55E2E69DC52DBE2EFA83985DD3CA60D3170748D44EAE24F30E69F0E4CBF817D72C5742DAC2DCE2DA8967BECA95F0DA4774BB46461DDC0BAF8B283AC6160578827D91F6CEC61660D2C61B2EABB8A95A8DF027E4A74ADD2EFA833D4F966A0C66C2AB1958196CD28E6847F6EDA41D91AE33B31C77869EC8696271ED9C6A668D5486D70C34BD44DAE7B14732921EFD3DA47A759FCBAA6E3CDE6DF7E3DDB607F932DF2B24274B7162AD118BD5208FEA24B1CE63516F84C126EDE81C87AED7B339B1234962FF03358C78C0378B6BA71EC867683916CCA862D6C4163EFE84E2F30EA95FB4F4CCA6185F102D97553F60BCDB0600EE2C6EF169D11F3C73D58DF3836AEC999C24D9F06B6E91A21DD18EEC9D31DA11F180A98DDF84EE1FFF6D239F6F54AFD29809AFFB00AE0EF00DAE3EAEAEAD23AA57F7B9ACE321E3DD760ABB3A3740B2EA66CD2294CE069B4BCFE4B4AC59BEC40F3B8A6947B4234200EC61975C98755836432489292953AA5769CC212F85C07EA04F748E473516FA422CB4271E76E20197753D68BCDBAEC7BBED05EC4E46B901F06BD11F2CD975E5A31262B7C2FE65B0C96093D84FA05ED9D178B795DA514415231E30B108886F3B6C27338B6BFFE35910580753E1753EAC082376BEAF8FF11EE30BA2E5B2EE078E77DB10F6AB6E3EA82D537376A11383EACA37418D77DB0D84477F73B558B7B1AC67B3F65064D2AD8674F6890F4416D7FE83EE6D418920AF65F304D6B2A98219E4C945FAF17E30125E177B28ABB86619939670D9C4438F56DDDC5BDE2AAD77C36D531C5439B012570885D72D6947B4234234E3C27D03F6E522432489A8BA7D1C729E89F0BA1B70E564D7E9A97E667C51AD2FC8F1ADE35C36F9F0F16E1B21391AFCD1F256E9B6A90DBFBE36126CC69ECA8B032B29D38E969ECA2BAE59CE84B48D08B2959D4072BC7257E6689B76DC015853952A636EE1CB77714518B1F779579ECA6B2FB4A56BFA45DDE6B2E9175047830748B64C1D2C6F778DA460F1F3A23F98B07BF3A3925DD7C23E8C7D9499453D0E1E59DC6D58CFA69EF18385F7884F04B0AB6FD3F6F1652DF551003C80456FEB20B2B836A6F83A4B489D28CCB26659931670E9CA8BA82D533D9493BC0180BF55F286AB6FAA35F495E77213B59F47167793457F3092EAD178B7DDD38E6A9337216D630FBBA2ADB700362D6D7B0CF9F68A2770756B5DAC213FF1EC1AAC6FD355461676EF2BD2B633B6E83097AEBD5005C99BE3D537F1A23F18B2DB39A87260251511D28E442C6B1EB70869231B007F59FA437BB4672B4A4FB559BAAAEE09DC76533713C8B7F27D025744758D00C015FDA2DADA7EABC64DD2412E5D7DB1A3E44D19356F8E95F927133846D9D4196CF93EB032D8EC26219D935ADBFF892A473C63A3FC22E947AD2B003F5B101C07007E41BE258A099BF6CD8300F0154CDC5017B88ADF46068C2F6AE0E2E242FA33BBB8B8985E5C5CF4B2FE9D8E4BD78592D6BC51A74D7D2BF1D6C7099CB5CFDB557844B1957E4A83CD1B6EDBEB9C1D0D215CC2EF6B5DA8A3F6AF21FC3ACBAD86C443F648BEA6DA04365F61BFE5AA2AE6007E58063B43AA49636C007CB6D4CD19C5D809A4098498A2E347E18E11027806F0458D71BFD49FF74812D5BD7337B86C536BC7BBED44256FDE41BEFC521B4003F8AE1238FB457F30F5EC08F189F0BA356DF0B78358A7DC49B7EC885F94ECC613DA11F1D909BCB3B8FE0A4972640D3796D447CA89B5594177076E3F768139EC3EB47E4192FCE95194AD65081ECC608354061FC0A4B54B04481233DF33E6E1D3248ED6AFBD6C63EBD5D6A9A14AE0FC07E5D4BE7923BCA342C651573549B5ED43CD034AD7D80BAFFBD49142AA52A7EAB6437634524E669DFAD335D65207A5CB6374C7C70030C0B6660ABBED5240F2E1EA971A8B9A989322E5ACFE63799F7768D7D69AC03220769D09EC3E4A5C2BBD9CB7D83E870DE9479B930E36FE4097D83424FBBAE8FADC3F5173EA0F14ABEBB4378D7917CFCFCF67AF36EDAD7230709A2249B854C913E447635F3826AF25EC8F9FFE6BBCDB6EE0296A6BC677CBDBDC8F77DBA8A5ED1F01F8D7E2160FE3DD76D4721D98C3BEB6CA7B9FB748A9AD653F7DB5A396D383DDE93E40B295624E515A13C13EF171ECEB4C505DDDBA50F5F97509F7BA87DD71D34DD9CDDAB2FDEF5B129C6D4AEAE747D5CF6D09E887EA5DAF2C6C3040FB3EEC044A2FAF2CEEF1006EF3B18DD10E6A9C75D15E6CFCE615DC4CF88CD4F864D367BFDBA6CBCF742A697312044448F6C45EB9F24E4D256DD456AF40FD84B04FD4989CA62580759793382AB80C9471965D04F5A064E8A41C55826AA8746854816D3DA8C92556EDDF3BD8FF21EDA8743B2A5B979CB6A396938E0169DF5D57F08C951A036215ECB1FFEA7588B302C8A5BAB7240828C3A1D505F1610B82DAE3B933ACC86E8EE74F17ED665F91CFB03C6A73D3898A63FFA8EC3E7E3C69AB2BFD5B75BB9F542C97EA76D7E7D70049B2BC0AFD99D72CC7DE917EA47EF30D4896FF1FA57FF02A69A3091066150559B9A92369B3E80F9E1DED86BBF16E3B6D91CE4C51FDAAADA2D4B61A63D11FC4706FFB529DEDA71D75D78E5A25C3861DC8EF8EBD93AB5FD85C6506F9B64D977179C58593631E9ADF36D6538986AB0EB4D545FFA8EA76BBA8D7BFC3D4968D5FAEF99765CDAB2EDA455B7863BFBAFCCCA50F9218EFB69BF16E3B1AEFB6172A71F21E2CFE4908218490EE325101CD3B945BFBAF291E90D4EF09C09A176D638FE48BFB81A2208490DF7C44CE84EB1F3E4A477DAD0FD33FAB953813245F6EAEA83F84104208E9086BBC148B1E215926DF165FE749F96631BBB1F5EC91246E36F4B50921047FA1C056C73F28AF64250E92A4CD24FD9D4AE48C50CDDE424208218490BA59E225813344F285EF9363EF78AFDE6BC3EEEA1C7BBC6C95A26F4D08F191839A7FF7452EF2A2A64D99A8A2BE23080ACAB9767A1421841042C81123545320DC445A20738EF69D924308212421C0CB07812E109E695F209C231FD5B599785B88B86ED42A9DE15107870030DE6D434A87104208212D24F56DC29C4EFA1E2FB56762F034B0B34E39218410F729901B49E7CC50CD8913E9FC70C14983104208218410420821C43D2E290242082184104208218410F760D286104208218410420821C44198B4218410420821841042087110266D082184104208218410421C84491B420821841042082184100761D286104208218410420821C44198B42184104208218410420871903F2802420821E42DFFFEDFFFABFA114B001F32FEFE3D80983D21660DE026E3EFFF04B077F8FDF700AE4E7EF70060C4AE6D8C08C014409053772200FFB4C4B67B007E697EFF0DC0845DEF0423A5531F2CEF730F60CEF98510191FFFF7DFDA9FC9953684104248BD0C55C077CEF166A0242304F08CEC848DEBF29DE06DC2863A512F3D24099ABDD2A76724099839F227FBA69ADF3D381A2C4F0BFE9E544FA07425D5BF7F619FB001804F00BEAB7BEED598490871988BE7E7674A8110420839A1A2953653005F35BFBF578EF429AEAF06718DA521A85901B83DF9DD1392049A8BECF13669738FE42B3BA987B9C1262F725E3F34F4D71CC0C6C1F64E35BF8BC1D5182EE9DEF1D83555FFAE0813759D2E217C4092BC5953FC8464D3C44A1B266D082184100D25276D7ACA19BED6FC5DBA55423721DF815FBAF306C86B4D307240F2B57A88E4CBF21BDF0B49A2C7B5E05997D8FBCBD160BFABFAF493F6486A660E73B2E611C9F6A832C68040CD39BAE4CD67144F0611E2154CDA104208218E5062D266846459FB2907BC6C958272A25D580D1242BF5C7EADDE71EF58574DA14F723CAAE02465AF095256A86E6BC0503D3F38F9FD5EC9716DB84EE798B5B1AE484FB5DD24DF5406FB06757B8F2469771A082FF176C5D641B5090DD8E330631C88D5FB6F5AAA0B55E941A89ED9D38C636BC7E435843EE99C8E63614576B2373CF3C2B29F0383AD6C8EE45FB77C438D0D159DD3D2B60D0B8EE965607A76D5F3727034979974287D87BAC794D0F05E71D5EFC3A40D218410E20825256D62BC4DC400FA82B213007FEBFC03D8AD06D14DF4E9AA8D2192AFAAB705EFE9C252FA1ECCAB97742B226600BE64C8C296483DF3BAE075C74199E91D75DBE4369A67D9AE04E9A9FBEA562C0D330283A17AEE278B673F2A1916D5299DDDA449AE40E9F74D453A68DAB2F65CE0DF9ECA7F0EBBBA2507A54779F56089E209AA21F42B912E8E1226D31AC79540B5F95620AF951A8BF7EAD9DF0BCAC216DD33CB1AFBF3C8AD779200D817182B2630D7DF2A6243938249871EB28B6687CA8EAE2D756F2A6C5FDEADAC263BFAF368ECBAAE419EC7BA382B61BC3CA8F617D1DD11DE7EDC3AFEF03252EF6633BF16793600BCB3F0714CFEC901C0F0E3FFFE5BB87F98B4218410423458266D02003F0C7F673A39C6E488DAAC06D125011E94B378A3716E969A771B29074CE7B8FE473DA36E4C4E56BA1D6A532038B259C5722E29F080B72B3902F5FEB71AF9DF1478BF29DEAE30B2093075C98F73F299C39CA839E0E5849AF8C869EEA9BE986404D9459CE5BD46373F437F6AD3A3FAF7BD23597F3B71E82383A33D33B47F93A35F80F3C9C1D8208F957A767CF29E81FA8932E4784EB74DE3D439BBD6F5FBBDBADF8DC606D627E34A4FD9804977F26CD1E9213BC1F5A4DAB0563F3D35EE8DD4CFB54637A079FF2AC73853D09E354F344D64B0AD633D58E2ED6AA6F0CC5C722E317C6E5E4B6DE556A37FF1C9781265E8DE37C33BEAEE13C05C2328CF497F4B9C4FD01E8FA36B259FD4F62719498C22F35AD638FE74E417EC3536181AECA9882D03FAD31E757D71389A53D627EF1265C8F3DC9CA29B47A41F414CFEC9EF3E91ACD461D286104208293769637228F37CF131397192D520A624D0B1F333CA1918F4A05F8151E5F6A2A2C16D1E27796D488C48B60398EE55E44B6700736D8973EF66EA5FC9D7799D4CB3563D980237C94A0969E2202B41726C73A302B613429FD8CB1B7898FAE45C00654A824405E438813EE9961578E8C69B73893F537F1DCB3CCAA90343E8B7059D1B574C4166D1AD44E71210556F4F358D654D25C325B62179DF9E6ABB6EFC3C97AC3A37AF3D299B5F5BB4A7A81E6F34498B73BA73CE8E8AD41632D9C3B931C42403C9386EB2E53CF3EB393B5CA97FB3B1D0D3730918DD5C22F90862B2E957492349D286477E13420821E5D053C1C21783C310E4082666194E4D51B21C9477478E731EF619CE6A5D0448B69DDC1A1215A31CF7589620DF21F4478A1F902C6B8F0A048DEB338EFDDD993E793004EFB6327DC0CBF26E9D53FA8FA10F7A28BE9C7CAD02B553FECE71EDD70C27FF02E65557456CE6A940F03415D8220C81C12714FBCA3B43921C5A1DFD7CCB687F087D8278226CE30149723980DD2A29648C4B4375CDA78C67EF0BC86CAEC64208FBCD763CBB35C87106B7986504C21782F7DDABF63F1418A3CFCD91A90E0C913F6158961E5F0BDA61D2AD7B25D379017946CAD6756348EFCCB87377F473AFFE2B19C7379017B036C9E251CDA96109BEC65AA05757C8FF512A1D7B6E0D73D1DAD608B9D286104208D15070A5CDC410641E0481E3C6E00416590D32847ED9BDF4CBB1A97D367BBE8B060D5F0CED2912A8F560B705CD74BDED17F9D810C09DEBF3D0104CE5392ADE24D3AC2FDD4B43A05F861E3C177C9729F4491BE99276932CF3AE5C32E9469E6D0A69909455AF21DDEEB34439C9529DCE4957079C16FDB6B56B9DFE56657B5259D862D2B726562F9E0BA8757656C62953261998ECBECC794D37CF16D9A2754E87B356C79ADA6D5393ACA82CCB6078F41342B6DA2782FE2340D195865973545EFDD05D9B67056F611B91ACB4F9836E3921841062C51AFA65DEE917D3A28EC7C610BC45B0FFE22F0D0674F77B40F5099B1EF4DBB2D2407189E2F5689E34F2BD45BE2FABF38C60D606D316893CC1A6AE3D930C1D302508CE05DE11CCF5027ED46C733D8393FCCD22E89965E898F47AE4D4CFBD0A2A7A30D769B9469238FD5B13DCCC0ADA6268D0B9A9A08D07A1FEF70CC1EE3743D06C92EFA8047DBA15F65B55F3892B0C0D76768F728E050F0BCA6056D2F81B65CCB1FB92747853703EBD87DDCAAE30C39FC82250BA3E825D41E9A2BEC8B9713712CAE083E01D8EDFE5F4FA0F67FA5F379716FD98940BAEB42184104234E4586913227B4F7CD9E4FD023B84FE6BA4B44EC214B2C2AAB64C906F8B4C59E4F9B2A7739A6C4F6CD2B5B3C85E7ADDF5A62F8B23E80B24E6D18D18E642B955B0CF08C8679A60C9666584492E7957D9986CAE8CD3BC46EA27EF8952795640ACA12F441E08C63BE98A8B39F45FE64DABC49E2DC6C4A2EF215D395434C0FC6E0858AB7EF6FE28403F1C2549A29331BDEAB17FAF491498DA1F405EFB2ACF73F3ACA8C8330E65E970D658632BD3A2B25CE2FC494C4FEA9DF6473A72FCFF1BBC9C42A91BFFCEAD3234CDF1D2959BBA39AAE8BCA01B1B753A66EAC75C05A0598898104208298933499BA521887A82EC0B91CE19BC113A33BA77B33955487A7CB10D6B43FB5728A7CEC41CB22D6865276D4C815BD14024CFD6229D435B643B80EEFA26B6729802049BE39175FA56A46DBAC0BFCAA3A2031518649DDC65EA5753B0714E7E3A1949130CA63ECCB2255D506AAB7FA6A444D5476D9F1BE7AA2A44DC8379E5A22EF96692CF4509EFA21B4FB2E6B8B2E6B5B21205D24485A9CF2F6A92A5A94F1F507CA5916D9B74362DF52DA4E35A1EFD381D674CFE5F6E1DE2F628420821A4FA80716D707A6DBFAA9F3A0EDF0DBF8FCE047336CB83F35E37AD48BEA62446D981D4DCE0B84E04C15268D1C7BAE0E149F00EF79A003E54CEBC49678BEAEB5A1318E4DD565656E066D2BD95856E44868023AF6C0243F224EB7ADB44E85AFDDB08FA84D115CC5BE474BF3BB70D6C6429A332C695A5A69DB7477A5E56A0B9423D099B54AEBAC0FF6F65B793129F3537E86956DDB57DC67B4B65D483B97ED34783DD879015CD8641B63ADB5B97A4C313811D41388E66C9F2BDE17EA684CDC8620C37251ECFC9EFAAE231E551A0A7338D8EDC9EF1FF6AF978C1D3A308218490FC4EC14F83A3F1AEE44446AC82F7533E091C1749122075084D75433615C87709F3F1A37F961C48491CEE34D1018D43372FF0EC5005437F0B02D7AC804CF79C914667D3D3518A3E6762D0C91F0287750EFDA955695F9B8297A1204122D185558144C0D4A0B35936B732D8F64468373A74361A1902AC89A08D8F429B0C0C7D782EC88B0CFAF7BD80FDA541D77346F05CE6387E8E8DD2F783E6EFBEA8F79C43BE622B54CF7836C8FC335E56DF9802589DAEFE8BE2AB21D204C32FE80B00FF95A14FA6796D5E82AD4BFADC340EDDE5480864CDF9418177880CB27C523A1517EC9BA24C603ECDF15C5B0173AD24896F3142B949E56F86FED1F97F1F51D36A536E8F22841042745EE9CBF6A8D4D9BC36045F554DD81343606F5A3A1FA2DC9A133314DFAF2F210DA4AE0CCED3A422F9CE0D8EF7B9D336A6301F35FD8897137EF647416AA8DA91A786C050D89E7546209A62F345F5D879BDCD4846CCD5BFD928DB09F0B29DC7D4FE8392D13A4782E243896D32D94C1A40A4ED18AA9FA92601F143687359FD95EA516C08624215B49992B8A655691B4D1F9C1BC322E84F77919E4AA3EBC322DB5CE6C84E5E3F29D9AE55BB8639ECAE4CFB901228799E2B06BB526DDB1FC93F50F20BD5FF67DDE3A0DA58A4EF4C7341FA3E338DBEF5D473A28CF1228FDD9739AF95B5D557A783E774D86447BA42F2F74A9EEB93713495E795C5186A7A8FF4B933CD3DD2BE1C215F6DAD73638A690E95FA169271ED9C2D9E2BAE6F556C98356D0821849072933623E8F74967054665F26C08E8829CC1B4340930443585558B2440AA3E4EDCE498E50DDCCE058FA62065AA1C639DA369A35359CEB84D902DE9BBBCB2981408BC4CFD65AB275901E9B9E0CED6E67A4A065F4BE88FB49E96A98F2790D5F228332032F5A124000F61AE4D65223D5D6C6AE8F3AAC79C22B6354179A7F93CA87BDAB66DA4647E65A9A7D302FDBD4639B5944C765E345160D2E1737588747694CE353D35EEDF0AC6D019E4AB333F09FB30AD2D170BE4DA43B24248679B9312E73DDBF92ECEE88FBB8FFFFBEFB4EE4181491B42082144438ED3A30849191E39DF6930BBC7CB17FFA5073208F1FA8BFF71D095CA2246C9C7A056D086D0E0C0AF6B7AF7215E5627E1E47DF64781778C7293703ED9AA2E215D7571F532ED2BFDEFA98E36A9AB43BC4E56C62776EF3313144B98A6E3D0B14CD33E5DA2FCC4A26EFE3A7EA68F634D0CFDF6DD00C046B252C616266D082184104208A91126857313E0F50A868DFA9106927BBC5D2962B32D911089CE35B9158F648F376757E03691B4E1E9518410420821841017E9E1F517EFF4FF2314AB2911C15C5324A09849454CA0DF4E36A1689C1B6762E8EB8C95BDB55804933684104208218410178991D4BC394DB85CE3A536C613DE166CEEE17C616E69917642F2623A627C43D134369EE4AD1DE4D49649266D08218410420821AE32573F219202A8A741D735F215244E0BB7CEE0766D25D20DA6057F4FAA274FC2E6CEC53EFAFF030064E1EDBFF555CA620000000049454E44AE426082, NULL)
SET IDENTITY_INSERT [dbo].[Logo] OFF
SET IDENTITY_INSERT [dbo].[Logon] ON 

INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (1, N'test')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (2, N'RiteshKumar')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (3, N'RiteshKumar2')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (4, N'RiteshKumar4')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (5, N'RiteshKumar5')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (6, N'RiteshKumar6')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (7, N'RiteshKumar7')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (8, N'RiteshKumar8')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (9, N'RiteshKumar9')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (10, N'SumitChoudhary1')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (11, N'hello.ritesh000')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (12, N'hello.ritesh0000')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (13, N'AtulAbhishek')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (14, N'90909090675')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (15, N'90909090677')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (16, N'9632475086')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (17, N'89851594154')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (18, N'89798787687')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (19, N'098908091')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (20, N'0989080909')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (21, N'0989080900')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (22, N'98812659312')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (23, N'54878664878')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (24, N'8795456456')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (25, N'9876345699')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (26, N'8544065747')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (27, N'7406455796')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (28, N'07406455798')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (29, N'9206684845')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (30, N'7877886868')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (31, N'5686798797')
INSERT [dbo].[Logon] ([UserId], [UserName]) VALUES (32, N'3456789121')
SET IDENTITY_INSERT [dbo].[Logon] OFF
SET IDENTITY_INSERT [dbo].[SearchYourNeedLink] ON 

INSERT [dbo].[SearchYourNeedLink] ([Id], [LinkType], [LinkText], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy]) VALUES (1, N'Carpenter', N'Carpenter', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[SearchYourNeedLink] ([Id], [LinkType], [LinkText], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy]) VALUES (2, N'Plumber', N'Plumber', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[SearchYourNeedLink] ([Id], [LinkType], [LinkText], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy]) VALUES (3, N'Electrician', N'Electrician', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[SearchYourNeedLink] ([Id], [LinkType], [LinkText], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy]) VALUES (4, N'Pandit', N'Pandit', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[SearchYourNeedLink] ([Id], [LinkType], [LinkText], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy]) VALUES (5, N'GeneralStaff', N'General Staff', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[SearchYourNeedLink] ([Id], [LinkType], [LinkText], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy]) VALUES (6, N'ShoeMaker', N'Shoe Maker', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[SearchYourNeedLink] ([Id], [LinkType], [LinkText], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy]) VALUES (7, N'Cook', N'Cook', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[SearchYourNeedLink] ([Id], [LinkType], [LinkText], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy]) VALUES (8, N'TentHouse', N'Tent House', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[SearchYourNeedLink] ([Id], [LinkType], [LinkText], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy]) VALUES (9, N'ToiletCleaningStaff', N'Toilet Cleaning Staff', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[SearchYourNeedLink] ([Id], [LinkType], [LinkText], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy]) VALUES (10, N'Driver', N'Driver', 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SearchYourNeedLink] OFF
SET IDENTITY_INSERT [dbo].[SliderConfig] ON 

INSERT [dbo].[SliderConfig] ([Id], [Description], [ImageUrl]) VALUES (12, N'Posting Ads is Free!!', N'/DarbhangaCityUploads/SliderImages/Banner1_c4k5dvw35rs_636312748902481813.jpg')
SET IDENTITY_INSERT [dbo].[SliderConfig] OFF
SET IDENTITY_INSERT [dbo].[StatusCondition] ON 

INSERT [dbo].[StatusCondition] ([Id], [StatusName]) VALUES (1, N'Active')
INSERT [dbo].[StatusCondition] ([Id], [StatusName]) VALUES (3, N'Blocked')
INSERT [dbo].[StatusCondition] ([Id], [StatusName]) VALUES (6, N'Created')
INSERT [dbo].[StatusCondition] ([Id], [StatusName]) VALUES (4, N'Draft')
INSERT [dbo].[StatusCondition] ([Id], [StatusName]) VALUES (2, N'Inactive')
INSERT [dbo].[StatusCondition] ([Id], [StatusName]) VALUES (7, N'Inprogress')
INSERT [dbo].[StatusCondition] ([Id], [StatusName]) VALUES (5, N'Published')
INSERT [dbo].[StatusCondition] ([Id], [StatusName]) VALUES (8, N'Resolved')
SET IDENTITY_INSERT [dbo].[StatusCondition] OFF
SET IDENTITY_INSERT [dbo].[UserRegistration] ON 

INSERT [dbo].[UserRegistration] ([Id], [FirstName], [MiddleName], [LastName], [Address], [EmailId], [MobileNo], [UserName], [ProfilePic], [IsVisitor], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdateBy], [PinCode]) VALUES (1, N'Sumit', N'Kumar', N'Choudhary', N'Bangalore', N'abc@gmail.com', N'9040903015', N'test', NULL, 1, 1, CAST(N'2016-02-14 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserRegistration] OFF
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(N'2016-04-04 20:30:12.980' AS DateTime), NULL, 1, CAST(N'2016-04-11 16:15:13.360' AS DateTime), 0, N'AAzSeHvG5GKojjsfejPgqiE2/JH+31a9GqPh8dxWFN9C4lAJ9y/GXl0wDjVfr8eBuw==', CAST(N'2016-04-04 20:30:12.980' AS DateTime), N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON 

INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (2, N'Administrator')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (3, N'Editor')
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (1, 2)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__StatusCo__05E7698A0724073C]    Script Date: 7/7/2017 10:25:43 AM ******/
ALTER TABLE [dbo].[StatusCondition] ADD UNIQUE NONCLUSTERED 
(
	[StatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__UserRegi__C9F28456536FB7C8]    Script Date: 7/7/2017 10:25:43 AM ******/
ALTER TABLE [dbo].[UserRegistration] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__UserRegi__C9F28456BB631C10]    Script Date: 7/7/2017 10:25:43 AM ******/
ALTER TABLE [dbo].[UserRegistration] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__webpages__8A2B61600E3896A4]    Script Date: 7/7/2017 10:25:43 AM ******/
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Enquiry] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[PageContent] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT ((1)) FOR [UserId]
GO
ALTER TABLE [dbo].[PostCateogryMapping] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[SearchYourNeed] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[VisitorCateogry] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Cateogry]  WITH CHECK ADD FOREIGN KEY([ParentCateogry])
REFERENCES [dbo].[Cateogry] ([Id])
GO
ALTER TABLE [dbo].[Cateogry]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[StatusCondition] ([Id])
GO
ALTER TABLE [dbo].[Enquiry]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[StatusCondition] ([Id])
GO
ALTER TABLE [dbo].[Memory]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[UserRegistration] ([Id])
GO
ALTER TABLE [dbo].[MemoryPicture]  WITH CHECK ADD FOREIGN KEY([MemoryId])
REFERENCES [dbo].[Memory] ([Id])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[StatusCondition] ([Id])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[UserRegistration] ([Id])
GO
ALTER TABLE [dbo].[PostCateogryMapping]  WITH CHECK ADD FOREIGN KEY([CateogryId])
REFERENCES [dbo].[Cateogry] ([Id])
GO
ALTER TABLE [dbo].[PostCateogryMapping]  WITH CHECK ADD FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[PostImage]  WITH CHECK ADD FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[Pvc]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[UserRegistration] ([Id])
GO
ALTER TABLE [dbo].[PvcAdharDocument]  WITH CHECK ADD FOREIGN KEY([PvcId])
REFERENCES [dbo].[Pvc] ([Id])
GO
ALTER TABLE [dbo].[SearchYourNeed]  WITH CHECK ADD FOREIGN KEY([LinkId])
REFERENCES [dbo].[SearchYourNeedLink] ([Id])
GO
ALTER TABLE [dbo].[SearchYourNeed]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[UserRegistration] ([Id])
GO
ALTER TABLE [dbo].[UserRegistration]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[StatusCondition] ([Id])
GO
ALTER TABLE [dbo].[VisitorCateogry]  WITH CHECK ADD FOREIGN KEY([CateogryId])
REFERENCES [dbo].[Cateogry] ([Id])
GO
ALTER TABLE [dbo].[VisitorCateogry]  WITH CHECK ADD FOREIGN KEY([VisitorId])
REFERENCES [dbo].[UserRegistration] ([Id])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Logon] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
