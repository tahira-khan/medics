USE [medical]
GO
/****** Object:  Table [dbo].[appointment]    Script Date: 11/5/2021 2:16:11 AM ******/
---
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointment](
	[appid] [int] IDENTITY(1,1) NOT NULL,
	[pname] [varchar](50) NULL,
	[email] [varchar](220) NULL,
	[contact] [bigint] NULL,
	[appdate] [date] NULL,
	[dept] [varchar](50) NULL,
	[doctor] [varchar](60) NULL,
	[msg] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[appid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blog]    Script Date: 11/5/2021 2:16:11 AM ******/
SET ANSI_NULLS ON
GO
--
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog](
	[blogid] [int] IDENTITY(1,1) NOT NULL,
	[blogtitle] [varchar](max) NULL,
	[blogdescription] [varchar](max) NULL,
	[blogdate] [date] NULL,
	[blogauthor] [varchar](50) NULL,
	[cat_id] [int] NULL,
	[blogimg] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[blogid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 11/5/2021 2:16:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 11/5/2021 2:16:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[guestname] [varchar](500) NULL,
	[email] [varchar](500) NULL,
	[cdate] [date] NULL,
	[comments] [varchar](max) NULL,
	[blogid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactus]    Script Date: 11/5/2021 2:16:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactus](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[guestname] [varchar](500) NULL,
	[email] [varchar](500) NULL,
	[phone] [bigint] NULL,
	[msg] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[register]    Script Date: 11/5/2021 2:16:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[register](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](50) NULL,
	[lname] [varchar](50) NULL,
	[contact] [bigint] NULL,
	[dob] [date] NULL,
	[email] [varchar](250) NULL,
	[username] [varchar](100) NULL,
	[pass] [varchar](100) NULL,
	[user_img] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[appointment] ON 

INSERT [dbo].[appointment] ([appid], [pname], [email], [contact], [appdate], [dept], [doctor], [msg]) VALUES (1, N'smith', N'smith@gmail.com', 56757867, CAST(N'2021-09-05' AS Date), N'Diagnostic', N'Diagnostic', N'fsdfsfs')
SET IDENTITY_INSERT [dbo].[appointment] OFF
GO
SET IDENTITY_INSERT [dbo].[blog] ON 

INSERT [dbo].[blog] ([blogid], [blogtitle], [blogdescription], [blogdate], [blogauthor], [cat_id], [blogimg]) VALUES (1, N'US Sending Millions of COVID-19 Vaccine Doses to Pakistan', N'WASHINGTON - As Pakistan deals with a surge in COVID-19 cases due to the delta variant, the United States will begin moving 4 million doses of the Pfizer coronavirus vaccine to the country on Thursday, a White House spokesperson told VOA.  The 4,149,990 doses, sent through COVAX, the global vaccine-sharing initiative co-led by Gavi (the Vaccine Alliance), the WHO (World Health Organization) and CEPI (Coalition for Epidemic Preparedness), are in addition to the more than 9.2 million doses of Moderna and Pfizer vaccine already donated to Pakistan since June.  ', CAST(N'2021-04-01' AS Date), N'James Paterson', 2, N'coronavirus-1.jpg')
INSERT [dbo].[blog] ([blogid], [blogtitle], [blogdescription], [blogdate], [blogauthor], [cat_id], [blogimg]) VALUES (2, N'The Messy Truth About Obsessive-Compulsive Disorder', N'One year included three psychiatric hospitals; intensive outpatient therapy; two months at the OCD Institute at McLean Hospital in Boston; being kicked out of said OCD Institute; and living on the streets of Boston in the middle of winter with little money, no transportation, no job and severe OCD and separation anxiety.  It took hitting rock bottom to get the help I needed. After eight scary therapeutic months, I was “reborn” and moved to Los Angeles a healthy, happy and thriving member of society. I finally understand the point of the therapy my loved ones had desperately been trying to get me into.', CAST(N'2021-06-06' AS Date), N'Dan Brown', 2, N'OCD-text.jpg')
INSERT [dbo].[blog] ([blogid], [blogtitle], [blogdescription], [blogdate], [blogauthor], [cat_id], [blogimg]) VALUES (3, N'Teleradiology Benefits', N'Radiology is a diverse and complex discipline, one that can be challenging, and one that is advancing rapidly. As examination volumes continue to increase, there is more demand for teleradiology: an advanced system that transmits digitised medical patient images from one location to another. Vision XRAY is at the forefront of teleradiology Australia having begun offering the service in 2001. In this post, we’ll look more closely at the benefits of teleradiology and Vision Xray’s role as a trusted teleradiology Reporting Service Australia wide.  Teleradiology Benefits Teleradiology Reporting is an effective tool in speeding up the diagnosis and treatment of many conditions. Rather than the radiologist needing to be physically present, teleradiology facilitates clearer communication between the doctors, surgeons, radiologists and hospitals. Other benefits include:  Faster Diagnosis – medical imaging results can be viewed much quicker, allowing doctors to treat patients more efficiently. Improved Consultations – radiologists, doctors and surgeons can collaborate to determine the best treatment plan and second opinions can be easily sought. Better Rural and Regional Care– teleradiology enables rural and regional hospitals to receive quick and accurate interpretation of medical imaging. Cost-Effective – as remote radiology reporting services eliminate the need for radiologists to be physically present, there’s less need for permanent staff. Weekends, holidays, after-hours and emergencies are also easily covered.', CAST(N'2021-11-04' AS Date), N'Sarah Paulin', 4, N'xray.jpg')
SET IDENTITY_INSERT [dbo].[blog] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([cat_id], [category_name]) VALUES (1, N'Alumni')
INSERT [dbo].[category] ([cat_id], [category_name]) VALUES (2, N'psychology')
INSERT [dbo].[category] ([cat_id], [category_name]) VALUES (3, N'Sonogram')
INSERT [dbo].[category] ([cat_id], [category_name]) VALUES (4, N'X-Ray')
INSERT [dbo].[category] ([cat_id], [category_name]) VALUES (5, N'Dental')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([cid], [guestname], [email], [cdate], [comments], [blogid]) VALUES (1, N'smith jonathan', N'smith@gmail.com', CAST(N'2021-11-04' AS Date), N'fhfghfh', 1)
INSERT [dbo].[comments] ([cid], [guestname], [email], [cdate], [comments], [blogid]) VALUES (2, N'dfgdgdg', N'dgfdgdgdgdg@hjlasjd.com', CAST(N'2021-11-04' AS Date), N'holllaaaa', 1)
INSERT [dbo].[comments] ([cid], [guestname], [email], [cdate], [comments], [blogid]) VALUES (3, N'peter watson', N'peter@gmail.com', CAST(N'2021-11-04' AS Date), N'hello world', 2)
INSERT [dbo].[comments] ([cid], [guestname], [email], [cdate], [comments], [blogid]) VALUES (4, N'smith jonathan', N'smith@gmail.com', CAST(N'2021-11-04' AS Date), N'good job keep it up', 2)
SET IDENTITY_INSERT [dbo].[comments] OFF
GO
SET IDENTITY_INSERT [dbo].[contactus] ON 

INSERT [dbo].[contactus] ([cid], [guestname], [email], [phone], [msg]) VALUES (1, N'george', NULL, 6456456757, N'I want to know the operation theater timings.')
SET IDENTITY_INSERT [dbo].[contactus] OFF
GO
SET IDENTITY_INSERT [dbo].[register] ON 

INSERT [dbo].[register] ([userid], [fname], [lname], [contact], [dob], [email], [username], [pass], [user_img]) VALUES (1, N'smith', N'john', 7777777, CAST(N'1996-05-06' AS Date), N'smith@gmail.com', N'smith', N'123', N'ceo.jpg')
INSERT [dbo].[register] ([userid], [fname], [lname], [contact], [dob], [email], [username], [pass], [user_img]) VALUES (2, N'peter', N'paul', 8956785678, CAST(N'2021-08-04' AS Date), N'peter@gmail.com', N'peter', N'123', NULL)
INSERT [dbo].[register] ([userid], [fname], [lname], [contact], [dob], [email], [username], [pass], [user_img]) VALUES (3, N'susan', N'taylor', 890707, CAST(N'2021-08-01' AS Date), N'taylor@gmail.com', N'susan', N'123', N'pexels-josh-kobayashi-5131450.jpg')
INSERT [dbo].[register] ([userid], [fname], [lname], [contact], [dob], [email], [username], [pass], [user_img]) VALUES (1002, N'zarish', N'francis', 4575678, CAST(N'2021-08-17' AS Date), N'zarish@gmail.com', N'zarish', N'123', N'abc.jfif')
INSERT [dbo].[register] ([userid], [fname], [lname], [contact], [dob], [email], [username], [pass], [user_img]) VALUES (1003, N'asim', N'khan', 56768678, CAST(N'2020-03-04' AS Date), N'asim@hotmail.com', N'asim', N'123', N'abc.jfif')
INSERT [dbo].[register] ([userid], [fname], [lname], [contact], [dob], [email], [username], [pass], [user_img]) VALUES (1004, N'asim', N'khan', 4564576567, CAST(N'2020-03-04' AS Date), N'asim@hotmail.com', N'asim', N'123', N'abc')
SET IDENTITY_INSERT [dbo].[register] OFF
GO
ALTER TABLE [dbo].[blog]  WITH CHECK ADD FOREIGN KEY([cat_id])
REFERENCES [dbo].[category] ([cat_id])
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD FOREIGN KEY([blogid])
REFERENCES [dbo].[blog] ([blogid])
GO
