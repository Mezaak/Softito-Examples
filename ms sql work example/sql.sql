USE [master]
GO
/****** Object:  Database [SoftProject]    Script Date: 10.02.2025 20:58:23 ******/
CREATE DATABASE [SoftProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SoftProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SoftProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SoftProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SoftProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SoftProject] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SoftProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SoftProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SoftProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SoftProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SoftProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SoftProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [SoftProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SoftProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SoftProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SoftProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SoftProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SoftProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SoftProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SoftProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SoftProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SoftProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SoftProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SoftProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SoftProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SoftProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SoftProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SoftProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SoftProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SoftProject] SET RECOVERY FULL 
GO
ALTER DATABASE [SoftProject] SET  MULTI_USER 
GO
ALTER DATABASE [SoftProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SoftProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SoftProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SoftProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SoftProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SoftProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SoftProject', N'ON'
GO
ALTER DATABASE [SoftProject] SET QUERY_STORE = ON
GO
ALTER DATABASE [SoftProject] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SoftProject]
GO
/****** Object:  Table [dbo].[BookCategory]    Script Date: 10.02.2025 20:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCategory](
	[BookCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[BookCategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BookCategory] PRIMARY KEY CLUSTERED 
(
	[BookCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 10.02.2025 20:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[BookName] [nchar](50) NOT NULL,
	[BookCategoryId] [int] NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookTransactions]    Script Date: 10.02.2025 20:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookTransactions](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[PersonnelId] [int] NOT NULL,
	[TransactionType] [nvarchar](30) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BookTransactions] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowedBooks]    Script Date: 10.02.2025 20:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowedBooks](
	[BorrowId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[BorrowedDate] [date] NULL,
	[ReturnedDate] [date] NULL,
 CONSTRAINT [PK_BorrowedBooks] PRIMARY KEY CLUSTERED 
(
	[BorrowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 10.02.2025 20:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personnel]    Script Date: 10.02.2025 20:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personnel](
	[PersonnelId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
 CONSTRAINT [PK_Personnel] PRIMARY KEY CLUSTERED 
(
	[PersonnelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BookCategory] ON 

INSERT [dbo].[BookCategory] ([BookCategoryId], [BookCategoryName]) VALUES (1, N'Science')
INSERT [dbo].[BookCategory] ([BookCategoryId], [BookCategoryName]) VALUES (2, N'Education')
INSERT [dbo].[BookCategory] ([BookCategoryId], [BookCategoryName]) VALUES (3, N'Fiction')
INSERT [dbo].[BookCategory] ([BookCategoryId], [BookCategoryName]) VALUES (4, N'Philosopy')
INSERT [dbo].[BookCategory] ([BookCategoryId], [BookCategoryName]) VALUES (5, N'Space')
INSERT [dbo].[BookCategory] ([BookCategoryId], [BookCategoryName]) VALUES (6, N'Poet')
INSERT [dbo].[BookCategory] ([BookCategoryId], [BookCategoryName]) VALUES (7, N'Economy')
INSERT [dbo].[BookCategory] ([BookCategoryId], [BookCategoryName]) VALUES (8, N'Businnes')
INSERT [dbo].[BookCategory] ([BookCategoryId], [BookCategoryName]) VALUES (9, N'Horror')
INSERT [dbo].[BookCategory] ([BookCategoryId], [BookCategoryName]) VALUES (10, N'Law')
INSERT [dbo].[BookCategory] ([BookCategoryId], [BookCategoryName]) VALUES (11, N'History')
SET IDENTITY_INSERT [dbo].[BookCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([BookId], [BookName], [BookCategoryId], [Stock]) VALUES (1, N'Bilim101                                          ', 1, 3)
INSERT [dbo].[Books] ([BookId], [BookName], [BookCategoryId], [Stock]) VALUES (2, N'History101                                        ', 11, 5)
INSERT [dbo].[Books] ([BookId], [BookName], [BookCategoryId], [Stock]) VALUES (3, N'Economy101                                        ', 7, 1)
INSERT [dbo].[Books] ([BookId], [BookName], [BookCategoryId], [Stock]) VALUES (4, N'SilentKiller                                      ', 9, 2)
INSERT [dbo].[Books] ([BookId], [BookName], [BookCategoryId], [Stock]) VALUES (5, N'SosyalBilgiler                                    ', 2, 10)
INSERT [dbo].[Books] ([BookId], [BookName], [BookCategoryId], [Stock]) VALUES (6, N'Monte Kristo Kontu                                ', 3, 6)
INSERT [dbo].[Books] ([BookId], [BookName], [BookCategoryId], [Stock]) VALUES (7, N'Tractacus Logico                                  ', 4, 1)
INSERT [dbo].[Books] ([BookId], [BookName], [BookCategoryId], [Stock]) VALUES (8, N'Interstellar                                      ', 5, 17)
INSERT [dbo].[Books] ([BookId], [BookName], [BookCategoryId], [Stock]) VALUES (9, N'Çile                                              ', 6, 5)
INSERT [dbo].[Books] ([BookId], [BookName], [BookCategoryId], [Stock]) VALUES (10, N'Zengin Baba Fakir Baba                            ', 8, 1)
INSERT [dbo].[Books] ([BookId], [BookName], [BookCategoryId], [Stock]) VALUES (11, N'CMK Temel Kavramlar                               ', 10, 2)
INSERT [dbo].[Books] ([BookId], [BookName], [BookCategoryId], [Stock]) VALUES (12, N'Cumhuriyet Tarihi                                 ', 11, 23)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[BookTransactions] ON 

INSERT [dbo].[BookTransactions] ([TransactionId], [BookId], [PersonnelId], [TransactionType], [TransactionDate]) VALUES (1, 1, 1, N'Borrow', CAST(N'2025-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[BookTransactions] ([TransactionId], [BookId], [PersonnelId], [TransactionType], [TransactionDate]) VALUES (2, 2, 2, N'Borrow', CAST(N'2025-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[BookTransactions] ([TransactionId], [BookId], [PersonnelId], [TransactionType], [TransactionDate]) VALUES (3, 3, 3, N'Borrow', CAST(N'2025-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[BookTransactions] ([TransactionId], [BookId], [PersonnelId], [TransactionType], [TransactionDate]) VALUES (4, 4, 4, N'Borrow', CAST(N'2025-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[BookTransactions] ([TransactionId], [BookId], [PersonnelId], [TransactionType], [TransactionDate]) VALUES (5, 1, 1, N'Return', CAST(N'2025-02-15T00:00:00.000' AS DateTime))
INSERT [dbo].[BookTransactions] ([TransactionId], [BookId], [PersonnelId], [TransactionType], [TransactionDate]) VALUES (6, 2, 2, N'Return', CAST(N'2025-02-17T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[BookTransactions] OFF
GO
SET IDENTITY_INSERT [dbo].[BorrowedBooks] ON 

INSERT [dbo].[BorrowedBooks] ([BorrowId], [MemberId], [BookId], [BorrowedDate], [ReturnedDate]) VALUES (1, 1, 1, CAST(N'2025-02-01' AS Date), CAST(N'2025-02-15' AS Date))
INSERT [dbo].[BorrowedBooks] ([BorrowId], [MemberId], [BookId], [BorrowedDate], [ReturnedDate]) VALUES (2, 2, 2, CAST(N'2025-02-03' AS Date), CAST(N'2025-02-17' AS Date))
INSERT [dbo].[BorrowedBooks] ([BorrowId], [MemberId], [BookId], [BorrowedDate], [ReturnedDate]) VALUES (3, 3, 3, CAST(N'2025-02-05' AS Date), CAST(N'2025-02-19' AS Date))
INSERT [dbo].[BorrowedBooks] ([BorrowId], [MemberId], [BookId], [BorrowedDate], [ReturnedDate]) VALUES (4, 4, 4, CAST(N'2025-02-07' AS Date), CAST(N'2025-02-21' AS Date))
SET IDENTITY_INSERT [dbo].[BorrowedBooks] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([MemberId], [FirstName], [LastName], [Email], [PhoneNumber]) VALUES (1, N'Hamdullah', N'Güven', N'hamdguven@gmail.com', 53223422)
INSERT [dbo].[Members] ([MemberId], [FirstName], [LastName], [Email], [PhoneNumber]) VALUES (2, N'Abdullah', N'Kuzey', N'abdkuzey@gmail.com', 53222266)
INSERT [dbo].[Members] ([MemberId], [FirstName], [LastName], [Email], [PhoneNumber]) VALUES (3, N'Nurullah', N'Güney', N'nurguney@gmail.com', 53222266)
INSERT [dbo].[Members] ([MemberId], [FirstName], [LastName], [Email], [PhoneNumber]) VALUES (4, N'Samed', N'Kurtulmuş', N'kurtulmus_samed@gmail.com', 53222266)
INSERT [dbo].[Members] ([MemberId], [FirstName], [LastName], [Email], [PhoneNumber]) VALUES (5, N'Abdulrezzak', N'Taşıyan', N'abdultasiyan@gmail.com', 53222266)
INSERT [dbo].[Members] ([MemberId], [FirstName], [LastName], [Email], [PhoneNumber]) VALUES (6, N'İsa', N'Yürüyen', N'isayurur@gmail.com', 53222266)
INSERT [dbo].[Members] ([MemberId], [FirstName], [LastName], [Email], [PhoneNumber]) VALUES (7, N'Deniz', N'Durmuş', N'denizdurmus@gmail.com', 53222266)
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[Personnel] ON 

INSERT [dbo].[Personnel] ([PersonnelId], [FirstName], [LastName], [Email], [PhoneNumber]) VALUES (1, N'Ahmet', N'Demir', N'ahmetdemir@gmail.com', 53322266)
INSERT [dbo].[Personnel] ([PersonnelId], [FirstName], [LastName], [Email], [PhoneNumber]) VALUES (2, N'Mehmet', N'Seyir', N'mehmetseyir@gmail.com', 53222266)
INSERT [dbo].[Personnel] ([PersonnelId], [FirstName], [LastName], [Email], [PhoneNumber]) VALUES (3, N'Faruk', N'Korkmaz', N'farukkorkmaz@gmail.com', 53222266)
INSERT [dbo].[Personnel] ([PersonnelId], [FirstName], [LastName], [Email], [PhoneNumber]) VALUES (4, N'Nurettin', N'Bayrak', N'nurettinbayrak@gmail.com', 53222266)
INSERT [dbo].[Personnel] ([PersonnelId], [FirstName], [LastName], [Email], [PhoneNumber]) VALUES (5, N'Süleyman', N'Toprak', N'suleymantoprak@gmail.com', 53222266)
SET IDENTITY_INSERT [dbo].[Personnel] OFF
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_BookCategory] FOREIGN KEY([BookCategoryId])
REFERENCES [dbo].[BookCategory] ([BookCategoryId])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_BookCategory]
GO
ALTER TABLE [dbo].[BookTransactions]  WITH CHECK ADD  CONSTRAINT [FK_BookTransactions_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
GO
ALTER TABLE [dbo].[BookTransactions] CHECK CONSTRAINT [FK_BookTransactions_Books]
GO
ALTER TABLE [dbo].[BookTransactions]  WITH CHECK ADD  CONSTRAINT [FK_BookTransactions_Personnel] FOREIGN KEY([PersonnelId])
REFERENCES [dbo].[Personnel] ([PersonnelId])
GO
ALTER TABLE [dbo].[BookTransactions] CHECK CONSTRAINT [FK_BookTransactions_Personnel]
GO
ALTER TABLE [dbo].[BorrowedBooks]  WITH CHECK ADD  CONSTRAINT [FK_BorrowedBooks_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
GO
ALTER TABLE [dbo].[BorrowedBooks] CHECK CONSTRAINT [FK_BorrowedBooks_Books]
GO
ALTER TABLE [dbo].[BorrowedBooks]  WITH CHECK ADD  CONSTRAINT [FK_BorrowedBooks_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[BorrowedBooks] CHECK CONSTRAINT [FK_BorrowedBooks_Members]
GO
USE [master]
GO
ALTER DATABASE [SoftProject] SET  READ_WRITE 
GO
