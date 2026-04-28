--Roles y Permisos
ALTER ROLE db_datareader
ADD MEMBER usuario_lab;
GO

SELECT * FROM Clientes;

INSERT INTO Clientes (Nombre, Ciudad)
VALUES ('Prueba', 'Managua');

ALTER ROLE db_datawriter
ADD MEMBER usuario_lab;
GO

INSERT INTO Clientes (Nombre, Ciudad)
VALUES ('Prueba', 'Managua');

SELECT * FROM Clientes
WHERE Nombre = 'Prueba';