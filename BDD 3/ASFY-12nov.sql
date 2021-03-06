USE [master]
GO
/****** Object:  Database [ASFY]    Script Date: 12/11/2021 10:09:11 ******/
CREATE DATABASE [ASFY]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASFY', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ASFY.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASFY_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ASFY_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ASFY] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASFY].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASFY] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASFY] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASFY] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASFY] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASFY] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASFY] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ASFY] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASFY] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASFY] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASFY] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASFY] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASFY] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASFY] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASFY] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASFY] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ASFY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASFY] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASFY] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASFY] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASFY] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASFY] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASFY] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASFY] SET RECOVERY FULL 
GO
ALTER DATABASE [ASFY] SET  MULTI_USER 
GO
ALTER DATABASE [ASFY] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASFY] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASFY] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASFY] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASFY] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ASFY', N'ON'
GO
ALTER DATABASE [ASFY] SET QUERY_STORE = OFF
GO
USE [ASFY]
GO
/****** Object:  User [alumno]    Script Date: 12/11/2021 10:09:11 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 12/11/2021 10:09:12 ******/
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
/****** Object:  Table [dbo].[Programas]    Script Date: 12/11/2021 10:09:12 ******/
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
/****** Object:  Table [dbo].[ProgramasPorUsuarios]    Script Date: 12/11/2021 10:09:12 ******/
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
/****** Object:  Table [dbo].[Rutinas]    Script Date: 12/11/2021 10:09:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutinas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[IdPrograma] [int] NULL,
	[Link] [varchar](max) NULL,
	[Descripcion] [varchar](max) NULL,
 CONSTRAINT [PK_Rutinas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 12/11/2021 10:09:12 ******/
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

INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (1, N'Burpees', 1, N'https://www.youtube.com/watch?v=Uy2nUNX38xE', N'Para realizar el ejercicio de «burpees» se parte de una posición inicial en cuclillas (o sentadillas), se colocan las manos en el suelo y se mantiene la cabeza erguida. Después se desplazan las piernas hacia atrás con los pies juntos y se hace una flexión de pecho (también conocida como flexión de codos).')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (2, N'Sentadilla con salto ', 1, N'https://www.youtube.com/embed/IiHH0EWo8-k', N'Gottschall explica que en las sentadillas con salto, se requiere una suma aumentada de fuerza para los músculos necesarios para la propulsión, que son los cuádriceps, los de la pantorrilla y los glúteos. Esta activación acelera el cuerpo y lo separa del piso para trabajar contra la gravedad.')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (3, N'Jumping acks ', 1, N'https://www.youtube.com/embed/iSSAk4XCsRA', N'Se trata de saltar abriendo las piernas y subiendo los brazos hasta que las manos se toquen sobre la cabeza y saltar de nuevo uniendo los pies y colocando los brazos a los lados en paralelo al cuerpo.')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (4, N'Bench Runners', 1, N'https://www.youtube.com/embed/njDkWO1hPnU', N'Párate directamente frente al cajón con el pie derecho firmemente colocado en la parte superior del banco y el pie izquierdo en el suelo. Toca el cajón con el pie derecho e inmediatamente cambie de pie, tocando el cajón con el izquierdo. Esa es una repetición.')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (5, N'Mountain climbers', 1, N'https://www.youtube.com/embed/lD_gfTofg4A', N'debemos colocarnos tumbados boca abajo en el suelo y apoyar las manos con los dedos dirigidos hacia el frente, justo debajo de los hombros. Desde allí, elevamos todo el cuerpo para quedar en posición de plancha, con brazos extendidos y palmas en el suelo y puntas de los pies como segundo apoyo.
')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (6, N'Laterl Shuffle taps ', 1, N'https://www.youtube.com/embed/mziPKITnPeQ', N'De pie en una posición atlética, con los pies más separados que la distancia entre las caderas, arrastra el pie un par de pasos hacia la izquierda y luego toca el suelo. Vuelve a arrastrar el pie y toca el suelo una vez que alcances el punto de partida.')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (7, N'Lateral toe taps ', 1, N'https://www.youtube.com/embed/4aeUj8df_nI', N'Lo que tienes que hacer es dar toquecitos sobre el objeto, con un pie y otro alternativamente, lo más rápido posible, soportando el peso de tu cuerpo en la pierna que queda apoyada en el suelo cada vez.')
INSERT [dbo].[Rutinas] ([Id], [Nombre], [IdPrograma], [Link], [Descripcion]) VALUES (8, N'Rollbacks ', 1, N'https://www.youtube.com/embed/isw7MCNMUBk', N' Comienza de pie. Con un solo movimiento, siéntate en el suelo y rueda hacia atrás, llevando las caderas y los talones hacia el techo. Vuelve a poner los pies en el suelo y a ponerte de pie. Esa es una repetición.')
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
