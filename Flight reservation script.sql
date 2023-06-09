USE [master]
GO
/****** Object:  Database [flight_reservation]    Script Date: 30-May-22 11:14:27 PM ******/
CREATE DATABASE [flight_reservation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'flight_reservation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\flight_reservation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'flight_reservation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\flight_reservation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [flight_reservation] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [flight_reservation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [flight_reservation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [flight_reservation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [flight_reservation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [flight_reservation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [flight_reservation] SET ARITHABORT OFF 
GO
ALTER DATABASE [flight_reservation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [flight_reservation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [flight_reservation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [flight_reservation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [flight_reservation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [flight_reservation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [flight_reservation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [flight_reservation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [flight_reservation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [flight_reservation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [flight_reservation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [flight_reservation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [flight_reservation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [flight_reservation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [flight_reservation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [flight_reservation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [flight_reservation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [flight_reservation] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [flight_reservation] SET  MULTI_USER 
GO
ALTER DATABASE [flight_reservation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [flight_reservation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [flight_reservation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [flight_reservation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [flight_reservation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [flight_reservation] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [flight_reservation] SET QUERY_STORE = OFF
GO
USE [flight_reservation]
GO
/****** Object:  Table [dbo].[aircraft_seats]    Script Date: 30-May-22 11:14:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aircraft_seats](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aircraft_id] [int] NULL,
	[travel_class_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aircrafts]    Script Date: 30-May-22 11:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aircrafts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model_number] [varchar](50) NOT NULL,
	[capacity] [int] NOT NULL,
	[manufacturer_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[airports]    Script Date: 30-May-22 11:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[airports](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[city_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booked_ticket]    Script Date: 30-May-22 11:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booked_ticket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[booked_date] [datetime] NOT NULL,
	[discount_id] [int] NULL,
	[charge_id] [int] NULL,
	[customer_id] [int] NULL,
	[seat_price_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[charges]    Script Date: 30-May-22 11:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[charges](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[amount_charged] [decimal](2, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 30-May-22 11:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[country_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[countries]    Script Date: 30-May-22 11:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 30-May-22 11:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[phone_number] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[city_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discounts]    Script Date: 30-May-22 11:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discounts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[discount_amount] [decimal](2, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flight_schedules]    Script Date: 30-May-22 11:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flight_schedules](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[departure_time] [datetime] NOT NULL,
	[arrival_time] [datetime] NOT NULL,
	[departure_airport_id] [int] NULL,
	[destination_airport] [int] NULL,
	[aircraft_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manufacturers]    Script Date: 30-May-22 11:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manufacturers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[manufacturer_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seat_prices]    Script Date: 30-May-22 11:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seat_prices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[flight_id] [int] NULL,
	[aircraft_seat_id] [int] NULL,
	[price] [decimal](4, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[travel_class]    Script Date: 30-May-22 11:14:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[travel_class](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[aircraft_seats] ON 

INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (1, 1, 1)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (2, 2, 1)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (3, 3, 2)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (4, 4, 2)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (5, 5, 3)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (6, 5, 3)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (8, 7, 3)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (9, 7, 3)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (10, 7, 3)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (11, 8, 1)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (12, 8, 1)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (13, 8, 1)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (14, 8, 1)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (15, 8, 1)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (16, 8, 1)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (17, 8, 1)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (18, 8, 1)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (19, 8, 2)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (20, 8, 2)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (21, 8, 2)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (22, 8, 2)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (23, 8, 2)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (24, 8, 2)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (26, 8, 2)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (27, 8, 2)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (28, 8, 1)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (29, 8, 1)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (30, 8, 1)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (31, 8, 1)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (32, 8, 3)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (33, 8, 3)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (34, 8, 3)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (35, 8, 3)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (36, 8, 3)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (37, 8, 3)
INSERT [dbo].[aircraft_seats] ([id], [aircraft_id], [travel_class_id]) VALUES (38, 8, 3)
SET IDENTITY_INSERT [dbo].[aircraft_seats] OFF
GO
SET IDENTITY_INSERT [dbo].[aircrafts] ON 

INSERT [dbo].[aircrafts] ([id], [model_number], [capacity], [manufacturer_id]) VALUES (1, N'A320-200', 450, 1)
INSERT [dbo].[aircrafts] ([id], [model_number], [capacity], [manufacturer_id]) VALUES (2, N'B111-178', 850, 1)
INSERT [dbo].[aircrafts] ([id], [model_number], [capacity], [manufacturer_id]) VALUES (3, N'B737-800', 550, 2)
INSERT [dbo].[aircrafts] ([id], [model_number], [capacity], [manufacturer_id]) VALUES (4, N'C737-333', 300, 2)
INSERT [dbo].[aircrafts] ([id], [model_number], [capacity], [manufacturer_id]) VALUES (5, N'D789-800', 650, 3)
INSERT [dbo].[aircrafts] ([id], [model_number], [capacity], [manufacturer_id]) VALUES (7, N'D879-700', 250, 3)
INSERT [dbo].[aircrafts] ([id], [model_number], [capacity], [manufacturer_id]) VALUES (8, N'E420-69', 420, 3)
SET IDENTITY_INSERT [dbo].[aircrafts] OFF
GO
SET IDENTITY_INSERT [dbo].[airports] ON 

INSERT [dbo].[airports] ([id], [name], [city_id]) VALUES (1, N'Sarajevo Airport', 1)
INSERT [dbo].[airports] ([id], [name], [city_id]) VALUES (2, N'Mostar Airport', 2)
INSERT [dbo].[airports] ([id], [name], [city_id]) VALUES (3, N'Podgorica Airport', 3)
INSERT [dbo].[airports] ([id], [name], [city_id]) VALUES (4, N'Bar Airport', 4)
INSERT [dbo].[airports] ([id], [name], [city_id]) VALUES (5, N'Beograd Airport', 5)
INSERT [dbo].[airports] ([id], [name], [city_id]) VALUES (6, N'Novi Sad Airport', 6)
INSERT [dbo].[airports] ([id], [name], [city_id]) VALUES (7, N'Zagreb Airport', 7)
INSERT [dbo].[airports] ([id], [name], [city_id]) VALUES (8, N'Split Airport', 8)
INSERT [dbo].[airports] ([id], [name], [city_id]) VALUES (9, N'Munich Airport', 9)
INSERT [dbo].[airports] ([id], [name], [city_id]) VALUES (10, N'Berlin Airport', 10)
INSERT [dbo].[airports] ([id], [name], [city_id]) VALUES (11, N'Paris Airport', 11)
INSERT [dbo].[airports] ([id], [name], [city_id]) VALUES (12, N'Nice Airport', 12)
INSERT [dbo].[airports] ([id], [name], [city_id]) VALUES (13, N'Stockholm Airport', 13)
INSERT [dbo].[airports] ([id], [name], [city_id]) VALUES (14, N'Amsterdam Airport', 14)
INSERT [dbo].[airports] ([id], [name], [city_id]) VALUES (15, N'Brussels Airport', 15)
INSERT [dbo].[airports] ([id], [name], [city_id]) VALUES (16, N'London', 16)
SET IDENTITY_INSERT [dbo].[airports] OFF
GO
SET IDENTITY_INSERT [dbo].[booked_ticket] ON 

INSERT [dbo].[booked_ticket] ([id], [booked_date], [discount_id], [charge_id], [customer_id], [seat_price_id]) VALUES (2, CAST(N'2022-04-30T23:33:00.000' AS DateTime), 1, 2, 1, 1)
INSERT [dbo].[booked_ticket] ([id], [booked_date], [discount_id], [charge_id], [customer_id], [seat_price_id]) VALUES (3, CAST(N'2022-04-10T11:00:00.000' AS DateTime), 5, 4, 5, NULL)
INSERT [dbo].[booked_ticket] ([id], [booked_date], [discount_id], [charge_id], [customer_id], [seat_price_id]) VALUES (4, CAST(N'2022-04-05T13:00:00.000' AS DateTime), 1, NULL, 6, NULL)
INSERT [dbo].[booked_ticket] ([id], [booked_date], [discount_id], [charge_id], [customer_id], [seat_price_id]) VALUES (5, CAST(N'2022-04-01T01:00:00.000' AS DateTime), 1, NULL, 7, NULL)
INSERT [dbo].[booked_ticket] ([id], [booked_date], [discount_id], [charge_id], [customer_id], [seat_price_id]) VALUES (6, CAST(N'2022-04-02T14:00:00.000' AS DateTime), 2, 4, 8, NULL)
INSERT [dbo].[booked_ticket] ([id], [booked_date], [discount_id], [charge_id], [customer_id], [seat_price_id]) VALUES (7, CAST(N'2022-04-05T19:00:00.000' AS DateTime), 2, NULL, 9, NULL)
INSERT [dbo].[booked_ticket] ([id], [booked_date], [discount_id], [charge_id], [customer_id], [seat_price_id]) VALUES (8, CAST(N'2022-04-07T11:00:00.000' AS DateTime), 2, 1, 10, NULL)
INSERT [dbo].[booked_ticket] ([id], [booked_date], [discount_id], [charge_id], [customer_id], [seat_price_id]) VALUES (9, CAST(N'2022-04-09T11:00:00.000' AS DateTime), 6, NULL, 11, NULL)
INSERT [dbo].[booked_ticket] ([id], [booked_date], [discount_id], [charge_id], [customer_id], [seat_price_id]) VALUES (10, CAST(N'2022-04-19T18:00:00.000' AS DateTime), 2, 2, 12, NULL)
INSERT [dbo].[booked_ticket] ([id], [booked_date], [discount_id], [charge_id], [customer_id], [seat_price_id]) VALUES (11, CAST(N'2022-04-30T11:00:00.000' AS DateTime), 1, 2, 4, 2)
INSERT [dbo].[booked_ticket] ([id], [booked_date], [discount_id], [charge_id], [customer_id], [seat_price_id]) VALUES (12, CAST(N'2022-04-16T07:00:00.000' AS DateTime), 3, NULL, 2, NULL)
INSERT [dbo].[booked_ticket] ([id], [booked_date], [discount_id], [charge_id], [customer_id], [seat_price_id]) VALUES (13, CAST(N'2022-04-14T21:00:00.000' AS DateTime), 6, NULL, 3, NULL)
INSERT [dbo].[booked_ticket] ([id], [booked_date], [discount_id], [charge_id], [customer_id], [seat_price_id]) VALUES (14, CAST(N'2022-04-30T11:00:00.000' AS DateTime), 5, NULL, 23, NULL)
INSERT [dbo].[booked_ticket] ([id], [booked_date], [discount_id], [charge_id], [customer_id], [seat_price_id]) VALUES (15, CAST(N'2022-04-13T11:00:00.000' AS DateTime), 3, 3, 17, NULL)
SET IDENTITY_INSERT [dbo].[booked_ticket] OFF
GO
SET IDENTITY_INSERT [dbo].[charges] ON 

INSERT [dbo].[charges] ([id], [name], [amount_charged]) VALUES (1, N'Cancellation Fee', CAST(0.10 AS Decimal(2, 2)))
INSERT [dbo].[charges] ([id], [name], [amount_charged]) VALUES (2, N'Additional Luggage', CAST(0.10 AS Decimal(2, 2)))
INSERT [dbo].[charges] ([id], [name], [amount_charged]) VALUES (3, N'Date Change', CAST(0.50 AS Decimal(2, 2)))
INSERT [dbo].[charges] ([id], [name], [amount_charged]) VALUES (4, N'Pet Cost', CAST(0.20 AS Decimal(2, 2)))
SET IDENTITY_INSERT [dbo].[charges] OFF
GO
SET IDENTITY_INSERT [dbo].[cities] ON 

INSERT [dbo].[cities] ([id], [name], [country_id]) VALUES (1, N'Sarajevo', 1)
INSERT [dbo].[cities] ([id], [name], [country_id]) VALUES (2, N'Mostar', 1)
INSERT [dbo].[cities] ([id], [name], [country_id]) VALUES (3, N'Podgorica', 3)
INSERT [dbo].[cities] ([id], [name], [country_id]) VALUES (4, N'Bar', 3)
INSERT [dbo].[cities] ([id], [name], [country_id]) VALUES (5, N'Beograd', 2)
INSERT [dbo].[cities] ([id], [name], [country_id]) VALUES (6, N'Novi Sad', 2)
INSERT [dbo].[cities] ([id], [name], [country_id]) VALUES (7, N'Zagreb', 4)
INSERT [dbo].[cities] ([id], [name], [country_id]) VALUES (8, N'Split', 4)
INSERT [dbo].[cities] ([id], [name], [country_id]) VALUES (9, N'Munich', 5)
INSERT [dbo].[cities] ([id], [name], [country_id]) VALUES (10, N'Berlin', 5)
INSERT [dbo].[cities] ([id], [name], [country_id]) VALUES (11, N'Paris', 6)
INSERT [dbo].[cities] ([id], [name], [country_id]) VALUES (12, N'Nice', 6)
INSERT [dbo].[cities] ([id], [name], [country_id]) VALUES (13, N'Stockholm', 7)
INSERT [dbo].[cities] ([id], [name], [country_id]) VALUES (14, N'Amsterdam', 8)
INSERT [dbo].[cities] ([id], [name], [country_id]) VALUES (15, N'Brussels', 9)
INSERT [dbo].[cities] ([id], [name], [country_id]) VALUES (16, N'London', 10)
INSERT [dbo].[cities] ([id], [name], [country_id]) VALUES (17, N'Sanski Most', 1)
SET IDENTITY_INSERT [dbo].[cities] OFF
GO
SET IDENTITY_INSERT [dbo].[countries] ON 

INSERT [dbo].[countries] ([id], [name]) VALUES (1, N'Bosnia and Herzegovina')
INSERT [dbo].[countries] ([id], [name]) VALUES (2, N'Serbia')
INSERT [dbo].[countries] ([id], [name]) VALUES (3, N'Montenegro')
INSERT [dbo].[countries] ([id], [name]) VALUES (4, N'Croatia')
INSERT [dbo].[countries] ([id], [name]) VALUES (5, N'Germany')
INSERT [dbo].[countries] ([id], [name]) VALUES (6, N'France')
INSERT [dbo].[countries] ([id], [name]) VALUES (7, N'Sweden')
INSERT [dbo].[countries] ([id], [name]) VALUES (8, N'Netherlands')
INSERT [dbo].[countries] ([id], [name]) VALUES (9, N'Belgium')
INSERT [dbo].[countries] ([id], [name]) VALUES (10, N'England')
SET IDENTITY_INSERT [dbo].[countries] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (1, N'Lejla', N'Muratovic', N'Jahijela Fincija 2', N'063 657 333', N'lejlamuratovic@gmail.com', 1)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (2, N'Dzejlana', N'Causevic', N'Trebevicka 19', N'062 258 852', N'dzejlana.causevic@gmail.com', 1)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (3, N'Melina', N'Cehajic', N'Zdena 63', N'061 458 968', N'melinacehajic@gmail.com', 8)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (4, N'Aldijana', N'Culezovic', N'Džemala Bijedica 1', N'060 111 444', N'aldijanaculezovic@yahoo.com', 2)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (5, N'Emir ', N'Kugic', N'Emira Bogunjica 1', N'062 909 200', N'emir.kugic@hotmail.com', 17)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (6, N'Ana', N'Hoffman', N'17 Ilica', N'064 121 131', N'hoffman.ana@gmail.com', 7)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (7, N'Aldin', N'Cehic', N'Cehici 65', N'061 789 321', N'aldin.cehic@hotmail.com', 17)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (8, N'Selma', N'Agicic', N'Prijedorska 98', N'062 047 589', N'selma.agicic@gmail.com', 17)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (9, N'Emina', N'Talic', N'Kljucka 46', N'062 987 456', N'emina.talic@gmail.com', 17)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (10, N'Hugh', N'Jass', N'Amsterdam 69', N'069 420 69 69', N'jass.hugh@gmail.com', 14)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (11, N'Ben', N'Dover', N'The Grove', N'447975777666', N'dover@ben.com', 16)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (12, N'Saima', N'Spahic', N'Francuske revolucije bb', N'060 187 598', N'saimaspa123@gmail.com', 5)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (13, N'Mike', N'Hawk', N'Place Jean Rey', N'02 800 08 88', N'hawkmike@gmail.com', 15)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (14, N'Tamara', N'Merlin', N'Mala aleja 15', N'061 774 774', N'merlintamara7@outlook.com', 3)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (17, N'Jack', N'Mehoff', N'Varuvagen 15', N'08 500 210 00', N'jackmehoff@gmail.com', 13)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (18, N'Juerdo', N'Titsgo', N'Rue De L Arceau', N'09 42 53 84 06', N'dr.juerdo.titgo@nice.hospital.com', 12)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (19, N'Mike', N'Oxlong', N'18 rue Isambard', N'02 65 48 92 65', N'mike@france-medical.care.com', 11)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (21, N'Jenna', N'Taylor', N'Sankt Josefs Weg', N'05851 21 18 96 ', N'jenna_taylor@hotmail.com', 10)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (22, N'Phill', N'McHunt', N'Borstelmannsweg 83', N'09561 66 74 30', N'phill@gmail.com', 9)
INSERT [dbo].[customers] ([id], [first_name], [last_name], [address], [phone_number], [email], [city_id]) VALUES (23, N'Aida', N'Dedic', N'Caplje 43', N'060 458 953', N'aidadedic@gmail.com', 17)
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[discounts] ON 

INSERT [dbo].[discounts] ([id], [name], [discount_amount]) VALUES (1, N'Student Discount', CAST(0.35 AS Decimal(2, 2)))
INSERT [dbo].[discounts] ([id], [name], [discount_amount]) VALUES (2, N'Senior Discount', CAST(0.20 AS Decimal(2, 2)))
INSERT [dbo].[discounts] ([id], [name], [discount_amount]) VALUES (3, N'Military Discount', CAST(0.37 AS Decimal(2, 2)))
INSERT [dbo].[discounts] ([id], [name], [discount_amount]) VALUES (5, N'Booked early', CAST(0.20 AS Decimal(2, 2)))
INSERT [dbo].[discounts] ([id], [name], [discount_amount]) VALUES (6, N'Medical Emergency', CAST(0.35 AS Decimal(2, 2)))
SET IDENTITY_INSERT [dbo].[discounts] OFF
GO
SET IDENTITY_INSERT [dbo].[flight_schedules] ON 

INSERT [dbo].[flight_schedules] ([id], [departure_time], [arrival_time], [departure_airport_id], [destination_airport], [aircraft_id]) VALUES (4, CAST(N'2022-05-30T12:33:00.000' AS DateTime), CAST(N'2022-05-30T15:30:00.000' AS DateTime), 1, 16, 1)
INSERT [dbo].[flight_schedules] ([id], [departure_time], [arrival_time], [departure_airport_id], [destination_airport], [aircraft_id]) VALUES (5, CAST(N'2022-05-31T06:00:00.000' AS DateTime), CAST(N'2022-05-31T10:25:00.000' AS DateTime), 2, 15, 2)
INSERT [dbo].[flight_schedules] ([id], [departure_time], [arrival_time], [departure_airport_id], [destination_airport], [aircraft_id]) VALUES (6, CAST(N'2022-06-01T12:30:00.000' AS DateTime), CAST(N'2022-06-01T14:30:00.000' AS DateTime), 3, 14, 3)
INSERT [dbo].[flight_schedules] ([id], [departure_time], [arrival_time], [departure_airport_id], [destination_airport], [aircraft_id]) VALUES (7, CAST(N'2022-06-01T09:30:00.000' AS DateTime), CAST(N'2022-06-01T10:30:00.000' AS DateTime), 4, 13, 4)
INSERT [dbo].[flight_schedules] ([id], [departure_time], [arrival_time], [departure_airport_id], [destination_airport], [aircraft_id]) VALUES (8, CAST(N'2022-06-01T18:30:00.000' AS DateTime), CAST(N'2022-06-01T20:00:00.000' AS DateTime), 5, 12, 5)
INSERT [dbo].[flight_schedules] ([id], [departure_time], [arrival_time], [departure_airport_id], [destination_airport], [aircraft_id]) VALUES (9, CAST(N'2022-06-02T21:00:00.000' AS DateTime), CAST(N'2022-06-02T23:30:00.000' AS DateTime), 6, 11, 5)
INSERT [dbo].[flight_schedules] ([id], [departure_time], [arrival_time], [departure_airport_id], [destination_airport], [aircraft_id]) VALUES (10, CAST(N'2022-06-03T21:00:00.000' AS DateTime), CAST(N'2022-06-03T23:30:00.000' AS DateTime), 7, 10, 1)
INSERT [dbo].[flight_schedules] ([id], [departure_time], [arrival_time], [departure_airport_id], [destination_airport], [aircraft_id]) VALUES (19, CAST(N'2022-06-24T02:00:00.000' AS DateTime), CAST(N'2022-06-24T07:00:00.000' AS DateTime), 9, 1, 3)
SET IDENTITY_INSERT [dbo].[flight_schedules] OFF
GO
SET IDENTITY_INSERT [dbo].[manufacturers] ON 

INSERT [dbo].[manufacturers] ([id], [manufacturer_name]) VALUES (1, N'Boeing')
INSERT [dbo].[manufacturers] ([id], [manufacturer_name]) VALUES (2, N'Airbus')
INSERT [dbo].[manufacturers] ([id], [manufacturer_name]) VALUES (3, N'Areo Adventure')
SET IDENTITY_INSERT [dbo].[manufacturers] OFF
GO
SET IDENTITY_INSERT [dbo].[seat_prices] ON 

INSERT [dbo].[seat_prices] ([id], [flight_id], [aircraft_seat_id], [price]) VALUES (1, 4, 1, CAST(85.00 AS Decimal(4, 2)))
INSERT [dbo].[seat_prices] ([id], [flight_id], [aircraft_seat_id], [price]) VALUES (2, 5, 2, CAST(99.55 AS Decimal(4, 2)))
INSERT [dbo].[seat_prices] ([id], [flight_id], [aircraft_seat_id], [price]) VALUES (3, 6, 3, CAST(99.99 AS Decimal(4, 2)))
INSERT [dbo].[seat_prices] ([id], [flight_id], [aircraft_seat_id], [price]) VALUES (4, 7, 4, CAST(25.00 AS Decimal(4, 2)))
INSERT [dbo].[seat_prices] ([id], [flight_id], [aircraft_seat_id], [price]) VALUES (5, 8, 5, CAST(42.00 AS Decimal(4, 2)))
INSERT [dbo].[seat_prices] ([id], [flight_id], [aircraft_seat_id], [price]) VALUES (6, 9, 6, CAST(55.55 AS Decimal(4, 2)))
INSERT [dbo].[seat_prices] ([id], [flight_id], [aircraft_seat_id], [price]) VALUES (9, 10, 6, CAST(18.50 AS Decimal(4, 2)))
SET IDENTITY_INSERT [dbo].[seat_prices] OFF
GO
SET IDENTITY_INSERT [dbo].[travel_class] ON 

INSERT [dbo].[travel_class] ([id], [name]) VALUES (1, N'First Class')
INSERT [dbo].[travel_class] ([id], [name]) VALUES (2, N'Business Clas')
INSERT [dbo].[travel_class] ([id], [name]) VALUES (3, N'Economy Class')
SET IDENTITY_INSERT [dbo].[travel_class] OFF
GO
ALTER TABLE [dbo].[aircraft_seats]  WITH CHECK ADD FOREIGN KEY([aircraft_id])
REFERENCES [dbo].[aircrafts] ([id])
GO
ALTER TABLE [dbo].[aircraft_seats]  WITH CHECK ADD FOREIGN KEY([travel_class_id])
REFERENCES [dbo].[travel_class] ([id])
GO
ALTER TABLE [dbo].[aircrafts]  WITH CHECK ADD FOREIGN KEY([manufacturer_id])
REFERENCES [dbo].[manufacturers] ([id])
GO
ALTER TABLE [dbo].[airports]  WITH CHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[cities] ([id])
GO
ALTER TABLE [dbo].[booked_ticket]  WITH CHECK ADD FOREIGN KEY([charge_id])
REFERENCES [dbo].[charges] ([id])
GO
ALTER TABLE [dbo].[booked_ticket]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[booked_ticket]  WITH CHECK ADD FOREIGN KEY([discount_id])
REFERENCES [dbo].[discounts] ([id])
GO
ALTER TABLE [dbo].[booked_ticket]  WITH CHECK ADD FOREIGN KEY([seat_price_id])
REFERENCES [dbo].[seat_prices] ([id])
GO
ALTER TABLE [dbo].[cities]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[countries] ([id])
GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[cities] ([id])
GO
ALTER TABLE [dbo].[flight_schedules]  WITH CHECK ADD FOREIGN KEY([aircraft_id])
REFERENCES [dbo].[aircrafts] ([id])
GO
ALTER TABLE [dbo].[flight_schedules]  WITH CHECK ADD FOREIGN KEY([departure_airport_id])
REFERENCES [dbo].[airports] ([id])
GO
ALTER TABLE [dbo].[flight_schedules]  WITH CHECK ADD FOREIGN KEY([destination_airport])
REFERENCES [dbo].[airports] ([id])
GO
ALTER TABLE [dbo].[seat_prices]  WITH CHECK ADD FOREIGN KEY([aircraft_seat_id])
REFERENCES [dbo].[aircraft_seats] ([id])
GO
ALTER TABLE [dbo].[seat_prices]  WITH CHECK ADD FOREIGN KEY([flight_id])
REFERENCES [dbo].[flight_schedules] ([id])
GO
USE [master]
GO
ALTER DATABASE [flight_reservation] SET  READ_WRITE 
GO
