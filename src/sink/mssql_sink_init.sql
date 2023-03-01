USE master
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'DemoData')
BEGIN
  CREATE DATABASE DemoData;
END;
GO

USE DemoData;
GO  

-- DO NOT create table, the io.confluent.connect.jdbc.JdbcSinkConnector will do it for us
-- IF OBJECT_ID('Products', 'U') IS NULL
-- BEGIN
--   CREATE TABLE Products (ID int IDENTITY(1,1), ProductName nvarchar(max));
-- END;
-- GO

-- drop table Products;

-- BEGIN
--   SET IDENTITY_INSERT DemoData.dbo.Products ON
-- END;
-- GO

-- SELECT * from dbo.Products;
-- delete from Products where ProductName = 'Chili Oil';