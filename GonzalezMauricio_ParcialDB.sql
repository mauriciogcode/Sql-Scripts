--Institución Cervantes 
--Carrera Analista de Sistema de Computación 
--Base de Datos 2

--Parcial N° 1  12/10/2022

--Tarea:
--Se posee un depósito de artículos cuyos datos son los siguientes:
--Código de Articulo
--Nombre Articulo
--stock
--Precio
--Estado



--Se debe crear un scripts que posea lo siguiente:
--Creación de base de datos cuyo Nombre es igual a su Apellido y Nombre*
--Creación de tablas necesarias 
--Inserción de datos necesarios (mínimo 3)
--Vista de datos 
--Procedimientos almacenados de cada tabla creada
--Insert
--Select 

--Recuerde que todos los archivos de la solución del problema se deben subir a la plataforma Teams en un archivo comprimido con su nombre.

USE master
GO
if DB_ID ('Gonzalez_mauricio') IS NOT NULL
DROP DATABASE IF EXISTS  Gonzalez_mauricio 

CREATE DATABASE Gonzalez_mauricio

GO
USE [Gonzalez_mauricio]
GO
IF OBJECT_ID ('Articulo', 'U') IS NOT NULL

DROP TABLE Articulo

CREATE TABLE Articulo(
	 IdArticulo   int  IDENTITY(1,1) NOT NULL,
	 Nombre   nvarchar (50) NOT NULL,
	 Precio   decimal (18, 2) NOT NULL,
	 Estado   nvarchar (max) NOT NULL,
	 Stock   bit  NOT NULL,
 CONSTRAINT  PK_Articulo  PRIMARY KEY CLUSTERED 
(
	 IdArticulo  ASC
))
GO


INSERT INTO Articulo(Nombre, Precio, Estado, Stock) 
values ('Articulo A', 10, 1, 100),
('Articulo B', 30, 0, 300),
('Articulo C', 50, 1, 500)

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW VistaAll
AS
SELECT        dbo.Articulo.*
FROM            dbo.Articulo
GO

SELECT * FROM VistaAll
GO



SELECT        IdArticulo, Precio
FROM            dbo.Articulo

SELECT         Nombre AS Nombre, Estado AS 'Estado del Producto'
FROM            dbo.Articulo

SELECT         Nombre AS Nombre, Stock AS 'Cantidad del Producto'
FROM            dbo.Articulo
WHERE			IdArticulo = 1


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE SP_Articulo_GetAll
	AS
 BEGIN
	  
	SELECT * from Articulo
END

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE SP_Insert_Articulo
	(
	@nombre nvarchar(50),
	@precio DECIMAL(18,2), 
	@estado nvarchar(max),
	@stock int )
AS
BEGIN

INSERT INTO Articulo(Nombre, Precio, Estado, Stock) values (@nombre, @precio, @estado, @stock)
END
GO