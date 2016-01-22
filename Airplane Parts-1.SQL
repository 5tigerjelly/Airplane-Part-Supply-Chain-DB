EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'Airplane Parts'
GO
USE [master]
GO
ALTER DATABASE [Airplane Parts] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
DROP DATABASE [Airplane Parts]
GO

USE Master
GO
CREATE DATABASE [Airplane Parts]
GO
USE [Airplane Parts]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEE]') AND type in (N'U'))
    DROP TABLE [dbo].[EMPLOYEE]
GO
CREATE TABLE [dbo].[EMPLOYEE] (
[EmployeeID] int identity  NOT NULL  
, [AddressID] int  NOT NULL  
, [EmployeeFname] varchar(50)  NOT NULL  
, [EmployeeLname] varchar(50)  NOT NULL  
, [Phone] varchar(20)  NULL  
, [Email] varchar(100)  NULL  
, [SSN] decimal(9,0)  NOT NULL  
)
GO

ALTER TABLE [dbo].[EMPLOYEE] ADD CONSTRAINT [EMPLOYEE_PK] PRIMARY KEY CLUSTERED (
[EmployeeID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRODUCT]') AND type in (N'U'))
    DROP TABLE [dbo].[PRODUCT]
GO
CREATE TABLE [dbo].[PRODUCT] (
[ProductID] int identity  NOT NULL  
, [ProductName] varchar(50)  NOT NULL  
, [ProductPrice] decimal(10,2)  NOT NULL  
, [ProductTypeID] int  NOT NULL  
, [ProductDescription] varchar(max)  NULL  
, [ProductQuantity] int  NULL  
)
GO

ALTER TABLE [dbo].[PRODUCT] ADD CONSTRAINT [PRODUCT_PK] PRIMARY KEY CLUSTERED (
[ProductID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VENDOR_ORDER]') AND type in (N'U'))
    DROP TABLE [dbo].[VENDOR_ORDER]
GO
CREATE TABLE [dbo].[VENDOR_ORDER] (
[VendorOrderID] int identity  NOT NULL  
, [VendorID] int  NOT NULL  
, [DateOrdered] datetime  NOT NULL  
, [OrderTotal] decimal(10,2)  NOT NULL  
)
GO

ALTER TABLE [dbo].[VENDOR_ORDER] ADD CONSTRAINT [VENDOR_ORDER_PK] PRIMARY KEY CLUSTERED (
[VendorOrderID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEE_POSITION]') AND type in (N'U'))
    DROP TABLE [dbo].[EMPLOYEE_POSITION]
GO
CREATE TABLE [dbo].[EMPLOYEE_POSITION] (
[EmployeeID] int identity  NOT NULL  
, [EmployeePositionID] int  NOT NULL  
, [Salary] decimal(10,2)  NOT NULL  
, [PositionStartDate] datetime  NOT NULL  
, [PositionEndDate] datetime  NULL  
)
GO

ALTER TABLE [dbo].[EMPLOYEE_POSITION] ADD CONSTRAINT [EMPLOYEE_POSITION_PK] PRIMARY KEY CLUSTERED (
[EmployeePositionID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CUSTOMER]') AND type in (N'U'))
    DROP TABLE [dbo].[CUSTOMER]
GO
CREATE TABLE [dbo].[CUSTOMER] (
[CustomerID] int identity  NOT NULL  
, [CustomerFName] varchar(50)  NOT NULL  
, [CustomerLName] varchar(50)  NOT NULL  
, [Phone] varchar(20)  NULL  
, [Email] varchar(100)  NULL  
, [AddressID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[CUSTOMER] ADD CONSTRAINT [CUSTOMER_PK] PRIMARY KEY CLUSTERED (
[CustomerID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CUSTOMER_PAYMENT]') AND type in (N'U'))
    DROP TABLE [dbo].[CUSTOMER_PAYMENT]
GO
CREATE TABLE [dbo].[CUSTOMER_PAYMENT] (
[CustomerPaymentID] int identity  NOT NULL  
, [CustomerOrderID] int  NOT NULL  
, [PaymentDate] datetime  NOT NULL  
, [PaymentAmount] decimal(10,2)  NOT NULL  
)
GO

ALTER TABLE [dbo].[CUSTOMER_PAYMENT] ADD CONSTRAINT [CUSTOMER_PAYMENT_PK] PRIMARY KEY CLUSTERED (
[CustomerPaymentID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DELIVERY]') AND type in (N'U'))
    DROP TABLE [dbo].[DELIVERY]
GO
CREATE TABLE [dbo].[DELIVERY] (
[DeliveryID] int identity  NOT NULL  
, [DeliveryDate] datetime  NOT NULL  
, [ShipmentID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[DELIVERY] ADD CONSTRAINT [DELIVERY_PK] PRIMARY KEY CLUSTERED (
[DeliveryID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VENDOR]') AND type in (N'U'))
    DROP TABLE [dbo].[VENDOR]
GO
CREATE TABLE [dbo].[VENDOR] (
[VendorID] int identity  NOT NULL  
, [VendorName] varchar(50)  NOT NULL  
, [VendorDescription] varchar(max)  NULL  
, [Email] varchar(100)  NULL  
, [Phone] varchar(20)  NULL  
)
GO

ALTER TABLE [dbo].[VENDOR] ADD CONSTRAINT [VENDOR_PK] PRIMARY KEY CLUSTERED (
[VendorID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CUSTOMER_ORDER]') AND type in (N'U'))
    DROP TABLE [dbo].[CUSTOMER_ORDER]
GO
CREATE TABLE [dbo].[CUSTOMER_ORDER] (
[CustomerOrderID] int identity  NOT NULL  
, [CustomerID] int  NOT NULL  
, [DateOrdered] datetime  NOT NULL  
, [OrderTotal] decimal(10,2)  NOT NULL  
)
GO

ALTER TABLE [dbo].[CUSTOMER_ORDER] ADD CONSTRAINT [CUSTOMER_ORDER_PK] PRIMARY KEY CLUSTERED (
[CustomerOrderID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADDRESS]') AND type in (N'U'))
    DROP TABLE [dbo].[ADDRESS]
GO
CREATE TABLE [dbo].[ADDRESS] (
[AddressID] int identity  NOT NULL  
, [Street] varchar(150)  NOT NULL  
, [CityID] int  NOT NULL  
, [Zipcode] varchar(20)  NULL  
)
GO

ALTER TABLE [dbo].[ADDRESS] ADD CONSTRAINT [ADDRESS_PK] PRIMARY KEY CLUSTERED (
[AddressID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CUSTOMER_ORDER_LINE_ITEM]') AND type in (N'U'))
    DROP TABLE [dbo].[CUSTOMER_ORDER_LINE_ITEM]
GO
CREATE TABLE [dbo].[CUSTOMER_ORDER_LINE_ITEM] (
[CustomerOrderLineItemID] int identity  NOT NULL  
, [CustomerOrderID] int  NOT NULL  
, [WareHouseProductID] int  NOT NULL  
, [LineProductCost] decimal(10,2)  NOT NULL  
, [LineProductCount] int  NOT NULL  
, [LineProductTotal] decimal(10,2)  NOT NULL  
)
GO

ALTER TABLE [dbo].[CUSTOMER_ORDER_LINE_ITEM] ADD CONSTRAINT [CUSTOMER_ORDER_LINE_ITEM_PK] PRIMARY KEY CLUSTERED (
[CustomerOrderLineItemID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CONTRACTOR_INFORMATION]') AND type in (N'U'))
    DROP TABLE [dbo].[CONTRACTOR_INFORMATION]
GO
CREATE TABLE [dbo].[CONTRACTOR_INFORMATION] (
[EmployeePositionID] int  NOT NULL  
, [ContractingCompany] varchar(50)  NOT NULL  
, [1099Status] varchar(50)  NULL  
, [PaymentInformation] varchar(50)  NOT NULL  
)
GO

ALTER TABLE [dbo].[CONTRACTOR_INFORMATION] ADD CONSTRAINT [CONTRACTOR_INFORMATION_PK] PRIMARY KEY CLUSTERED (
[EmployeePositionID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRODUCT_TYPE]') AND type in (N'U'))
    DROP TABLE [dbo].[PRODUCT_TYPE]
GO
CREATE TABLE [dbo].[PRODUCT_TYPE] (
[ProductTypeID] int identity  NOT NULL  
, [ProductTypeName] varchar(150)  NOT NULL  
, [ProductTypeDesc] varchar(max)  NULL  
)
GO

ALTER TABLE [dbo].[PRODUCT_TYPE] ADD CONSTRAINT [PRODUCT_TYPE_PK] PRIMARY KEY CLUSTERED (
[ProductTypeID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CARRIER]') AND type in (N'U'))
    DROP TABLE [dbo].[CARRIER]
GO
CREATE TABLE [dbo].[CARRIER] (
[CarrierID] int identity  NOT NULL  
, [CarrierName] varchar(50)  NOT NULL  
, [CarrierDescription] varchar(max)  NULL  
)
GO

ALTER TABLE [dbo].[CARRIER] ADD CONSTRAINT [CARRIER_PK] PRIMARY KEY CLUSTERED (
[CarrierID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VENDOR_ORDER_LINE_ITEM]') AND type in (N'U'))
    DROP TABLE [dbo].[VENDOR_ORDER_LINE_ITEM]
GO
CREATE TABLE [dbo].[VENDOR_ORDER_LINE_ITEM] (
[VendorOrderLineItemID] int identity  NOT NULL  
, [WareHouseProductID] int  NOT NULL  
, [VendorOrderID] int  NOT NULL  
, [ArrivalDate] datetime  NULL  
, [ShipmentCarrier] char(10)  NULL  
, [TrackingNumber] int  NULL  
, [PurchasePrice] decimal(10,2)  NOT NULL  
, [PurchaseCount] int  NOT NULL  
, [PurchaseTotal] decimal(10,2)  NOT NULL  
)
GO

ALTER TABLE [dbo].[VENDOR_ORDER_LINE_ITEM] ADD CONSTRAINT [VENDOR_ORDER_LINE_ITEM_PK] PRIMARY KEY CLUSTERED (
[VendorOrderLineItemID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STATE_PROVINCE]') AND type in (N'U'))
    DROP TABLE [dbo].[STATE_PROVINCE]
GO
CREATE TABLE [dbo].[STATE_PROVINCE] (
[StateID] int identity  NOT NULL  
, [StateName] varchar(50)  NOT NULL  
, [CountryID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[STATE_PROVINCE] ADD CONSTRAINT [STATE_PROVINCE_PK] PRIMARY KEY CLUSTERED (
[StateID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WAREHOUSE_WORKER]') AND type in (N'U'))
    DROP TABLE [dbo].[WAREHOUSE_WORKER]
GO
CREATE TABLE [dbo].[WAREHOUSE_WORKER] (
[EmployeePositionID] int  NOT NULL  
, [WarehouseID] int  NOT NULL  
, [SupervisingEmployeeID] int  NOT NULL  
, [Disability] varchar(50)  NULL  
, [DisabilityNotes] varchar(255)  NULL  
)
GO

ALTER TABLE [dbo].[WAREHOUSE_WORKER] ADD CONSTRAINT [WAREHOUSE_WORKER_PK] PRIMARY KEY CLUSTERED (
[EmployeePositionID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EXECUTIVE]') AND type in (N'U'))
    DROP TABLE [dbo].[EXECUTIVE]
GO
CREATE TABLE [dbo].[EXECUTIVE] (
[EmployeePositionID] int  NOT NULL  
, [ExecutivePositionID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[EXECUTIVE] ADD CONSTRAINT [EXECUTIVE_PK] PRIMARY KEY CLUSTERED (
[EmployeePositionID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CITY]') AND type in (N'U'))
    DROP TABLE [dbo].[CITY]
GO
CREATE TABLE [dbo].[CITY] (
[CityID] int identity  NOT NULL  
, [CityName] varchar(50)  NOT NULL  
, [StateID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[CITY] ADD CONSTRAINT [CITY_PK] PRIMARY KEY CLUSTERED (
[CityID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WAREHOUSE]') AND type in (N'U'))
    DROP TABLE [dbo].[WAREHOUSE]
GO
CREATE TABLE [dbo].[WAREHOUSE] (
[WarehouseID] int identity  NOT NULL  
, [AddressID] int  NOT NULL  
, [WarehouseName] varchar(150)  NOT NULL  
, [WarehouseDesc] varchar(max)  NULL  
)
GO

ALTER TABLE [dbo].[WAREHOUSE] ADD CONSTRAINT [WAREHOUSE_PK] PRIMARY KEY CLUSTERED (
[WarehouseID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EXECUTIVE_POSITION]') AND type in (N'U'))
    DROP TABLE [dbo].[EXECUTIVE_POSITION]
GO
CREATE TABLE [dbo].[EXECUTIVE_POSITION] (
[ExecutivePositionID] int identity  NOT NULL  
, [ExecutivePositionName] varchar(50)  NOT NULL  
, [ExecutiveDepartment] varchar(255)  NULL  
)
GO

ALTER TABLE [dbo].[EXECUTIVE_POSITION] ADD CONSTRAINT [EXECUTIVE_POSITION_PK] PRIMARY KEY CLUSTERED (
[ExecutivePositionID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SHIPMENT]') AND type in (N'U'))
    DROP TABLE [dbo].[SHIPMENT]
GO
CREATE TABLE [dbo].[SHIPMENT] (
[ShipmentID] int identity  NOT NULL  
, [CustomerOrderLineItemID] int  NOT NULL  
, [DateShipped] datetime  NOT NULL  
, [CarrierID] int  NOT NULL  
, [TrackingNumber] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[SHIPMENT] ADD CONSTRAINT [SHIPMENT_PK] PRIMARY KEY CLUSTERED (
[ShipmentID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WAREHOUSE_PRODUCT]') AND type in (N'U'))
    DROP TABLE [dbo].[WAREHOUSE_PRODUCT]
GO
CREATE TABLE [dbo].[WAREHOUSE_PRODUCT] (
[WarehouseProductID] int identity  NOT NULL  
, [ProductID] int  NOT NULL  
, [WarehouseID] int  NOT NULL  
, [Quantity] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[WAREHOUSE_PRODUCT] ADD CONSTRAINT [WAREHOUSE_PRODUCT_PK] PRIMARY KEY CLUSTERED (
[WarehouseProductID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[COUNTRY]') AND type in (N'U'))
    DROP TABLE [dbo].[COUNTRY]
GO
CREATE TABLE [dbo].[COUNTRY] (
[CountryID] int identity  NOT NULL  
, [CountryName] varchar(50)  NOT NULL  
, [RegionID] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[COUNTRY] ADD CONSTRAINT [COUNTRY_PK] PRIMARY KEY CLUSTERED (
[CountryID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGION]') AND type in (N'U'))
    DROP TABLE [dbo].[REGION]
GO
CREATE TABLE [dbo].[REGION] (
[RegionID] int identity  NOT NULL  
, [RegionName] varchar(50)  NOT NULL  
)
GO

ALTER TABLE [dbo].[REGION] ADD CONSTRAINT [REGION_PK] PRIMARY KEY CLUSTERED (
[RegionID]
)
GO
GO

ALTER TABLE [dbo].[EMPLOYEE] WITH CHECK ADD CONSTRAINT [ADDRESS_EMPLOYEE_FK1] FOREIGN KEY (
[AddressID]
)
REFERENCES [dbo].[ADDRESS] (
[AddressID]
)
GO

ALTER TABLE [dbo].[PRODUCT] WITH CHECK ADD CONSTRAINT [PRODUCT_TYPE_PRODUCT_FK1] FOREIGN KEY (
[ProductTypeID]
)
REFERENCES [dbo].[PRODUCT_TYPE] (
[ProductTypeID]
)
GO

ALTER TABLE [dbo].[VENDOR_ORDER] WITH CHECK ADD CONSTRAINT [VENDOR_VENDOR_ORDER_FK1] FOREIGN KEY (
[VendorID]
)
REFERENCES [dbo].[VENDOR] (
[VendorID]
)
GO

ALTER TABLE [dbo].[EMPLOYEE_POSITION] WITH CHECK ADD CONSTRAINT [EMPLOYEE_EMPLOYEE_POSITION_FK1] FOREIGN KEY (
[EmployeeID]
)
REFERENCES [dbo].[EMPLOYEE] (
[EmployeeID]
)
GO

ALTER TABLE [dbo].[CUSTOMER] WITH CHECK ADD CONSTRAINT [ADDRESS_CUSTOMER_FK1] FOREIGN KEY (
[AddressID]
)
REFERENCES [dbo].[ADDRESS] (
[AddressID]
)
GO

ALTER TABLE [dbo].[CUSTOMER_PAYMENT] WITH CHECK ADD CONSTRAINT [CUSTOMER_ORDER_CUSTOMER_PAYMENT_FK1] FOREIGN KEY (
[CustomerOrderID]
)
REFERENCES [dbo].[CUSTOMER_ORDER] (
[CustomerOrderID]
)
GO

ALTER TABLE [dbo].[DELIVERY] WITH CHECK ADD CONSTRAINT [SHIPMENT_DELIVERY_FK1] FOREIGN KEY (
[ShipmentID]
)
REFERENCES [dbo].[SHIPMENT] (
[ShipmentID]
)
GO

GO

ALTER TABLE [dbo].[CUSTOMER_ORDER] WITH CHECK ADD CONSTRAINT [CUSTOMER_CUSTOMER_ORDER_FK1] FOREIGN KEY (
[CustomerID]
)
REFERENCES [dbo].[CUSTOMER] (
[CustomerID]
)
GO

ALTER TABLE [dbo].[ADDRESS] WITH CHECK ADD CONSTRAINT [CITY_ADDRESS_FK1] FOREIGN KEY (
[CityID]
)
REFERENCES [dbo].[CITY] (
[CityID]
)
GO

ALTER TABLE [dbo].[CUSTOMER_ORDER_LINE_ITEM] WITH CHECK ADD CONSTRAINT [WAREHOUSE_PRODUCT_CUSTOMER_ORDER_LINE_ITEM_FK1] FOREIGN KEY (
[WareHouseProductID]
)
REFERENCES [dbo].[WAREHOUSE_PRODUCT] (
[WarehouseProductID]
)
ALTER TABLE [dbo].[CUSTOMER_ORDER_LINE_ITEM] WITH CHECK ADD CONSTRAINT [CUSTOMER_ORDER_CUSTOMER_ORDER_LINE_ITEM_FK1] FOREIGN KEY (
[CustomerOrderID]
)
REFERENCES [dbo].[CUSTOMER_ORDER] (
[CustomerOrderID]
)
GO

ALTER TABLE [dbo].[CONTRACTOR_INFORMATION] WITH CHECK ADD CONSTRAINT [EMPLOYEE_POSITION_CONTRACTOR_INFORMATION_FK1] FOREIGN KEY (
[EmployeePositionID]
)
REFERENCES [dbo].[EMPLOYEE_POSITION] (
[EmployeePositionID]
)
GO

GO

GO

ALTER TABLE [dbo].[VENDOR_ORDER_LINE_ITEM] WITH CHECK ADD CONSTRAINT [WAREHOUSE_PRODUCT_VENDOR_ORDER_LINE_ITEM_FK1] FOREIGN KEY (
[WareHouseProductID]
)
REFERENCES [dbo].[WAREHOUSE_PRODUCT] (
[WarehouseProductID]
)
ALTER TABLE [dbo].[VENDOR_ORDER_LINE_ITEM] WITH CHECK ADD CONSTRAINT [VENDOR_ORDER_VENDOR_ORDER_LINE_ITEM_FK1] FOREIGN KEY (
[VendorOrderID]
)
REFERENCES [dbo].[VENDOR_ORDER] (
[VendorOrderID]
)
GO

ALTER TABLE [dbo].[STATE_PROVINCE] WITH CHECK ADD CONSTRAINT [COUNTRY_STATE_PROVINCE_FK1] FOREIGN KEY (
[CountryID]
)
REFERENCES [dbo].[COUNTRY] (
[CountryID]
)
GO

ALTER TABLE [dbo].[WAREHOUSE_WORKER] WITH CHECK ADD CONSTRAINT [WAREHOUSE_WAREHOUSE_WORKER_FK1] FOREIGN KEY (
[WarehouseID]
)
REFERENCES [dbo].[WAREHOUSE] (
[WarehouseID]
)
ALTER TABLE [dbo].[WAREHOUSE_WORKER] WITH CHECK ADD CONSTRAINT [EMPLOYEE_POSITION_WAREHOUSE_WORKER_FK1] FOREIGN KEY (
[EmployeePositionID]
)
REFERENCES [dbo].[EMPLOYEE_POSITION] (
[EmployeePositionID]
)
GO

ALTER TABLE [dbo].[EXECUTIVE] WITH CHECK ADD CONSTRAINT [EMPLOYEE_POSITION_EXECUTIVE_FK1] FOREIGN KEY (
[EmployeePositionID]
)
REFERENCES [dbo].[EMPLOYEE_POSITION] (
[EmployeePositionID]
)
ALTER TABLE [dbo].[EXECUTIVE] WITH CHECK ADD CONSTRAINT [EXECUTIVE_POSITION_EXECUTIVE_FK1] FOREIGN KEY (
[ExecutivePositionID]
)
REFERENCES [dbo].[EXECUTIVE_POSITION] (
[ExecutivePositionID]
)
GO

ALTER TABLE [dbo].[CITY] WITH CHECK ADD CONSTRAINT [STATE_PROVINCE_CITY_FK1] FOREIGN KEY (
[StateID]
)
REFERENCES [dbo].[STATE_PROVINCE] (
[StateID]
)
GO

ALTER TABLE [dbo].[WAREHOUSE] WITH CHECK ADD CONSTRAINT [ADDRESS_WAREHOUSE_FK1] FOREIGN KEY (
[AddressID]
)
REFERENCES [dbo].[ADDRESS] (
[AddressID]
)
GO

GO

ALTER TABLE [dbo].[SHIPMENT] WITH CHECK ADD CONSTRAINT [CUSTOMER_ORDER_LINE_ITEM_SHIPMENT_FK1] FOREIGN KEY (
[CustomerOrderLineItemID]
)
REFERENCES [dbo].[CUSTOMER_ORDER_LINE_ITEM] (
[CustomerOrderLineItemID]
)
ALTER TABLE [dbo].[SHIPMENT] WITH CHECK ADD CONSTRAINT [CARRIER_SHIPMENT_FK1] FOREIGN KEY (
[CarrierID]
)
REFERENCES [dbo].[CARRIER] (
[CarrierID]
)
GO

ALTER TABLE [dbo].[WAREHOUSE_PRODUCT] WITH CHECK ADD CONSTRAINT [WAREHOUSE_WAREHOUSE_PRODUCT_FK1] FOREIGN KEY (
[WarehouseID]
)
REFERENCES [dbo].[WAREHOUSE] (
[WarehouseID]
)
ALTER TABLE [dbo].[WAREHOUSE_PRODUCT] WITH CHECK ADD CONSTRAINT [PRODUCT_WAREHOUSE_PRODUCT_FK1] FOREIGN KEY (
[ProductID]
)
REFERENCES [dbo].[PRODUCT] (
[ProductID]
)
GO

ALTER TABLE [dbo].[COUNTRY] WITH CHECK ADD CONSTRAINT [REGION_COUNTRY_FK1] FOREIGN KEY (
[RegionID]
)
REFERENCES [dbo].[REGION] (
[RegionID]
)
GO

GO

