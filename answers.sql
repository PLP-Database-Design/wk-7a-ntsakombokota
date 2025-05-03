Question 1
SELECT 
    OrderID,
    CustomerName,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', n.n), ',', -1)) AS Product
FROM 
    ProductDetail
JOIN (
    SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3  -- Adjust based on max number of products per row
) AS n
ON CHAR_LENGTH(Products) - CHAR_LENGTH(REPLACE(Products, ',', '')) >= n.n - 1;

Question 2
  
SELECT DISTINCT 
    OrderID,              -- Unique order identifier
    CustomerName          -- This should only appear once per OrderID
FROM 
    OrderDetails;         -- Original partially normalized table

Question 2b
SELECT 
    OrderID,              -- Foreign key to Orders
    Product,              -- Product purchased
    Quantity              -- How many units were ordered
FROM 
    OrderDetails;
