USE [Airplane Parts]
GO

INSERT INTO VENDOR (VendorName,VendorDescription,Email,Phone) VALUES ('Triumph Aerostructures','riumph Group, Inc., headquartered in Berwyn, Pennsylvania, is a global leader in manufacturing and overhauling aerospace structures, systems and components. ','solutions@triumphgroup.com','6102511000');
INSERT INTO VENDOR (VendorName,VendorDescription,Email,Phone) VALUES ('Aero Adventure Aviation','Aero Adventure, LLC. builds and supports the best value in amphibious aircraft available today. Located in DeLand, Florida, we are 25 minutes west of the worlds most famous beach, Daytona Beach.','aeroadventurellc@gmail.com','8664945367');
INSERT INTO VENDOR (VendorName,VendorDescription,Email,Phone) VALUES ('Boeing','Boeing is the world''s largest aerospace company and leading manufacturer of commercial jetliners and defense, space and security systems. ','info@futureofflight.org','3125442000');

GO

INSERT INTO EXECUTIVE_POSITION (ExecutivePositionName,ExecutiveDepartment) VALUES ('Chairman','Often a semi-retired president or company founder. Denotes a position with considerable power within the company exercised through behind-the-scenes influence via the active president');
INSERT INTO EXECUTIVE_POSITION (ExecutivePositionName,ExecutiveDepartment) VALUES ('Vice chairman','the vice-chairman commonly holds the CEO title');
INSERT INTO EXECUTIVE_POSITION (ExecutivePositionName,ExecutiveDepartment) VALUES ('President','Often CEO of the corporation. Some companies do not have the \"chairman\" position, in which case the \"president\" is the top position that is equally respected and authoritative');
INSERT INTO EXECUTIVE_POSITION (ExecutivePositionName,ExecutiveDepartment) VALUES ('Deputy president','Reports to the president');
INSERT INTO EXECUTIVE_POSITION (ExecutivePositionName,ExecutiveDepartment) VALUES ('Deputy general manager','Direct subordinate');
INSERT INTO EXECUTIVE_POSITION (ExecutivePositionName,ExecutiveDepartment) VALUES ('Assistant manager','Denotes a head of a team/section underneath a larger division/department.');

GO

INSERT INTO PRODUCT_TYPE (ProductTypeName,ProductTypeDesc) VALUES ('Engine','a machine for converting thermal energy into mechanical energy or power to produce force and motion.');
INSERT INTO PRODUCT_TYPE (ProductTypeName,ProductTypeDesc) VALUES ('Chair','a seat, especially for one person, usually having four legs for support and a rest for the back and often having rests for the arms.');
INSERT INTO PRODUCT_TYPE (ProductTypeName,ProductTypeDesc) VALUES ('Fuselage','the complete central structure to which the wing, tail surfaces, and engines are attached on an airplane.');
INSERT INTO PRODUCT_TYPE (ProductTypeName,ProductTypeDesc) VALUES ('flaps',' devices used to alter the lift characteristics of a wing');
INSERT INTO PRODUCT_TYPE (ProductTypeName,ProductTypeDesc) VALUES ('rudder','a vertical blade at the stern of a vessel that can be turned horizontally to change the vessel''s direction when in motion');
INSERT INTO PRODUCT_TYPE (ProductTypeName,ProductTypeDesc) VALUES ('wheel','a circular frame or disk arranged to revolve on an axis');
INSERT INTO PRODUCT_TYPE (ProductTypeName,ProductTypeDesc) VALUES ('slats','a control surface along the leading edge of a wing that can be extended forward to create a gap (slot) to improve airflow');
INSERT INTO PRODUCT_TYPE (ProductTypeName,ProductTypeDesc) VALUES ('spoiler','a device used to break up the airflow around an aerodynamic surface, as an aircraft wing, in order to slow the movement through the air or to decrease the lift on the surface and, as a result, provide bank or descent control');
INSERT INTO PRODUCT_TYPE (ProductTypeName,ProductTypeDesc) VALUES ('stabillizer','to put or keep (an aircraft) in stable equilibrium, as by some special device');
INSERT INTO PRODUCT_TYPE (ProductTypeName,ProductTypeDesc) VALUES ('Instruments','instruments in the cockpit of an aircraft that provide the pilot with information about the flight situation of that aircraft');

