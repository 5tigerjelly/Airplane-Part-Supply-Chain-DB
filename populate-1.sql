USE [Airplane Parts]
GO

SELECT * INTO PEOPLE FROM CUSTOMER_BUILD.dbo.tblCUSTOMER
GO

DECLARE @customers INT = 1000;
DECLARE @employees INT = 1000;

GO

WHILE (@customers > 0)
	BEGIN
		DECLARE @CustomerFName varchar(60)
		DECLARE @CustomerLName varchar(60)
		DECLARE @Email varchar(75)
		DECLARE @Street varchar(120)
		DECLARE @ZipCode char(5)
		DECLARE @phone varchar(20)

		DECLARE @PersonID INTEGER

		SELECT TOP 1
			@CustomerFName = CustomerFname,
			@CustomerLName = CustomerLname,
			@Email = Email,
			@Street = CustomerAddress,
			@ZipCode = CustomerZIP,
			@phone = CONCAT( AreaCode, Phone)
		FROM PEOPLE;

		EXEC @PersonID = addCustomer @CustomerFName = @CustomerFName, @CustomerLName = @CustomerLName, @Street = @Street,  @ZipCode = @ZipCode, @CityName = @CityName, @StateName = @StateName, @CountryName = @CountryName, @RegionName = @RegionName, @Phone = @Phone, @Email = @Email

		PRINT(@PersonID)
		
		DELETE TOP (1) FROM PEOPLE
		
		SET @customers = @customers -1 
	END

GO

WHILE (@customers > 0)
	BEGIN
		DECLARE @EmployeeFname varchar(60)
		DECLARE @EmployeeLName varchar(60)
		DECLARE @Email varchar(75)
		DECLARE @Street varchar(120)
		DECLARE @ZipCode char(5)
		DECLARE @phone varchar(20)
		DECLARE @SSN INT

		DECLARE @PersonID INTEGER

		SELECT TOP 1
			@EmployeeFname = CustomerFname,
			@EmployeeLName = CustomerLname,
			@Email = Email,
			@Street = CustomerAddress,
			@ZipCode = CustomerZIP,
			@phone = CONCAT( AreaCode, Phone)
		FROM PEOPLE;

		

		EXEC @PersonID = addEmployee @EmployeeFname = @EmployeeFname, @EmployeeLName = @EmployeeLName, @SSN = @SSN, @Street = @Street,  @ZipCode = @ZipCode, @CityName = @CityName, @StateName = @StateName, @CountryName = @CountryName, @RegionName = @RegionName, @Phone = @Phone, @Email = @Email

		PRINT(@PersonID)
		
		DELETE TOP (1) FROM PEOPLE
		
		SET @customers = @customers -1 
	END

GO


USE [master]
GO