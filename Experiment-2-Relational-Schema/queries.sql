-- Experiment 2: ER Diagram to Relational Schema
-- Indian E-Commerce Platform

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Address (
    address_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    city VARCHAR(50) NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
        ON DELETE CASCADE
);

CREATE TABLE Seller (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100) NOT NULL
);

CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    seller_id INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (seller_id)
        REFERENCES Seller(seller_id)
        ON DELETE CASCADE,
    FOREIGN KEY (category_id)
        REFERENCES Category(category_id)
        ON DELETE CASCADE
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
        ON DELETE CASCADE
);

CREATE TABLE OrderItem (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
        ON DELETE CASCADE,
    FOREIGN KEY (product_id)
        REFERENCES Product(product_id)
        ON DELETE CASCADE
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
        ON DELETE CASCADE
);

CREATE TABLE Delivery (
    delivery_id INT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    address_id INT,
    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
        ON DELETE CASCADE,
    FOREIGN KEY (address_id)
        REFERENCES Address(address_id)
        ON DELETE SET NULL
);

-- Sample Data

INSERT INTO Customer VALUES
(1, 'Aman Sharma', 'aman@example.com'),
(2, 'Riya Verma', 'riya@example.com');

INSERT INTO Address VALUES
(101, 1, 'Lucknow'),
(102, 2, 'Kanpur');

INSERT INTO Seller VALUES
(201, 'Tech Store'),
(202, 'Fashion Hub');

INSERT INTO Category VALUES
(301, 'Electronics'),
(302, 'Clothing');

INSERT INTO Product VALUES
(401, 'Keyboard', 799.00, 201, 301),
(402, 'T-Shirt', 499.00, 202, 302);

INSERT INTO Orders VALUES
(501, 1, '2026-10-10'),
(502, 2, '2026-10-11');

INSERT INTO OrderItem VALUES
(601, 501, 401, 1),
(602, 502, 402, 2);

INSERT INTO Payment VALUES
(701, 501, 799.00, 'UPI'),
(702, 502, 998.00, 'Card');

INSERT INTO Delivery VALUES
(801, 501, 101),
(802, 502, 102);

-- Display Sample Data

SELECT * FROM Customer;
SELECT * FROM Address;
SELECT * FROM Seller;
SELECT * FROM Category;
SELECT * FROM Product;
SELECT * FROM Orders;
SELECT * FROM OrderItem;
SELECT * FROM Payment;
SELECT * FROM Delivery;

-- Test UNIQUE Constraint
-- This statement should produce an error because
-- customer_id 1 already has aman@example.com.
-- Run separately only when testing the constraint.

-- INSERT INTO Customer
-- VALUES (3, 'Test User', 'aman@example.com');