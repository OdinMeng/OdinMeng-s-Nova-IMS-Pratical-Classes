USE [master]
GO

exec sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL";
exec sp_MSforeachtable "DELETE FROM ?";
exec sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";