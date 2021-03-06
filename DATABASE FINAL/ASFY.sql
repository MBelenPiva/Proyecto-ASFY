USE [ASFY]
GO
/****** Object:  User [alumno]    Script Date: 19/11/2021 11:06:15 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Calendario]    Script Date: 19/11/2021 11:06:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendario](
	[Id] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Informacion] [varchar](max) NULL,
 CONSTRAINT [PK_Calendario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 19/11/2021 11:06:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Programas]    Script Date: 19/11/2021 11:06:15 ******/
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
/****** Object:  Table [dbo].[ProgramasPorUsuarios]    Script Date: 19/11/2021 11:06:15 ******/
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
/****** Object:  Table [dbo].[Rutinas]    Script Date: 19/11/2021 11:06:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutinas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[IdPrograma] [int] NULL,
	[Link] [varchar](max) NULL,
	[Descripcion] [varchar](4000) NULL,
 CONSTRAINT [PK_Rutinas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 19/11/2021 11:06:15 ******/
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
	[Direccion] [varchar](512) NULL,
	[Sexo] [varchar](50) NULL,
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

INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (1, N'Burpees', 1, N'https://www.youtube.com/watch?v=Uy2nUNX38xE', N'Para realizar el ejercicio de «burpees» se parte de una posición inicial en cuclillas (o sentadillas), se colocan las manos en el suelo y se mantiene la cabeza erguida. Después se desplazan las piernas hacia atrás con los pies juntos y se hace una flexión de pecho (también conocida como flexión de codos).')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (2, N'Sentadilla con salto ', 1, N'https://www.youtube.com/embed/IiHH0EWo8-k', N'Gottschall explica que en las sentadillas con salto, se requiere una suma aumentada de fuerza para los músculos necesarios para la propulsión, que son los cuádriceps, los de la pantorrilla y los glúteos. Esta activación acelera el cuerpo y lo separa del piso para trabajar contra la gravedad.')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (3, N'Jumping acks ', 1, N'https://www.youtube.com/embed/iSSAk4XCsRA', N'Se trata de saltar abriendo las piernas y subiendo los brazos hasta que las manos se toquen sobre la cabeza y saltar de nuevo uniendo los pies y colocando los brazos a los lados en paralelo al cuerpo.')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (4, N'Bench Runners', 1, N'https://www.youtube.com/embed/njDkWO1hPnU', N'Párate directamente frente al cajón con el pie derecho firmemente colocado en la parte superior del banco y el pie izquierdo en el suelo. Toca el cajón con el pie derecho e inmediatamente cambie de pie, tocando el cajón con el izquierdo. Esa es una repetición.')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (5, N'Mountain climbers', 1, N'https://www.youtube.com/embed/lD_gfTofg4A', N'debemos colocarnos tumbados boca abajo en el suelo y apoyar las manos con los dedos dirigidos hacia el frente, justo debajo de los hombros. Desde allí, elevamos todo el cuerpo para quedar en posición de plancha, con brazos extendidos y palmas en el suelo y puntas de los pies como segundo apoyo.')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (6, N'Laterl Shuffle taps ', 1, N'https://www.youtube.com/embed/mziPKITnPeQ', N'De pie en una posición atlética, con los pies más separados que la distancia entre las caderas, arrastra el pie un par de pasos hacia la izquierda y luego toca el suelo. Vuelve a arrastrar el pie y toca el suelo una vez que alcances el punto de partida.')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (7, N'Lateral toe taps ', 1, N'https://www.youtube.com/embed/4aeUj8df_nI', N'Lo que tienes que hacer es dar toquecitos sobre el objeto, con un pie y otro alternativamente, lo más rápido posible, soportando el peso de tu cuerpo en la pierna que queda apoyada en el suelo cada vez.')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (8, N'Rollbacks ', 1, N'https://www.youtube.com/embed/isw7MCNMUBk', N'Comienza de pie. Con un solo movimiento, siéntate en el suelo y rueda hacia atrás, llevando las caderas y los talones hacia el techo. Vuelve a poner los pies en el suelo y a ponerte de pie. Esa es una repetición.')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (9, N'El patinador ', 1, N'https://www.youtube.com/embed/mKPhNk7cE8A', N'Aterrizamos con la pierna izquierda, siempre con la rodilla flexionada, y pasamos la pierna derecha por detrás, colocando el pie por atrás de la pierna de apoyo. ')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (10, N'Zancadas ', 1, N'https://www.youtube.com/embed/1O543yIxtIY', N'La posición inicial es de pie, con las manos dispuestas en jarra, sobre la cintura, y las piernas algo separadas. Toma aire y da un paso hacia delante. Lo que hay que evitar en la medida de los posible son los balanceos.')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (11, N'Abdomiales', 2, N'https://www.youtube.com/watch?v=CwhxepX7aR8', N'Acerca el torso a las rodillas sin levantar la espalda del suelo')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (12, N'Flexiones', 2, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (13, N'Abdominales rusos', 2, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (14, N'Sentadillas', 2, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (15, N'Plancha ', 2, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (16, N'Elevacion de pelvis', 2, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (17, N'Elevacion de pelvis en cuadrupedia ', 2, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (18, N'Zancadas ', 2, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (19, N'Abdominales con giro alternado', 2, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (20, N'Sentadilla split', 2, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (21, N'Plancha ', 3, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (22, N'Sit-ups', 3, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (23, N'Burpees ', 3, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (24, N'Sentadilla ', 3, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (25, N'Sentadilla split ', 3, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (26, N'Zancadas con banco ', 3, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (27, N'Elevacion de pierna en cuadrupedia ', 3, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (28, N'Abdominales con giro alternado ', 3, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (29, N'Abdominales giro ruso ', 3, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (30, N'Jumpling jacks ', 3, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (31, N'Sentadilla con salto ', 4, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (32, N'Burpees ', 4, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (33, N'Mountain climbers', 4, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (34, N'Laterl Shuffle taps ', 4, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (35, N'Flexiones ', 4, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (36, N'Abdominales giro ruso', 4, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (37, N'
Lateral toe taps ', 4, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (38, N'Elevacion de pelvis', 4, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (39, N'Plancha ', 4, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (40, N'Zancadas ', 4, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (41, N'Jumpling jacks', 5, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (42, N'Salto en cunclillas alternado', 5, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (43, N'Mountain climbers', 5, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (44, N'Escalador ', 5, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (45, N'Zancadas ', 5, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (46, N'Plancha', 6, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (47, N'Abodminales ', 6, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (48, N'Abdomiales bicicleta ', 6, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (49, N'Sentadillas con salto ', 6, NULL, NULL)
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (50, N'Zancadas cruzadas ', 6, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Rutinas] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto], [Direccion], [Sexo]) VALUES (1, N'Cechu 123', N'Piva', N'belenpiva2@gmail.com', N'1234', CAST(N'2004-04-15' AS Date), 160, 50, NULL, N'diaz velez', N'M')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto], [Direccion], [Sexo]) VALUES (2, N'Angela', N'Park', N'angelapark@gmail.com', N'6543', CAST(N'2003-08-05' AS Date), 157, 50, N'', N'yatay 339', N'F')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto], [Direccion], [Sexo]) VALUES (3, N'Cecilia', N'Lombardi', N'cecilialombardi@gmail.com', N'9143', CAST(N'2004-03-04' AS Date), 155, 50, NULL, N'potosi', NULL)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto], [Direccion], [Sexo]) VALUES (4, N'cacho', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto], [Direccion], [Sexo]) VALUES (5, N'Maria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto], [Direccion], [Sexo]) VALUES (6, N'Maria', N'Piva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto], [Direccion], [Sexo]) VALUES (7, N'PAblo', N'Piva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto], [Direccion], [Sexo]) VALUES (8, N'Willy', N'Wonka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto], [Direccion], [Sexo]) VALUES (9, N'PAblo', N'Piva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto], [Direccion], [Sexo]) VALUES (10, N'PAblo', N'Piva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto], [Direccion], [Sexo]) VALUES (11, N'PAblo', N'Piva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto], [Direccion], [Sexo]) VALUES (12, N'PAblo', N'Piva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto], [Direccion], [Sexo]) VALUES (13, N'PAblo', N'Piva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto], [Direccion], [Sexo]) VALUES (14, N'Cacho', N'castanio', N'caca@caca.com', N'belu', CAST(N'2004-05-15' AS Date), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto], [Direccion], [Sexo]) VALUES (15, N'Maria Belen .kdjglsdg', NULL, N'belenpiva@gmail.com', NULL, CAST(N'2004-05-15' AS Date), NULL, NULL, NULL, N'diaz velez', N'Elegir')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto], [Direccion], [Sexo]) VALUES (16, N'Maria Belen ', NULL, N'belenpiva@gmail.com', NULL, CAST(N'2004-05-15' AS Date), NULL, NULL, NULL, N'diaz velez', N'Elegir')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto], [Direccion], [Sexo]) VALUES (17, N'Maria Belen  sdgaegd', NULL, N'belenpiva@gmail.com', NULL, CAST(N'2004-05-15' AS Date), NULL, NULL, NULL, N'diaz velez', N'Elegir')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellido], [Email], [Contrasena], [FechaDeNacimiento], [Altura], [Peso], [URLFoto], [Direccion], [Sexo]) VALUES (18, N'Maria Belen  sdgaegd', NULL, N'belenpiva@gmail.com', NULL, CAST(N'2004-05-15' AS Date), NULL, NULL, NULL, N'diaz velez', N'Elegir')
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
/****** Object:  StoredProcedure [dbo].[Usuarios_Insert]    Script Date: 19/11/2021 11:06:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usuarios_Insert]
	-- Add the parameters for the stored procedure here
	@Nombre		        Varchar(50), 
	@Apellido			Varchar(50),
	@Email				Varchar(50),
	@FechaDeNacimiento  datetime, 
	@Contrasena			Varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Usuarios (
		Nombre,
		Apellido,
		Email,
		FechaDeNacimiento,
		Contrasena
	)
	VALUES  (
		@Nombre,
		@Apellido,
		@Email,
		@FechaDeNacimiento, 
		@Contrasena
	)

	SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[Usuarios_Update]    Script Date: 19/11/2021 11:06:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usuarios_Update]
	-- Add the parameters for the stored procedure here
	@Id					int, 
	@Nombre		        Varchar(50), 
	@Email				Varchar(50),
	@FechaDeNacimiento  datetime, 
	@Sexo			Varchar(50),
	@Direccion		Varchar(50)
AS
BEGIN

	UPDATE Usuarios SET

		Nombre				= @Nombre,
		Email				= @Email,
		FechaDeNacimiento	= @FechaDeNacimiento,
		Sexo				= @Sexo,
		Direccion			= @Direccion

	WHERE Id = @Id
END
GO
