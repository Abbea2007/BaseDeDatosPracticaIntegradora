USE TechStore;
GO

SELECT 
    TABLE_NAME AS Tabla
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

SELECT 
    TABLE_NAME AS Tabla,
    COLUMN_NAME AS Campo,
    DATA_TYPE AS TipoDato,
    CHARACTER_MAXIMUM_LENGTH AS Longitud,
    IS_NULLABLE AS PermiteNULL,
    COLUMN_DEFAULT AS ValorPorDefecto
FROM INFORMATION_SCHEMA.COLUMNS
ORDER BY TABLE_NAME, ORDINAL_POSITION;

SELECT 
    tc.TABLE_NAME AS Tabla,
    tc.CONSTRAINT_NAME AS Restriccion,
    tc.CONSTRAINT_TYPE AS TipoRestriccion,
    kcu.COLUMN_NAME AS Campo
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE kcu
    ON tc.CONSTRAINT_NAME = kcu.CONSTRAINT_NAME
ORDER BY tc.TABLE_NAME;

-- Procedimientos almacenados
SELECT 
    name AS Procedimiento,
    create_date AS FechaCreacion
FROM sys.procedures;

-- Índices
SELECT 
    t.name AS Tabla,
    i.name AS Indice,
    i.type_desc AS TipoIndice
FROM sys.indexes i
JOIN sys.tables t ON i.object_id = t.object_id
WHERE i.name IS NOT NULL
ORDER BY t.name;