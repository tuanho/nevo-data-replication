USE master
GO

-- Creates DemoData database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'DemoData')
BEGIN
  CREATE DATABASE DemoData;
END;
GO

USE DemoData;
GO  

-- Enable CDC on this table
-- See: https://learn.microsoft.com/en-us/sql/relational-databases/track-changes/enable-and-disable-change-data-capture-sql-server?view=sql-server-ver16
-- select is_cdc_enabled from sys.databases where name = 'DemoData' and is_cdc_enabled = 1;
IF NOT EXISTS (select is_cdc_enabled from sys.databases where name = 'DemoData' and is_cdc_enabled = 1)
BEGIN
    EXEC sys.sp_cdc_enable_db
END
GO  

IF OBJECT_ID('Products', 'U') IS NULL
BEGIN
  CREATE TABLE Products (ID int IDENTITY(1,1), ProductName nvarchar(max));
END;
GO
-- DROP TABLE Products;

-- Enables CDC for Products table
EXEC sys.sp_cdc_enable_table
@source_schema = N'dbo',
@source_name   = N'Products', 
@role_name     = NULL,  
@filegroup_name = NULL,
@supports_net_changes = 0
GO

-- View CDC details
-- EXEC sys.sp_cdc_help_change_data_capture
-- GO

IF NOT EXISTS (SELECT * FROM Products WHERE ID = 1)
BEGIN
    INSERT INTO Products (ProductName)
         VALUES ('Milk'),
                ('Butter'),
                ('Broccoli'),
                ('Chicken'),
                ('Soy Sauce'),
                ('Red Bell Pepper'),
                ('Green Onions'),
                ('Olive Oil'),
                ('Eggs');
END

SELECT * from dbo.Products;

-- insert into products (ProductName) values ('Chili Oil');