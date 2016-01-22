USE [Airplane Parts]
GO

-- Stored Procedure to add to Customer
CREATE PROCEDURE addCustomer
@CustomerFName varChar (50),
@CustomerLName varChar (50),
@Street varchar(150), 
@ZipCode INT,
@CityName varchar(150),
@StateName varchar(150),
@CountryName varchar(150),
@RegionName varchar(150),
@Phone INT,
@Email varChar(100)
AS
BEGIN TRAN T1
	DECLARE @CustomerID INT
	DECLARE @AddressID INT

	EXEC @AddressID = location.Address @Street, @ZipCode, @CityName, @StateName, @CountryName, @RegionName

	INSERT INTO Airplane_Parts.dbo.CUSTOMER([CustomerFName],[CustomerLName],[AddressID],[Phone],[Email])
		VALUES (@CustomerFName, @CustomerLName, @AddressID, @Phone, @Email)
	SET @CustomerID = (SELECT SCOPE_IDENTITY());

IF (@@error <> 0)
	BEGIN
		ROLLBACK TRAN T1
		RETURN (0)
	END
ELSE
	BEGIN
		COMMIT TRAN T1
		RETURN (@CustomerID)
	END
GO

-- Stored Procedure to add to Customer_Order
CREATE PROCEDURE addCustomerOrder
@CustomerID INT,
@DateORdered DATETIME,
@OrderTotal Numeric(10,2)
AS
BEGIN TRAN T1
	DECLARE @CustomerOrderID INT

	INSERT INTO Airplane_Parts.dbo.CUSTOMER_Order([CustomerID],[DateORdered],[OrderTotal])
		VALUES (@CustomerID, @DateORdered, @OrderTotal)
	SET @CustomerOrderID = (SELECT SCOPE_IDENTITY());

IF (@@error <> 0)
	BEGIN
		ROLLBACK TRAN T1
		RETURN (0)
	END
ELSE
	BEGIN
		COMMIT TRAN T1
		RETURN (@CustomerOrderID)
	END
GO

-- Stored Procedure to add to CustomerOderLineItem
CREATE PROCEDURE addCustomerOderLineItem
@CustomerOrderID INT,
@WarehouseProductID INT,
@LineProductCount INT,
@ProductName varChar(50)

AS
BEGIN TRAN T1
	DECLARE @CustomerOrderLineItemID INT
	DECLARE @LineProductCost Numeric(10,2)

	SET @LineProductCost = (
		SELECT P.ProductPrice 
		FROM PRODUCT P 
			JOIN WAREHOUSE_PRODUCT WP 
				ON P.ProductID = WP.ProductID 
		WHERE WP.WarehouseProductID = @WarehouseProductID
	)

	INSERT INTO Airplane_Parts.dbo.CUSTOMER_ORDER_LINE_ITEM([CustomerOrderID],[WarehouseProductID],[LineProductCost],[LineProductCount])
		VALUES (@CustomerOrderID, @WarehouseProductID, @LineProductCost, @LineProductCount)
	SET @CustomerOrderLineItemID = (SELECT SCOPE_IDENTITY());

IF (@@error <> 0)
	BEGIN
		ROLLBACK TRAN T1
		RETURN (0)
	END
ELSE
	BEGIN
		COMMIT TRAN T1
		RETURN (@CustomerOrderLineItemID)
	END
GO

-- Stored Procedure to add to CustomerPayment
CREATE PROCEDURE addCustomerPayment
@CustomerOrderID INT,
@PatmentDate DATETIME,
@PaymentAmount Numeric(10,2)
AS
BEGIN TRAN T1
	DECLARE @CustomerPaymentID INT

	INSERT INTO Airplane_Parts.dbo.CUSTOMER_PAYMENT([CustomerOrderID],[PatmentDate],[PaymentAmount])
		VALUES (@CustomerOrderID, @PatmentDate, @PaymentAmount)
	SET @CustomerPaymentID = (SELECT SCOPE_IDENTITY());

IF (@@error <> 0)
	BEGIN
		ROLLBACK TRAN T1
		RETURN (0)
	END
ELSE
	BEGIN
		COMMIT TRAN T1
		RETURN (@CustomerPaymentID)
	END
GO

-- Stored Procedure to add to ProductType
CREATE PROCEDURE addProductType
@ProductTypeName varChar(50),
@ProductTypeDesc varChar(MAX)
AS
BEGIN TRAN T1
	DECLARE @ProductTypeID INT

	INSERT INTO Airplane_Parts.dbo.PRODUCT_TYPE([ProductTypeName],[ProductTypeDesc])
		VALUES (@ProductTypeName, @ProductTypeDesc)
	SET @ProductTypeID = (SELECT SCOPE_IDENTITY());

IF (@@error <> 0)
	BEGIN
		ROLLBACK TRAN T1
		RETURN (0)
	END
ELSE
	BEGIN
		COMMIT TRAN T1
		RETURN (@ProductTypeID)
	END
GO

-- Stored Procedure to add to Product
CREATE PROCEDURE addProduct
@ProductName varChar(50),
@ProductPrice Numeric(10,2),
@ProductTypeID INT,
@ProductDescription varChar(MAX)
AS
BEGIN TRAN T1
	DECLARE @ProductID INT

	INSERT INTO Airplane_Parts.dbo.PRODUCT([ProductName],[ProductPrice],[ProductTypeID],[ProductDescription])
		VALUES (@ProductName, @ProductPrice, @ProductTypeID, @ProductDescription)
	SET @ProductID = (SELECT SCOPE_IDENTITY());	

IF (@@error <> 0)
	BEGIN
		ROLLBACK TRAN T1
		RETURN (0)
	END
ELSE
	BEGIN
		COMMIT TRAN T1
		RETURN (@ProductID)
	END
GO

-- Stored Procedure to add to WarehouseProduct
CREATE PROCEDURE addWarehouseProduct
@ProductID INT,
@PWarehouseID INT
AS
BEGIN TRAN T1
	DECLARE @WarehouseProductID INT

	INSERT INTO Airplane_Parts.dbo.WAREHOUSE_PRODUCT([ProductID],[PWarehouseID])
		VALUES (@ProductID, @PWarehouseID)
	SET @WarehouseProductID = (SELECT SCOPE_IDENTITY());	

IF (@@error <> 0)
	BEGIN
		ROLLBACK TRAN T1
		RETURN (0)
	END
ELSE
	BEGIN
		COMMIT TRAN T1
		RETURN (@WarehouseProductID)
	END
GO

-- Back to Master
USE [master]
GO
