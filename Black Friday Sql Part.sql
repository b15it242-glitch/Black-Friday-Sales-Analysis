create database Black_Friday_Data;
use Black_Friday_Data;
CREATE TABLE black_friday_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT NOT NULL,
    Product_ID VARCHAR(20) NOT NULL,
    Gender CHAR(1),
    Age VARCHAR(10),
    Occupation INT,
    City_Category CHAR(1),
    Stay_In_Current_City_Years INT,
    Marital_Status INT,
    Product_Category_1 INT,
    Product_Category_2 INT,
    Product_Category_3 INT,
    Purchase INT NOT NULL,
    
    CHECK (Purchase > 0)
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Black Friday Data.csv"
INTO TABLE black_friday_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
User_ID,
Product_ID,
Gender,
Age,
Occupation,
City_Category,
Stay_In_Current_City_Years,
Marital_Status,
Product_Category_1,
Product_Category_2,
Product_Category_3,
Purchase

);

-- Customer View
CREATE VIEW customer_info AS
SELECT DISTINCT
    User_ID,
    Gender,
    Age,
    Occupation,
    City_Category,
    Stay_In_Current_City_Years,
    Marital_Status
FROM black_friday_data;

-- Product View
CREATE VIEW product_info AS
SELECT DISTINCT
    Product_ID,
    Product_Category_1,
    Product_Category_2,
    Product_Category_3
FROM black_friday_data;

-- Transaction View
CREATE VIEW transaction_data AS
SELECT
    User_ID,
    Product_ID,
    Purchase
FROM black_friday_data;


-- Check Row Count
SELECT COUNT(*) FROM Black_Friday_Data;

-- Spot Check Random Rows
SELECT * FROM Black_Friday_Data LIMIT 10;
SELECT * FROM Black_Friday_Data ORDER BY RAND() LIMIT 10;

-- Sanity Check Queries
-- 1 Total Transactions
SELECT COUNT(*) AS total_transactions FROM Black_Friday_Data;

-- 2️ Distinct Customers
SELECT COUNT(DISTINCT User_ID) AS distinct_customers FROM Black_Friday_Data;

-- 3 Distinct Products
SELECT COUNT(DISTINCT Product_ID) AS distinct_products FROM Black_Friday_Data;






SET
Product_Category_2 = NULLIF(@Product_Category_2,''),
Product_Category_3, = NULLIF(@Product_Category_3,'');
