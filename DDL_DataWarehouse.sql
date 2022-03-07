--DDL
USE MASTER;
GO
-------------------------------------------------------------------------------
--DATABASE CREATION
IF(DB_ID('seminariodos201801266') IS NOT NULL)
DROP DATABASE seminariodos201801266;

CREATE DATABASE seminariodos201801266;
GO

USE seminariodos201801266;
GO
-------------------------------------------------------------------------------
--COLUMNAR DATABASE CREATION
IF(DB_ID('semniariodosColumnar201801266') IS NOT NULL)
DROP DATABASE semniariodosColumnar201801266;

CREATE DATABASE semniariodosColumnar201801266;
GO

USE semniariodosColumnar201801266;
GO
-------------------------------------------------------------------------------
--CREATION OF TABLES
----TIEMPO TABLE
CREATE TABLE Tiempo(
  tiempoID INT IDENTITY (1,1) NOT NULL,
  dia INT NOT NULL,
  mes INT NOT NULL,
  anio INT NOT NULL,
  fecha DATE NOT NULL,
  PRIMARY KEY (tiempoID)
);
----PRODUCTO TABLE
CREATE TABLE Producto(
  productoID INT IDENTITY (1,1) NOT NULL,
  codigo VARCHAR (100) NOT NULL,
  nombre VARCHAR (100) NOT NULL,
  marca VARCHAR (100) NOT NULL,
  categoria VARCHAR (100) NOT NULL,
  PRIMARY KEY (productoID)
);
----SUCURSAL TABLE
CREATE TABLE Sucursal(
  sucursalID INT IDENTITY (1,1) NOT NULL,
  codigo VARCHAR (100) NOT NULL,
  nombre VARCHAR (100) NOT NULL,
  direccion VARCHAR (150) NOT NULL,
  region VARCHAR (100) NOT NULL,
  departamento VARCHAR (100) NOT NULL,
  PRIMARY KEY (sucursalID)
);
----PROVEEDOR TABLE
CREATE TABLE Proveedor(
  proveedorID INT IDENTITY (1,1) NOT NULL,
  codigo VARCHAR (100) NOT NULL,
  nombre VARCHAR (100) NOT NULL,
  direccion VARCHAR (150) NOT NULL,
  numero INT NOT NULL,
  web TINYINT NOT NULL,
  PRIMARY KEY (proveedorID)
);
----COMPRA TABLE
CREATE TABLE Compra(
  compraID INT IDENTITY (1,1) NOT NULL,
  tiempoID INT NOT NULL,
  proveedorID INT NOT NULL,
  productoID INT NOT NULL,
  sucursalID INT NOT NULL,
  unidades INT NOT NULL,
  costoUnitario DECIMAL (6,2) NOT NULL,
  FOREIGN KEY (tiempoID) REFERENCES Tiempo(tiempoID),
  FOREIGN KEY (proveedorID) REFERENCES Proveedor(proveedorID),
  FOREIGN KEY (productoID) REFERENCES Producto(productoID),
  FOREIGN KEY (sucursalID) REFERENCES Sucursal(sucursalID),
  PRIMARY KEY (compraID)
);
----VENDEDOR TABLE
CREATE TABLE Vendedor(
  vendedorID INT IDENTITY (1,1) NOT NULL,
  nombre VARCHAR (100) NOT NULL,
  vacacionista TINYINT NOT NULL,
  PRIMARY KEY (vendedorID)
);
----CLIENTE TABLE
CREATE TABLE Cliente(
  clienteID INT IDENTITY (1,1) NOT NULL,
  codigo VARCHAR (100) NOT NULL,
  nombre VARCHAR (100) NOT NULL,
  tipoCliente TINYINT NOT NULL,
  direccion VARCHAR (150) NOT NULL,
  numero INT NOT NULL,
  PRIMARY KEY (clienteID)
);
----VENTA TABLE
CREATE TABLE Venta(
  ventaID INT IDENTITY (1,1) NOT NULL,
  tiempoID INT NOT NULL,
  clienteID INT NOT NULL,
  vendedorID INT NOT NULL,
  productoID INT NOT NULL,
  sucursalID INT NOT NULL,
  unidades INT NOT NULL,
  precioUnitario DECIMAL (6,2) NOT NULL,
  FOREIGN KEY (tiempoID) REFERENCES Tiempo(tiempoID),
  FOREIGN KEY (clienteID) REFERENCES Cliente(clienteID),
  FOREIGN KEY (vendedorID) REFERENCES Vendedor(vendedorID),
  FOREIGN KEY (productoID) REFERENCES Producto(productoID),
  FOREIGN KEY (sucursalID) REFERENCES Sucursal(sucursalID),
  PRIMARY KEY (ventaID)
);
GO