GO

INSERT INTO PRODUCT (ProductName,ProductPrice,ProductTypeID,ProductDescription) VALUES ('Tailwheel','35','6','Six inch tailwheel as shipped in the RV kit for 3/8\" axle only. Will not fit single-sided Tailwheel Mount by Aviation Products');
INSERT INTO PRODUCT (ProductName,ProductPrice,ProductTypeID,ProductDescription) VALUES ('GNX IO-360-C1D6','41750.00','1','Fuel Injected 4 Cylinder 200 HP Experimental Engine with Genuine Lycoming Roller Camshaft & Lifter Technology');
INSERT INTO PRODUCT (ProductName,ProductPrice,ProductTypeID,ProductDescription) VALUES ('FREEFLIGHT TRA3000/TRI40','6019.00','10','TRA3000/TRI40 / Radar Altimeter System 28V');
INSERT INTO PRODUCT (ProductName,ProductPrice,ProductTypeID,ProductDescription) VALUES ('MID-CONTINENT INSTRUMENTS 15020-01103','3920.00','10','15020-01103 / 35K Millibar 2\" Altimeter');
INSERT INTO PRODUCT (ProductName,ProductPrice,ProductTypeID,ProductDescription) VALUES ('Insight Gyro 4000','3562.00','10','The Insight Gyro 4000 is based on the best heading system in the industry, the Sperry/Honeywell C-14A. The C-14A rotors are equipped with long life bearings rated for 10,000 hours. Combining the C-14A with special interface circuitry in a compatible package, the Gyro 4000 is a plug-in replacement for the old JET DN-101 or DN-104.');
INSERT INTO PRODUCT (ProductName,ProductPrice,ProductTypeID,ProductDescription) VALUES ('Falcon 50 OUTBD LD Edge Slats','144000.00','7','Repaired by Metal Air Service July 2014, LH and RH Falcon 50 OUTBD Leading Edge Slats with 8130-3. P/Ns F50B134000 and F50B144000. Sold outright, no trade-in. Located in Seymour,IN. 812-343-8543');
INSERT INTO PRODUCT (ProductName,ProductPrice,ProductTypeID,ProductDescription) VALUES ('Republic Seabee Seat Assembly','976.00','2','Airtex chair upholstery sets are not to be confused with Slip-covers, as they completely replace the old upholstery. Airtex upholstered cushion sets and bucket seat type upholstery sets include all new cushioning. They are beautifully made to order by expert craftsmen who take pride in their workmanship. All main panels are quilted through a layer of polyfoam, backed with Dacron fabric for maximum strength and long wear. Map pockets are provided, as in the original. If at all possible, please send photos of seats.');
INSERT INTO PRODUCT (ProductName,ProductPrice,ProductTypeID,ProductDescription) VALUES ('13-14180','5400.00','8','Kennon Wind Spoilers are a strip of soft fiber filled tubes that attach to the wing to slow airflow over the top and to prevent lift. An airplane was built to fly, given a strong wind, the plane will fly without you and no tie down will restrain a flying airplane for long. During the stormy winter of 1998, over 200 airplanes were picked up and destroyed by strong winds. Kennon Wind Spoilers could have saved many of these aircraft. The wind spoilers cover the leading edge of the wings but not the tips, and most are about 14-1/2 feet long (per wing). Specify aircraft make, model, and year when ordering.');
INSERT INTO PRODUCT (ProductName,ProductPrice,ProductTypeID,ProductDescription) VALUES ('Kennon Lift Spoiler Strip','3800.00','8','Strap them on your wings and your plane won''t fly without you. Soft fabric spoilers destroy the airflow over the wing and prevent lift! One sise fits all aircraft.');
INSERT INTO PRODUCT (ProductName,ProductPrice,ProductTypeID,ProductDescription) VALUES ('Stearman Seat Assembly','470.00','2','Airtex chair upholstery sets are not to be confused with Slip-covers, as they completely replace the old upholstery. Airtex upholstered cushion sets and bucket seat type upholstery sets include all new cushioning. They are beautifully made to order by expert craftsmen who take pride in their workmanship. All main panels are quilted through a layer of polyfoam, backed with Dacron fabric for maximum strength and long wear. Map pockets are provided, as in the original. If at all possible, please send photos of seats.');
INSERT INTO PRODUCT (ProductName,ProductPrice,ProductTypeID,ProductDescription) VALUES ('BD4','1500.00','3','BD4 Fuslage');
INSERT INTO PRODUCT (ProductName,ProductPrice,ProductTypeID,ProductDescription) VALUES ('Piper Navajo','7000.00','4','Navajo-Flap Amplifier, #551-992 Tested/works. Sold AS IS');
INSERT INTO PRODUCT (ProductName,ProductPrice,ProductTypeID,ProductDescription) VALUES ('Taylorcraft B series','498.00','2','Airtex chair upholstery sets are not to be confused with Slip-covers, as they completely replace the old upholstery. Airtex upholstered cushion sets and bucket seat type upholstery sets include all new cushioning. They are beautifully made to order by expert craftsmen who take pride in their workmanship. All main panels are quilted through a layer of polyfoam, backed with Dacron fabric for maximum strength and long wear. Map pockets are provided, as in the original. If at all possible, please send photos of seats.');
INSERT INTO PRODUCT (ProductName,ProductPrice,ProductTypeID,ProductDescription) VALUES ('Rudder Pedal','250.00','5','Part Number: AP2000-01 Description: RUDDER PEDAL FAA-PMA PMA Supplement AP1 Qty per Aircraft: 4 Unit of Measure: EACH');
INSERT INTO PRODUCT (ProductName,ProductPrice,ProductTypeID,ProductDescription) VALUES ('Piper stabilizer','350.00','9','PN 64274. Univair Is Your Source For Piper Parts. Search Univair''s Inventory By Part Number In The Trade-A-Plane Parts Catalog Or Click Photo On This Listing''s Page To Purchase This Specific Item.');
GO

