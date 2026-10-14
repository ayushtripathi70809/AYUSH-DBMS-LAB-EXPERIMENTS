– Experiment 2: ER Diagram to Relational Schema
– Indian E-commerce Platform

CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

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
category_id INT,
seller_id INT,
FOREIGN KEY (category_id)
REFERENCES Category(category_id)
ON DELETE SET NULL,
FOREIGN KEY (seller_id)
REFERENCES Seller(seller_id)
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
order_id INT,
product_id INT,
quantity INT NOT NULL,
PRIMARY KEY (order_id, product_id),
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

– Insert sample data
INSERT INTO Customer VALUES
(1, ‘Rahul Sharma’, ‘rahul@example.com’),
(2, ‘Priya Verma’, ‘priya@example.com’);

INSERT INTO Address VALUES
(101, 1, ‘Delhi’),
(102, 2, ‘Jaipur’);

INSERT INTO Seller VALUES
(201, ‘Tech Store’),
(202, ‘Fashion Store’);

INSERT INTO Category VALUES
(301, ‘Electronics’),
(302, ‘Clothing’);

INSERT INTO Product VALUES
(401, ‘Headphones’, 1500.00, 301, 201),
(402, ‘T-Shirt’, 500.00, 302, 202);

INSERT INTO Orders VALUES
(501, 1, ‘2026-10-01’),
(502, 2, ‘2026-10-02’);

INSERT INTO OrderItem VALUES
(501, 401, 1),
(502, 402, 2);

INSERT INTO Payment VALUES
(601, 501, 1500.00),
(602, 502, 1000.00);

INSERT INTO Delivery VALUES
(701, 501, 101),
(702, 502, 102);

– Display sample output
SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM Orders;

– Test referential integrity violation
– This should produce a foreign key error
INSERT INTO Address VALUES (103, 999, ‘Mumbai’);
