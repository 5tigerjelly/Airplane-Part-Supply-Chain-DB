# Airplane-Part-Supply-Chain-DB

Stored Procedure to add to Customer
```sql
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
```

##Computed Columns 
Order Total
```sql
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
```
Check Inventory
```sql
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
```
