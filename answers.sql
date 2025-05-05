-- -----------------------------------------------------
-- QUESTION 1: Achieving First Normal Form (1NF)
-- -----------------------------------------------------
-- The original table has a column 'Products' with multiple values in one cell.
-- This violates 1NF because each cell must hold only a single atomic value.
-- We fix this by separating each product into its own row.

-- Drop the table if it already exists to avoid conflicts
DROP TABLE IF EXISTS ProductDetail_1NF;

-- Create a new table where each product is in a separate row
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Insert normalized data: each product appears in a separate row
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Now each row has only one product, satisfying 1NF

-- -----------------------------------------------------
-- QUESTION 2: Achieving Second Normal Form (2NF)
-- -----------------------------------------------------
-- In the previous 1NF table, CustomerName depends only on OrderID.
-- This is a partial dependency because the table has a composite key (OrderID, Product).
-- To fix this and achieve 2NF, we separate data into two tables:
--   1. Orders table: contains OrderID and CustomerName
--   2. OrderDetails table: contains OrderID, Product, and Quantity

-- Drop the tables if they already exist
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS OrderDetails_2NF;

-- Create the Orders table to store OrderID and CustomerName
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create the OrderDetails table to store OrderID, Product, and Quantity
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert data into OrderDetails table
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- This structure ensures that all non-key attributes depend on the full primary key.
-- The design now satisfies Second Normal Form (2NF).

