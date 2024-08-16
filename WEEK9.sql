CREATE DATABASE PRODUCT;
USE PRODUCT;
CREATE TABLE Product (
    ProductNumber INT PRIMARY KEY,
    ProductName VARCHAR(255),
    SellingPrice DECIMAL(10, 2),
    ManufacturerName VARCHAR(255)
);

CREATE TABLE Client (
    ClientID INT PRIMARY KEY,
    ClientName VARCHAR(255),
    ClientAddress VARCHAR(255),
    City VARCHAR(100),
    PinCode VARCHAR(20),
    TotalBalance DECIMAL(10, 2)
);

CREATE TABLE Salesman (
    SalesmanNumber INT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    PinCode VARCHAR(20),
    Salary DECIMAL(10, 2)
);
CREATE TABLE SalesOrder (
    SalesOrderNumber INT PRIMARY KEY,
    SalesOrderDate DATE,
    ClientID INT,
    SalesmanNumber INT,
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
    FOREIGN KEY (SalesmanNumber) REFERENCES Salesman(SalesmanNumber)
);

-- Inserting into Product table
INSERT INTO Product (ProductNumber, ProductName, SellingPrice, ManufacturerName) VALUES
(1, 'Laptop', 1500.00, 'Lenovo'),
(2, 'Smartphone', 800.00, 'Samsung'),
(3, 'Tablet', 300.00, 'Apple'),
(4, 'Headphones', 50.00, 'Sony'),
(5, 'Camera', 1200.00, 'Canon');

-- Inserting into Client table
INSERT INTO Client (ClientID, ClientName, ClientAddress, City, PinCode, TotalBalance) VALUES
(1, 'John Doe', '123 Main St', 'New York', '10001', 5000.00),
(2, 'Jane Smith', '456 Elm St', 'Los Angeles', '90001', 2000.00),
(3, 'Alice Johnson', '789 Oak St', 'Chicago', '60601', 10000.00),
(4, 'Bob Brown', '101 Pine St', 'Houston', '77001', 7000.00),
(5, 'Charlie Davis', '202 Maple St', 'San Francisco', '94101', 3000.00);

-- Inserting into Salesman table
INSERT INTO Salesman (SalesmanNumber, Name, Address, City, PinCode, Salary) VALUES
(1, 'Michael Scott', '1 Dunder Mifflin Way', 'Scranton', '18501', 50000.00),
(2, 'Dwight Schrute', '2 Dunder Mifflin Way', 'Scranton', '18501', 45000.00),
(3, 'Jim Halpert', '3 Dunder Mifflin Way', 'Scranton', '18501', 40000.00),
(4, 'Pam Beesly', '4 Dunder Mifflin Way', 'Scranton', '18501', 35000.00),
(5, 'Stanley Hudson', '5 Dunder Mifflin Way', 'Scranton', '18501', 30000.00);

-- Inserting into SalesOrder table
INSERT INTO SalesOrder (SalesOrderNumber, SalesOrderDate, ClientID, SalesmanNumber) VALUES
(1, '2024-04-01', 1, 1),
(2, '2024-04-02', 2, 2),
(3, '2024-04-03', 3, 3),
(4, '2024-04-04', 4, 4),
(5, '2024-04-05', 5, 5);

SELECT ClientName, City FROM Client;


SELECT * FROM Product;


SELECT ClientName FROM Client WHERE SUBSTRING(ClientName, 2, 1) = 'a';


SELECT * FROM Client WHERE City = 'ALIGARH';


SELECT * FROM Product WHERE SellingPrice > 2000 AND SellingPrice <= 5000;


SELECT * FROM Product ORDER BY ProductName;




