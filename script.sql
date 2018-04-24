USE [thriljunkyDb]
GO
/****** Object:  UserDefinedFunction [dbo].[GetDistanceBetween]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetDistanceBetween]
(
    @Lat1 float,
    @Long1 float,
    @Lat2 float,
    @Long2 float
)
RETURNS float
AS
BEGIN

    DECLARE @RetVal float;
    SET @RetVal = ( SELECT geography::Point(@Lat1, @Long1, 4326).STDistance(geography::Point(@Lat2, @Long2, 4326)) / 1609.344 );

RETURN @RetVal;

END
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/18/2018 4:54:51 PM ******/
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
/****** Object:  Table [dbo].[ApiClaims]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ApiClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApiResources]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ApiResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApiScopeClaims]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopeClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApiScopeId] [int] NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ApiScopeClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApiScopes]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Emphasize] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Required] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
 CONSTRAINT [PK_ApiScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApiSecrets]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NULL,
	[Value] [nvarchar](2000) NULL,
 CONSTRAINT [PK_ApiSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[MediaId] [int] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientClaims]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_ClientClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientCorsOrigins]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientCorsOrigins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Origin] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_ClientCorsOrigins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientGrantTypes]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientGrantTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[GrantType] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_ClientGrantTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientIdPRestrictions]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientIdPRestrictions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Provider] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ClientIdPRestrictions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientPostLogoutRedirectUris]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientPostLogoutRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[PostLogoutRedirectUri] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_ClientPostLogoutRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientProperties]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_ClientProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientRedirectUris]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[RedirectUri] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_ClientRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clients]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AbsoluteRefreshTokenLifetime] [int] NOT NULL,
	[AccessTokenLifetime] [int] NOT NULL,
	[AccessTokenType] [int] NOT NULL,
	[AllowAccessTokensViaBrowser] [bit] NOT NULL,
	[AllowOfflineAccess] [bit] NOT NULL,
	[AllowPlainTextPkce] [bit] NOT NULL,
	[AllowRememberConsent] [bit] NOT NULL,
	[AlwaysIncludeUserClaimsInIdToken] [bit] NOT NULL,
	[AlwaysSendClientClaims] [bit] NOT NULL,
	[AuthorizationCodeLifetime] [int] NOT NULL,
	[BackChannelLogoutSessionRequired] [bit] NOT NULL,
	[BackChannelLogoutUri] [nvarchar](2000) NULL,
	[ClientClaimsPrefix] [nvarchar](200) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[ClientName] [nvarchar](200) NULL,
	[ClientUri] [nvarchar](2000) NULL,
	[ConsentLifetime] [int] NULL,
	[Description] [nvarchar](1000) NULL,
	[EnableLocalLogin] [bit] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[FrontChannelLogoutSessionRequired] [bit] NOT NULL,
	[FrontChannelLogoutUri] [nvarchar](2000) NULL,
	[IdentityTokenLifetime] [int] NOT NULL,
	[IncludeJwtId] [bit] NOT NULL,
	[LogoUri] [nvarchar](2000) NULL,
	[PairWiseSubjectSalt] [nvarchar](200) NULL,
	[ProtocolType] [nvarchar](200) NOT NULL,
	[RefreshTokenExpiration] [int] NOT NULL,
	[RefreshTokenUsage] [int] NOT NULL,
	[RequireClientSecret] [bit] NOT NULL,
	[RequireConsent] [bit] NOT NULL,
	[RequirePkce] [bit] NOT NULL,
	[SlidingRefreshTokenLifetime] [int] NOT NULL,
	[UpdateAccessTokenClaimsOnRefresh] [bit] NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientScopes]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ClientScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientSecrets]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NULL,
	[Value] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_ClientSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hint]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hint](
	[HintId] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NULL,
	[HintValue] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UserId] [nvarchar](max) NULL,
 CONSTRAINT [PK_Hint] PRIMARY KEY CLUSTERED 
(
	[HintId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IdentityClaims]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_IdentityClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IdentityResources]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Emphasize] [bit] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Required] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
 CONSTRAINT [PK_IdentityResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationTypeId] [int] NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[Address] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LocationType]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationType](
	[LocationTypeId] [int] NOT NULL,
	[Type] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Media]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media](
	[MediaId] [int] IDENTITY(1,1) NOT NULL,
	[MediaTypeId] [int] NULL,
	[MediaUrl] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Media] PRIMARY KEY CLUSTERED 
(
	[MediaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MediaType]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaType](
	[MediaTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MediaTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersistedGrants]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersistedGrants](
	[Key] [nvarchar](200) NOT NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[SubjectId] [nvarchar](200) NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PersistedGrants] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[LocationId] [int] NULL,
	[MediaId] [int] NULL,
	[PostText] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[LastUpdatedDate] [datetime] NULL,
	[IsFlagged] [bit] NULL,
	[UserId] [nvarchar](max) NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostTag]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTag](
	[PostTagId] [int] IDENTITY(1,1) NOT NULL,
	[TagId] [int] NOT NULL,
	[PostId] [int] NOT NULL,
 CONSTRAINT [PK_PostTag] PRIMARY KEY CLUSTERED 
(
	[PostTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reason]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reason](
	[ReasonId] [int] IDENTITY(1,1) NOT NULL,
	[Reason] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReportedItems]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportedItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReasonId] [int] NULL,
	[UserId] [nvarchar](255) NULL,
	[MediaId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[PostId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tag]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[MediaId] [int] NULL,
	[LocationId] [int] NULL,
	[Username] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Quote] [nvarchar](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vote]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vote](
	[VoteCategoryId] [int] NULL,
	[HintId] [int] NULL,
	[PostId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[VoteTypeId] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](255) NULL,
 CONSTRAINT [PK_Vote] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VoteCategory]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoteCategory](
	[VoteCategoryId] [int] NOT NULL,
	[Category] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[VoteCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VoteType]    Script Date: 4/18/2018 4:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoteType](
	[VoteTypeId] [int] NOT NULL,
	[Type] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[VoteTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180130230617_InitialIdentityServerMigration', N'2.0.1-rtm-125')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180130230632_InitialIdentityServerMigration', N'2.0.1-rtm-125')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180130230723_InitialIdentityServerMigration', N'2.0.1-rtm-125')
SET IDENTITY_INSERT [dbo].[ApiClaims] ON 

INSERT [dbo].[ApiClaims] ([Id], [ApiResourceId], [Type]) VALUES (1, 1, N'role')
SET IDENTITY_INSERT [dbo].[ApiClaims] OFF
SET IDENTITY_INSERT [dbo].[ApiResources] ON 

INSERT [dbo].[ApiResources] ([Id], [Description], [DisplayName], [Enabled], [Name]) VALUES (1, N'Custom API Access', N'Custom API', 1, N'customAPI')
SET IDENTITY_INSERT [dbo].[ApiResources] OFF
SET IDENTITY_INSERT [dbo].[ApiScopes] ON 

INSERT [dbo].[ApiScopes] ([Id], [ApiResourceId], [Description], [DisplayName], [Emphasize], [Name], [Required], [ShowInDiscoveryDocument]) VALUES (1, 1, NULL, N'customAPI.read', 0, N'customAPI.read', 0, 1)
INSERT [dbo].[ApiScopes] ([Id], [ApiResourceId], [Description], [DisplayName], [Emphasize], [Name], [Required], [ShowInDiscoveryDocument]) VALUES (2, 1, NULL, N'customAPI.write', 0, N'customAPI.write', 0, 1)
SET IDENTITY_INSERT [dbo].[ApiScopes] OFF
SET IDENTITY_INSERT [dbo].[ApiSecrets] ON 

INSERT [dbo].[ApiSecrets] ([Id], [ApiResourceId], [Description], [Expiration], [Type], [Value]) VALUES (1, 1, NULL, NULL, N'SharedSecret', N'Q+bw3BC58luDS3eW1mhsK6Gr8AJ2bZguLbVoc5mcSts=')
SET IDENTITY_INSERT [dbo].[ApiSecrets] OFF
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] ON 

INSERT [dbo].[AspNetUserClaims] ([Id], [ClaimType], [ClaimValue], [UserId]) VALUES (1, N'email', N'scott@scottbrady91.com', N'5BE86359-073C-434B-AD2D-A3932222DABE')
INSERT [dbo].[AspNetUserClaims] ([Id], [ClaimType], [ClaimValue], [UserId]) VALUES (2, N'role', N'admin', N'5BE86359-073C-434B-AD2D-A3932222DABE')
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] OFF
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [MediaId]) VALUES (N'03075583-5a1f-4145-a6e7-808cff7c6b73', 0, N'8e0e1c84-92a9-49ed-92c0-2e3324a787d7', N'brad.lietz@outlook.com', 0, 1, NULL, N'BRAD.LIETZ@OUTLOOK.COM', N'BRADLIETZ2', N'AQAAAAEAACcQAAAAEEaN6Ns+X3O8E2WIRbrs/3ulABQPmguUH+JLh2tyQCeO/MrP1Vu3xLL7pb2DTGhw7w==', NULL, 0, N'cc4498c2-d8c8-4062-a30d-a26c1c69752e', 0, N'bradlietz2', 255)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [MediaId]) VALUES (N'2029f919-3119-4185-a95c-a5e2275c8feb', 1, N'a83ebfbd-fbe7-462d-b7cf-18a74f3c8dec', N'brad.lietz@outlook.com', 0, 1, NULL, N'BRAD.LIETZ@OUTLOOK.COM', N'BRADLIETX1', N'AQAAAAEAACcQAAAAEFzmJlOfUreDPBdWbfeypeH2C2W6zcgUQwQf6BdqonDoPg+SX42kZojXOwS6yBombw==', NULL, 0, N'ac5de35e-aaed-4e5d-93f0-129f087f96b8', 0, N'Bradlietx1', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [MediaId]) VALUES (N'26f896c1-244a-4298-b3c9-4426bb60ce74', 0, N'76d105e0-296f-44be-89bd-5df9f5a91919', N'brad.lietz@nvinteractive.com', 0, 1, NULL, N'BRAD.LIETZ@NVINTERACTIVE.COM', N'BRAD.LIETZ@NVINTERACTIVE.COM', N'AQAAAAEAACcQAAAAEOos2epiXk8PsbUX3KRdTHh9/b1oNrkebyeOhecopQMqb9d4urYhuVPw/867+X72fg==', NULL, 0, N'4be3a583-0ba3-46bd-ae7c-8c052c8c287d', 0, N'brad.lietz@nvinteractive.com', 254)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [MediaId]) VALUES (N'3e75e0f8-5efe-4193-a890-e73df382eec0', 0, N'32951f2c-dbe7-412b-a3e9-96d17e7f4984', N'bradlee', 0, 1, NULL, N'BRADLEE', N'BRADLEE', N'AQAAAAEAACcQAAAAEETHdhOitvRXMYP6BG/j3Ab5ZiXdaw3kLUbikmv1dB0PTUQVU4mugPCH/3YnXHYnNw==', NULL, 0, N'2f6b0fe4-1c0d-4552-849c-a3f7cecde816', 0, N'bradlee', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [MediaId]) VALUES (N'406b9865-b908-4d17-b25e-8df085aaf3ba', 0, N'0f406550-2024-4851-b76f-49013d36dadd', N'test@test.com', 0, 1, NULL, N'TEST@TEST.COM', N'TEST@TEST.COM', N'AQAAAAEAACcQAAAAEDWj+pybz0bO5H9vswhBV0Zq0FexmU41IqhmQw6aalh5ZdUYtvQe5wHi3kv73Rrg+w==', NULL, 0, N'88634b9f-0e3a-4fac-b46a-1351e0b90aa2', 0, N'test@test.com', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [MediaId]) VALUES (N'51531831-9512-4d20-95ac-d4f869a4323b', 0, N'86b921e8-b99a-44bc-90aa-e001931b8dba', N'brad.lietz@outlook.com1', 0, 1, NULL, N'BRAD.LIETZ@OUTLOOK.COM1', N'BRAD.LIETZ@OUTLOOK.COM1', N'AQAAAAEAACcQAAAAEKA2prrG61C14PyQpy+juLESmH0x2bRUMnmu2nyUWngoOYWDo0Af3QuXozD76ifi4A==', NULL, 0, N'aa302862-6a62-4dcd-9f58-687dd5aeef1e', 0, N'brad.lietz@outlook.com1', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [MediaId]) VALUES (N'5BE86359-073C-434B-AD2D-A3932222DABE', 2, N'6433bb67-073e-490c-9607-72bb4ebc9f36', NULL, 0, 1, NULL, NULL, N'SCOTT', N'AQAAAAEAACcQAAAAEIVoMyihkedHrL+Kc989+cMScrX3H/5T22sZm+T1xYX3U/M9Wp2oHUQKsAKA+OTMag==', NULL, 0, N'17b0d2f1-9ca9-480a-a3ca-751db20f0532', 0, N'scott', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [MediaId]) VALUES (N'6f1e0737-646f-416c-a317-52d23bd2e165', 0, N'45eb4337-1a53-48da-a41b-7cb796160570', N'test1@test2.com', 0, 1, NULL, N'TEST1@TEST2.COM', N'TEST1@TEST2.COM', N'AQAAAAEAACcQAAAAED3+xTkGIPGLXkXtN7zYSu5EJ7sL1dm8kIm2iR8Y3CEqFSwHAvOyPjspQ5Qow7oJuw==', NULL, 0, N'7677f62d-8d69-4527-9d86-ef9bfb732643', 0, N'test1@test2.com', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [MediaId]) VALUES (N'79d3738d-4bb1-4482-b64c-e9d8c7434d4b', 0, N'e6f536d9-49ff-4f0f-85bb-a193f560c373', N'brad@test.com', 0, 1, NULL, N'BRAD@TEST.COM', N'BRAD@TEST.COM', N'AQAAAAEAACcQAAAAEE0EnKkZDiEJfoPk5kWQE+0JdUJy18m1oNG0xEaqANgbFOrrLCtDH5hTz9udbLSrSA==', NULL, 0, N'0359465a-1fbf-4f47-bc61-5cda46835632', 0, N'brad@test.com', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [MediaId]) VALUES (N'7f922095-8186-44f2-a4d4-160d3c7f874e', 2, N'4739ee67-60cf-4961-b7b3-f4f50b2a2d8e', N'test@test.com', 0, 1, NULL, N'TEST@TEST.COM', N'BRADLIETX', N'AQAAAAEAACcQAAAAEF4qsEKQ/NydPNc7NJ1Z0vRvsrblc8MbzJp7Y/RfqukmpPrxmPW7AtcSVU5D7XwDQA==', NULL, 0, N'572791a8-eb9e-4deb-be55-75b7aef95ecd', 0, N'bradlietx', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [MediaId]) VALUES (N'9185ed9f-22ac-4e47-ac54-d66deaf99583', 0, N'da5c20e0-6c47-4c05-be99-e14a479bd31a', N'brad.lietz@outlook.com', 0, 1, NULL, N'BRAD.LIETZ@OUTLOOK.COM', N'BRADLIET', N'AQAAAAEAACcQAAAAEAqZ+hVk7RFaFx82U1OBAeFjRmtnBz+a6XZ+MXCjNDBYtlUDBWeTtMQ2DzS9uJsGbw==', NULL, 0, N'678ec192-1b9a-43e2-88da-a3389622df78', 0, N'bradliet', 257)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [MediaId]) VALUES (N'99afd592-5c6f-47ce-9d40-63be7d44c4e3', 0, N'8e2b0230-5709-4ae6-86e7-bc9c8945c1cd', N'brad.lietz@outlook.com', 0, 1, NULL, N'BRAD.LIETZ@OUTLOOK.COM', N'BRADLIETZZZZZZZZZZZZZZ', N'AQAAAAEAACcQAAAAEHK/Vi8ZNFFuLTdGo6XzW7wefPdzpDH34P7/ovZ9VsPhfMh3YF2a2xQnxkYvKFQx+A==', NULL, 0, N'044c559a-ad25-4f1d-8d81-0256f590569a', 0, N'bradlietzzzzzzzzzzzzzz', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [MediaId]) VALUES (N'bbc55a12-a4fe-4733-a392-1c6208499ff6', 0, N'fd5f5c43-e59d-473a-8a8a-72f488c2dab1', NULL, 0, 1, NULL, NULL, N'BRADLIETZ1', N'AQAAAAEAACcQAAAAEP/FFLRj6klwpcuI3TpYMzidvZZwd80U4AXBnbc3RVa+K97/WKzIkdeuyuk5W25OOQ==', NULL, 0, N'0e10b307-48ea-40e6-932c-b61769ff1f5b', 0, N'bradlietz1', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [MediaId]) VALUES (N'c261f817-ce6d-4568-9b79-f4acd7a5b22a', 0, N'9b9a7efb-931a-4322-ace7-f1a7458f48ec', N'brad.lietz@test.com', 0, 1, NULL, N'BRAD.LIETZ@TEST.COM', N'BRAD.LIETZ@TEST.COM', N'AQAAAAEAACcQAAAAENjWVSpTaTIACt+JR/Xgl1msF+iE8MtyReMNodbC3Ck/sGh925hJxqJgSW4Qv8fFQQ==', NULL, 0, N'271a4fd9-0850-4bbf-a2e7-e581640539a3', 0, N'brad.lietz@test.com', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [MediaId]) VALUES (N'c562c810-89c1-42f9-9e75-24e9f5205223', 0, N'd373df6d-dadb-4790-85a0-a3f3067d6b83', N'test@test.com', 0, 1, NULL, N'TEST@TEST.COM', N'BRADLIETZ5', N'AQAAAAEAACcQAAAAEIRlY7hB8cm9wVGtk2S1VBpNKR23K61mebTBO061cfUxwGTrg1LrEMxqrP5qu0jHpQ==', NULL, 0, N'4b770b09-8da3-44e2-b939-c5106fd027a3', 0, N'bradlietz5', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [MediaId]) VALUES (N'cdb55d0a-6d19-46a0-af86-391ad1b627f7', 0, N'0358820e-23fb-43f3-9703-a4a89bd8f5dd', N'brad.lietz@outlook.com', 0, 1, NULL, N'BRAD.LIETZ@OUTLOOK.COM', N'BRAD.LIETZ@OUTLOOK.COM', N'AQAAAAEAACcQAAAAEEie3tWgbVUqhRZrW4Uj8gW1qOcJ44zsrd6ZTox4M9QTZ3dfLM8CS5s/Rle/rMLwDw==', NULL, 0, N'181db17d-9444-44d8-a0c3-610bacef36a8', 0, N'brad.lietz@outlook.com', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [MediaId]) VALUES (N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4', 0, N'056302aa-0070-45f8-acbe-22b1dd5df23d', NULL, 0, 1, CAST(N'2018-02-05T22:38:05.2426108+00:00' AS DateTimeOffset), NULL, N'BRADLIETZ', N'AQAAAAEAACcQAAAAEEDAK1qY8QvIgEDgmRU9qde/jaIIIWltrhnhDDfzcvD0pOp3dvQpDsb/tsFeQlFuFg==', NULL, 0, N'af1e5948-6f39-4585-a205-1230f60e8aa8', 0, N'bradlietz', 263)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [MediaId]) VALUES (N'ee3623b8-f6ba-405b-9827-ad3e1c4a62a4', 0, N'cd37481d-1a2b-475d-a8a2-755d3e0464fa', N'test@test.com', 0, 1, NULL, N'TEST@TEST.COM', N'BRADLIETZ3', N'AQAAAAEAACcQAAAAEFl1ZnAirpaE2rDYW5F95F8MoRyS4yGzzfYDHGoBbFalFJUCrYeMCxbkEE1AKDPpxA==', NULL, 0, N'b7a831fd-aefb-4979-88ad-b200aa3962cf', 0, N'bradlietz3', NULL)
SET IDENTITY_INSERT [dbo].[ClientGrantTypes] ON 

INSERT [dbo].[ClientGrantTypes] ([Id], [ClientId], [GrantType]) VALUES (1, 1, N'client_credentials')
INSERT [dbo].[ClientGrantTypes] ([Id], [ClientId], [GrantType]) VALUES (2, 2, N'implicit')
SET IDENTITY_INSERT [dbo].[ClientGrantTypes] OFF
SET IDENTITY_INSERT [dbo].[ClientPostLogoutRedirectUris] ON 

INSERT [dbo].[ClientPostLogoutRedirectUris] ([Id], [ClientId], [PostLogoutRedirectUri]) VALUES (1, 2, N'https://localhost:44330')
SET IDENTITY_INSERT [dbo].[ClientPostLogoutRedirectUris] OFF
SET IDENTITY_INSERT [dbo].[ClientRedirectUris] ON 

INSERT [dbo].[ClientRedirectUris] ([Id], [ClientId], [RedirectUri]) VALUES (1, 2, N'https://localhost:44330/signin-oidc')
SET IDENTITY_INSERT [dbo].[ClientRedirectUris] OFF
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Id], [AbsoluteRefreshTokenLifetime], [AccessTokenLifetime], [AccessTokenType], [AllowAccessTokensViaBrowser], [AllowOfflineAccess], [AllowPlainTextPkce], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [AlwaysSendClientClaims], [AuthorizationCodeLifetime], [BackChannelLogoutSessionRequired], [BackChannelLogoutUri], [ClientClaimsPrefix], [ClientId], [ClientName], [ClientUri], [ConsentLifetime], [Description], [EnableLocalLogin], [Enabled], [FrontChannelLogoutSessionRequired], [FrontChannelLogoutUri], [IdentityTokenLifetime], [IncludeJwtId], [LogoUri], [PairWiseSubjectSalt], [ProtocolType], [RefreshTokenExpiration], [RefreshTokenUsage], [RequireClientSecret], [RequireConsent], [RequirePkce], [SlidingRefreshTokenLifetime], [UpdateAccessTokenClaimsOnRefresh]) VALUES (1, 2592000, 3600, 0, 0, 0, 0, 1, 0, 0, 300, 1, NULL, N'client_', N'oauthClient', N'Example Client Credentials Client Application', NULL, NULL, NULL, 1, 1, 1, NULL, 300, 0, NULL, NULL, N'oidc', 1, 1, 1, 1, 0, 1296000, 0)
INSERT [dbo].[Clients] ([Id], [AbsoluteRefreshTokenLifetime], [AccessTokenLifetime], [AccessTokenType], [AllowAccessTokensViaBrowser], [AllowOfflineAccess], [AllowPlainTextPkce], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [AlwaysSendClientClaims], [AuthorizationCodeLifetime], [BackChannelLogoutSessionRequired], [BackChannelLogoutUri], [ClientClaimsPrefix], [ClientId], [ClientName], [ClientUri], [ConsentLifetime], [Description], [EnableLocalLogin], [Enabled], [FrontChannelLogoutSessionRequired], [FrontChannelLogoutUri], [IdentityTokenLifetime], [IncludeJwtId], [LogoUri], [PairWiseSubjectSalt], [ProtocolType], [RefreshTokenExpiration], [RefreshTokenUsage], [RequireClientSecret], [RequireConsent], [RequirePkce], [SlidingRefreshTokenLifetime], [UpdateAccessTokenClaimsOnRefresh]) VALUES (2, 2592000, 3600, 0, 0, 0, 0, 1, 0, 0, 300, 1, NULL, N'client_', N'openIdConnectClient', N'Example Implicit Client Application', NULL, NULL, NULL, 1, 1, 1, NULL, 300, 0, NULL, NULL, N'oidc', 1, 1, 1, 1, 0, 1296000, 0)
SET IDENTITY_INSERT [dbo].[Clients] OFF
SET IDENTITY_INSERT [dbo].[ClientScopes] ON 

INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope]) VALUES (1, 1, N'customAPI.read')
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope]) VALUES (2, 2, N'openid')
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope]) VALUES (3, 2, N'profile')
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope]) VALUES (4, 2, N'email')
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope]) VALUES (5, 2, N'role')
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope]) VALUES (6, 2, N'customAPI.write')
SET IDENTITY_INSERT [dbo].[ClientScopes] OFF
SET IDENTITY_INSERT [dbo].[ClientSecrets] ON 

INSERT [dbo].[ClientSecrets] ([Id], [ClientId], [Description], [Expiration], [Type], [Value]) VALUES (1, 1, NULL, NULL, N'SharedSecret', N'q1w5YgqB4je2a9SVVPyU6Osjpg6Z0BxfPwsw6NruIw4=')
SET IDENTITY_INSERT [dbo].[ClientSecrets] OFF
SET IDENTITY_INSERT [dbo].[Hint] ON 

INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (1, 5, N'Testing', CAST(N'2018-03-09 02:11:08.360' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (2, 5, N'Testing 2', CAST(N'2018-03-09 02:12:24.767' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (3, 5, N'Testing', CAST(N'2018-03-09 02:15:27.583' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (4, 5, N'Testing', CAST(N'2018-03-09 02:24:37.587' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (5, 5, N'Testing 4', CAST(N'2018-03-09 02:28:21.927' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (6, 5, N'TESTING', CAST(N'2018-03-09 07:06:51.917' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (7, 5, N'A', CAST(N'2018-03-09 07:22:46.327' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (8, 5, N'AB', CAST(N'2018-03-09 07:23:02.583' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (9, 5, N'ABC', CAST(N'2018-03-09 07:30:41.977' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (10, 5, N'TEST', CAST(N'2018-03-09 07:34:42.997' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (11, 5, N'TEST1', CAST(N'2018-03-09 07:34:51.903' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (12, 5, N'TEST4', CAST(N'2018-03-09 07:35:50.200' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (13, 5, N'A', CAST(N'2018-03-09 07:37:14.303' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (14, 5, N'C', CAST(N'2018-03-10 05:41:12.300' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (15, 5, N'TEST', CAST(N'2018-03-11 01:29:57.740' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (16, 5, N'TESTING', CAST(N'2018-03-11 04:50:21.570' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (17, 5, N'Dcdcsdcccdscsdcdscsdcsdcdscdscdscdscsdcsdcdscdscdscdscdscdsdscdsdscsdcsdcdscdscsdcdscsdcsdcdscdscsdcsdcsdcdscsdcsdcsd', CAST(N'2018-03-11 05:22:29.260' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (18, 5, N'Djncdsckndsckjdsncsdkjncsdkcndskjcdscjkdsckjsdcsnsdcnsdkc', CAST(N'2018-03-11 05:27:14.850' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (19, 5, N'Djncdsckndsckjdsncsdkjncsdkcn', CAST(N'2018-03-11 05:27:30.270' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (20, 5, N'Svddsvdsvdsvdsvdsvvdsvdsvdsdsvdsvdsv', CAST(N'2018-03-11 06:33:12.207' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (21, 5, N'Avfnfdjfndjn', CAST(N'2018-03-11 07:10:34.857' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (22, 5, N'Fdfgfdgf', CAST(N'2018-03-11 07:12:57.213' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (23, 5, N'Fefrefrefrefreferferfrefreferferferferfreferferfrefreferfrefrefreferfrefreferfrferferferfrefrefrefreferfreferferfrefreferferf', CAST(N'2018-03-11 07:22:24.713' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (24, 5, N'Vfdfvvdfvfdvdf', CAST(N'2018-03-11 07:23:29.203' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (25, 5, N'A', CAST(N'2018-03-11 07:34:21.810' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (26, 5, N'Dfvfdvfvdfvfddv', CAST(N'2018-03-11 07:36:44.567' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (27, 5, N'Testing', CAST(N'2018-03-12 23:26:19.713' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (28, 5, N'Testing', CAST(N'2018-03-12 23:26:25.243' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (29, 5, N'Testing1', CAST(N'2018-03-12 23:39:56.027' AS DateTime), N'03075583-5a1f-4145-a6e7-808cff7c6b73')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (30, 5, N'Testing ', CAST(N'2018-03-12 23:43:46.760' AS DateTime), N'03075583-5a1f-4145-a6e7-808cff7c6b73')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (31, 7, N'Testing', CAST(N'2018-03-14 01:20:41.753' AS DateTime), N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (32, 7, N'Testing 1', CAST(N'2018-03-14 01:20:48.597' AS DateTime), N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (33, 7, N'Testing 😃', CAST(N'2018-03-14 07:35:58.603' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (34, 7, N'New comment 😃😃😂', CAST(N'2018-03-14 07:44:01.707' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (35, 9, N'TEST ', CAST(N'2018-03-14 20:27:50.983' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (36, 8, N'Testing ', CAST(N'2018-03-14 21:03:03.360' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Hint] ([HintId], [PostId], [HintValue], [CreatedDate], [UserId]) VALUES (37, 9, N'Test ', CAST(N'2018-03-15 00:12:34.780' AS DateTime), N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
SET IDENTITY_INSERT [dbo].[Hint] OFF
SET IDENTITY_INSERT [dbo].[IdentityClaims] ON 

INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (1, 1, N'sub')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (2, 3, N'email')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (3, 2, N'updated_at')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (4, 2, N'locale')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (5, 2, N'zoneinfo')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (6, 2, N'birthdate')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (7, 2, N'gender')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (8, 2, N'website')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (9, 2, N'picture')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (10, 2, N'profile')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (11, 2, N'preferred_username')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (12, 2, N'nickname')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (13, 2, N'middle_name')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (14, 2, N'given_name')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (15, 2, N'family_name')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (16, 2, N'name')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (17, 3, N'email_verified')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (18, 4, N'role')
SET IDENTITY_INSERT [dbo].[IdentityClaims] OFF
SET IDENTITY_INSERT [dbo].[IdentityResources] ON 

INSERT [dbo].[IdentityResources] ([Id], [Description], [DisplayName], [Emphasize], [Enabled], [Name], [Required], [ShowInDiscoveryDocument]) VALUES (1, NULL, N'Your user identifier', 0, 1, N'openid', 1, 1)
INSERT [dbo].[IdentityResources] ([Id], [Description], [DisplayName], [Emphasize], [Enabled], [Name], [Required], [ShowInDiscoveryDocument]) VALUES (2, N'Your user profile information (first name, last name, etc.)', N'User profile', 1, 1, N'profile', 0, 1)
INSERT [dbo].[IdentityResources] ([Id], [Description], [DisplayName], [Emphasize], [Enabled], [Name], [Required], [ShowInDiscoveryDocument]) VALUES (3, NULL, N'Your email address', 1, 1, N'email', 0, 1)
INSERT [dbo].[IdentityResources] ([Id], [Description], [DisplayName], [Emphasize], [Enabled], [Name], [Required], [ShowInDiscoveryDocument]) VALUES (4, NULL, NULL, 0, 1, N'role', 0, 1)
SET IDENTITY_INSERT [dbo].[IdentityResources] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Latitude], [Longitude], [Address], [CreatedDate], [Name]) VALUES (1, 1, -43.523731231689453, 172.58277893066406, N'Puaka-James Hight Building, Ilam, Christchurch 8041, New Zealand', NULL, N'Central Library - Te Puna Mātauraka o Te Whare Wānanga o Waitaha')
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Latitude], [Longitude], [Address], [CreatedDate], [Name]) VALUES (2, 1, -43.523719787597656, 172.58280944824219, N'University Dr, Ilam, Christchurch 8041, New Zealand', NULL, N'University of Canterbury Library - Ngā Puna Mātauraka o Te Whare Wānanga o Waitaha')
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Latitude], [Longitude], [Address], [CreatedDate], [Name]) VALUES (3, 1, -43.369655609130859, 172.66673278808594, N'20 Chester St, Kaiapoi 7630, New Zealand', NULL, N'20 Chester St')
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Latitude], [Longitude], [Address], [CreatedDate], [Name]) VALUES (4, 1, -43.367988586425781, 172.66450500488281, N'416 Williams St, Kaiapoi 7691, New Zealand', NULL, N'Jagz of Sovereign Palms')
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Latitude], [Longitude], [Address], [CreatedDate], [Name]) VALUES (5, 1, -43.371562957763672, 172.66291809082031, N'373 Williams St, Kaiapoi 7630, New Zealand', NULL, N'Kaiapoi Golf Club Inc')
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Latitude], [Longitude], [Address], [CreatedDate], [Name]) VALUES (6, 1, -43.368690490722656, 172.66709899902344, N'Foxton Drive, Kaiapoi, Canterbury, NZ', NULL, N'Foxton Drive, Kaiapoi, Canterbury, NZ')
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Latitude], [Longitude], [Address], [CreatedDate], [Name]) VALUES (7, 1, -43.368816375732422, 172.66693115234375, N'Blackburn Street, Kaiapoi, Canterbury, NZ', NULL, N'Blackburn Street, Kaiapoi, Canterbury, NZ')
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Latitude], [Longitude], [Address], [CreatedDate], [Name]) VALUES (8, 0, -123, 43, N'TEST dcjdshbcds', NULL, N'dsdcdn')
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Latitude], [Longitude], [Address], [CreatedDate], [Name]) VALUES (9, 1, -43.368560791015625, 172.66668701171875, N'Cattermole Street, Kaiapoi, Canterbury, NZ', NULL, N'Cattermole Street, Kaiapoi, Canterbury, NZ')
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Latitude], [Longitude], [Address], [CreatedDate], [Name]) VALUES (10, 1, 51.178882598876953, -1.8262150287628174, N'Amesbury, Salisbury SP4 7DE, UK', NULL, N'Stonehenge')
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Latitude], [Longitude], [Address], [CreatedDate], [Name]) VALUES (11, 1, -43.368698120117188, 172.66703796386719, N'Newtons Road, Templeton, Canterbury, NZ', NULL, N'Newtons Road, Templeton, Canterbury, NZ')
SET IDENTITY_INSERT [dbo].[Location] OFF
INSERT [dbo].[LocationType] ([LocationTypeId], [Type]) VALUES (1, N'Place')
SET IDENTITY_INSERT [dbo].[Media] ON 

INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (1, 1, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/01022018200200.mp4', CAST(N'2018-02-01 20:51:03.060' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (2, 1, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/01022018210201.mp4', CAST(N'2018-02-01 21:04:02.960' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (3, 1, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/03022018120233.png', CAST(N'2018-02-02 23:15:52.167' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (4, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/03022018120233.jpg', CAST(N'2018-02-02 23:16:43.627' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (5, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/03022018120247.jpg', CAST(N'2018-02-02 23:16:48.617' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (6, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/03022018120252.jpg', CAST(N'2018-02-02 23:16:59.807' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (7, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/03022018120209.jpg', CAST(N'2018-02-02 23:22:14.060' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (8, 3, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/03022018190235.mp4', CAST(N'2018-02-03 19:04:36.990' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (9, 3, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/07022018070255.mp4', CAST(N'2018-02-07 07:36:58.670' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (10, 3, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/07022018070249.mp4', CAST(N'2018-02-07 07:39:50.230' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (11, 3, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11022018190258.mp4', CAST(N'2018-02-11 06:56:10.487' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (12, 3, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11022018200223.mp4', CAST(N'2018-02-11 07:22:21.667' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (13, 3, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11022018200258.mp4', CAST(N'2018-02-11 07:51:31.950' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (14, 3, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11022018200234.mp4', CAST(N'2018-02-11 08:03:53.490' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (15, 3, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11022018210223.mp4', CAST(N'2018-02-11 08:33:02.053' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (16, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/58bb9fa6-f0c3-414b-9e0e-df4fd4179386/https://thriljunkystorage.blob.core.windows.net/asset-9cdb2c4f-90b2-4de6-9558-cd799c0211ae/manifest(format=m3u8-aapl-v3)', CAST(N'2018-02-11 08:39:37.540' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (17, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/6698c4df-9909-4151-9256-04e53e674c5f/11022018210228.ism/manifest(format=m3u8-aapl-v3)', CAST(N'2018-02-11 08:47:46.657' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (18, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/33bad729-fc4f-4ed5-9757-6e20e46baaa4/11022018220249.ism/manifest(format=m3u8-aapl-v3)', CAST(N'2018-02-11 09:20:08.903' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (19, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/72133ccf-d8ef-4e8b-98cd-1b91a63e6c62/14022018070228.ism/manifest', CAST(N'2018-02-14 07:10:34.060' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (20, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/1348cc10-5e31-4dd5-affa-6b926bfc8760/14022018070250.ism/manifest', CAST(N'2018-02-14 07:54:53.043' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (21, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/a81d8379-d6ab-4950-b6ba-358ee7f89433/14022018080202.ism/manifest', CAST(N'2018-02-14 08:01:04.900' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (22, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/79d3f91c-7f33-4fb9-a0e9-dd5b19261c0f/14022018080233.ism/manifest', CAST(N'2018-02-14 08:05:36.300' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (23, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/b5bbd75d-d5b8-45d7-b954-b33c9b1e9ef7/14022018080228.ism/manifest', CAST(N'2018-02-14 08:07:31.293' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (24, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/1419b99a-30a7-49fc-a800-fb345b251bcb/14022018080204.ism/manifest', CAST(N'2018-02-14 08:18:06.733' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (25, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/fab44da3-3414-4734-b6cd-9c822ffcf5a1/14022018080219.ism/manifest', CAST(N'2018-02-14 08:19:21.703' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (26, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/f3a0f03a-a855-4205-a8d5-dd8c7314fc94/14022018080258.ism/manifest', CAST(N'2018-02-14 08:21:01.163' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (27, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/b7a8b810-810b-46de-8e67-5e9ac9d88acc/14022018080240.ism/manifest', CAST(N'2018-02-14 08:22:42.963' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (28, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/6ddd21c5-bf41-400c-97b7-d97f27476baa/14022018080212.ism/manifest', CAST(N'2018-02-14 08:24:13.917' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (29, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/b6bc1b69-3b6d-4886-a7d1-3e85c9fafa94/14022018080259.ism/manifest', CAST(N'2018-02-14 08:28:00.747' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (30, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/f40dd37c-9565-4275-99cf-32ed3f95c469/14022018080228.ism/manifest', CAST(N'2018-02-14 08:28:30.407' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (31, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/4fbd2c78-70d3-4969-a250-c242f3aaa459/14022018080245.ism/manifest', CAST(N'2018-02-14 08:31:48.193' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (32, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/46b22dcb-81eb-43c6-ab29-8938513b512a/14022018080239.ism/manifest', CAST(N'2018-02-14 08:48:41.507' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (33, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/f3347cb3-fa81-40aa-b8b6-a92e2234d993/14022018080230.ism/manifest', CAST(N'2018-02-14 08:53:33.740' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (34, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/df2a67fd-80c9-4676-80e5-aa4e1781fe54/14022018080216.ism/manifest', CAST(N'2018-02-14 08:54:18.193' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (35, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/1904fcb0-705c-4e6d-830c-19bd0718c681/14022018090205.ism/manifest', CAST(N'2018-02-14 09:02:07.843' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (36, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/ebcdbb53-813e-48b2-9499-0c82ee5a816c/14022018090249.ism/manifest', CAST(N'2018-02-14 09:02:50.980' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (37, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/ac41e549-f5a5-40eb-8e6b-d1ceb9ff3f59/14022018090231.ism/manifest', CAST(N'2018-02-14 09:05:34.137' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (38, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/97c8465c-c5b2-4166-8a9f-b2988c342f9b/14022018090226.ism/manifest', CAST(N'2018-02-14 09:07:28.537' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (39, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/88022e8f-8f55-4c9f-8461-954bef8de271/14022018090232.ism/manifest', CAST(N'2018-02-14 09:15:34.623' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (40, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/9f169735-474a-4b66-a775-27b6c67aaf8a/14022018090242.ism/manifest', CAST(N'2018-02-14 09:19:44.920' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (41, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/9e4f6553-ff3c-4f58-b269-429c19e3b148/14022018090243.ism/manifest', CAST(N'2018-02-14 09:21:45.167' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (42, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/6f834a4f-8c50-46e1-b248-41da797b411a/14022018090253.ism/manifest', CAST(N'2018-02-14 09:36:56.323' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (43, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/2f2e257c-c894-4fd7-8cda-fa2f229b7834/14022018090217.ism/manifest', CAST(N'2018-02-14 09:38:19.470' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (44, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/b96a260a-14a0-49b1-8a6f-a7f1a2897747/14022018090207.ism/manifest', CAST(N'2018-02-14 09:43:09.037' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (45, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/511e8b29-f874-4bd3-84a9-bc45c263b1d7/14022018090231.ism/manifest', CAST(N'2018-02-14 09:45:32.863' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (46, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/4f5ea0f4-ea38-4837-b110-0d53cb6983c5/14022018090228.ism/manifest', CAST(N'2018-02-14 09:46:29.730' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (47, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/fd30bf52-7682-4526-a01c-a4ff538b283c/14022018090219.ism/manifest', CAST(N'2018-02-14 09:49:21.220' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (48, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/66fc1a22-dadb-4ed0-a5ae-25416517e491/14022018090209.ism/manifest', CAST(N'2018-02-14 09:50:10.587' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (49, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/2853da6a-db35-43b0-9030-ad97d5392edb/14022018090246.ism/manifest', CAST(N'2018-02-14 09:51:49.357' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (50, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/28faa696-07b9-4fdb-a820-fe3050b4f6b4/15022018050241.ism/manifest', CAST(N'2018-02-15 05:16:46.317' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (51, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/ca9522c3-2106-489e-ba72-7ce947d32e2a/15022018050230.ism/manifest', CAST(N'2018-02-15 05:19:31.930' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (52, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/d537e825-d404-46e6-96be-b6db07f3fe76/15022018050223.ism/manifest', CAST(N'2018-02-15 05:21:26.280' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (53, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/70eb2fc1-f806-401e-b386-30f99cc0060a/15022018050217.ism/manifest', CAST(N'2018-02-15 05:25:19.543' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (54, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/a6842be3-bca8-4e13-8792-82c05657ebec/15022018050205.ism/manifest', CAST(N'2018-02-15 05:29:07.417' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (55, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/f9868305-58be-4933-bde2-073e3420e9f2/15022018050217.ism/manifest', CAST(N'2018-02-15 05:31:20.893' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (56, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/f2cfb208-5138-4430-ad5a-017c62b1fced/15022018050227.ism/manifest', CAST(N'2018-02-15 05:35:30.267' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (57, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/89a1654a-f84f-4d3a-b120-afc6fdee10c3/15022018050238.ism/manifest', CAST(N'2018-02-15 05:37:40.137' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (58, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/b55d4792-58ca-4b61-9765-9e85a2022b11/15022018050217.ism/manifest', CAST(N'2018-02-15 05:41:19.970' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (59, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/a3949831-f48a-4201-882a-7534e4493724/15022018050245.ism/manifest', CAST(N'2018-02-15 05:43:47.970' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (60, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/7c42599e-37fa-4e47-a981-42d2f7c21959/15022018050239.ism/manifest', CAST(N'2018-02-15 05:45:42.057' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (61, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/9a4feb46-9ab5-4fff-9902-50f9a99c4cec/15022018050236.ism/manifest', CAST(N'2018-02-15 05:47:38.850' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (62, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/77688610-26d9-490b-bae5-9b21f2bd9751/15022018050248.ism/manifest', CAST(N'2018-02-15 05:49:50.550' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (63, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/0e348e1e-50cd-45f2-a3ad-f19c97505a44/15022018050220.ism/manifest', CAST(N'2018-02-15 05:52:23.643' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (64, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/8143d5dc-0b1e-4125-b597-d0635228881f/18022018010223.ism/manifest', CAST(N'2018-02-18 01:42:29.727' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (65, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/4286d29c-ae81-4175-b25f-90ac276d587a/18022018010217.ism/manifest', CAST(N'2018-02-18 01:46:19.890' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (66, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/9c9c698b-f779-4f47-8f29-b77ebc1d3ec3/18022018010201.ism/manifest', CAST(N'2018-02-18 01:48:04.373' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (67, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/dec86624-c7e6-4ae9-8e50-82821ca0faa2/18022018010217.ism/manifest', CAST(N'2018-02-18 01:49:19.570' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (68, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/a06ee2f8-b622-465e-9a8a-055660b4bb1a/18022018010215.ism/manifest', CAST(N'2018-02-18 01:50:16.893' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (69, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/2a10a8d7-ce45-4e30-b956-2835ce0f4f16/18022018010227.ism/manifest', CAST(N'2018-02-18 01:50:28.743' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (70, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/41c1ca73-ff9b-4758-bbe4-8b71731cfb74/18022018020257.ism/manifest', CAST(N'2018-02-18 02:03:59.653' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (71, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/8eb30a19-a38c-47df-ba56-45d1f48e73c4/18022018020250.ism/manifest', CAST(N'2018-02-18 02:04:52.827' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (72, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/9d01807f-3fcd-4528-b185-d4944d6cbccb/18022018020224.ism/manifest', CAST(N'2018-02-18 02:07:27.197' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (73, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/b948c128-3d4c-4764-9c15-fec00d5f34c3/18022018020212.ism/manifest', CAST(N'2018-02-18 02:08:14.497' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (74, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/7157f416-7f51-4263-a557-ca56c0f6a48a/18022018020201.ism/manifest', CAST(N'2018-02-18 02:11:03.233' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (75, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/0c6c8e49-4292-4fee-88da-d2ea27c4b8c1/18022018020229.ism/manifest', CAST(N'2018-02-18 02:12:32.177' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (76, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/3f56aa79-ad6b-4e14-be9c-676d67c2ce1a/18022018020229.ism/manifest', CAST(N'2018-02-18 02:14:30.903' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (77, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/ae2514c0-66c7-409f-bf54-14b8823446e8/18022018020223.ism/manifest', CAST(N'2018-02-18 02:15:25.507' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (78, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/3e379fd6-2b2f-47f1-84e9-5aff0734cca9/18022018020211.ism/manifest', CAST(N'2018-02-18 02:16:13.350' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (79, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/aeec6cc8-94d6-4d87-b707-f17e1e3fade5/18022018020213.ism/manifest', CAST(N'2018-02-18 02:17:30.180' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (80, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/9b06d731-8b1a-4c86-8199-f905568926c4/18022018020223.ism/manifest', CAST(N'2018-02-18 02:18:24.653' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (81, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/86d9de53-f553-4705-b907-10d49ade7b04/18022018020214.ism/manifest', CAST(N'2018-02-18 02:21:16.087' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (82, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/cc5916a6-f9c2-4cc4-be16-df9ef8eb2212/18022018020206.ism/manifest', CAST(N'2018-02-18 02:22:08.310' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (83, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/de6e0c20-03db-46d1-a48d-cf0f3bb0c4c8/18022018020257.ism/manifest', CAST(N'2018-02-18 02:22:58.880' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (84, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/c51e7645-f2d3-48ea-8cfe-20c1c0de931d/18022018020244.ism/manifest', CAST(N'2018-02-18 02:23:46.277' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (85, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/f7f4d05a-e287-409c-879a-263192dd525d/18022018020220.ism/manifest', CAST(N'2018-02-18 02:25:22.883' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (86, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/0c99df43-2ef2-483c-abe3-894b888d02d2/18022018020206.ism/manifest', CAST(N'2018-02-18 02:26:07.823' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (87, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/e71e4ca4-562f-45aa-a994-86df75ec69f8/18022018040214.ism/manifest', CAST(N'2018-02-18 04:12:16.927' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (88, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/a8f47b34-0487-4721-bf5f-1b6a87435ae1/18022018050248.ism/manifest', CAST(N'2018-02-18 05:50:53.310' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (89, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/560efbb6-0288-4f5a-8187-d13d5ebaf3d6/18022018050243.ism/manifest', CAST(N'2018-02-18 05:52:47.067' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (90, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/ac3f627b-0a28-4f89-a21e-e0e669e6b037/18022018050257.ism/manifest', CAST(N'2018-02-18 05:55:58.867' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (91, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/31f63925-e8ea-4ffe-9623-f45fa379ba72/18022018050222.ism/manifest', CAST(N'2018-02-18 05:56:23.863' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (92, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/a88d91d1-3f52-435a-8501-bc9621fd377a/18022018050252.ism/manifest', CAST(N'2018-02-18 05:58:54.387' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (93, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/28283a31-5c00-4847-b475-fd16c1d5b012/18022018060226.ism/manifest', CAST(N'2018-02-18 06:05:29.113' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (94, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/b826d2a4-76d8-4642-82a0-67c94506a1b6/18022018060216.ism/manifest', CAST(N'2018-02-18 06:06:18.040' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (95, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/daef4b2c-d121-4b03-97d2-3db6a60ce0a4/18022018060220.ism/manifest', CAST(N'2018-02-18 06:06:22.680' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (96, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/0e73f15a-8e9b-449a-9c82-b13c92bc381f/18022018060250.ism/manifest', CAST(N'2018-02-18 06:08:52.707' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (97, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/a291de8f-2953-435c-9143-2f0876b4ef2e/18022018060252.ism/manifest', CAST(N'2018-02-18 06:09:55.977' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (98, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/a30c7fa9-b25e-4c83-aa69-b2f932ba857d/18022018060244.ism/manifest', CAST(N'2018-02-18 06:10:45.973' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (99, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/8de68224-b89b-49cc-b82b-7944566c06b5/18022018060201.ism/manifest', CAST(N'2018-02-18 06:14:03.587' AS DateTime))
GO
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (100, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/e95129c6-7d7e-472d-93b5-1db1c568a0b1/18022018060202.ism/manifest', CAST(N'2018-02-18 06:27:04.623' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (101, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/7b190059-670a-436f-b2c9-8235dea0c7c6/18022018060235.ism/manifest', CAST(N'2018-02-18 06:28:37.023' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (102, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/f84983f3-7036-474f-a9b3-cf6a29843dd2/18022018060218.ism/manifest', CAST(N'2018-02-18 06:38:20.810' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (103, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/f8f864eb-4326-4b8b-833f-09d685c6cc97/18022018060231.ism/manifest', CAST(N'2018-02-18 06:48:34.437' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (104, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/cfdd18f8-2936-4c6e-847d-234385b61674/18022018060200.ism/manifest', CAST(N'2018-02-18 06:51:03.660' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (105, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/2057a50f-4cb4-4e92-b4c5-c25524246409/18022018060254.ism/manifest', CAST(N'2018-02-18 06:51:56.490' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (106, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/ec2428cd-da84-4688-b8ea-86bf882d863c/18022018060203.ism/manifest', CAST(N'2018-02-18 06:53:06.123' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (107, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/2a964ace-91bd-4dab-839c-1d425e75d5ec/18022018060244.ism/manifest', CAST(N'2018-02-18 06:55:46.987' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (108, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/0150fd78-7ec8-4e89-9103-4231879dab62/18022018060202.ism/manifest', CAST(N'2018-02-18 06:57:04.593' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (109, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/b7e72214-ccda-488e-a39c-ffbfc5290627/18022018070239.ism/manifest', CAST(N'2018-02-18 07:08:42.383' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (110, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/5040c154-d640-423a-8a06-0c3cacd56759/19022018010243.ism/manifest', CAST(N'2018-02-19 01:10:47.127' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (111, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/6631e22c-4748-4119-9281-3f85686598b9/19022018010248.ism/manifest', CAST(N'2018-02-19 01:10:50.050' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (112, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/74f385d2-3329-444d-86fb-6926648d8d58/19022018010245.ism/manifest', CAST(N'2018-02-19 01:16:48.947' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (113, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/9b97fb4c-0f24-450c-a33a-c8e1ac26c744/19022018010228.ism/manifest', CAST(N'2018-02-19 01:20:30.770' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (114, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/6a0c003f-ba8c-4eed-9ea9-0ad84a276778/19022018010209.ism/manifest', CAST(N'2018-02-19 01:23:11.620' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (115, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/d361a6f7-75ef-4370-80ad-4f89658f3150/19022018010252.ism/manifest', CAST(N'2018-02-19 01:24:54.593' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (116, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/593f1b9f-a5d7-496d-ae02-c2567bab36ea/19022018010214.ism/manifest', CAST(N'2018-02-19 01:26:16.163' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (117, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/c9dd2a2d-4bcc-443f-a1b3-c9d1b0c2a1f6/19022018010243.ism/manifest', CAST(N'2018-02-19 01:32:45.610' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (118, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/00f9bb65-f31b-4562-ac09-912f96707d0a/19022018010240.ism/manifest', CAST(N'2018-02-19 01:34:42.903' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (119, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/59b9663b-70e5-492b-b39f-9bb4fb89190c/19022018010242.ism/manifest', CAST(N'2018-02-19 01:41:44.380' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (120, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/6bacc304-07a4-4028-a49b-3f7ce855e23a/19022018010237.ism/manifest', CAST(N'2018-02-19 01:44:39.363' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (121, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/30e1028a-df92-4340-8685-79326dbb1909/19022018010252.ism/manifest', CAST(N'2018-02-19 01:44:54.200' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (122, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/70f3442c-f01f-4419-821f-f8b728aabc1e/19022018010237.ism/manifest', CAST(N'2018-02-19 01:48:39.163' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (123, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/e0c029fa-3f72-4e30-abde-453e55eed312/19022018020248.ism/manifest', CAST(N'2018-02-19 02:09:51.943' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (124, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/f905d9c2-b6cb-4f90-85e4-8a38a2ef4a18/19022018020254.ism/manifest', CAST(N'2018-02-19 02:18:56.307' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (125, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/e0c03bbd-df70-494e-aa06-a8ddad174037/19022018020219.ism/manifest', CAST(N'2018-02-19 02:39:21.893' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (126, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/c1f611c6-0ca8-4cf3-a34d-170b7588d4f3/19022018020240.ism/manifest', CAST(N'2018-02-19 02:42:42.623' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (127, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/4f62941f-a19e-4041-b44a-a810146081bb/19022018020203.ism/manifest', CAST(N'2018-02-19 02:46:05.980' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (128, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/c1e6ed3d-c5bc-417f-8463-78cc49b8913f/19022018050236.ism/manifest', CAST(N'2018-02-19 05:53:40.070' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (129, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/89283ed3-9aff-4ee0-b054-d4ac28fe7609/19022018070203.ism/manifest', CAST(N'2018-02-19 07:39:07.117' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (130, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/e1c7a506-8deb-46bd-a515-659fa65ce0f6/19022018070235.ism/manifest', CAST(N'2018-02-19 07:42:37.127' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (131, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/87464de0-35d9-4544-a01d-b65b73c15a4d/19022018070205.ism/manifest', CAST(N'2018-02-19 07:47:07.173' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (132, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/02be0cef-bac1-424c-bac4-dc123df34a05/19022018070218.ism/manifest', CAST(N'2018-02-19 07:48:21.720' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (133, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/0b8417fb-c16b-4eee-8f3d-dc3b5390c088/19022018070247.ism/manifest', CAST(N'2018-02-19 07:49:49.650' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (134, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/882c202a-4053-4add-a467-8f72e4b560e5/19022018070231.ism/manifest', CAST(N'2018-02-19 07:51:33.473' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (135, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/64de909c-dcd2-4b6c-a38f-86bc9a2f2915/19022018070222.ism/manifest', CAST(N'2018-02-19 07:55:24.763' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (136, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/33032d6f-efdb-4e1f-aaf8-ade2a044a516/19022018080220.ism/manifest', CAST(N'2018-02-19 08:16:23.720' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (137, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/e0d24657-fab7-48dc-b445-036cfb98b79f/19022018080211.ism/manifest', CAST(N'2018-02-19 08:21:13.847' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (138, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/0807b751-480d-437d-842f-6943f33bae94/19022018080250.ism/manifest', CAST(N'2018-02-19 08:22:52.067' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (139, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/02fcb337-b0d8-4da5-ae9d-915a9e3cdfef/19022018080214.ism/manifest', CAST(N'2018-02-19 08:25:16.483' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (140, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/c1e11a85-7614-4c5d-9de7-fde674513937/19022018080237.ism/manifest', CAST(N'2018-02-19 08:26:39.777' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (141, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/fc89f382-ebf2-4e16-9ad1-6309c7f91ee9/19022018080242.ism/manifest', CAST(N'2018-02-19 08:28:44.053' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (142, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/da1ae411-39f1-4c9a-84a1-14b9e973c75d/19022018080233.ism/manifest', CAST(N'2018-02-19 08:31:35.207' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (143, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/acfed21e-8785-48d8-bc5b-e2aca2fa86e1/19022018080247.ism/manifest', CAST(N'2018-02-19 08:33:50.143' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (144, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/d3deadc3-9f48-4dd2-aae3-b5c6e8f0fc81/19022018080222.ism/manifest', CAST(N'2018-02-19 08:35:25.510' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (145, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/e27d9d09-eb5b-4b23-a176-e77edbdb9114/19022018080207.ism/manifest', CAST(N'2018-02-19 08:36:09.237' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (146, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/3a6390d2-69f9-44c5-aaec-a6e81d2bdc23/19022018080207.ism/manifest', CAST(N'2018-02-19 08:43:10.357' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (147, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/d4471864-8d75-47fc-b6dc-6600394346b4/19022018100216.ism/manifest', CAST(N'2018-02-19 10:27:23.580' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (148, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/de331219-74ee-4c30-aa70-abeb34fa8bd9/19022018100233.ism/manifest', CAST(N'2018-02-19 10:36:35.773' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (149, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/678a3cc0-5c64-4d0e-a18e-efba3142c66c/19022018100238.ism/manifest', CAST(N'2018-02-19 10:39:40.687' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (150, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/9de0e86a-9f24-4ad0-909f-d5ef2e42724c/19022018100202.ism/manifest', CAST(N'2018-02-19 10:43:03.757' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (151, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/370461c2-190a-4345-83f2-d9b79e738b10/20022018190234.ism/manifest', CAST(N'2018-02-20 19:32:39.510' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (152, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/a899b441-6499-446c-9466-8719fa5c1421/20022018190216.ism/manifest', CAST(N'2018-02-20 19:34:19.117' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (153, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/2982288d-10b1-456d-a8cc-20b231ffeea7/20022018190205.ism/manifest', CAST(N'2018-02-20 19:46:07.177' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (154, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/5a302378-549f-4d6c-859d-764a3e4bfb8a/23022018030205.ism/manifest', CAST(N'2018-02-23 03:06:12.363' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (155, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/30e7b6c9-1ec4-4d28-a7a9-c110a04557c5/23022018040212.ism/manifest', CAST(N'2018-02-23 04:04:14.423' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (156, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/8b1093f6-1e4d-4305-8c6e-e33d0ad04f1e/23022018040224.ism/manifest', CAST(N'2018-02-23 04:09:27.563' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (157, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/db6ae519-2d6c-4b02-8e69-61843041b904/23022018040222.ism/manifest', CAST(N'2018-02-23 04:13:26.550' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (158, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/c1fa727c-eef9-4bf2-97e3-8e30a5b95520/23022018040257.ism/manifest', CAST(N'2018-02-23 04:14:00.380' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (159, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/395b99bb-39b6-42c1-8e38-2e5ba194b7cb/23022018040237.ism/manifest', CAST(N'2018-02-23 04:15:39.663' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (160, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/6a34fc35-8043-48e8-92b1-f163c2e48537/23022018040229.ism/manifest', CAST(N'2018-02-23 04:18:31.973' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (161, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/8d6d3133-8b87-4e1e-ae8b-5ab10e4b689d/23022018040242.ism/manifest', CAST(N'2018-02-23 04:20:43.903' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (162, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/5d4258c6-643d-4d06-a973-86f27625f1ff/23022018040249.ism/manifest', CAST(N'2018-02-23 04:21:52.360' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (163, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/ef1e5c89-a292-486b-8470-198596b868c6/23022018040200.ism/manifest', CAST(N'2018-02-23 04:30:04.170' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (164, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/60b28b5f-14c4-44a6-a8f6-59942f87248a/23022018040201.ism/manifest', CAST(N'2018-02-23 04:39:04.510' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (165, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/0e8ab799-622b-4622-9049-30afc83ade7c/23022018040202.ism/manifest', CAST(N'2018-02-23 04:40:05.353' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (166, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/3718d13a-bc30-4560-9174-d7f4b239496b/23022018050259.ism/manifest', CAST(N'2018-02-23 05:05:03.360' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (167, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/d0058919-84db-4d25-aa2d-85b1e65df9c9/23022018050209.ism/manifest', CAST(N'2018-02-23 05:14:11.993' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (168, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/fd341bb7-d05f-4ecb-a4fc-d702b8310850/23022018050206.ism/manifest', CAST(N'2018-02-23 05:17:08.433' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (169, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/ff377b9f-0581-4725-87e3-42e4d90a1e06/23022018050249.ism/manifest', CAST(N'2018-02-23 05:18:51.723' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (170, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/b3a56082-f6bb-422d-b42f-5a693a444773/23022018050227.ism/manifest', CAST(N'2018-02-23 05:20:29.647' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (171, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/f5eefffc-68a8-420b-a080-bf5195c14c5b/23022018050250.ism/manifest', CAST(N'2018-02-23 05:22:52.343' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (172, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/6e5f35f1-c9c0-4496-99d4-78f2cadbbaa8/23022018050241.ism/manifest', CAST(N'2018-02-23 05:23:42.567' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (173, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/feb117d1-14e6-43ac-b05c-4df4851503e4/23022018050207.ism/manifest', CAST(N'2018-02-23 05:29:09.860' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (174, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/a52c4efb-f171-442d-9fd0-077d76d4731f/23022018050228.ism/manifest', CAST(N'2018-02-23 05:30:30.340' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (175, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/3b6646ba-cdaf-4d6a-8c08-a80c78ab0ee4/23022018080246.ism/manifest', CAST(N'2018-02-23 08:23:50.037' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (176, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/f03fd19b-a682-48f1-b06c-e583dea49864/23022018210239.ism/manifest', CAST(N'2018-02-23 21:48:44.550' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (177, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/e811a1ac-c6c6-4763-b0ab-d75e0a7bc9e4/23022018220211.ism/manifest', CAST(N'2018-02-23 22:04:12.960' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (178, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/4d307dd5-7435-4bf7-9bc8-52ab84367866/23022018220247.ism/manifest', CAST(N'2018-02-23 22:05:50.060' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (179, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/bc63efcd-8a53-49cf-aac6-8d2555b8761c/23022018220249.ism/manifest', CAST(N'2018-02-23 22:54:51.407' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (180, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/f2a0bd52-5162-4326-9041-c2201af6e77a/23022018220213.ism/manifest', CAST(N'2018-02-23 22:56:14.757' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (181, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/4d95a61a-d7f6-4194-82dc-74edebb64400/23022018220241.ism/manifest', CAST(N'2018-02-23 22:57:43.693' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (182, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/974374fa-82c1-4fb7-b498-39808049e7bf/23022018220231.ism/manifest', CAST(N'2018-02-23 22:58:32.623' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (183, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/817aa8c7-5df3-4df7-8927-7fddde065783/23022018230214.ism/manifest', CAST(N'2018-02-23 23:00:15.837' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (184, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/fe86ba82-73e3-4fa0-ac8e-83abc3692ecc/23022018230245.ism/manifest', CAST(N'2018-02-23 23:06:47.057' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (185, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/e4941d6e-c6e9-4a2e-a50a-40382ed25ec4/23022018230210.ism/manifest', CAST(N'2018-02-23 23:08:13.160' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (186, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/dc7ed458-ddcd-4652-9388-5dd9c4333dfc/23022018230236.ism/manifest', CAST(N'2018-02-23 23:08:38.330' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (187, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/b495ba4f-c1cc-4754-be9a-b88fed2b3d98/23022018230231.ism/manifest', CAST(N'2018-02-23 23:21:33.843' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (188, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/7b3542b8-baf5-45cc-9cb4-683bfc02ccd9/24022018000201.ism/manifest', CAST(N'2018-02-24 00:37:04.877' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (189, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/3f4cb31b-8d5a-4489-a143-6493c5010d1e/24022018000219.ism/manifest', CAST(N'2018-02-24 00:39:21.540' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (190, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/baf023a6-3288-42e6-b30c-fa85935ee26e/24022018000250.ism/manifest', CAST(N'2018-02-24 00:59:52.223' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (191, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/672c08ab-2406-43b7-b73b-4f7f851bba3e/24022018010252.ism/manifest', CAST(N'2018-02-24 01:06:54.577' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (192, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/30e0b847-f107-4339-9a66-34a26c744bd5/24022018010219.ism/manifest', CAST(N'2018-02-24 01:13:22.200' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (193, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/2ca02c7a-d098-4da4-b2a4-039fad5f04eb/24022018010247.ism/manifest', CAST(N'2018-02-24 01:14:49.497' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (194, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/a0ca0d5d-9f1b-4bbd-9037-da18c10b09b9/24022018010208.ism/manifest', CAST(N'2018-02-24 01:17:10.760' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (195, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/67ea9503-a104-4423-8d6a-b185873c17b6/24022018010220.ism/manifest', CAST(N'2018-02-24 01:18:22.040' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (196, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/58d2ed50-6db3-4e00-8b90-ae9c632e49dc/24022018010228.ism/manifest', CAST(N'2018-02-24 01:20:30.767' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (197, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/3b8be8ff-7c8e-475d-8e40-0ae15eca59a9/24022018010254.ism/manifest', CAST(N'2018-02-24 01:21:55.760' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (198, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/0c3ae229-716b-4745-af16-54192942e731/24022018010211.ism/manifest', CAST(N'2018-02-24 01:31:13.923' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (199, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/5d4eae65-94be-4f33-809a-3e3db5ab46e9/24022018020217.ism/manifest', CAST(N'2018-02-24 02:44:20.043' AS DateTime))
GO
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (200, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/b7f16d67-ac06-431a-be68-3ad4ec0b25bf/24022018020211.ism/manifest', CAST(N'2018-02-24 02:51:13.170' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (201, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/e420f2c2-6146-4a84-96bf-36c888140980/24022018030207.ism/manifest', CAST(N'2018-02-24 03:38:09.707' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (202, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/21803e12-00ef-4800-b873-6836a2747d93/24022018040207.ism/manifest', CAST(N'2018-02-24 04:07:09.953' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (203, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/4a9f4a88-646a-40b2-b35a-01441d0b55cd/02032018230326.ism/manifest', CAST(N'2018-03-02 23:04:30.447' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (204, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/430a5cda-379a-412a-815b-9e3896f66bfc/02032018230324.ism/manifest', CAST(N'2018-03-02 23:13:27.073' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (205, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/c54e300f-2e8a-43bb-a78d-1efb4eaf68c2/03032018010319.ism/manifest', CAST(N'2018-03-03 01:35:24.413' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (206, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/fffc15cf-c656-498f-846f-aaa73cebd189/03032018010327.ism/manifest', CAST(N'2018-03-03 01:57:29.170' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (207, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/d6811bb9-c8d2-4164-896f-a2f7bb842e44/03032018020349.ism/manifest', CAST(N'2018-03-03 02:06:51.593' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (208, 1, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018110343.png', CAST(N'2018-03-10 22:49:58.570' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (209, 1, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018000353.png', CAST(N'2018-03-11 00:05:54.840' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (210, 1, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018000322.png', CAST(N'2018-03-11 00:06:22.117' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (211, 1, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018000321.png', CAST(N'2018-03-11 00:08:21.470' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (212, 1, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018000343.png', CAST(N'2018-03-11 00:22:43.920' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (213, 1, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018000326.png', CAST(N'2018-03-11 00:41:26.210' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (214, 1, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010331.png', CAST(N'2018-03-11 01:25:32.460' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (215, 1, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018140338.png', CAST(N'2018-03-11 01:27:42.757' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (216, 1, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010336.png', CAST(N'2018-03-11 01:33:36.897' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (217, 1, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010337.png', CAST(N'2018-03-11 01:36:37.477' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (218, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010340.jpg', CAST(N'2018-03-11 01:38:40.960' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (219, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010309.jpg', CAST(N'2018-03-11 01:40:09.920' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (220, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010335.jpg', CAST(N'2018-03-11 01:40:35.600' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (221, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010344.jpg', CAST(N'2018-03-11 01:40:44.783' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (222, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010308.jpg', CAST(N'2018-03-11 01:41:08.357' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (223, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010312.jpg', CAST(N'2018-03-11 01:41:12.933' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (224, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010314.jpg', CAST(N'2018-03-11 01:41:14.813' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (225, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010316.jpg', CAST(N'2018-03-11 01:41:16.593' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (226, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010318.jpg', CAST(N'2018-03-11 01:41:18.220' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (227, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010325.jpg', CAST(N'2018-03-11 01:41:25.367' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (228, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010331.jpg', CAST(N'2018-03-11 01:41:31.900' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (229, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010333.jpg', CAST(N'2018-03-11 01:41:33.543' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (230, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010335.jpg', CAST(N'2018-03-11 01:41:35.123' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (231, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010305.jpg', CAST(N'2018-03-11 01:42:05.770' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (232, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010328.jpg', CAST(N'2018-03-11 01:42:28.673' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (233, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010356.jpg', CAST(N'2018-03-11 01:45:57.653' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (234, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010339.jpg', CAST(N'2018-03-11 01:46:39.753' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (235, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010353.jpg', CAST(N'2018-03-11 01:49:54.577' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (236, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010312.jpg', CAST(N'2018-03-11 01:53:12.453' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (237, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018010326.jpg', CAST(N'2018-03-11 01:53:26.710' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (238, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018020328.jpg', CAST(N'2018-03-11 02:11:28.623' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (239, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018020358.jpg', CAST(N'2018-03-11 02:11:59.007' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (240, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018020308.jpg', CAST(N'2018-03-11 02:32:08.573' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (241, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018020307.jpg', CAST(N'2018-03-11 02:38:07.950' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (242, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018030306.jpg', CAST(N'2018-03-11 03:10:06.743' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (243, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018030314.jpg', CAST(N'2018-03-11 03:16:14.800' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (244, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018070317.jpg', CAST(N'2018-03-11 07:16:17.867' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (245, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018080343.jpg', CAST(N'2018-03-11 08:39:43.337' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (246, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/11032018080315.jpg', CAST(N'2018-03-11 08:52:15.603' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (247, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/12032018010331.jpg', CAST(N'2018-03-12 01:55:32.293' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (248, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/12032018030333.jpg', CAST(N'2018-03-12 03:40:33.730' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (249, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/12032018050341.jpg', CAST(N'2018-03-12 05:59:41.707' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (250, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/12032018230322.jpg', CAST(N'2018-03-12 23:27:23.123' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (251, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/e530ed97-9f72-46f6-bf46-2f5eae4702c0/12032018230312.ism/manifest', CAST(N'2018-03-12 23:29:16.047' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (252, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/47f98ea3-2d67-44c7-9a35-75ad03a93708/12032018230337.ism/manifest', CAST(N'2018-03-12 23:29:38.843' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (253, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/46b471c4-03e4-439b-8859-c8f700b76478/12032018230350.ism/manifest', CAST(N'2018-03-12 23:30:53.677' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (254, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/12032018230325.jpg', CAST(N'2018-03-12 23:37:25.560' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (255, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/12032018230305.jpg', CAST(N'2018-03-12 23:39:05.627' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (256, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/4ab20347-81db-4b38-b08c-2eba51e6719f/13032018000317.ism/manifest', CAST(N'2018-03-13 00:01:18.917' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (257, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/13032018230338.jpg', CAST(N'2018-03-13 23:56:39.453' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (258, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/14032018070358.jpg', CAST(N'2018-03-14 07:44:59.363' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (259, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/ee884e35-056d-4fd7-a311-14cc20c6c7dd/14032018080344.ism/manifest', CAST(N'2018-03-14 08:02:47.787' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (260, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/cf2f00aa-55ea-47b0-a447-da2691918562/14032018080358.ism/manifest', CAST(N'2018-03-14 08:05:01.167' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (261, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/1a6166a7-ff24-47c8-a39c-2a1a59d68116/14032018210331.ism/manifest', CAST(N'2018-03-14 21:27:34.590' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (262, 3, N'http://mediaservicetj.streaming.mediaservices.windows.net/02685d55-5072-4753-b4b8-11f24043754d/14032018210339.ism/manifest', CAST(N'2018-03-14 21:37:41.003' AS DateTime))
INSERT [dbo].[Media] ([MediaId], [MediaTypeId], [MediaUrl], [CreatedDate]) VALUES (263, 2, N'https://thriljunkystorage.blob.core.windows.net/tjblobcontainer/03042018000404.jpg', CAST(N'2018-04-03 00:52:06.520' AS DateTime))
SET IDENTITY_INSERT [dbo].[Media] OFF
SET IDENTITY_INSERT [dbo].[MediaType] ON 

INSERT [dbo].[MediaType] ([MediaTypeId], [Type]) VALUES (1, N'png')
INSERT [dbo].[MediaType] ([MediaTypeId], [Type]) VALUES (2, N'jpg')
INSERT [dbo].[MediaType] ([MediaTypeId], [Type]) VALUES (3, N'mp4')
SET IDENTITY_INSERT [dbo].[MediaType] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostId], [LocationId], [MediaId], [PostText], [CreatedDate], [LastUpdatedDate], [IsFlagged], [UserId]) VALUES (1, 4, 203, NULL, CAST(N'2018-03-02 23:04:31.210' AS DateTime), CAST(N'2018-03-02 23:04:31.210' AS DateTime), NULL, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Post] ([PostId], [LocationId], [MediaId], [PostText], [CreatedDate], [LastUpdatedDate], [IsFlagged], [UserId]) VALUES (2, 3, 204, NULL, CAST(N'2018-03-02 23:13:27.693' AS DateTime), CAST(N'2018-03-02 23:13:27.693' AS DateTime), NULL, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Post] ([PostId], [LocationId], [MediaId], [PostText], [CreatedDate], [LastUpdatedDate], [IsFlagged], [UserId]) VALUES (3, 3, 205, NULL, CAST(N'2018-03-03 01:35:25.137' AS DateTime), CAST(N'2018-03-03 01:35:25.137' AS DateTime), NULL, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Post] ([PostId], [LocationId], [MediaId], [PostText], [CreatedDate], [LastUpdatedDate], [IsFlagged], [UserId]) VALUES (4, 4, 206, NULL, CAST(N'2018-03-03 01:57:29.783' AS DateTime), CAST(N'2018-03-03 01:57:29.783' AS DateTime), NULL, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Post] ([PostId], [LocationId], [MediaId], [PostText], [CreatedDate], [LastUpdatedDate], [IsFlagged], [UserId]) VALUES (5, 4, 207, NULL, CAST(N'2018-03-03 02:06:52.257' AS DateTime), CAST(N'2018-03-03 02:06:52.257' AS DateTime), NULL, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Post] ([PostId], [LocationId], [MediaId], [PostText], [CreatedDate], [LastUpdatedDate], [IsFlagged], [UserId]) VALUES (6, 5, 253, NULL, CAST(N'2018-03-12 23:30:54.440' AS DateTime), CAST(N'2018-03-12 23:30:54.440' AS DateTime), NULL, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Post] ([PostId], [LocationId], [MediaId], [PostText], [CreatedDate], [LastUpdatedDate], [IsFlagged], [UserId]) VALUES (7, 4, 256, NULL, CAST(N'2018-03-13 00:01:19.520' AS DateTime), CAST(N'2018-03-13 00:01:19.520' AS DateTime), NULL, N'03075583-5a1f-4145-a6e7-808cff7c6b73')
INSERT [dbo].[Post] ([PostId], [LocationId], [MediaId], [PostText], [CreatedDate], [LastUpdatedDate], [IsFlagged], [UserId]) VALUES (8, 7, 259, NULL, CAST(N'2018-03-14 08:02:48.513' AS DateTime), CAST(N'2018-03-14 08:02:48.513' AS DateTime), NULL, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Post] ([PostId], [LocationId], [MediaId], [PostText], [CreatedDate], [LastUpdatedDate], [IsFlagged], [UserId]) VALUES (9, 6, 260, NULL, CAST(N'2018-03-14 08:05:01.940' AS DateTime), CAST(N'2018-03-14 08:05:01.940' AS DateTime), NULL, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Post] ([PostId], [LocationId], [MediaId], [PostText], [CreatedDate], [LastUpdatedDate], [IsFlagged], [UserId]) VALUES (10, 6, 261, NULL, CAST(N'2018-03-14 21:27:35.337' AS DateTime), CAST(N'2018-03-14 21:27:35.337' AS DateTime), NULL, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Post] ([PostId], [LocationId], [MediaId], [PostText], [CreatedDate], [LastUpdatedDate], [IsFlagged], [UserId]) VALUES (11, 11, 262, NULL, CAST(N'2018-03-14 21:37:41.843' AS DateTime), CAST(N'2018-03-14 21:37:41.843' AS DateTime), NULL, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
SET IDENTITY_INSERT [dbo].[Post] OFF
SET IDENTITY_INSERT [dbo].[PostTag] ON 

INSERT [dbo].[PostTag] ([PostTagId], [TagId], [PostId]) VALUES (1, 4, 1)
INSERT [dbo].[PostTag] ([PostTagId], [TagId], [PostId]) VALUES (2, 22, 2)
INSERT [dbo].[PostTag] ([PostTagId], [TagId], [PostId]) VALUES (3, 4, 3)
INSERT [dbo].[PostTag] ([PostTagId], [TagId], [PostId]) VALUES (4, 8, 4)
INSERT [dbo].[PostTag] ([PostTagId], [TagId], [PostId]) VALUES (5, 9, 5)
INSERT [dbo].[PostTag] ([PostTagId], [TagId], [PostId]) VALUES (6, 4, 6)
INSERT [dbo].[PostTag] ([PostTagId], [TagId], [PostId]) VALUES (7, 23, 7)
INSERT [dbo].[PostTag] ([PostTagId], [TagId], [PostId]) VALUES (8, 4, 8)
INSERT [dbo].[PostTag] ([PostTagId], [TagId], [PostId]) VALUES (9, 2, 9)
INSERT [dbo].[PostTag] ([PostTagId], [TagId], [PostId]) VALUES (10, 4, 10)
INSERT [dbo].[PostTag] ([PostTagId], [TagId], [PostId]) VALUES (11, 24, 11)
SET IDENTITY_INSERT [dbo].[PostTag] OFF
SET IDENTITY_INSERT [dbo].[Reason] ON 

INSERT [dbo].[Reason] ([ReasonId], [Reason]) VALUES (1, N'Not for me')
INSERT [dbo].[Reason] ([ReasonId], [Reason]) VALUES (2, N'Already seen video')
INSERT [dbo].[Reason] ([ReasonId], [Reason]) VALUES (3, N'Video doesn''t load')
INSERT [dbo].[Reason] ([ReasonId], [Reason]) VALUES (4, N'Report spam')
INSERT [dbo].[Reason] ([ReasonId], [Reason]) VALUES (5, N'Wrong category')
INSERT [dbo].[Reason] ([ReasonId], [Reason]) VALUES (6, N'Block video')
SET IDENTITY_INSERT [dbo].[Reason] OFF
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (1, N'study', CAST(N'2018-02-19 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (2, N'computer', CAST(N'2018-02-19 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (3, N'work', CAST(N'2018-02-19 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (4, N'test', CAST(N'2018-02-19 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (5, N'news', CAST(N'2018-02-19 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (6, N'gold', CAST(N'2018-02-19 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (7, N'custim', CAST(N'2018-02-19 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (8, N'food', CAST(N'2018-02-19 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (9, N'golf', CAST(N'2018-02-21 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (10, N'agg', CAST(N'2018-02-21 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (11, N'scax', CAST(N'2018-02-21 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (12, N'acsd', CAST(N'2018-02-21 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (13, N'badass', CAST(N'2018-02-21 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (14, N'sabc', CAST(N'2018-02-21 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (15, N'dav', CAST(N'2018-02-21 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (16, N'nsv', CAST(N'2018-02-21 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (17, N'tear', CAST(N'2018-02-23 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (18, N'testt', CAST(N'2018-02-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (19, N'testr', CAST(N'2018-02-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (20, N'teatr', CAST(N'2018-02-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (21, N'teta', CAST(N'2018-02-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (22, N'blog', CAST(N'2018-03-03 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (23, N'apple', CAST(N'2018-03-13 00:00:00.000' AS DateTime))
INSERT [dbo].[Tag] ([TagId], [Text], [CreatedDate]) VALUES (24, N'music', CAST(N'2018-03-15 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tag] OFF
SET IDENTITY_INSERT [dbo].[Vote] ON 

INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (1, NULL, 5, CAST(N'2018-02-12 00:00:00.000' AS DateTime), 1, 1, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (1, NULL, 3, CAST(N'2018-03-12 01:50:56.567' AS DateTime), 1, 2, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (1, NULL, 2, CAST(N'2018-03-12 02:00:31.840' AS DateTime), 1, 3, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, NULL, NULL, CAST(N'2018-03-12 02:53:12.447' AS DateTime), 1, 4, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 26, NULL, CAST(N'2018-03-12 02:56:26.243' AS DateTime), 1, 5, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 25, NULL, CAST(N'2018-03-12 03:27:19.020' AS DateTime), 1, 6, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 24, NULL, CAST(N'2018-03-12 03:47:21.520' AS DateTime), 1, 7, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 23, NULL, CAST(N'2018-03-12 06:45:00.773' AS DateTime), 1, 8, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 22, NULL, CAST(N'2018-03-12 06:54:43.463' AS DateTime), 1, 9, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 20, NULL, CAST(N'2018-03-12 21:50:23.180' AS DateTime), 1, 10, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 28, NULL, CAST(N'2018-03-12 23:32:13.800' AS DateTime), 1, 11, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (1, NULL, 6, CAST(N'2018-03-12 23:33:21.993' AS DateTime), 0, 12, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (1, NULL, 6, CAST(N'2018-03-12 23:36:49.987' AS DateTime), 1, 13, N'26f896c1-244a-4298-b3c9-4426bb60ce74')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (1, NULL, 6, CAST(N'2018-03-12 23:39:27.407' AS DateTime), 1, 14, N'03075583-5a1f-4145-a6e7-808cff7c6b73')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 29, NULL, CAST(N'2018-03-12 23:40:21.833' AS DateTime), 1, 15, N'03075583-5a1f-4145-a6e7-808cff7c6b73')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 30, NULL, CAST(N'2018-03-12 23:44:06.900' AS DateTime), 1, 16, N'03075583-5a1f-4145-a6e7-808cff7c6b73')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (1, NULL, 7, CAST(N'2018-03-13 00:02:09.887' AS DateTime), 1, 17, N'03075583-5a1f-4145-a6e7-808cff7c6b73')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (1, NULL, 7, CAST(N'2018-03-13 00:03:19.837' AS DateTime), 1, 18, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (1, NULL, 7, CAST(N'2018-03-13 23:55:36.133' AS DateTime), 1, 19, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 27, NULL, CAST(N'2018-03-14 00:11:10.003' AS DateTime), 1, 20, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 21, NULL, CAST(N'2018-03-14 00:13:53.563' AS DateTime), 1, 21, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 19, NULL, CAST(N'2018-03-14 00:14:07.713' AS DateTime), 1, 22, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 1, NULL, CAST(N'2018-03-14 00:21:27.587' AS DateTime), 2, 23, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 2, NULL, CAST(N'2018-03-14 00:21:59.357' AS DateTime), 1, 24, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 3, NULL, CAST(N'2018-03-14 00:22:49.347' AS DateTime), 1, 25, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 4, NULL, CAST(N'2018-03-14 00:24:29.763' AS DateTime), 1, 26, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 5, NULL, CAST(N'2018-03-14 00:25:30.650' AS DateTime), 1, 27, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 6, NULL, CAST(N'2018-03-14 00:25:47.440' AS DateTime), 1, 28, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 7, NULL, CAST(N'2018-03-14 00:26:16.043' AS DateTime), 1, 29, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 8, NULL, CAST(N'2018-03-14 00:29:06.193' AS DateTime), 1, 30, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 9, NULL, CAST(N'2018-03-14 00:30:15.397' AS DateTime), 1, 31, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 10, NULL, CAST(N'2018-03-14 00:30:23.857' AS DateTime), 1, 32, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 11, NULL, CAST(N'2018-03-14 00:32:50.433' AS DateTime), 1, 33, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 12, NULL, CAST(N'2018-03-14 00:33:49.167' AS DateTime), 1, 34, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 13, NULL, CAST(N'2018-03-14 00:34:39.650' AS DateTime), 1, 35, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 14, NULL, CAST(N'2018-03-14 00:34:47.020' AS DateTime), 1, 36, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 15, NULL, CAST(N'2018-03-14 00:36:21.047' AS DateTime), 1, 37, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 16, NULL, CAST(N'2018-03-14 00:37:19.173' AS DateTime), 1, 38, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 17, NULL, CAST(N'2018-03-14 00:38:00.683' AS DateTime), 1, 39, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 18, NULL, CAST(N'2018-03-14 00:38:34.527' AS DateTime), 1, 40, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (1, NULL, 6, CAST(N'2018-03-14 01:38:45.373' AS DateTime), 1, 41, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (1, NULL, 3, CAST(N'2018-03-14 02:11:48.737' AS DateTime), 1, 42, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 23, NULL, CAST(N'2018-03-14 02:24:08.187' AS DateTime), 2, 43, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 31, NULL, CAST(N'2018-03-14 02:24:43.790' AS DateTime), 1, 44, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 32, NULL, CAST(N'2018-03-14 02:24:44.913' AS DateTime), 2, 45, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 18, NULL, CAST(N'2018-03-14 07:34:00.957' AS DateTime), 0, 46, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 17, NULL, CAST(N'2018-03-14 07:34:03.493' AS DateTime), 0, 47, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 33, NULL, CAST(N'2018-03-14 07:43:39.913' AS DateTime), 2, 48, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 34, NULL, CAST(N'2018-03-14 07:44:11.450' AS DateTime), 1, 49, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (1, NULL, 8, CAST(N'2018-03-14 08:03:56.477' AS DateTime), 1, 50, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (1, NULL, 8, CAST(N'2018-03-14 20:07:15.923' AS DateTime), 0, 51, N'9185ed9f-22ac-4e47-ac54-d66deaf99583')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (1, NULL, 9, CAST(N'2018-03-14 20:27:43.020' AS DateTime), 1, 52, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 31, NULL, CAST(N'2018-03-14 20:52:44.513' AS DateTime), 2, 53, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 32, NULL, CAST(N'2018-03-14 20:52:48.643' AS DateTime), 1, 54, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (1, NULL, 11, CAST(N'2018-03-14 23:21:39.843' AS DateTime), 1, 55, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (1, NULL, 10, CAST(N'2018-03-15 00:09:23.807' AS DateTime), 0, 56, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 35, NULL, CAST(N'2018-03-15 00:12:39.323' AS DateTime), 1, 57, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 37, NULL, CAST(N'2018-03-15 00:12:40.480' AS DateTime), 2, 58, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
INSERT [dbo].[Vote] ([VoteCategoryId], [HintId], [PostId], [CreatedDate], [VoteTypeId], [ID], [UserId]) VALUES (2, 36, NULL, CAST(N'2018-03-15 09:46:59.127' AS DateTime), 1, 59, N'e92cd65e-e6a5-4586-8c2f-e4661004cbc4')
SET IDENTITY_INSERT [dbo].[Vote] OFF
INSERT [dbo].[VoteCategory] ([VoteCategoryId], [Category]) VALUES (1, N'Post')
INSERT [dbo].[VoteCategory] ([VoteCategoryId], [Category]) VALUES (2, N'Hint')
INSERT [dbo].[VoteType] ([VoteTypeId], [Type]) VALUES (1, N'Like')
INSERT [dbo].[VoteType] ([VoteTypeId], [Type]) VALUES (2, N'Dislike')
/****** Object:  Index [IX_ApiClaims_ApiResourceId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApiClaims_ApiResourceId] ON [dbo].[ApiClaims]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ApiResources_Name]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ApiResources_Name] ON [dbo].[ApiResources]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiScopeClaims_ApiScopeId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApiScopeClaims_ApiScopeId] ON [dbo].[ApiScopeClaims]
(
	[ApiScopeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiScopes_ApiResourceId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApiScopes_ApiResourceId] ON [dbo].[ApiScopes]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ApiScopes_Name]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ApiScopes_Name] ON [dbo].[ApiScopes]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApiSecrets_ApiResourceId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApiSecrets_ApiResourceId] ON [dbo].[ApiSecrets]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientClaims_ClientId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientClaims_ClientId] ON [dbo].[ClientClaims]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientCorsOrigins_ClientId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientCorsOrigins_ClientId] ON [dbo].[ClientCorsOrigins]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientGrantTypes_ClientId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientGrantTypes_ClientId] ON [dbo].[ClientGrantTypes]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientIdPRestrictions_ClientId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientIdPRestrictions_ClientId] ON [dbo].[ClientIdPRestrictions]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientPostLogoutRedirectUris_ClientId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientPostLogoutRedirectUris_ClientId] ON [dbo].[ClientPostLogoutRedirectUris]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientProperties_ClientId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientProperties_ClientId] ON [dbo].[ClientProperties]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientRedirectUris_ClientId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientRedirectUris_ClientId] ON [dbo].[ClientRedirectUris]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Clients_ClientId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Clients_ClientId] ON [dbo].[Clients]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientScopes_ClientId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientScopes_ClientId] ON [dbo].[ClientScopes]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientSecrets_ClientId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClientSecrets_ClientId] ON [dbo].[ClientSecrets]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdentityClaims_IdentityResourceId]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_IdentityClaims_IdentityResourceId] ON [dbo].[IdentityClaims]
(
	[IdentityResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_IdentityResources_Name]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IdentityResources_Name] ON [dbo].[IdentityResources]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_PersistedGrants_SubjectId_ClientId_Type]    Script Date: 4/18/2018 4:54:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_PersistedGrants_SubjectId_ClientId_Type] ON [dbo].[PersistedGrants]
(
	[SubjectId] ASC,
	[ClientId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApiClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApiClaims_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiClaims] CHECK CONSTRAINT [FK_ApiClaims_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiScopeClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ApiScopeId] FOREIGN KEY([ApiScopeId])
REFERENCES [dbo].[ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiScopeClaims] CHECK CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ApiScopeId]
GO
ALTER TABLE [dbo].[ApiScopes]  WITH CHECK ADD  CONSTRAINT [FK_ApiScopes_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiScopes] CHECK CONSTRAINT [FK_ApiScopes_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiSecrets]  WITH CHECK ADD  CONSTRAINT [FK_ApiSecrets_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiSecrets] CHECK CONSTRAINT [FK_ApiSecrets_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ClientClaims]  WITH CHECK ADD  CONSTRAINT [FK_ClientClaims_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientClaims] CHECK CONSTRAINT [FK_ClientClaims_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientCorsOrigins]  WITH CHECK ADD  CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientCorsOrigins] CHECK CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientGrantTypes]  WITH CHECK ADD  CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientGrantTypes] CHECK CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientIdPRestrictions]  WITH CHECK ADD  CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientIdPRestrictions] CHECK CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris] CHECK CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClientProperties_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientProperties] CHECK CONSTRAINT [FK_ClientProperties_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientRedirectUris] CHECK CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientScopes]  WITH CHECK ADD  CONSTRAINT [FK_ClientScopes_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientScopes] CHECK CONSTRAINT [FK_ClientScopes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientSecrets]  WITH CHECK ADD  CONSTRAINT [FK_ClientSecrets_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientSecrets] CHECK CONSTRAINT [FK_ClientSecrets_Clients_ClientId]
GO
ALTER TABLE [dbo].[IdentityClaims]  WITH CHECK ADD  CONSTRAINT [FK_IdentityClaims_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityClaims] CHECK CONSTRAINT [FK_IdentityClaims_IdentityResources_IdentityResourceId]
GO
