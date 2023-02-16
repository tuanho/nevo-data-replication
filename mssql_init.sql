USE master
GO

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
  CREATE TABLE Products (ID int, ProductName nvarchar(max));
END;
GO

IF NOT EXISTS (SELECT * FROM Products WHERE ID = 1)
BEGIN
    INSERT INTO Products (ID, ProductName)
         VALUES (1, 'Milk'),
                (2, 'Butter'),
                (3, 'Broccoli'),
                (4, 'Chicken'),
                (5, 'Soy Sauce'),
                (6, 'Red Bell Pepper'),
                (7, 'Green Onions'),
                (8, 'Olive Oil'),
                (9, 'Eggs');
END

SELECT * from Products;