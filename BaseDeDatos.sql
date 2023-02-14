-- Tablas
-- Proc. Almacenados
-- Vistas
-- Trigger


-- ===============================================================================
-- Normalizacion - Repaso - Clase 1
-- ===============================================================================

-- Tres tablas relacionadas / Tienen una cardinalidad 
-- *No puede haber muchos a muchos ni uno a uno sino se une
-- *Hay que lograr que todo sea de uno a muchos - Cambiando o rompiendo relaciones

-- Proveedores (Id)
-- Cliente ()
-- Articulo ()

-- Factura (Un cliente, articulos, en un momento determinado)

--         Maestro -- Detalle -- Articulos
--             |
--          Cliente

-- Tablas? Para datos/info de entidades  (datos -> procesos -> salida)
-- Filas (Registros) - Columnas (Campos/Atributos de la ent)
-- Los campos tienen distintos tipos de datos
-- Claves primarias y claves foraneas 
-- (Puede existir una tabla intermedia donde las claves Clientes y Articulo sean foraneas 
-- y solo sirva para guardar una relacion entre ellas)

-- SELECT

-- SELECT Id, Nombre FROM Cliente WHERE Id = 1

-- CUANDO HAGO INNER JOIN CON EL QUE ESTOY USANDO VOY PRIMERO.


--SELECT        dbo.Cliente.*, dbo.Cliente.Nombre AS Expr3, dbo.Domicilio.Calle
-- FROM            dbo.Cliente INNER JOIN
--                          dbo.Domicilio ON dbo.Cliente.Id_Domicilio = dbo.Domicilio.Id

-- CUANDO HAGO LEFT JOIN ME TRAE LOS CLIENTES AUNQUE EL DOMICILIO ESTE VACIO.

-- INSERT 
-- Si voy a anotar todos los campos del insert no hace falta aclarar

-- DELETE 
-- No olvidar el where, se borra todo

-- UPDATE
-- No olvidar el where, se cambia todo


-- ===============================================================================
-- Store Procedure - Procedimiento Almacenado -  Clase 2
-- ===============================================================================
-- Objetos:
-- Store Procedure - Metodo que se puede almacenar
-- Vistas - 
-- Trigger - Tarea despues de una accion. Ex. Guardar fechas despues de un log

-- Sirve para:
-- INSERT, UPDATE, DELETE, SELECT
-- Guardar los datos en otra tabla.

-- Ventajas: Velocidad. Por que no requiere compilacion.

-- Contras: 
-- Al cambiar la base de datos se puede perder. 
-- Cuando el ORM no lo puede hacer
-- Cuando no se tiene buen rendimiento

-- La diferencia entre procedimientos y funciones es que las funciones devuelven un valor

-- SP para el nombre de Store  y V para el nombre de la vista

-- - Para Crearlo -
-- Proyamabilty > Create Procedure

-- CREATE PROCEDURE SP_Ejemplo_GetAll
	
-- AS --
-- BEGIN -- Comienza
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	-- SET NOCOUNT ON; -- Sirve para que no me devuelva un log de lo realizado

    -- Insert statements for procedure here
	-- SELECT * from Ejemplo
-- END -- Termina
-- GO


-- para ejecutarlo se usa EXEC y el nombre. ex. Exec SP_Ejemplo_GetAll

-- se altera con un ALTER

-- Parametros

--CREATE PROCEDURE SP_Get_Id
	-- Add the parameters for the stored procedure here
	
	--@Id int = null -- valor por defecto
--AS
--BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT * from Ejemplo where Id= @Id
--END
--GO

--Se ejecuta por segundo boton > exec

-- CREATE ALTER y DROP sirven para todos los objetos > TABLE, VIEWS, PROCEDURE

-- ===============================================================================
--  Vistas -  Clase 3
-- ===============================================================================
-- V_ para el nombre de la vista

--
-- ===============================================================================
--  - SCRIPT  -  Clase 4
-- =============================================================================== 

-- 
if DB_ID ('Prueba') IS NULL
create database Prueba


use master -- para que no genere problemas de uso
GO
if DB_ID ('Prueba') IS NOT NULL
    begin
	drop database Prueba
	create database Prueba
	end
else
	create database Prueba
GO


use Prueba

GO -- es como un paso/bloque de ejecucion

if OBJECT_ID('Ejemplo','U') is not null --u es tabla
begin
drop table Ejemplo

create table Ejemplo (
IdEjemplo int NOT NULL Primary Key identity(1,1),
Nombre nvarchar(100),
Descripcion nvarchar(max),
fecha2 datetime
) 

end

USE [ejemplo]
GO

USE [ejemplo]
GO

