
-- creating database
CREATE DATABASE database_assignment;

-- creating table
CREATE TABLE customers( 
First_name VARCHAR(10),
Last_name VARCHAR(10),
Date_of_Birth VARCHAR(15),
Phone VARCHAR(15),
Address VARCHAR(20),
City VARCHAR(10),
State VARCHAR(10),
Points INT(5)
);

SELECT * FROM customers

INSERT INTO customers(First_name, Last_name, Date_of_Birth, Phone, Address, City, State, Points) VALUES
('Babara','MacCaffrey','1986-03-28','781-932-9754','0 Sage Terrace','Waltham','MA','2273'),
('Ines','Brushfield','1986-04-13','804-427-9456','14187 Commercial Trail','Hampton','VA','947'),
('Freddi','Boagey','1985-02-07','719-724-7869','251 Springs Junction','Colorado Springs','CO','2967'),
('Ambur','Roseburgh','1974-04-14','407-231-8017','30 Arapahoe Terrace','Orlando','FL','457'),
('Clemmie','Betchley','1973-11-07','Null','5 Spohn Circle','Arlington','TX','3675');

-- Show only 2 members whose points are more than 1000
SELECT * FROM customers WHERE points>100 LIMIT 2;

-- Find the customers whose age is in 1980 to 1990 or points less than 1000.
SELECT * FROM customers WHERE Date_of_Birth  BETWEEN '1980-01-01' AND '1990-12-30' OR points<1000;

-- Order the customers by points in ascending order.
SELECT * FROM customers ORDER BY points ASC

-- Find the customer whose name contains 'burgh' using Regular Expression.
SELECT * FROM customers WHERE First_name OR Last_name REGEXP 'burgh';

-- Find the customer who does not have phone number.
SELECT * FROM customers WHERE Phone = 'Null';

-- Change the 'Date of Birth' column name into 'dob'.
ALTER TABLE customers CHANGE COLUMN Date_of_Birth dob DATE;

-- Find the max point holder customer name.
SELECT First_name,Last_name, MAX(Points) FROM customers;

-- Execute a query for the following scenario.
-- If customers have points less than 1000, they are bronze member.
-- If customers have points more than 1000 and less than 2000, they are silver member.
-- If customers have points more than 2000 and less than 3000, they are gold member.
-- If customers have points more than 3000, they are platinum member.

SELECT  points,
CASE
    WHEN points<1000 THEN 'they are bronze member.'
    WHEN points<2000 AND points>1000 THEN 'they are silver customer.'
    WHEN points<3000 AND points>2000 THEN 'they are gold customer.'
    ELSE 'they are platinum customer.'
END AS remarks FROM customers;

