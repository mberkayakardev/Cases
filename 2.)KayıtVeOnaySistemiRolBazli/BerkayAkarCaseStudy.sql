Create Database [SERTRANS_CASE]
go
USE [SERTRANS_CASE]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17.03.2024 16:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[DepartmentId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedUserId] [int] NOT NULL,
	[CreatedUserName] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedUserId] [int] NOT NULL,
	[ModifiedUserName] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK__AspNetUs__3214EC0741DD543C] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 17.03.2024 16:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedUserId] [int] NOT NULL,
	[CreatedUserName] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedUserId] [int] NOT NULL,
	[ModifiedUserName] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_PersonelBilgileri]    Script Date: 17.03.2024 16:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_PersonelBilgileri] AS
SELECT U.Id ,
	   U.UserName,
	   U.Email,
	   U.PhoneNumber,
	   D.DepartmentName,
	   U.IsActive
FROM Users as U
inner join Department as D
on U.DepartmentId = D.Id
GO
/****** Object:  Table [dbo].[ConfirmationCardRoles]    Script Date: 17.03.2024 16:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfirmationCardRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ConfirmationCardsId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedUserId] [int] NOT NULL,
	[CreatedUserName] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedUserId] [int] NOT NULL,
	[ModifiedUserName] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ConfirmationCardRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfirmationCards]    Script Date: 17.03.2024 16:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfirmationCards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ConfirmationName] [nvarchar](200) NOT NULL,
	[ConfirmationCardDescription] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedUserId] [int] NOT NULL,
	[CreatedUserName] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedUserId] [int] NOT NULL,
	[ModifiedUserName] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ConfirmationCards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 17.03.2024 16:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedUserId] [int] NOT NULL,
	[CreatedUserName] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedUserId] [int] NOT NULL,
	[ModifiedUserName] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPreRegister]    Script Date: 17.03.2024 16:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPreRegister](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](500) NOT NULL,
	[CustomerSector] [int] NOT NULL,
	[CustomerProductSegment] [int] NOT NULL,
	[AccountResponsibleSales] [int] NOT NULL,
	[AccountResponsibleOperation] [int] NOT NULL,
	[AccountResponsiblePlanning] [int] NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[ContractDuration] [int] NOT NULL,
	[vade] [int] NOT NULL,
	[DepoM2RafSayisi] [int] NOT NULL,
	[DepoM2ZeminSayisi] [int] NOT NULL,
	[StorageFee] [decimal](18, 2) NOT NULL,
	[ServiceFee] [decimal](18, 2) NOT NULL,
	[TotalTurnover] [decimal](18, 2) NOT NULL,
	[EBIT_DA_Yatirim_Haric] [int] NOT NULL,
	[EBIT_DA_Yatirim_Dahil] [int] NOT NULL,
	[Transport] [bit] NOT NULL,
	[TransportServiceFeePerMounth] [decimal](18, 2) NOT NULL,
	[ConfirmStatus] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedUserId] [int] NOT NULL,
	[CreatedUserName] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedUserId] [int] NOT NULL,
	[ModifiedUserName] [nvarchar](256) NOT NULL,
	[ModifiedDate] [date] NOT NULL,
 CONSTRAINT [PK_CustomerPreRegister] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPreRegisterConfirms]    Script Date: 17.03.2024 16:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPreRegisterConfirms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerPreRegisterId] [int] NOT NULL,
	[ConfirmerRoles] [int] NOT NULL,
	[ConfirmerId] [int] NULL,
	[ConfirmStatus] [bit] NOT NULL,
	[CreatedUserId] [int] NOT NULL,
	[CreatedUserName] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedUserId] [int] NOT NULL,
	[ModifiedUserName] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_CustomerPreRegisterConfirms_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPreRegisterRequest]    Script Date: 17.03.2024 16:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPreRegisterRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerRequestId] [int] NULL,
	[CustomerPreRegisterId] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedUserId] [int] NOT NULL,
	[CreatedUserName] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedUserId] [int] NOT NULL,
	[ModifiedUserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_CustomerPreRegisterRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerProductSegment]    Script Date: 17.03.2024 16:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerProductSegment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SegmentName] [nvarchar](200) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedUserId] [int] NOT NULL,
	[CreatedUserName] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedUserId] [int] NOT NULL,
	[ModifiedUserName] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_CustomerProductSegment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerRequest]    Script Date: 17.03.2024 16:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestName] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedUserId] [int] NOT NULL,
	[CreatedUserName] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedUserId] [int] NOT NULL,
	[ModifiedUserName] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_CustomerRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerSectors]    Script Date: 17.03.2024 16:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerSectors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SectorName] [nvarchar](50) NULL,
	[SectorDescription] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedUserId] [int] NOT NULL,
	[CreatedUserName] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedUserId] [int] NOT NULL,
	[ModifiedUserName] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_CustomerSectors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 17.03.2024 16:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[RoleDescription] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedUserId] [int] NOT NULL,
	[CreatedUserName] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedUserId] [int] NOT NULL,
	[ModifiedUserName] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 17.03.2024 16:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedUserId] [int] NOT NULL,
	[CreatedUserName] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedUserId] [int] NOT NULL,
	[ModifiedUserName] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK__UserRole__3214EC07F584A54E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ConfirmationCardRoles] ON 

INSERT [dbo].[ConfirmationCardRoles] ([Id], [ConfirmationCardsId], [RoleId], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (1, 4, 2, 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationCardRoles] ([Id], [ConfirmationCardsId], [RoleId], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (3, 4, 5, 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationCardRoles] ([Id], [ConfirmationCardsId], [RoleId], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (4, 4, 6, 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationCardRoles] ([Id], [ConfirmationCardsId], [RoleId], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (6, 4, 8, 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationCardRoles] ([Id], [ConfirmationCardsId], [RoleId], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (7, 4, 9, 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationCardRoles] ([Id], [ConfirmationCardsId], [RoleId], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (9, 4, 10, 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationCardRoles] ([Id], [ConfirmationCardsId], [RoleId], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (10, 4, 12, 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationCardRoles] ([Id], [ConfirmationCardsId], [RoleId], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (11, 4, 13, 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ConfirmationCardRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[ConfirmationCards] ON 

INSERT [dbo].[ConfirmationCards] ([Id], [ConfirmationName], [ConfirmationCardDescription], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (4, N'Müşteri Ön Kayıt Onay Kartı ', N'Müşteri sisteme ilk eklendiğinde CustomerPreRegister tablosuna kayıt düşer. Bu müşteriyi onaylayacak olan roller belirlenir ', 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ConfirmationCards] OFF
GO
SET IDENTITY_INSERT [dbo].[Currency] ON 

INSERT [dbo].[Currency] ([Id], [Name], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (1, N'TL', 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Currency] ([Id], [Name], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (2, N'USD', 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Currency] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerProductSegment] ON 

INSERT [dbo].[CustomerProductSegment] ([Id], [SegmentName], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (1, N'Beyaz Eşya', 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[CustomerProductSegment] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerRequest] ON 

INSERT [dbo].[CustomerRequest] ([Id], [RequestName], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (1, N'E-COM', 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerRequest] ([Id], [RequestName], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (3, N'SERBEST DEPO', 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerRequest] ([Id], [RequestName], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (4, N'ANTREDEPO', 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerRequest] ([Id], [RequestName], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (6, N'YURTİÇİ DAGITIM', 1, 5, N'BERKAYAKAR', CAST(N'2024-03-01T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerRequest] ([Id], [RequestName], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (8, N'KARGO', 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerRequest] ([Id], [RequestName], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (9, N'IHRACAT', 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[CustomerRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerSectors] ON 

INSERT [dbo].[CustomerSectors] ([Id], [SectorName], [SectorDescription], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (1, N'Egitim', NULL, 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerSectors] ([Id], [SectorName], [SectorDescription], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (2, N'Gıda', NULL, 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerSectors] ([Id], [SectorName], [SectorDescription], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (4, N'Elektronik', NULL, 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[CustomerSectors] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [DepartmentName], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (2, N'Bilgi İşlem', 1, 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-16T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name], [RoleDescription], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (2, N'Kontrat Satis Yoneticisi', N'Kontrat Satış Yöneticisi pozisyonundaki kişilere tanımlanacak olan bir roldür. Müşyeri Ön Kayıtlarını gerçekleştirebilir, Fiyatlandırma verebilir.', 1, 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Roles] ([Id], [Name], [RoleDescription], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (5, N'Is Geliştirme Ve Fiyatlandırma Yöneticisi', N'Ek bir bilgi mevcut değil', 1, 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Roles] ([Id], [Name], [RoleDescription], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (6, N'İnsan Kaynakları Müdürü', NULL, 1, 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Roles] ([Id], [Name], [RoleDescription], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (8, N'Lojistik Depolar Müdürü', N'Global olarak tüm depolardan sorumludur', 1, 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Roles] ([Id], [Name], [RoleDescription], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (9, N'Satış Direktörü', NULL, 1, 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Roles] ([Id], [Name], [RoleDescription], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (10, N'Lojistik Direktörü', NULL, 1, 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Roles] ([Id], [Name], [RoleDescription], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (12, N'Mali İşler Direktörü', NULL, 1, 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Roles] ([Id], [Name], [RoleDescription], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (13, N'ARGE - BT Direktörü', NULL, 1, 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (1, 5, 2, 1, 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [DepartmentId], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (5, N'BerkayAkar', N'BERKAYAKAR', N'm.berkay.akar@gmail.com', N'M.BERKAY.AKAR@GMAIL.COM', N'8cffb19bb9712e811192916d313a4757aeedb67d958d64540ac057d994b6931d', N'05345643410', 1, 0, NULL, 1, 0, N'SYSTEMUSER', CAST(N'2024-03-14T00:00:00.000' AS DateTime), 0, N'SYSTEMUSER', CAST(N'2024-03-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [DepartmentId], [IsActive], [CreatedUserId], [CreatedUserName], [CreatedDate], [ModifiedUserId], [ModifiedUserName], [ModifiedDate]) VALUES (7, N'AhmetAksu', N'AHMETAKSU', N'ahmet.aksu@gmail.com', N'AHMET.AKSU@GMAIL.COM', N'8cffb19bb9712e811192916d313a4757aeedb67d958d64540ac057d994b6931d', N'05554443322', 1, 1, NULL, 1, 5, N'BERKAYAKAR', CAST(N'2024-03-15T00:00:00.000' AS DateTime), 5, N'BERKAYAKAR', CAST(N'2027-03-15T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[ConfirmationCardRoles]  WITH CHECK ADD  CONSTRAINT [FK_ConfirmationCardRoles_ConfirmationCards1] FOREIGN KEY([ConfirmationCardsId])
REFERENCES [dbo].[ConfirmationCards] ([Id])
GO
ALTER TABLE [dbo].[ConfirmationCardRoles] CHECK CONSTRAINT [FK_ConfirmationCardRoles_ConfirmationCards1]
GO
ALTER TABLE [dbo].[ConfirmationCardRoles]  WITH CHECK ADD  CONSTRAINT [FK_ConfirmationCardRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[ConfirmationCardRoles] CHECK CONSTRAINT [FK_ConfirmationCardRoles_Roles]
GO
ALTER TABLE [dbo].[CustomerPreRegister]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPreRegister_Currency] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currency] ([Id])
GO
ALTER TABLE [dbo].[CustomerPreRegister] CHECK CONSTRAINT [FK_CustomerPreRegister_Currency]
GO
ALTER TABLE [dbo].[CustomerPreRegister]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPreRegister_CustomerProductSegment] FOREIGN KEY([CustomerProductSegment])
REFERENCES [dbo].[CustomerProductSegment] ([Id])
GO
ALTER TABLE [dbo].[CustomerPreRegister] CHECK CONSTRAINT [FK_CustomerPreRegister_CustomerProductSegment]
GO
ALTER TABLE [dbo].[CustomerPreRegister]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPreRegister_CustomerSectors] FOREIGN KEY([CustomerSector])
REFERENCES [dbo].[CustomerSectors] ([Id])
GO
ALTER TABLE [dbo].[CustomerPreRegister] CHECK CONSTRAINT [FK_CustomerPreRegister_CustomerSectors]
GO
ALTER TABLE [dbo].[CustomerPreRegister]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPreRegister_Users] FOREIGN KEY([AccountResponsibleSales])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[CustomerPreRegister] CHECK CONSTRAINT [FK_CustomerPreRegister_Users]
GO
ALTER TABLE [dbo].[CustomerPreRegister]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPreRegister_Users1] FOREIGN KEY([AccountResponsibleOperation])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[CustomerPreRegister] CHECK CONSTRAINT [FK_CustomerPreRegister_Users1]
GO
ALTER TABLE [dbo].[CustomerPreRegister]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPreRegister_Users2] FOREIGN KEY([AccountResponsiblePlanning])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[CustomerPreRegister] CHECK CONSTRAINT [FK_CustomerPreRegister_Users2]
GO
ALTER TABLE [dbo].[CustomerPreRegisterConfirms]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPreRegisterConfirms_CustomerPreRegister] FOREIGN KEY([CustomerPreRegisterId])
REFERENCES [dbo].[CustomerPreRegister] ([Id])
GO
ALTER TABLE [dbo].[CustomerPreRegisterConfirms] CHECK CONSTRAINT [FK_CustomerPreRegisterConfirms_CustomerPreRegister]
GO
ALTER TABLE [dbo].[CustomerPreRegisterConfirms]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPreRegisterConfirms_Roles] FOREIGN KEY([ConfirmerRoles])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[CustomerPreRegisterConfirms] CHECK CONSTRAINT [FK_CustomerPreRegisterConfirms_Roles]
GO
ALTER TABLE [dbo].[CustomerPreRegisterConfirms]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPreRegisterConfirms_Users] FOREIGN KEY([ConfirmerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[CustomerPreRegisterConfirms] CHECK CONSTRAINT [FK_CustomerPreRegisterConfirms_Users]
GO
ALTER TABLE [dbo].[CustomerPreRegisterRequest]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPreRegisterRequest_CustomerPreRegister] FOREIGN KEY([CustomerPreRegisterId])
REFERENCES [dbo].[CustomerPreRegister] ([Id])
GO
ALTER TABLE [dbo].[CustomerPreRegisterRequest] CHECK CONSTRAINT [FK_CustomerPreRegisterRequest_CustomerPreRegister]
GO
ALTER TABLE [dbo].[CustomerPreRegisterRequest]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPreRegisterRequest_CustomerRequest] FOREIGN KEY([CustomerRequestId])
REFERENCES [dbo].[CustomerRequest] ([Id])
GO
ALTER TABLE [dbo].[CustomerPreRegisterRequest] CHECK CONSTRAINT [FK_CustomerPreRegisterRequest_CustomerRequest]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Department]
GO
/****** Object:  StoredProcedure [dbo].[KY_MUSTERI_ON_KAYIT]    Script Date: 17.03.2024 16:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[KY_MUSTERI_ON_KAYIT] 
@CustomerName nvarchar(500),
@CustomerSector int, 
@CustomerProductSegment int,
@AccountResponsibleSales int,  -- Personel Id si 
@AccountResponsibleOperation int, -- Personel Id si 
@AccountResponsiblePlanning int,-- Personel Id si // Ben bunları operasyoncu olarak düşündüm. Yani bu müşterinin stok planlamacısı şu, operasyoncusu bu tarzında  
@CurrencyId int, -- 1 tl , 2 dolar olarak Currency tablosunda mevcuttur
@ContractDuration int,
@vade int,
@DepoM2RafSayisi int, 
@DepoM2ZeminSayisi int, 
@StorageFee decimal(18,2),
@ServiceFee decimal(18,2),
@TotalTurnover decimal(18,2),
@EBIT_DA_Yatirim_Haric int,
@EBIT_DA_Yatirim_Dahil int,
@Transport bit,
@TransportServiceFeePerMounth decimal(18,2),
@CreatedUserId int,
@CreatedUserName nvarchar(256)
AS
BEGIN
     
	  DECLARE @MusteriOnKayitOnayciKarti INT = 4; -- Müşteri ön kayıt işlemi için onaycı kartımız 4 tür bunun tanımlaması yapıldı burada 
	  
	  DECLARE @CustomerPreRegisterInsertAfterId INT; 
	  
	  DECLARE @ConfirmerRolesVerables INT; -- Cursor içerisinden dönecek olan role id ler bu değişkene setlenecektir. 

	  DECLARE ConfirmerRoles CURSOR FOR  SELECT RoleId FROM ConfirmationCardRoles as CR where CR.IsActive = 1 and Cr.ConfirmationCardsId = @MusteriOnKayitOnayciKarti ;

	  
	  ; -- 4 numaralı kart için onaycı rollerini cursor ile dönüp ilgili roller için onaycılar oluşturmam gerekecektir. 

	  BEGIN TRANSACTION;
		
		insert into CustomerPreRegister( CustomerName,
										 CustomerSector,
										 CustomerProductSegment,
										 AccountResponsibleSales,
										 AccountResponsibleOperation,
										 AccountResponsiblePlanning,
										 CurrencyId,
										 ContractDuration,
										 vade,
										 DepoM2RafSayisi,
									     DepoM2ZeminSayisi,
									     StorageFee,
                                         ServiceFee,
									     TotalTurnover,
										 EBIT_DA_Yatirim_Haric,
									     EBIT_DA_Yatirim_Dahil,
										 Transport,
								         TransportServiceFeePerMounth,
										 ConfirmStatus, -- Onaylı kayıtlar 1 onaysız kayıtlar 0 olarak oluşturulur.
										 IsActive,
										 CreatedUserId,
										 CreatedUserName,
										 CreatedDate,
										 ModifiedUserId,
										 ModifiedUserName,
										 ModifiedDate)  
								values 
								(@CustomerName,
								 @CustomerSector,
								 @CustomerProductSegment,
								 @AccountResponsibleSales,
								 @AccountResponsibleOperation,
								 @AccountResponsiblePlanning,
								 @CurrencyId,
								 @ContractDuration,
								 @vade,
								 @DepoM2RafSayisi, 
								 @DepoM2ZeminSayisi, 
								 @StorageFee,
								 @ServiceFee,
								 @TotalTurnover,
								 @EBIT_DA_Yatirim_Haric,
								 @EBIT_DA_Yatirim_Dahil,
								 @Transport,
								 @TransportServiceFeePerMounth,
								 0, -- İlk kayıt onaysız müşteri olarak oluşturulacaktır. tüm onaycılar onaylamadan statüsü 1 e dönmeyecektir. 
								 1,
								 @CreatedUserId,
								 @CreatedUserName,
								 GETDATE(),
								 @CreatedUserId,  
								 @CreatedUserName,
								 GETDATE())

	    SET @CustomerPreRegisterInsertAfterId = SCOPE_IDENTITY(); -- son atılan müşteri kaydı için identity değeri alınacaktır. 

		-- Bu aşamada ilgili onaycılara ait roller burada toplanır ve bunlar tek tek müşteri onaycılarına aktarılır. 
		OPEN ConfirmerRoles;
		FETCH NEXT FROM ConfirmerRoles INTO @ConfirmerRolesVerables;
			WHILE @@FETCH_STATUS = 0
			BEGIN
				
				INSERT INTO CustomerPreRegisterConfirms ( CustomerPreRegisterId,  
														  ConfirmerRoles, 
														  ConfirmerId,  
														  ConfirmStatus,
														  CreatedUserId,
														  CreatedUserName,
														  CreatedDate,
														  ModifiedUserId,
														  ModifiedUserName,
														  ModifiedDate,
														  IsActive)

										values (@CustomerPreRegisterInsertAfterId,
												@ConfirmerRolesVerables,
												NULL,                      -- İlgili role ait kim onayladıysa onaylama prosedüründen burası doldurulacak 
												0,                          -- Müşteri kaydı oluşturuldu. İlgili müşteriyi onaylayacak olan onaycılar için rol bazlı onay kayıtları oluşturuldu ama onaylanmadıkları için tüm statüler ilk kayıtta 0 olacak Yetkililer onayladıkça 1 e dönecek
												@CreatedUserId,
												@CreatedUserName,
												GETDATE(),
												@CreatedUserId,  
												@CreatedUserName,
												GETDATE(),
												1);
		 
			 FETCH NEXT FROM ConfirmerRoles INTO @ConfirmerRolesVerables;
			END;

		
		CLOSE ConfirmerRoles;
		DEALLOCATE ConfirmerRoles;

		 
	  COMMIT TRANSACTION;
END;
GO
