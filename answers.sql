-- Question 1
-- First, create an Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Then create an OrderProducts table
CREATE TABLE OrderProducts (
    OrderProductID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    Product VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into Orders
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert data into OrderProducts
INSERT INTO OrderProducts (OrderID, Product) VALUES
(101, 'Laptop'),
(101, 'Mouse'),
(102, 'Tablet'),
(102, 'Keyboard'),
(102, 'Mouse'),
(103, 'Phone');


-- Question 2
-- First, create Customers table to remove partial dependency
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Then create Orders table referencing Customers
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create Products table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(50)
);

-- Create OrderItems junction table
CREATE TABLE OrderItems (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert data
-- First insert customers
INSERT INTO Customers (CustomerName) VALUES
('John Doe'),
('Jane Smith'),
('Emily Clark');

-- Then insert orders
INSERT INTO Orders (OrderID, CustomerID) VALUES
(101, 1),
(102, 2),
(103, 3);

-- Insert products
INSERT INTO Products (ProductName) VALUES
('Laptop'),
('Mouse'),
('Tablet'),
('Keyboard'),
('Phone');

-- Finally insert order items
INSERT INTO OrderItems (OrderID, ProductID, Quantity) VALUES
(101, 1, 2),  -- Order 101, Laptop
(101, 2, 1),  -- Order 101, Mouse
(102, 3, 3),  -- Order 102, Tablet
(102, 4, 1),  -- Order 102, Keyboard
(102, 2, 2),  -- Order 102, Mouse
(103, 5, 1);  -- Order 103, Phone