INSERT INTO CARRIER (CarrierName) VALUES ('Fedex');
INSERT INTO CARRIER (CarrierName) VALUES ('UPS');
INSERT INTO CARRIER (CarrierName) VALUES ('USPS');
INSERT INTO CARRIER (CarrierName) VALUES ('World Cargo International');
INSERT INTO CARRIER (CarrierName) VALUES ('Lynden International');
INSERT INTO CARRIER (CarrierName) VALUES ('DHL Express');

GO

EXEC addWarehouse 'Connecticut','Sits on 13.51 acres:(2 Bldgs) 1-Indust Pre-Eng Warehs Style w/Office, 1 lev, 2458 s/f, Wood frame, Wall height 12'', Metal Roof-Shed style','27 Iffland pond Road','06759','Litchfield','Connecticut','United States','North America'
GO

EXEC addWarehouse 'Florida','Auction.com is pleased to present the sale of a two-tenant, three-building, 580,278 sf leasable industrial complex located on 28 acres of land','5245 Commonwealth Avenue','32254','Jacksonville','Florida','United States','North America'
GO

EXEC addWarehouse 'New Hampshire','Credit card deposits will not be accepted for this asset. Deposits will need to be made by wire transfer or cashier''s check only','160 Burke Street, Nashua','03105','Nashua','New Hampshire','United States','North America'
GO

EXEC addWarehouse 'Qingdao, China','global supply chain management solutions provider with locations throughout the world including Qingdao, China','6C Building No.2 Qingdao Software Park No.288 Ningxia Road','26607','Qingdao','Shandong','China','Asia'
GO

EXEC addWarehouse 'Yusen, Korea','Yusen Logistics (Korea) Co.,Ltd. has contributed to development of the distribution industry in line with Korea''s growing economy over the past 20 years.','16F Shinhan Investment Corp. Tower, 23-2, Yoido-Dong, Youngdeungpo-Gu','150-712','Seoul','Gyeonggi','Korea','Asia'
GO

EXEC addWarehouse 'Japan','Yusen Logistics Co','Sumitomo Fudosan Shiba-Koen Tower 2-11-1, Shiba-Koen Minato-ku','105-0011','Tokyo','Japan','Japan','Asia'
GO

EXEC addWarehouse 'Hong Kong','Yusen Logistics','22/F., Goodman Interlink, 39 Tsing Yi Road','','Tsing Yi','Hong Kong','China','Asia'
GO

USE [master]
GO