CREATE DATABASE SALESMAN;
DROP DATABASE SALESMAN;
USE SALESMAN;
CREATE TABLE SALESMAN_MASTER(
SALESMANNO VARCHAR(100),SALESMANNAME VARCHAR(100),ADDRESS1 VARCHAR(100),ADDRESS2 VARCHAR(100),CITY VARCHAR(100),PINCODE INT(100),STATE VARCHAR(100),SALAMT INT(100));

INSERT INTO SALESMAN_MASTER
VALUES
("S00001","AMAN","A/14","WORLI","MUMBAI",400002,"MAHARASHTRA",3500),
("S00002","OMKAR","65","NARIMAN","MUMBAI",400001,"MAHARASHTRA",4000),
("S00003","RAJ","P-7","BANDRA","MUMBAI",400032,"MAHARASHTRA",5000),
("S00004","ASHISH","A/5","JUHU","MUMBAI",400044,"MAHARASHTRA",3500);

SELECT*FROM SALESMAN_MASTER;

DELETE FROM SALESMAN_MASTER
WHERE SALAMT= 3500;

ALTER TABLE Salesman_Master
RENAME TO sman_mast;

SELECT* FROM sman_mast;


