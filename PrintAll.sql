USE [Airplane Parts]
GO

DECLARE @SQL AS VarChar(MAX)
SET @SQL = ''

SELECT @SQL = @SQL + 'SELECT * FROM ' + TABLE_SCHEMA + '.[' + TABLE_NAME + ']' + CHAR(13)
FROM INFORMATION_SCHEMA.TABLES

EXEC (@SQL)


USE [master]
GO
