/*!
* DisplayMonkey source file
* http://displaymonkey.org
*
* Copyright (c) 2016 Fuel9 LLC and contributors
*
* Released under the MIT license:
* http://opensource.org/licenses/MIT
*/

use DisplayMonkey	-- TODO: change if DisplayMonkey database name is different
GO

/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](255) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AzureAccount]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AzureAccount](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Resource] [int] NOT NULL CONSTRAINT [DF_AzureAccount_Application]  DEFAULT ((0)),
	[ClientId] [varchar](36) NOT NULL,
	[ClientSecret] [varchar](500) NOT NULL,
	[TenantId] [varchar](100) NULL,
	[User] [varchar](100) NOT NULL,
	[Password] [varbinary](400) NULL,
	[AccessToken] [varchar](2000) NULL,
	[ExpiresOn] [datetime] NULL,
	[RefreshToken] [varchar](1000) NULL,
	[IdToken] [varchar](1000) NULL,
 CONSTRAINT [PK_PowerbiAccount] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Canvas]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Canvas](
	[CanvasId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Height] [int] NOT NULL,
	[Width] [int] NOT NULL,
	[BackgroundImage] [int] NULL,
	[BackgroundColor] [varchar](20) NULL,
	[Version] [timestamp] NOT NULL,
 CONSTRAINT [PK_CANVAS] PRIMARY KEY CLUSTERED 
(
	[CanvasId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clock]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clock](
	[FrameId] [int] NOT NULL,
	[Type] [int] NOT NULL CONSTRAINT [DF_CLOCK_Type]  DEFAULT ((0)),
	[ShowDate] [bit] NOT NULL CONSTRAINT [DF_CLOCK_ShowDate]  DEFAULT ((1)),
	[ShowTime] [bit] NOT NULL CONSTRAINT [DF_CLOCK_ShowTime]  DEFAULT ((1)),
	[Label] [varchar](50) NULL,
	[TimeZone] [varchar](50) NULL,
	[ShowSeconds] [bit] NOT NULL CONSTRAINT [DF_Clock_ShowSeconds]  DEFAULT ((1)),
 CONSTRAINT [PK_CLOCK] PRIMARY KEY CLUSTERED 
(
	[FrameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Content]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Content](
	[ContentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Data] [varbinary](max) NOT NULL,
	[Type] [int] NOT NULL CONSTRAINT [DF_CONTENT_Type]  DEFAULT ((0)),
	[Version] [timestamp] NOT NULL,
 CONSTRAINT [PK_IMAGE_1] PRIMARY KEY CLUSTERED 
(
	[ContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Display]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Display](
	[DisplayId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Host] [varchar](50) NULL,
	[CanvasId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[Version] [timestamp] NOT NULL,
	[NoScroll] [bit] NOT NULL CONSTRAINT [DF_Display_NoScroll]  DEFAULT ((0)),
	[ReadyTimeout] [int] NOT NULL CONSTRAINT [DF_Display_ReadyTimeout]  DEFAULT ((0)),
	[PollInterval] [int] NOT NULL CONSTRAINT [DF_Display_PollInterval]  DEFAULT ((0)),
	[ErrorLength] [int] NOT NULL CONSTRAINT [DF_Display_ErrorLength]  DEFAULT ((0)),
	[NoCursor] [bit] NOT NULL CONSTRAINT [DF_Display_NoCursor]  DEFAULT ((0)),
	[RecycleTime] [time](7) NULL,
 CONSTRAINT [PK_DISPLAY] PRIMARY KEY CLUSTERED 
(
	[DisplayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExchangeAccount]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExchangeAccount](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Account] [varchar](100) NOT NULL,
	[Password] [varbinary](400) NULL,
	[EwsVersion] [int] NOT NULL CONSTRAINT [DF_ExchangeAccount_EwsVersion]  DEFAULT ((0)),
	[Url] [varchar](250) NULL,
 CONSTRAINT [PK_ExchangeAccount] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Frame]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Frame](
	[FrameId] [int] IDENTITY(1,1) NOT NULL,
	[PanelId] [int] NOT NULL,
	[Duration] [int] NOT NULL CONSTRAINT [DF_FRAME_Duration]  DEFAULT ((1)),
	[BeginsOn] [datetime] NULL,
	[EndsOn] [datetime] NULL,
	[Sort] [int] NULL,
	[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_Frame_DateCreated]  DEFAULT (getdate()),
	[Version] [timestamp] NOT NULL,
	[TemplateId] [int] NOT NULL,
	[CacheInterval] [int] NOT NULL CONSTRAINT [DF_Frame_CacheInterval]  DEFAULT ((0)),
 CONSTRAINT [PK_FRAME] PRIMARY KEY CLUSTERED 
(
	[FrameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FrameLocation]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FrameLocation](
	[FrameId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
 CONSTRAINT [PK_FRAME_LOCATION] PRIMARY KEY CLUSTERED 
(
	[FrameId] ASC,
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FullScreen]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FullScreen](
	[PanelId] [int] NOT NULL,
	[MaxIdleInterval] [int] NULL,
 CONSTRAINT [PK_FullScreen] PRIMARY KEY CLUSTERED 
(
	[PanelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Html]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Html](
	[FrameId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Html] PRIMARY KEY CLUSTERED 
(
	[FrameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Level]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[LevelId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_LEVEL] PRIMARY KEY CLUSTERED 
(
	[LevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[LevelId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[AreaId] [int] NULL,
	[TemperatureUnit] [char](1) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[DateFormat] [varchar](20) NULL,
	[TimeFormat] [varchar](10) NULL,
	[Woeid] [int] NULL,
	[Version] [timestamp] NOT NULL,
	[Culture] [varchar](10) NULL,
	[TimeZone] [varchar](50) NULL,
 CONSTRAINT [PK_LOCATION] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Memo]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memo](
	[FrameId] [int] NOT NULL,
	[Subject] [nvarchar](200) NULL,
	[Body] [nvarchar](max) NULL,
 CONSTRAINT [PK_TEXT] PRIMARY KEY CLUSTERED 
(
	[FrameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[FrameId] [int] NOT NULL,
	[Source] [int] NOT NULL,
 CONSTRAINT [PK_NEWS] PRIMARY KEY CLUSTERED 
(
	[FrameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Outlook]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Outlook](
	[FrameId] [int] NOT NULL,
	[Mode] [int] NOT NULL CONSTRAINT [DF_Outlook_Mode]  DEFAULT ((0)),
	[Name] [nvarchar](100) NULL,
	[Mailbox] [varchar](100) NULL,
	[ShowEvents] [int] NOT NULL CONSTRAINT [DF_Outlook_ShowEvents]  DEFAULT ((0)),
	[AccountId] [int] NOT NULL,
	[AllowReserve] [bit] NOT NULL CONSTRAINT [DF_Outlook_AllowReserve]  DEFAULT ((0)),
	[ShowAsFlags] [int] NOT NULL CONSTRAINT [DF_Outlook_ShowAsFlags]  DEFAULT ((-1)),
	[Privacy] [int] NOT NULL CONSTRAINT [DF_Outlook_Privacy]  DEFAULT ((0)),
 CONSTRAINT [PK_Outlook] PRIMARY KEY CLUSTERED 
(
	[FrameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Panel]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Panel](
	[PanelId] [int] IDENTITY(1,1) NOT NULL,
	[CanvasId] [int] NOT NULL,
	[Top] [int] NOT NULL,
	[Left] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[Width] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Version] [timestamp] NOT NULL,
	[FadeLength] [float] NOT NULL CONSTRAINT [DF_Panel_FadeLength]  DEFAULT ((0)),
 CONSTRAINT [PK_PANEL] PRIMARY KEY CLUSTERED 
(
	[PanelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Picture]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picture](
	[FrameId] [int] NOT NULL,
	[ContentId] [int] NOT NULL,
	[Mode] [int] NOT NULL CONSTRAINT [DF_PICTURE_Mode]  DEFAULT ((0)),
 CONSTRAINT [PK_IMAGE] PRIMARY KEY CLUSTERED 
(
	[FrameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Powerbi]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Powerbi](
	[FrameId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[Type] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Dashboard] [uniqueidentifier] NULL,
	[Tile] [uniqueidentifier] NULL,
	[Report] [uniqueidentifier] NULL,
	[Url] [varchar](200) NULL,
 CONSTRAINT [PK_Powerbi] PRIMARY KEY CLUSTERED 
(
	[FrameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Report]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Report](
	[FrameId] [int] NOT NULL,
	[Path] [varchar](250) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Mode] [int] NOT NULL CONSTRAINT [DF_REPORT_Mode]  DEFAULT ((0)),
	[ServerId] [int] NOT NULL,
 CONSTRAINT [PK_REPORT] PRIMARY KEY CLUSTERED 
(
	[FrameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReportServer]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReportServer](
	[ServerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[BaseUrl] [varchar](250) NOT NULL,
	[User] [varchar](100) NULL,
	[Password] [varbinary](1024) NULL,
	[Domain] [varchar](100) NULL,
 CONSTRAINT [PK_ReportServer] PRIMARY KEY CLUSTERED 
(
	[ServerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Settings](
	[Key] [uniqueidentifier] NOT NULL,
	[Value] [varbinary](512) NULL,
	[Type] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY NONCLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Template]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Template](
	[TemplateId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Html] [nvarchar](max) NOT NULL,
	[FrameType] [int] NOT NULL,
	[Version] [timestamp] NOT NULL,
 CONSTRAINT [PK_Template] PRIMARY KEY CLUSTERED 
(
	[TemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[uname] [varchar](15) NOT NULL,
	[Pwd] [varchar](25) NOT NULL,
	[userRole] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY NONCLUSTERED 
(
	[uname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Video]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[FrameId] [int] NOT NULL,
	[PlayMuted] [bit] NOT NULL,
	[AutoLoop] [bit] NOT NULL,
 CONSTRAINT [PK_VIDEO] PRIMARY KEY CLUSTERED 
(
	[FrameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VideoAlternative]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoAlternative](
	[FrameId] [int] NOT NULL,
	[ContentId] [int] NOT NULL,
 CONSTRAINT [PK_VIDEO_ALTERNATIVE] PRIMARY KEY CLUSTERED 
(
	[FrameId] ASC,
	[ContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Weather]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weather](
	[FrameId] [int] NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_WEATHER] PRIMARY KEY CLUSTERED 
(
	[FrameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Youtube]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Youtube](
	[FrameId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[YoutubeId] [nvarchar](100) NOT NULL,
	[Volume] [int] NOT NULL CONSTRAINT [DF_Youtube_PlayMuted]  DEFAULT ((0)),
	[AutoLoop] [bit] NOT NULL CONSTRAINT [DF_Youtube_AutoLoop]  DEFAULT ((0)),
	[Aspect] [int] NOT NULL CONSTRAINT [DF_Youtube_Aspect]  DEFAULT ((0)),
	[Quality] [int] NOT NULL CONSTRAINT [DF_Youtube_Quality]  DEFAULT ((0)),
	[Start] [int] NOT NULL CONSTRAINT [DF_Youtube_Start]  DEFAULT ((0)),
	[Rate] [int] NOT NULL CONSTRAINT [DF_Youtube_Rate]  DEFAULT ((0)),
 CONSTRAINT [PK_Youtube] PRIMARY KEY CLUSTERED 
(
	[FrameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_NEWS_Source]  DEFAULT ((0)) FOR [Source]
GO
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [DF_VIDEO_PlayMuted]  DEFAULT ((1)) FOR [PlayMuted]
GO
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [DF_VIDEO_AutoLoop]  DEFAULT ((1)) FOR [AutoLoop]
GO
ALTER TABLE [dbo].[Weather] ADD  CONSTRAINT [DF_Weather_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Canvas]  WITH CHECK ADD  CONSTRAINT [FK_Canvas_Content] FOREIGN KEY([BackgroundImage])
REFERENCES [dbo].[Content] ([ContentId])
GO
ALTER TABLE [dbo].[Canvas] CHECK CONSTRAINT [FK_Canvas_Content]
GO
ALTER TABLE [dbo].[Clock]  WITH CHECK ADD  CONSTRAINT [FK_Clock_Frame] FOREIGN KEY([FrameId])
REFERENCES [dbo].[Frame] ([FrameId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Clock] CHECK CONSTRAINT [FK_Clock_Frame]
GO
ALTER TABLE [dbo].[Display]  WITH CHECK ADD  CONSTRAINT [FK_Display_Canvas] FOREIGN KEY([CanvasId])
	REFERENCES [dbo].[Canvas] ([CanvasId]) 
	ON UPDATE  CASCADE
	ON DELETE  CASCADE
GO
ALTER TABLE [dbo].[Display] CHECK CONSTRAINT [FK_Display_Canvas]
GO
ALTER TABLE [dbo].[Display]  WITH CHECK ADD  CONSTRAINT [FK_Display_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[Display] CHECK CONSTRAINT [FK_Display_Location]
GO
ALTER TABLE [dbo].[Frame]  WITH CHECK ADD  CONSTRAINT [FK_Frame_Panel] FOREIGN KEY([PanelId])
REFERENCES [dbo].[Panel] ([PanelId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Frame] CHECK CONSTRAINT [FK_Frame_Panel]
GO
ALTER TABLE [dbo].[Frame]  WITH CHECK ADD  CONSTRAINT [FK_Frame_Template] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[Template] ([TemplateId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Frame] CHECK CONSTRAINT [FK_Frame_Template]
GO
ALTER TABLE [dbo].[FrameLocation]  WITH CHECK ADD  CONSTRAINT [FK_FrameLlocation_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FrameLocation] CHECK CONSTRAINT [FK_FrameLlocation_Location]
GO
ALTER TABLE [dbo].[FrameLocation]  WITH CHECK ADD  CONSTRAINT [FK_FrameLocation_Frame] FOREIGN KEY([FrameId])
REFERENCES [dbo].[Frame] ([FrameId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FrameLocation] CHECK CONSTRAINT [FK_FrameLocation_Frame]
GO
ALTER TABLE [dbo].[FullScreen]  WITH CHECK ADD  CONSTRAINT [FK_FullScreen_Panel] FOREIGN KEY([PanelId])
REFERENCES [dbo].[Panel] ([PanelId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FullScreen] CHECK CONSTRAINT [FK_FullScreen_Panel]
GO
ALTER TABLE [dbo].[Html]  WITH CHECK ADD  CONSTRAINT [FK_Html_Frame] FOREIGN KEY([FrameId])
REFERENCES [dbo].[Frame] ([FrameId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Html] CHECK CONSTRAINT [FK_Html_Frame]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Area] FOREIGN KEY([AreaId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Area]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Level] FOREIGN KEY([LevelId])
REFERENCES [dbo].[Level] ([LevelId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Level]
GO
ALTER TABLE [dbo].[Memo]  WITH CHECK ADD  CONSTRAINT [FK_Memo_Frame] FOREIGN KEY([FrameId])
REFERENCES [dbo].[Frame] ([FrameId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Memo] CHECK CONSTRAINT [FK_Memo_Frame]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Frame] FOREIGN KEY([FrameId])
REFERENCES [dbo].[Frame] ([FrameId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Frame]
GO
ALTER TABLE [dbo].[Outlook]  WITH CHECK ADD  CONSTRAINT [FK_Outlook_ExchangeAccount] FOREIGN KEY([AccountId])
REFERENCES [dbo].[ExchangeAccount] ([AccountId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Outlook] CHECK CONSTRAINT [FK_Outlook_ExchangeAccount]
GO
ALTER TABLE [dbo].[Outlook]  WITH CHECK ADD  CONSTRAINT [FK_Outlook_Frame] FOREIGN KEY([FrameId])
REFERENCES [dbo].[Frame] ([FrameId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Outlook] CHECK CONSTRAINT [FK_Outlook_Frame]
GO
ALTER TABLE [dbo].[Panel]  WITH CHECK ADD  CONSTRAINT [FK_Panel_Canvas] FOREIGN KEY([CanvasId])
REFERENCES [dbo].[Canvas] ([CanvasId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Panel] CHECK CONSTRAINT [FK_Panel_Canvas]
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD  CONSTRAINT [FK_Picture_Content] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Content] ([ContentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Picture] CHECK CONSTRAINT [FK_Picture_Content]
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD  CONSTRAINT [FK_Picture_Frame] FOREIGN KEY([FrameId])
REFERENCES [dbo].[Frame] ([FrameId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Picture] CHECK CONSTRAINT [FK_Picture_Frame]
GO
ALTER TABLE [dbo].[Powerbi]  WITH CHECK ADD  CONSTRAINT [FK_Powerbi_AzureAccount] FOREIGN KEY([AccountId])
REFERENCES [dbo].[AzureAccount] ([AccountId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Powerbi] CHECK CONSTRAINT [FK_Powerbi_AzureAccount]
GO
ALTER TABLE [dbo].[Powerbi]  WITH CHECK ADD  CONSTRAINT [FK_Powerbi_Frame] FOREIGN KEY([FrameId])
REFERENCES [dbo].[Frame] ([FrameId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Powerbi] CHECK CONSTRAINT [FK_Powerbi_Frame]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Frame] FOREIGN KEY([FrameId])
REFERENCES [dbo].[Frame] ([FrameId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Frame]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_ReportServer] FOREIGN KEY([ServerId])
REFERENCES [dbo].[ReportServer] ([ServerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_ReportServer]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_Frame] FOREIGN KEY([FrameId])
REFERENCES [dbo].[Frame] ([FrameId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_Frame]
GO
ALTER TABLE [dbo].[VideoAlternative]  WITH CHECK ADD  CONSTRAINT [FK_VideoAalternative_Video] FOREIGN KEY([FrameId])
REFERENCES [dbo].[Video] ([FrameId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VideoAlternative] CHECK CONSTRAINT [FK_VideoAalternative_Video]
GO
ALTER TABLE [dbo].[VideoAlternative]  WITH CHECK ADD  CONSTRAINT [FK_VideoAlternative_Content] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Content] ([ContentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VideoAlternative] CHECK CONSTRAINT [FK_VideoAlternative_Content]
GO
ALTER TABLE [dbo].[Weather]  WITH CHECK ADD  CONSTRAINT [FK_Weather_Frame] FOREIGN KEY([FrameId])
REFERENCES [dbo].[Frame] ([FrameId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Weather] CHECK CONSTRAINT [FK_Weather_Frame]
GO
ALTER TABLE [dbo].[Youtube]  WITH CHECK ADD  CONSTRAINT [FK_Youtube_Frame] FOREIGN KEY([FrameId])
REFERENCES [dbo].[Frame] ([FrameId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Youtube] CHECK CONSTRAINT [FK_Youtube_Frame]
GO
ALTER TABLE [dbo].[Canvas]  WITH CHECK ADD  CONSTRAINT [CK_CANVAS_NAME] CHECK  (([Name]<>''))
GO
ALTER TABLE [dbo].[Canvas] CHECK CONSTRAINT [CK_CANVAS_NAME]
GO
ALTER TABLE [dbo].[Display]  WITH CHECK ADD  CONSTRAINT [CK_DISPLAY_NAME] CHECK  (([Name]<>''))
GO
ALTER TABLE [dbo].[Display] CHECK CONSTRAINT [CK_DISPLAY_NAME]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [CK_LOCATION_NAME] CHECK  (([Name]<>''))
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [CK_LOCATION_NAME]
GO
ALTER TABLE [dbo].[Panel]  WITH CHECK ADD  CONSTRAINT [CK_PANEL_NAME] CHECK  (([Name]<>''))
GO
ALTER TABLE [dbo].[Panel] CHECK CONSTRAINT [CK_PANEL_NAME]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDisplayData]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************
  2013-11-07 [DPA] - DisplayMonkey object
  2014-11-16 [LTL] - displayId instead of panelId, fixed location
  2015-07-30 [LTL] - supersedes sp_GetIdleInterval and fn_GetDisplayHash, RC13
  2015-08-17 [LTL] - fixed hash, RC14
  2015-09-03 [LTL] - added RecycleTime, RC15
  2016-10-10 [LTL] - handle canvasId in FS, 1.3.0
*******************************************************************/
CREATE procedure [dbo].[sp_GetDisplayData]
	@displayId int
as begin
	set nocount on;

	-- calculate display hash
	declare @v varbinary(max); set @v = 0x;
	with _c as (
		select c.CanvasId ID, c.Version VC, d.Version V
		from Display d with(nolock)
		inner join Canvas c with(nolock) on c.CanvasId=d.CanvasId 
		where d.DisplayId=@displayId
	)
	, _l as (
		select l.LocationId ID, l.Version V from Location l with(nolock)
		inner join Display d with(nolock) on d.LocationId=l.LocationId 
		where d.DisplayId=@displayId
	)
	, _p as (
		select p.PanelId ID, p.Version V from Panel p with(nolock)
		inner join _c on _c.ID=p.CanvasId
	)
	, _h as (
		select 0 O, ID, V from _c
		union all
		select 1 O, ID, VC from _c
		union all
		select 2 O, ID, V from _l
		union all
		select 3 O, ID, V from _p
	)
	select @v = @v + V from _h order by O, ID
	;

	-- claculate FS idle interval
	with _f as (
		select top 1 
			d.DisplayId
		,	d.CanvasId
		,	d.LocationId
		,	d.RecycleTime
		,	f.PanelId
		,	MaxDuration	= isnull(MaxIdleInterval,0)
		from Display d with(nolock)
		inner join Panel p with(nolock) on p.CanvasId=d.CanvasId
		inner join FullScreen f with(nolock) on f.PanelId=p.PanelId
		where d.DisplayId = @displayId
	)
	, _p as (
		select
			p.PanelId
		,	Duration	= sum(isnull(Duration,0))
		from Panel p with(nolock) 
		inner join _f on _f.CanvasId=p.CanvasId
		left join Frame f with(nolock) on f.PanelId=p.PanelId 
			and getdate() between isnull(f.BeginsOn,'') and isnull(f.EndsOn,'99991231')
		where 
			p.PanelId != _f.PanelId	-- exclude FullScreen 
		and (
			-- frame is linked to display location
			exists(select 1 from FrameLocation l with(nolock) where l.FrameId=f.FrameId and l.LocationId=_f.LocationId)
			-- or frame is not linked to any locations
			or not exists(select 1 from FrameLocation l with(nolock) where l.FrameId=f.FrameId)
			)
		group by p.PanelId
	)
	, _m as (
		select
			Duration = max(Duration) from _p
	)

	-- return result
	select 
		DisplayId
	,	[Hash]			= checksum(@v)
	,	IdleInterval	= case when 0 < MaxDuration and MaxDuration < Duration then MaxDuration else Duration end
	,	RecycleTime
	from _f outer apply _m
	;
end

GO
/****** Object:  StoredProcedure [dbo].[sp_GetLocationDetails]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************
  2013-11-09 [DPA] - DisplayMonkey object
  2014-10-04 [LTL] - added woeid
  2014-11-28 [LTL] - added culture
  2015-04-14 [LTL] - replaced offset with time zone
*******************************************************************/
CREATE procedure [dbo].[sp_GetLocationDetails]
	@displayId int
as begin
	set nocount on;

	declare 
		@lat float
	,	@lng float
	,	@woeid int
	,	@unit char
	,	@locId int
	,	@levelId int
	,	@displayLoc int
	,	@parentLoc int
	,	@dateFmt varchar(20)
	,	@timeFmt varchar(10)
	,	@name nvarchar(100)
	,	@culture varchar(10)
	,	@timeZone varchar(50)
	;
	
	select top 1 @locId = LocationId from Display where DisplayId=@displayId;
	
	set @displayLoc = @locId;
	
	while (@lat is null or @lng is null or @unit is null or @dateFmt is null or @timeFmt is null) begin
		select top 1 
			@lat = isnull(@lat,Latitude)
		,	@lng = isnull(@lng,Longitude)
		,	@woeid = isnull(@woeid,Woeid)
		,	@unit = isnull(@unit,TemperatureUnit)
		,	@parentLoc = AreaId
		,	@dateFmt = isnull(@dateFmt, DateFormat)
		,	@timeFmt = isnull(@timeFmt, TimeFormat)
		,	@name = case when @displayLoc = @locId then Name else @name end
		,	@timeZone = ISNULL(@timeZone, TimeZone)
		,	@culture = isnull(@culture, Culture)
		from Location where LocationId=@locId
		;
		if (@@rowcount=0) break;
		set @locId = @parentLoc;
	end
	
	select 
		LocationId
	,	LevelId
	,	Name = isnull(@name,N'')
	,	Latitude = isnull(@lat,0)
	,	Longitude = isnull(@lng,0)
	,	Woeid = isnull(@woeid,0)
	,	TemperatureUnit = isnull(@unit,'C')
	,	DateFormat = isnull(@dateFmt,'LL')
	,	TimeFormat = isnull(@timeFmt,'LT')
	,	TimeZone = @timeZone
	,	Culture = @culture
	from Location where LocationId=@displayLoc
	;

end



GO
/****** Object:  StoredProcedure [dbo].[sp_GetNextFrame]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************
  2013-11-07 [DPA] - DisplayMonkey object
  2014-02-19 [LTL] - using Sort
  2014-11-07 [LTL] - improvements, blank cycle
  2015-03-30 [LTL] - return entire frame + template
*******************************************************************/
CREATE procedure [dbo].[sp_GetNextFrame]
	@panelId int
,	@displayId int
,	@lastFrameId int
as begin

	set nocount on;
	declare @now as datetime, @lid int; 
	select 
		@now = getdate()
	;
	
	declare @l table (LocationId int not null, FrameId int not null);
	select @lid=LocationId from Display where DisplayId=@displayId;
	while (not @lid is null) begin
		--print @lid
		insert @l 
			select LocationId, FrameId
			from FrameLocation where LocationId=@lid
			;
		select @lid=AreaId from Location where LocationId=@lid
		;
	end
	;

	with _curr as (
		select isnull(Sort,FrameId) S from Frame where FrameId = @lastFrameId 
	)
	, _next as (
		select 1 S, FrameId, isnull(Sort,FrameId) Sort from Frame 
		inner join _curr on S < isnull(Sort,FrameId) where PanelId = @panelId 
		union all
		select 2 S, FrameId, isnull(Sort,FrameId) Sort from Frame where PanelId = @panelId 
	)
	select top 1 
		t.FrameType
	,	t.Name TemplateName
	,	t.Html
	,	d.FrameId
	,	d.PanelId
	,	d.Duration
	,	d.BeginsOn
	,	d.EndsOn
	,	d.Sort
	,	d.DateCreated
	,	d.CacheInterval
	,	d.[Version]
	from _next f 
	inner join Frame d on d.FrameId=f.FrameId
	inner join Template t on t.TemplateId=d.TemplateId
	where
		(d.BeginsOn is null or d.BeginsOn <= @now) 
		and (d.EndsOn is null or @now <= d.EndsOn)
		and (
				not exists(select 1 from FrameLocation where FrameId=f.FrameId)
				or  exists(select 1 from @l where FrameId=f.FrameId)
			)
	order by f.S, f.Sort
	;

end



GO
/****** Object:  StoredProcedure [dbo].[sp_RegisterDisplay]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************
  2013-11-17 [DPA] - DisplayMonkey object
  2015-08-03 [LTL] - defaults for new displays, RC13
*******************************************************************/
CREATE procedure [dbo].[sp_RegisterDisplay] (
	@host varchar(100)
,	@name nvarchar(100)
,	@canvasId int
,	@locationId int
,	@displayId int out
)
as begin
set nocount on;

if( isnull(@host,'')='' ) return;
if( isnull(@name,'')='' ) return;
if( isnull(@canvasId,0)=0 ) return;
if( isnull(@locationId,0)=0 ) return;

if not exists(select 1 from Display where Host=@host) begin
	insert Display (Name, Host, CanvasId, LocationId)
	select @name, @host, @canvasId, @locationId
	;
	
	set @displayId = scope_identity()
	;

	-- defaults
	update Display set 
		ErrorLength		= ISNULL((select convert(int,[Value]) from Settings where [Key]='2F43071D-C314-4C78-8438-76B474364258'), ErrorLength)
	,	PollInterval	= ISNULL((select convert(int,[Value]) from Settings where [Key]='7C993AC3-2E15-44DD-84B3-D13935BD1E43'), PollInterval)
	,	ReadyTimeout	= ISNULL((select convert(int,[Value]) from Settings where [Key]='3AC645E8-30B9-4473-A78C-69DBC4BFFAA6'), ReadyTimeout)
	where DisplayId = @displayId
	;

end else begin
	update Display set Name=@name, CanvasId=@canvasId, LocationId=@locationId
	where Host=@host;
	;
	
	set @displayId = scope_identity()
	;
end

end



GO
/****** Object:  Trigger [dbo].[tr_Location]    Script Date: 2016-11-21 15:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************
  2014-11-28 [LTL] - DisplayMonkey object
*******************************************************************/
CREATE trigger [dbo].[tr_Location]
	on  [dbo].[Location] 
	after update, delete
as
begin
	declare @k table (id int,i int);
	declare @i int; set @i=0;
	insert @k (id,i) select LocationId, @i from deleted;
	while (@@rowcount > 0) begin
		set @i=@i+1;
		update c set Name=c.Name
		output inserted.LocationId,@i into @k (id,i)
		from @k p inner join Location c on c.AreaId=p.id
		where i=@i-1
		;
	end
end



GO


--------------------------------- SETTINGS ----------------------------------------

INSERT [dbo].[__MigrationHistory] ([MigrationId], [Model], [ProductVersion]) VALUES (N'201311300046371_InitialCreate', 0x1F8B0800000000000400CD56C96EDB3010BD17E83F083CB5879ACE726803B9456A2785D13A09A224F7B134B689725145CAB0BFAD877E527FA1436BB12CD9491AF4D08B6191B3BC797C33E4EF9FBFC24F2B2583256656183D6047BD3E0B50C726117A3E60B99BBD7BCF3E7D7CFD2ABC48D42A78A8EC4EBC1D796A3B600BE7D233CE6DBC4005B6A7449C196B66AE171BC52131FCB8DFFFC08F8E38520846B18220BCCDB5130A371FF439343AC6D4E52027264169CB75DA893651832B5068538871C046C2A612D613A3BFE3BA57D8B3E05C0A202C11CA190BD2D3B37B8B91CB8C9E47293801F26E9D22EDCF405A2C919FA5A7CF05DF3FF6E039686D1C8533FA45C5B3BA2C2AEC8208706B0F6B53DC807DC325CAA609197DC5F5CE022DDD6426C5CCAD6F71D6741C272CE0BBCEBCED5DFBB61D3D8A011B6B7772CC82AB5C4A984AACC92236236732FC821A337098DC807398910AC6096EAAE8A46E25F2BF55163A1592160B2EC50A936FA8E76E51679AC0AA5AA1BF2CB8D78294484E2ECBB189ACF86E260DF996D02ECDA42F0782E09780763434FAECB771E55AE417AE11BA265D24B56DA2426FBDE2E4F6C2A9136F15CD0B4957D2E707B41F4E204D89A9462F942B415434C2F05DF4F73254450C1EDB3D6AACD1D699E8DC618EAD5D4A4D482F4566DD081C4CC19FDD30511DB3BFA3B94ABAC3765BFE5BF22B73FF7FCFA99693A1B7A7AD9A645E527D8A54BC29156B2C7BDBB1F48C6290901DEAA5A191B9D28F76E663718A5669062956BA1142DE2AA14D15EF70D59A0F6DE61FD36FDBA4CE5EEBB8A5D7B0D4CED303BD23A6C2840544CD52245E48D1DA3A543D6FD08B7EC8A11454EFD660025ACCD0BA3BF31D692C91D6DFB76E84174C6B6E6D22FFF3912D3C0B4F0EE7CE447FFEB4D64BC8E205646F14ACDEFECB09DC9D20CF18BE87676F2199014BA686A01710AB79FDC2B9DCD56FC89BCF96708456CCB721FC234663EC5F07DBA095CD58CF4C453315D5445499B44E61820E12E2E63C736206B1A3ED18ADDDDC9D0F207332B950534CC6FA3A7769EECEAD4535953B7771C81FCFBFB97C763187D7A9FFB2FFA2048229A804BCD69F7321931AF76557858742789994D22654F476A070F3751DE9CAE867062AE91B618ADA37C61D2ABA2B1CDA6B1DC1120F637B9AC35DC6C291807906CA9631B6FEFE15CDFD33FAE31F6A22AA43780B0000, N'5.0.0.net45')
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'9a0bc012-ff01-4103-8a75-a03b275b0ad1', 0x00500000, 0)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'4cab57c4-efef-4ede-91a3-effd48660909', 0x0AA00000, 0)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'417d856b-7ec4-4cbd-a5ea-47bfc0f7b1f9', 0x68007400740070003A002F002F00770069006E002D003900310031003200340061003600760067006C0069002F0061007000700073002F0044006900730070006C00610079004D006F006E006B00650079002F00, 1)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'1d715b8d-2377-4fc6-b2a1-d025a4e48a56', 0x640065006600610075006C007400, 1)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'2409f3db-06c7-4e16-a903-3d76fd0db45a', 0x640065006600610075006C007400, 1)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'366ac17f-c163-4f28-b233-eda6b15a8142', 0x640065006600610075006C007400, 1)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'356fb4fa-c2b4-4a52-9420-1364c645f573', 0x4F00750074006C006F006F006B002000530069006D0070006C0069006600690065006400, 1)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'5565e940-0c32-4c6d-848d-96f99e8ae947', 0x640065006600610075006C007400, 1)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'411def31-e1d6-41e9-a299-81d345ec1ab7', 0x640065006600610075006C007400, 1)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'4fa531dc-9957-4182-946d-3c8f3213057d', 0x640065006600610075006C007400, 1)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'21bdcc5d-753b-47af-a492-0fc32d90a335', 0x640065006600610075006C007400, 1)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'cafcc975-8b0c-4027-8344-5719fcb0a213', 0x640065006600610075006C007400, 1)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'c12a15aa-3c10-407e-8368-a2397c7625bb', 0x00000001, 0)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'29851a7e-9f53-4759-98ff-f70ac0fd5a74', 0x0000003C, 0)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'f1afb295-75fb-4833-be21-7db5ed55ed92', 0x0000000A, 0)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'32f35fc7-18cd-4c0b-82e2-fe584d6be0c8', 0x0000003C, 0)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'c7c63812-2e51-42ef-a0c0-9258e48a5ff8', 0x00000005, 0)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'3ac645e8-30b9-4473-a78c-69dbc4bffaa6', 0x00000005, 0)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'7c993ac3-2e15-44dd-84b3-d13935bd1e43', 0x0000003C, 0)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'2f43071d-c314-4c78-8438-76b474364258', 0x00000014, 0)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'6865c5ae-8a91-4a44-b03a-ea81f69d6539', 0x4000000000000000, 2)
INSERT [dbo].[Settings] ([Key], [Value], [Type]) VALUES (N'9a4989fc-4c2f-49f3-ad60-e120ad8f85fe', 0x4000000000000000, 2)
SET IDENTITY_INSERT [dbo].[Template] ON 

INSERT [dbo].[Template] ([TemplateId], [Name], [Html], [FrameType]) VALUES (1, N'default', N'<div class="clock">
    <div class="text">
		<div class="label"></div>
		<ul class="face">
			<li class="date"></li>
			<li class="time"></li>
		</ul>
	</div>
    <div class="bmpAnalog">
		<div class="label"></div>
		<ul class="face">
			<li class="hour"></li>
			<li class="minute"></li>
			<li class="second"></li>
		</ul>
	</div>
    <div class="svgAnalog">
		<div class="label"></div>
		<div class="face">
			<!-- 
				 german-clock.svg

				 Copyright (c) 2012 Rüdiger Appel
				 Dual licensed under the MIT and GPL licenses.
		 
				 Date:    2012-03-14
				 Version: 1.0
				 Email:   ludi(at)me(dot)com
				 URI:     http://www.3Quarks.com/de/Bahnhofsuhr/
			-->

			<svg xmlns="http://www.w3.org/2000/svg"
				 xmlns:xlink="http://www.w3.org/1999/xlink"
				 xmlns:ev="http://www.w3.org/2001/xml-events"
				 version="1.1"
				 baseProfile="full"
				 width="100%"
				 height="100%"
				 viewBox="0 0 200 200">

			  <defs>

				<!-- three hour stroke (DIN 41091.1) -->
				<symbol id="threeHourStroke">
				  <line x1="100" y1="0" x2="100" y2="30" style="stroke:#333; stroke-width:8.4; stroke-linecap:butt"/>
				</symbol>

				<!-- hour stroke (DIN 41091.1) -->
				<symbol id="hourStroke">
				  <line x1="100" y1="0" x2="100" y2="24"  style="stroke:#333; stroke-width:8.4; stroke-linecap:butt"/>
				</symbol>

				<!-- minute stroke (DIN 41091.1) -->
				<symbol id="minuteStroke">
				  <line x1="100" y1="0" x2="100" y2="8" style="stroke:#333; stroke-width:3.6; stroke-linecap:butt"/>
				</symbol>

				<!-- quarter strokes -->
				<symbol id="quarterStrokes">
				  <use xlink:href="#threeHourStroke" />
				  <use xlink:href="#minuteStroke" transform="rotate( 6, 100, 100)"/>
				  <use xlink:href="#minuteStroke" transform="rotate(12, 100, 100)"/>
				  <use xlink:href="#minuteStroke" transform="rotate(18, 100, 100)"/>
				  <use xlink:href="#minuteStroke" transform="rotate(24, 100, 100)"/>
				  <use xlink:href="#hourStroke"   transform="rotate(30, 100, 100)"/>
				  <use xlink:href="#minuteStroke" transform="rotate(36, 100, 100)"/>
				  <use xlink:href="#minuteStroke" transform="rotate(42, 100, 100)"/>
				  <use xlink:href="#minuteStroke" transform="rotate(48, 100, 100)"/>
				  <use xlink:href="#minuteStroke" transform="rotate(54, 100, 100)"/>
				  <use xlink:href="#hourStroke"   transform="rotate(60, 100, 100)"/>
				  <use xlink:href="#minuteStroke" transform="rotate(66, 100, 100)"/>
				  <use xlink:href="#minuteStroke" transform="rotate(72, 100, 100)"/>
				  <use xlink:href="#minuteStroke" transform="rotate(78, 100, 100)"/>
				  <use xlink:href="#minuteStroke" transform="rotate(84, 100, 100)"/>
				</symbol>

				<!-- visible dial circle -->
				<clipPath id="dialCircle">
				  <circle cx="100" cy="100" r="100"/>
				</clipPath>

			  </defs>

			  <g id="svgAnalogFace" visibility="visible">

				  <!-- dial -->
				  <g id="dial" clip-path="url(#dialCircle)">
					<use xlink:href="#quarterStrokes"/>
					<use xlink:href="#quarterStrokes" transform="rotate( 90, 100, 100)"/>
					<use xlink:href="#quarterStrokes" transform="rotate(180, 100, 100)"/>
					<use xlink:href="#quarterStrokes" transform="rotate(270, 100, 100)"/>
				  </g>

				  <!-- hour hand -->
				  <g id="hourHand">
					<polygon points="94,46 100,40 106,46 106,118 94,118" style="fill:#222; stroke:none"/>
				  </g>

				  <!-- minute hand -->
				  <g id="minuteHand">
					<polygon points="95.5,11.5 100,7 104.5,11.5 104.5,122 95.5,122" style="fill:#222; stroke:none"/>
				  </g>

				  <!-- second hand -->
				  <g id="secondHand">
					<polygon points="98.8,11 100,9.8 101.2,11 101.6,42 98.4,42" style="fill:#ad1a14; stroke:none"/>
					<polygon points="98.1,58 101.9,58 102.5,122 97.5,122" style="fill:#ad1a14; stroke:none"/>
					<circle cx="100" cy="50" r="8.5" style="fill:none; stroke:#ad1a14; stroke-width:6.5"/>
					<circle cx="100" cy="100" r="3" style="fill:#222; stroke:#ad1a14; stroke-width:2.6"/>
				  </g>

			  </g>

			</svg>
		</div>
    </div>
</div>
', 0)
INSERT [dbo].[Template] ([TemplateId], [Name], [Html], [FrameType]) VALUES (2, N'default', N'<iframe class="html" seamless="seamless"></iframe>
', 1)
INSERT [dbo].[Template] ([TemplateId], [Name], [Html], [FrameType]) VALUES (3, N'default', N'<div class="memo">
    <h1 class="subject"></h1>
    <span class="body"></span>
</div>
', 2)
INSERT [dbo].[Template] ([TemplateId], [Name], [Html], [FrameType]) VALUES (4, N'default', N'
<div class="outlook">
	<div class="progress">
		<img src="files/world.gif" />
	</div>
	<div class="summary">
		<div class="mailbox"></div>
		<div class="current event"></div>
		<div class="current status"></div>
	</div>
	<div class="events">
		<table>
			<tr>
				<th class="label subject"></th>
				<th class="label starts"></th>
				<th class="label ends"></th>
				<th class="label duration"></th>
				<th class="label showAs"></th>
				<th class="label sensitivity"></th>
			</tr>
			<tr class="item">
				<td class="subject"></td>
				<td class="starts"></td>
				<td class="ends"></td>
				<td class="duration"></td>
				<td class="showAs"></td>
				<td class="sensitivity"></td>
			</tr>
		</table>
	</div>
	<div class="actions">
		<div class="title">Quick book</div>
		<div class="message"></div>
		<div class="controls">
			<input type="button" class="book" data-minutes="15" value="0:15" />
			<input type="button" class="book" data-minutes="30" value="0:30" />
			<input type="button" class="book" data-minutes="60" value="1:00" />
			<input type="button" class="book" />
		</div>
	</div>
</div>
', 4)
INSERT [dbo].[Template] ([TemplateId], [Name], [Html], [FrameType]) VALUES (5, N'default', N'<div class="picture">
    <span></span><img alt="" />
</div>
', 5)
INSERT [dbo].[Template] ([TemplateId], [Name], [Html], [FrameType]) VALUES (6, N'default', N'<div class="report">
    <span></span><img alt="" />
</div>
', 6)
INSERT [dbo].[Template] ([TemplateId], [Name], [Html], [FrameType]) VALUES (7, N'default', N'<div class="video">
    <video class="videoPlayer" poster="files/video.gif"></video>
</div>
', 7)
INSERT [dbo].[Template] ([TemplateId], [Name], [Html], [FrameType]) VALUES (8, N'default', N'<div class="weather">
    <table>
	    <tr>
            <td><img class="condition_code" alt=""/></td>
            <td><span class="location_city"></span> <span class="location_region"></span> <span class="location_country"></span><br />
            <span class="condition_text"></span> <span class="condition_temp"></span> <span class="units_temperature"></span></td>
        </tr>
    </table>
</div>
', 8)
INSERT [dbo].[Template] ([TemplateId], [Name], [Html], [FrameType]) VALUES (9, N'default', N'<div class="youtube">
	<div class="ytplayer"></div>
	<div class="ytshield"></div>
</div>
', 9)
INSERT [dbo].[Template] ([TemplateId], [Name], [Html], [FrameType]) VALUES (17, N'White Text, Black Background', N'<div class="memo" style="color:#FFFFFF; background-color: #000000;">
    <h1 class="subject"></h1>
    <span class="body"></span>
</div>', 2)
INSERT [dbo].[Template] ([TemplateId], [Name], [Html], [FrameType]) VALUES (18, N'Black Background', N'<iframe class="html" seamless="seamless" style="background-color: #000000;"></iframe>', 1)
INSERT [dbo].[Template] ([TemplateId], [Name], [Html], [FrameType]) VALUES (23, N'Text - Light Grey', N'<div class="clock">
    <div class="text"  style="color:#B0B0B0;font-size:25px">
		<div class="label"></div>
		<ul class="face">
			<li class="date"></li>
			<li class="time"></li>
		</ul>
	</div>
</div>', 0)
INSERT [dbo].[Template] ([TemplateId], [Name], [Html], [FrameType]) VALUES (24, N'Outlook Simplified', N'<div class="outlook">
	<div class="progress">
		<img src="files/world.gif" />
	</div>
	<div class="summary">
		<div class="mailbox"></div>
		<div class="current event"></div>
		<div class="current status"></div>
	</div>
	<div class="events">
		<table>
			<tr>
				<th class="label subject"></th>
				<th class="label starts"></th>
				<th class="label ends"></th>
				<th class="label duration"></th>
			</tr>
			<tr class="item">
				<td class="subject"></td>
				<td class="starts"></td>
				<td class="ends"></td>
				<td class="duration"></td>
			</tr>
		</table>
	</div>
	<div class="actions">
		<div class="title">Quick book</div>
		<div class="message"></div>
		<div class="controls">
			<input type="button" class="book" data-minutes="15" value="0:15" />
			<input type="button" class="book" data-minutes="30" value="0:30" />
			<input type="button" class="book" data-minutes="60" value="1:00" />
			<input type="button" class="book" />
		</div>
	</div>
</div>', 4)
INSERT [dbo].[Template] ([TemplateId], [Name], [Html], [FrameType]) VALUES (25, N'default', N'<div class="powerbi"><iframe></iframe></div>', 10)
SET IDENTITY_INSERT [dbo].[Template] OFF
