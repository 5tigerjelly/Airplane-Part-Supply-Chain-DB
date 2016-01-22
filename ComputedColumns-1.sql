USE [Airplane Parts]
GO

-- Line Item Totals
ALTER TABLE dbo.CUSTOMER_ORDER_LINE_ITEM DROP COLUMN LineProductTotal;
GO
ALTER TABLE dbo.CUSTOMER_ORDER_LINE_ITEM ADD LineProductTotal AS (LineProductCost * LineProductCount);
GO

ALTER TABLE dbo.VENDOR_ORDER_LINE_ITEM DROP COLUMN PurchaseTotal;
GO
ALTER TABLE dbo.VENDOR_ORDER_LINE_ITEM ADD PurchaseTotal AS (PurchasePrice * PurchaseCount);
GO

-- Order Total
CREATE FUNCTION dbo.CustomerOrderTotal(@CustomerOrderID INT)
RETURNS INT
AS
BEGIN
	RETURN (
		SELECT SUM(LineProductTotal)
		FROM CUSTOMER_ORDER_LINE_ITEM
		WHERE CustomerOrderID = @CustomerOrderID
	)
END
GO

ALTER TABLE dbo.CUSTOMER_ORDER DROP COLUMN OrderTotal
GO
ALTER TABLE dbo.CUSTOMER_ORDER 
	ADD OrderTotal AS dbo.CustomerOrderTotal(CustomerOrderID)
GO

-- Order Total
CREATE FUNCTION dbo.VendorOrderTotal(@VendorOrderID INT)
RETURNS INT
AS
BEGIN
	RETURN (
		SELECT SUM(PurchaseTotal)
		FROM VENDOR_ORDER_LINE_ITEM
		WHERE VendorOrderID = @VendorOrderID
	)
END
GO

ALTER TABLE dbo.VENDOR_ORDER DROP COLUMN OrderTotal
GO
ALTER TABLE dbo.VENDOR_ORDER 
	ADD OrderTotal AS dbo.VendorOrderTotal(VendorOrderID)
GO

-- Inventory
CREATE FUNCTION dbo.WarehouseProductInventory(@WarehouseProductID INT)
RETURNS INT
AS
BEGIN
	DECLARE @VENDOR INT
	DECLARE @CUSTOMER INT

	SET @VENDOR = (
		SELECT SUM(PurchaseCount)
		FROM VENDOR_ORDER_LINE_ITEM
		WHERE WarehouseProductID = @WarehouseProductID
	)

	SET @CUSTOMER = (
		SELECT SUM(LineProductTotal)
		FROM CUSTOMER_ORDER_LINE_ITEM
		WHERE WarehouseProductID = @WarehouseProductID
	)

	RETURN (@VENDOR - @CUSTOMER)

END
GO

ALTER TABLE dbo.WAREHOUSE_PRODUCT DROP COLUMN Quantity
GO
ALTER TABLE dbo.WAREHOUSE_PRODUCT 
	ADD Quantity AS dbo.WarehouseProductInventory(WarehouseProductID)
GO

-- Product Total
CREATE FUNCTION dbo.TotalProductInventory(@ProductID INT)
RETURNS INT
AS
BEGIN
	RETURN  (
		SELECT SUM(Quantity)
		FROM WAREHOUSE_PRODUCT
		WHERE ProductID = @ProductID
	)

END
GO

ALTER TABLE dbo.PRODUCT DROP COLUMN ProductQuantity
GO
ALTER TABLE dbo.PRODUCT 
	ADD ProductQuantity AS dbo.TotalProductInventory(ProductID)
GO

-- Back to Master
USE [master]
GO
