USE master
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'DemoData')
BEGIN
  CREATE DATABASE DemoData;
END;
GO

USE DemoData;
GO  

IF OBJECT_ID('Products', 'U') IS NULL
BEGIN
  CREATE TABLE Products (ID int IDENTITY(1,1), ProductName nvarchar(max));
END;
GO

SELECT * from dbo.Products;