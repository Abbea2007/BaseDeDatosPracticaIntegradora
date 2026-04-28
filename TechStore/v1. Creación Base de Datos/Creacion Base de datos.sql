--Creacion base de datos

CREATE DATABASE TechStore;
GO

USE TechStore;
GO


CREATE TABLE Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL,
    Telefono NVARCHAR(20),
    Ciudad NVARCHAR(80),
    FechaRegistro DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Productos (
    ProductoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(120) NOT NULL,
    Categoria NVARCHAR(80) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    Activo BIT DEFAULT 1
);
GO

CREATE TABLE Empleados (
    EmpleadoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Cargo NVARCHAR(80) NOT NULL,
    Email NVARCHAR(150),
    Salario DECIMAL(10,2) NOT NULL
);
GO

CREATE TABLE Ventas (
    VentaID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT NOT NULL,
    EmpleadoID INT NOT NULL,
    FechaVenta DATETIME DEFAULT GETDATE(),
    Total DECIMAL(10,2) NOT NULL,
    Estado NVARCHAR(30) DEFAULT 'Completada',

    CONSTRAINT FK_Ventas_Clientes 
        FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),

    CONSTRAINT FK_Ventas_Empleados 
        FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);
GO

CREATE TABLE DetalleVentas (
    DetalleID INT IDENTITY(1,1) PRIMARY KEY,
    VentaID INT NOT NULL,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_DetalleVentas_Ventas 
        FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID),

    CONSTRAINT FK_DetalleVentas_Productos 
        FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);
GO

/* ============================================================
   TABLA TarjetasClientes
   ============================================================ */

CREATE TABLE TarjetasClientes (
    TarjetaID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT NOT NULL,
    NumeroTarjeta NVARCHAR(30) NOT NULL,
    FechaVencimiento NVARCHAR(10) NOT NULL,
    CVV NVARCHAR(5) NOT NULL,

    CONSTRAINT FK_TarjetasClientes_Clientes
        FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
GO
