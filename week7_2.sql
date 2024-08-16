create database branch;
use  branch;
CREATE TABLE BRANCH (
    branch_name VARCHAR(255) PRIMARY KEY,
    branch_city VARCHAR(255),
    assets REAL
);

CREATE TABLE ACCOUNT (
    accno INT PRIMARY KEY,
    branch_name VARCHAR(255),
    balance REAL,
    FOREIGN KEY (branch_name) REFERENCES BRANCH(branch_name)
);



CREATE TABLE DEPOSITOR (
    customer_name VARCHAR(255),
    accno INT,
    PRIMARY KEY (customer_name, accno),
    FOREIGN KEY (accno) REFERENCES ACCOUNT(accno)
);

CREATE TABLE CUSTOMER (
    customer_name VARCHAR(255) PRIMARY KEY,
    customer_street VARCHAR(255),
    customer_city VARCHAR(255)
);

CREATE TABLE LOAN (
    loan_number INT PRIMARY KEY,
    branch_name VARCHAR(255),
    amount REAL,
    FOREIGN KEY (branch_name) REFERENCES BRANCH(branch_name)
);

CREATE TABLE BORROWER (
    customer_name VARCHAR(255),
    loan_number INT,
    PRIMARY KEY (customer_name, loan_number),
    FOREIGN KEY (loan_number) REFERENCES LOAN(loan_number)
);


-- BRANCH
INSERT INTO BRANCH (branch_name, branch_city, assets) VALUES
('Main', 'New York', 500000),
('Downtown', 'New York', 300000),
('Uptown', 'New York', 200000),
('Downtown', 'Los Angeles', 400000),
('East', 'Los Angeles', 250000);

-- ACCOUNT
INSERT INTO ACCOUNT (accno, branch_name, balance) VALUES
(101, 'Main', 1000),
(102, 'Main', 2000),
(103, 'Main', 3000),
(104, 'Downtown', 1500),
(105, 'Uptown', 2500);

-- DEPOSITOR
INSERT INTO DEPOSITOR (customer_name, accno) VALUES
('Alice', 101),
('Bob', 102),
('Alice', 103),
('Charlie', 104),
('David', 105);

-- CUSTOMER
INSERT INTO CUSTOMER (customer_name, customer_street, customer_city) VALUES
('Alice', '123 Main St', 'New York'),
('Bob', '456 Elm St', 'New York'),
('Charlie', '789 Oak St', 'Los Angeles'),
('David', '321 Maple St', 'Los Angeles'),
('Eve', '555 Pine St', 'New York');

-- LOAN
INSERT INTO LOAN (loan_number, branch_name, amount) VALUES
(201, 'Main', 10000),
(202, 'Main', 15000),
(203, 'Downtown', 20000),
(204, 'Uptown', 25000),
(205, 'East', 30000);

-- BORROWER
INSERT INTO BORROWER (customer_name, loan_number) VALUES
('Alice', 201),
('Bob', 202),
('Charlie', 203),
('David', 204),
('Eve', 205);


SELECT DISTINCT customer_name
FROM DEPOSITOR
WHERE branch_name = 'Main Branch'
GROUP BY customer_name
HAVING COUNT(accno) >= 2;


SELECT DISTINCT d.customer_name
FROM DEPOSITOR d
WHERE NOT EXISTS (
    SELECT b.branch_name
    FROM BRANCH b
    WHERE b.branch_city = 'New York'
    AND NOT EXISTS (
        SELECT a.accno
        FROM ACCOUNT a
        WHERE a.branch_name = b.branch_name
        AND a.accno = d.accno
    )
);



DELETE FROM ACCOUNT
WHERE branch_name IN (
    SELECT branch_name
    FROM BRANCH
    WHERE branch_city = 'New York'
);




