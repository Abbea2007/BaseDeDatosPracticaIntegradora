SELECT 
    name AS BaseDatos,
    recovery_model_desc AS ModeloRecuperacion
FROM sys.databases
WHERE name = 'TechStore';

ALTER DATABASE TechStore
SET RECOVERY FULL;

BACKUP DATABASE TechStore
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TechStore.bak'
WITH INIT,
     NAME = 'Backup Completo TechStore';

BACKUP DATABASE TechStore
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TechStore\Diferencial.bak'
WITH DIFFERENTIAL, INIT, NAME = 'Backup Diferencial TechStore'

BACKUP LOG TechStore
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TechStore\Log.trn'
WITH INIT, NAME = 'Backup Log de trasacciones'