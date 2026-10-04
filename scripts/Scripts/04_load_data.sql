
USE foodtrack;
GO
 
DELETE FROM order_items;
DELETE FROM locations;
DELETE FROM products;
DELETE FROM orders;
DELETE FROM foodtrucks;
GO
 
BULK INSERT foodtrucks  FROM 'C:\Users\laura\Downloads\henry\M2\homeworkP1\foodtrack-db\data\foodtrucks.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', CODEPAGE = '65001', CHECK_CONSTRAINTS);
 
BULK INSERT products    FROM 'C:\Users\laura\Downloads\henry\M2\homeworkP1\foodtrack-db\data\products.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', CODEPAGE = '65001', CHECK_CONSTRAINTS);
 
GO
CREATE OR ALTER VIEW v_orders_load AS
    SELECT order_id, foodtruck_id, order_date, status, total FROM orders;
GO
BULK INSERT v_orders_load FROM 'C:\Users\laura\Downloads\henry\M2\homeworkP1\foodtrack-db\data\orders.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', CODEPAGE = '65001', CHECK_CONSTRAINTS);
 
BULK INSERT order_items FROM 'C:\Users\laura\Downloads\henry\M2\homeworkP1\foodtrack-db\data\order_items.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', CODEPAGE = '65001', CHECK_CONSTRAINTS);
 
BULK INSERT locations   FROM 'C:\Users\laura\Downloads\henry\M2\homeworkP1\foodtrack-db\data\locations.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', CODEPAGE = '65001', CHECK_CONSTRAINTS);
GO
 
DROP VIEW v_orders_load;
GO


SELECT * from products