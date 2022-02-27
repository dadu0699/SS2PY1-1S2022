--DDL
USE MASTER;
GO
-------------------------------------------------------------------------------
--DATABASE CREATION
IF(DB_ID('SS2P1Pivot') IS NOT NULL)
DROP DATABASE SS2P1Pivot;

CREATE DATABASE SS2P1Pivot;
GO

USE SS2P1Pivot;
GO
-------------------------------------------------------------------------------
--CREATION OF TABLES
----Compra TABLE
CREATE TABLE Compra (
  idCompra INT IDENTITY (1,1) NOT NULL,
  fecha DATE,
  codProveedor VARCHAR(100) NULL,
  nombreProveedor VARCHAR(100) NULL,
  direccionProveedor VARCHAR(150) NULL,
  numeroProveedor INT NULL,
  webProveedor VARCHAR(150) NULL,
  codProducto VARCHAR(100) NULL,
  nombreProducto VARCHAR(100) NULL,
  marcaProducto VARCHAR(100) NULL,
  categoria VARCHAR(100) NULL,
  codSucursal VARCHAR(100) NULL,
  nombreSucursal VARCHAR(100) NULL,
  direccionSucursal VARCHAR(150) NULL,
  region VARCHAR(100) NULL,
  departamento VARCHAR(100) NULL,
  unidades VARCHAR(100) NULL,
  costoU DECIMAL (6,2) NULL,
	PRIMARY KEY (idCompra)
);
----Ventas TABLE
CREATE TABLE Venta (
  idVenta INT IDENTITY (1,1) NOT NULL,
  fecha DATE NULL,
  codigoCliente VARCHAR(100) NULL,
  nombreCliente VARCHAR(100) NULL,
  tipoCliente VARCHAR(100) NULL,
  direccionCliente VARCHAR(150) NULL,
  numeroCliente INT NULL,
  codVendedor VARCHAR(100) NULL,
  nombreVendedor VARCHAR(100) NULL,
  vacacionista TINYINT NULL,
  codProducto VARCHAR(100) NULL,
  nombreProducto VARCHAR(100) NULL,
  marcaProducto VARCHAR(100) NULL,
  categoria VARCHAR(100) NULL,
  codSucursal VARCHAR(100) NULL,
  nombreSucursal VARCHAR(100) NULL,
  direccionSucursal VARCHAR(150) NULL,
  eegion VARCHAR(100) NULL,
  departamento VARCHAR(100) NULL,
  unidades VARCHAR(100) NULL,
  precioUnitario DECIMAL (6,2) NULL,
	PRIMARY KEY (idVenta)
);
GO