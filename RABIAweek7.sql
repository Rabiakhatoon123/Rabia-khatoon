CREATE DATABASE Insurance11;
USE Insurance11;

-- a) Create the above tables by properly specifying the primary keys and 
-- foreign keys.

CREATE TABLE PERSON1 (
    driver_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255)
);

SELECT * FROM PERSON1;

CREATE TABLE CAR1 (
    regno VARCHAR(50) PRIMARY KEY,
    model VARCHAR(100),
    year INT
);

CREATE TABLE ACCIDENT11 (
    report_number INT PRIMARY KEY,
    accd_date DATE,
    location VARCHAR(255)
);

CREATE TABLE OWNS111 (
    driver_id VARCHAR(10),
    regno VARCHAR(15),
    PRIMARY KEY (driver_id, regno),
    FOREIGN KEY (driver_id) REFERENCES PERSON1(driver_id),
    FOREIGN KEY (regno) REFERENCES CAR1(regno)
);


CREATE TABLE PARTICIPATED11 (
    driver_id VARCHAR(10),
    regno VARCHAR(15),
    report_number INT,
    damage_amount INT,
    PRIMARY KEY (driver_id, regno, report_number),
    FOREIGN KEY (driver_id) REFERENCES PERSON1(driver_id),
    FOREIGN KEY (regno) REFERENCES CAR1(regno),
    FOREIGN KEY (report_number) REFERENCES ACCIDENT11(report_number)
);
DROP TABLE PARTICIPATED11;

-- b) Enter at least five tuples for each relation

INSERT INTO PERSON1
VALUES
('D001', 'John Doe', '123 Main Street'),
('D002', 'Jane Smith', '456 Elm Street'),
('D003', 'Michael Johnson', '789 Oak Street'),
('D004', 'Emily Brown', '101 Pine Street'),
('D005', 'David Wilson', '234 Maple Street');

SELECT * FROM PERSON1;

INSERT INTO CAR1 (regno, model, year) VALUES
('ABC123', 'Toyota Camry', 2019),
('XYZ456', 'Honda Civic', 2018),
('DEF789', 'Ford Mustang', 2020),
('GHI101', 'Chevrolet Silverado', 2017),
('JKL234', 'Nissan Altima', 2016);

INSERT INTO CAR1 VALUES ('JHGFD12','HERO',2021);



SELECT * FROM CAR1;

INSERT INTO ACCIDENT11 (report_number, accd_date, location) VALUES
(1001, '2024-01-10', 'Intersection of Main St and Elm St'),
(1002, '2024-02-15', 'Highway 101'),
(1003, '2024-03-20', 'Parking Lot of Supermarket'),
(1004, '2008-04-25', 'Residential Area'),
(1005, '2008-05-30', 'Downtown Area');

SELECT * FROM ACCIDENT11;

INSERT INTO OWNS111 (driver_id, regno) VALUES
('D001', 'ABC123'),
('D002', 'XYZ456'),
('D003', 'DEF789'),
('D004', 'GHI101'),
('D005', 'JKL234');

SELECT * FROM OWNS111;

INSERT INTO PARTICIPATED11 (driver_id, regno, report_number, damage_amount) VALUES
('D001', 'ABC123', 1001, 5000),
('D002', 'XYZ456', 1002, 3000),
('D003', 'DEF789', 1003, 2000),
('D004', 'GHI101', 1004, 4000),
('D005', 'JKL234', 1005, 2500);

SELECT * FROM PARTICIPATED11;

-- c) Update the damage amount for the car with specific regno in the 
-- accident with report number 12 to 25000

UPDATE PARTICIPATED11
SET damage_amount = 25000
WHERE regno = 'Your_Regno_Here' AND report_number = 12;

-- d) Add a new accident to the database. 
INSERT INTO ACCIDENT11
VALUES
(1006,'2024-07-30', 'New Downtown Area');

-- e) Find the total number of people who owned cars that were involved in 
-- accidents in the year 2008.

SELECT COUNT(DISTINCT driver_id)
FROM OWNS111
WHERE regno IN (
    SELECT regno
    FROM PARTICIPATED11
    INNER JOIN ACCIDENT11 ON PARTICIPATED11.report_number = ACCIDENT11.report_number
    WHERE YEAR(accd_date) = 2008
);

SELECT COUNT(*) AS num_accidents
FROM PARTICIPATED11 P
INNER JOIN ACCIDENT11 A ON P.report_number = A.report_number
INNER JOIN CAR1 C ON P.regno = C.regno
WHERE C.model = 'HERO';

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
('Main', 'New York', 1000000.00),
('Downtown', 'New York', 750000.00),
('Uptown', 'New York', 500000.00),
('Westside', 'Los Angeles', 900000.00),
('Eastside', 'Los Angeles', 600000.00);

-- ACCOUNT
INSERT INTO ACCOUNT (accno, branch_name, balance) VALUES
(101, 'Main', 1500.00),
(102, 'Main', 2000.00),
(103, 'Main', 3000.00),
(104, 'Downtown', 2500.00),
(105, 'Downtown', 1800.00);

-- DEPOSITOR
INSERT INTO DEPOSITOR (customer_name, accno) VALUES
('John Smith', 101),
('John Smith', 102),
('Jane Doe', 103),
('Alice Johnson', 104),
('Bob Brown', 105);

-- CUSTOMER
INSERT INTO CUSTOMER (customer_name, customer_street, customer_city) VALUES
('John Smith', '123 Main St', 'New York'),
('Jane Doe', '456 Elm St', 'Los Angeles'),
('Alice Johnson', '789 Oak St', 'New York'),
('Bob Brown', '101 Pine St', 'Los Angeles'),
('Eve White', '202 Maple St', 'New York');

-- LOAN
INSERT INTO LOAN (loan_number, branch_name, amount) VALUES
(201, 'Main', 5000.00),
(202, 'Main', 7000.00),
(203, 'Downtown', 4500.00),
(204, 'Uptown', 6000.00),
(205, 'Westside', 8000.00);

-- BORROWER
INSERT INTO BORROWER (customer_name, loan_number) VALUES
('John Smith', 201),
('Jane Doe', 202),
('Alice Johnson', 203),
('Bob Brown', 204),
('Eve White', 205);


SELECT d.customer_name
FROM DEPOSITOR d
INNER JOIN ACCOUNT a ON d.accno = a.accno
WHERE a.branch_name = 'Main'
GROUP BY d.customer_name
HAVING COUNT(*) >= 2;


SELECT d.customer_name
FROM DEPOSITOR d
INNER JOIN ACCOUNT a ON d.accno = a.accno
INNER JOIN BRANCH b ON a.branch_name = b.branch_name
WHERE b.branch_city = 'New York'
GROUP BY d.customer_name
HAVING COUNT(DISTINCT b.branch_name) = (SELECT COUNT(*) FROM BRANCH WHERE branch_city = 'New York');


DELETE FROM ACCOUNT
WHERE branch_name IN (SELECT branch_name FROM BRANCH WHERE branch_city = 'Los Angeles');

