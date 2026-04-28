--Auditoria

USE TechStore;
GO

-- Revisar usuarios existentes
EXEC sp_helpuser;
GO

-- Revisar roles asignados a usuarios
SELECT 
    DP1.name AS Usuario,
    DP2.name AS RolAsignado
FROM sys.database_role_members DRM
JOIN sys.database_principals DP1
    ON DRM.member_principal_id = DP1.principal_id
JOIN sys.database_principals DP2
    ON DRM.role_principal_id = DP2.principal_id
ORDER BY DP1.name;
GO

-- Revisar permisos expl�citos
SELECT 
    USER_NAME(grantee_principal_id) AS Usuario,
    permission_name AS Permiso,
    state_desc AS EstadoPermiso,
    class_desc AS TipoObjeto,
    OBJECT_NAME(major_id) AS Objeto
FROM sys.database_permissions
ORDER BY Usuario, Permiso;
GO

-- Revisar trazabilidad b�sica de usuarios
SELECT 
    name AS Usuario,
    type_desc AS TipoUsuario,
    create_date AS FechaCreacion,
    modify_date AS FechaModificacion
FROM sys.database_principals
WHERE type IN ('S', 'U')
ORDER BY create_date;
GO