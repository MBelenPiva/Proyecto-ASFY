
GO
CREATE TABLE [dbo].[Categorias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programas]    Script Date: 16/7/2021 12:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](1024) NULL,
	[IdCategoria] [int] NULL,
 CONSTRAINT [PK_Programas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramasPorUsuarios]    Script Date: 16/7/2021 12:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramasPorUsuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPrograma] [int] NULL,
	[IdUsuario] [int] NULL,
	[Fecha] [date] NULL,
 CONSTRAINT [PK_ProgramasPorUsuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rutinas]    Script Date: 16/7/2021 12:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutinas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[IdPrograma] [int] NULL,
	[Link] [varchar](max) NULL,
 CONSTRAINT [PK_Rutinas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 16/7/2021 12:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Contrasena] [varchar](50) NULL,
	[FechaDeNacimiento] [date] NULL,
	[Altura] [int] NULL,
	[Peso] [int] NULL,
	[URLFoto] [varchar](512) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (1, N'Fuerza')
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (2, N'Cardio')
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (3, N'Fuerza y Cardio')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Programas] ON 

INSERT [dbo].[Programas] ([Id], [Nombre], [Descripcion], [IdCategoria]) VALUES (1, N'Programa de cardio para perder peso', N'Este programa es para que pueda perder peso a partir de rutinas de cardio', 2)
INSERT [dbo].[Programas] ([Id], [Nombre], [Descripcion], [IdCategoria]) VALUES (2, N'Programa de fuerza para ganar masa muscular ', N'Este programa es para que puede ganar masa muscular a partir de rutinas de fuerza ', 1)
INSERT [dbo].[Programas] ([Id], [Nombre], [Descripcion], [IdCategoria]) VALUES (3, N'Programa de cardio y fuerza para perder peso', N'Este es un programa convinado entre fuerza y cardio que le permitira realizar rutinas de ambos tipos y ganar masa muscular', 3)
INSERT [dbo].[Programas] ([Id], [Nombre], [Descripcion], [IdCategoria]) VALUES (4, N'Programa de fuerza y cardio para perder peso', N'Este es un programa convinado que le permitira trabajar rutinas cardio y fuerza y aun asi perder peso', 3)
INSERT [dbo].[Programas] ([Id], [Nombre], [Descripcion], [IdCategoria]) VALUES (5, N'Programa de cardio rapido para perder peso', N'Este es un programa de cardio que le permitira perder peso de forma eficaz y rapida ', 2)
INSERT [dbo].[Programas] ([Id], [Nombre], [Descripcion], [IdCategoria]) VALUES (6, N'Programa de fuerza rapido para ganar peso ', N'Este es un programa de fuerza que le permitira ganar masa muscular de forma rapida y precisa ', 1)
SET IDENTITY_INSERT [dbo].[Programas] OFF
GO
SET IDENTITY_INSERT [dbo].[ProgramasPorUsuarios] ON 

INSERT [dbo].[ProgramasPorUsuarios] ([Id], [IdPrograma], [IdUsuario], [Fecha]) VALUES (1, 1, 2, CAST(N'2021-05-05' AS Date))
INSERT [dbo].[ProgramasPorUsuarios] ([Id], [IdPrograma], [IdUsuario], [Fecha]) VALUES (2, 5, 1, CAST(N'2021-04-14' AS Date))
INSERT [dbo].[ProgramasPorUsuarios] ([Id], [IdPrograma], [IdUsuario], [Fecha]) VALUES (3, 3, 3, CAST(N'2021-05-06' AS Date))
SET IDENTITY_INSERT [dbo].[ProgramasPorUsuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Rutinas] ON 

INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (1, N'Burpees', 1, N'https://www.youtube.com/embed/UM1r9Mz888s')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (2, N'Sentadilla con salto ', 1, N'https://www.youtube.com/embed/IiHH0EWo8-k')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (3, N'Jumping acks ', 1, N'https://www.youtube.com/embed/iSSAk4XCsRA')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (4, N'Bench Runners', 1, N'https://www.youtube.com/embed/njDkWO1hPnU')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (5, N'Mountain climbers', 1, N'https://www.youtube.com/embed/lD_gfTofg4A')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (6, N'Laterl Shuffle taps ', 1, N'https://www.youtube.com/embed/mziPKITnPeQ')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (7, N'Lateral toe taps ', 1, N'https://www.youtube.com/embed/4aeUj8df_nI')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (8, N'Rollbacks ', 1, N'https://www.youtube.com/embed/isw7MCNMUBk')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (9, N'El patinador ', 1, N'https://www.youtube.com/embed/mKPhNk7cE8A')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (10, N'Zancadas ', 1, N'https://www.youtube.com/embed/1O543yIxtIY')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (11, N'Abdomiales', 2, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (12, N'Flexiones', 2, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (13, N'Abdominales rusos', 2, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (14, N'Sentadillas', 2, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (15, N'Plancha ', 2, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (16, N'Elevacion de pelvis', 2, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (17, N'Elevacion de pelvis en cuadrupedia ', 2, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (18, N'Zancadas ', 2, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (19, N'Abdominales con giro alternado', 2, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (20, N'Sentadilla split', 2, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (21, N'Plancha ', 3, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (22, N'Sit-ups', 3, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (23, N'Burpees ', 3, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (24, N'Sentadilla ', 3, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (25, N'Sentadilla split ', 3, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (26, N'Zancadas con banco ', 3, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (27, N'Elevacion de pierna en cuadrupedia ', 3, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (28, N'Abdominales con giro alternado ', 3, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (29, N'Abdominales giro ruso ', 3, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (30, N'Jumpling jacks ', 3, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (31, N'Sentadilla con salto ', 4, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (32, N'Burpees ', 4, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (33, N'Mountain climbers', 4, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (34, N'Laterl Shuffle taps ', 4, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (35, N'Flexiones ', 4, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (36, N'Abdominales giro ruso', 4, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (37, N'
Lateral toe taps ', 4, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (38, N'Elevacion de pelvis', 4, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (39, N'Plancha ', 4, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (40, N'Zancadas ', 4, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (41, N'Jumpling jacks', 5, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (42, N'Salto en cunclillas alternado', 5, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (43, N'Mountain climbers', 5, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (44, N'Escalador ', 5, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (45, N'Zancadas ', 5, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (46, N'Plancha', 6, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (47, N'Abodminales ', 6, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (48, N'Abdomiales bicicleta ', 6, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (49, N'Sentadillas con salto ', 6, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link]) VALUES (50, N'Zancadas cruzadas ', 6, NULL)
SET IDENTITY_INSERT [dbo].[Rutinas] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto]) VALUES (1, N'Maria Belen ', N'Piva', N'belenpiva@gmail.com', N'1234', CAST(N'2004-05-15' AS Date), 160, 50, NULL)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto]) VALUES (2, N'Angela', N'Park', N'angelapark@gmail.com', N'6543', CAST(N'2003-08-05' AS Date), 157, 50, NULL)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto]) VALUES (3, N'Cecilia', N'Lombardi', N'cecilialombardi@gmail.com', N'9143', CAST(N'2004-03-04' AS Date), 155, 50, NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Programas]  WITH CHECK ADD  CONSTRAINT [FK_Programas_Categorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([Id])
GO
ALTER TABLE [dbo].[Programas] CHECK CONSTRAINT [FK_Programas_Categorias]
GO
ALTER TABLE [dbo].[ProgramasPorUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_ProgramasPorUsuarios_Programas] FOREIGN KEY([IdPrograma])
REFERENCES [dbo].[Programas] ([Id])
GO
ALTER TABLE [dbo].[ProgramasPorUsuarios] CHECK CONSTRAINT [FK_ProgramasPorUsuarios_Programas]
GO
ALTER TABLE [dbo].[ProgramasPorUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_ProgramasPorUsuarios_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[ProgramasPorUsuarios] CHECK CONSTRAINT [FK_ProgramasPorUsuarios_Usuarios]
GO
ALTER TABLE [dbo].[Rutinas]  WITH CHECK ADD  CONSTRAINT [FK_Rutinas_Programas] FOREIGN KEY([IdPrograma])
REFERENCES [dbo].[Programas] ([Id])
GO
ALTER TABLE [dbo].[Rutinas] CHECK CONSTRAINT [FK_Rutinas_Programas]
GO
USE [master]
GO
ALTER DATABASE [ASFY] SET  READ_WRITE 
GO
