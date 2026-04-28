--Seguridad y Logins
USE master;
GO

CREATE LOGIN usuario_lab
WITH PASSWORD = 'LabSQL2026*',
CHECK_POLICY = ON;
GO

USE TechStore;
GO

CREATE USER usuario_lab
FOR LOGIN usuario_lab;
GO

SELECT 
    name AS Usuario,
    type_desc AS TipoUsuario,
    create_date AS FechaCreacion
FROM sys.database_principals
WHERE name = 'usuario_lab';

USE master;
GO

SELECT 
    name AS Login,
    type_desc AS TipoLogin,
    is_disabled AS EstaDeshabilitado,
    create_date AS FechaCreacion
FROM sys.server_principals
WHERE name = 'usuario_lab';

USE TechStore;
 SELECT * FROM Clientes;

USE TechStore;
GO