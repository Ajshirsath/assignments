CREATE DATABASE  CONTACT_DATABASE;
USE CONTACT_DATABASE;

CREATE TABLE COMPANY(
		COMPANY_ID int ,
        COMAPNY_NAME VARCHAR(45),
          STREET VARCHAR(45),
        CITY VARCHAR(45),
        STATE VARCHAR(2),
        ZIP VARCHAR(10)
);
        

CREATE TABLE CONTACT_TABLE(
		COMPANY_ID int,
        COMAPNY_NAME VARCHAR(45),
        STREET VARCHAR(45),
        CITY VARCHAR(45),
        STATE VARCHAR(2),
        ZIP VARCHAR(10),
        ISMAIN BOOLEAN,
        EMAIL varchar(45),
        PHONE VARCHAR(12)
);

CREATE TABLE CONTACT_EMPLOYEE(
		CONTACTEMPLOYEE_ID INT,
        CONTACT_ID INT,
        EMPLOYEE_ID INT,
        CONTACTDATE DATE,
        DESCRIPTION VARCHAR(100)
);

CREATE TABLE EMPLOYEE(
		EMPLOYEE_ID INT,
        FIRST_NAME VARCHAR(45),
        LAST_NAME VARCHAR(45),
        SALARY DECIMAL(10,2),
        HIRE_DATE DATE,
        JOB_TITLE VARCHAR(25),
        EMAIL VARCHAR(45),
        PHONE VARCHAR(12)
);


INSERT INTO COMPANY
	VALUES(1, 'TechNova Solutions',     '101 Innovation Dr',      'San Jose',     'CA', '95134'),
    (2, 'GreenLeaf Organics',     '25 Market Street',       'Seattle',      'WA', '98101'),
    (3, 'Skyline Builders',       '77 Highrise Ave',        'New York',     'NY', '10001'),
    (4, 'BlueRiver Finance',      '900 Riverside Blvd',     'Chicago',      'IL', '60601'),
    (5, 'Sunrise Retailers',      '450 Main Street',        'Dallas',       'TX', '75201'),
    (6, 'PixelWorks Studio',      '12 Artisans Lane',       'Austin',       'TX', '73301'),
    (7, 'EverFresh Foods',        '88 Orchard Road',        'Miami',        'FL', '33101'),
    (8, 'NorthStar Logistics',    '210 Cargo Parkway',      'Denver',       'CO', '80202'),
    (9, 'Silverline Consulting',  '19 Corporate Circle',    'Boston',       'MA', '02108'),
    (10,'RapidMed Healthcare',    '305 Wellness Way',       'Phoenix',      'AZ', '85001');
    
    SELECT * FROM COMPANY;

INSERT INTO CONTACT_TABLE
VALUES(1, 'TechNova Solutions',   '101 Innovation Dr',  'San Jose', 'CA', '95134', TRUE,  'info@technova.com',   '408-555-1101'),
    (2, 'GreenLeaf Organics',   '25 Market Street',   'Seattle',  'WA', '98101', TRUE,  'contact@greenleaf.com','206-555-2234'),
    (3, 'Skyline Builders',     '77 Highrise Ave',    'New York', 'NY', '10001', FALSE, 'sales@skyline.com',   '212-555-3345'),
    (4, 'BlueRiver Finance',    '900 Riverside Blvd', 'Chicago',  'IL', '60601', TRUE,  'support@blueriver.com','312-555-4456'),
    (5, 'Sunrise Retailers',    '450 Main Street',    'Dallas',   'TX', '75201', FALSE, 'service@sunrise.com', '214-555-5567'),
    (6, 'PixelWorks Studio',    '12 Artisans Lane',   'Austin',   'TX', '73301', TRUE,  'hello@pixelworks.com','512-555-6678'),
    (7, 'EverFresh Foods',      '88 Orchard Road',    'Miami',    'FL', '33101', TRUE,  'fresh@everfresh.com', '305-555-7789'),
    (8, 'NorthStar Logistics',  '210 Cargo Parkway',  'Denver',   'CO', '80202', FALSE, 'logistics@northstar.com','720-555-8890'),
    (9, 'Silverline Consulting','19 Corporate Circle','Boston',   'MA', '02108', TRUE,  'team@silverline.com', '617-555-9901'),
    (10,'RapidMed Healthcare',  '305 Wellness Way',   'Phoenix',  'AZ', '85001', TRUE,  'care@rapidmed.com',   '602-555-1011');
    
SELECT * FROM CONTACT_TABLE;

INSERT INTO CONTACT_EMPLOYEE
VALUES (1, 1, 101, '2025-09-01', 'Initial meeting with client to discuss project scope'),
    (2, 2, 102, '2025-09-03', 'Follow-up call regarding contract details'),
    (3, 3, 103, '2025-09-05', 'Provided product demo and gathered feedback'),
    (4, 4, 104, '2025-09-07', 'Discussed pricing and payment terms'),
    (5, 5, 105, '2025-09-08', 'Resolved issue related to order delivery'),
    (6, 6, 106, '2025-09-09', 'Shared new marketing proposal'),
    (7, 7, 107, '2025-09-10', 'Technical discussion about system integration'),
    (8, 8, 108, '2025-09-11', 'Scheduled training session for client staff'),
    (9, 9, 109, '2025-09-12', 'Reviewed contract changes and finalized agreement'),
    (10,10,110, '2025-09-13', 'Post-implementation support and feedback collection');
    
SELECT * FROM CONTACT_EMPLOYEE;

INSERT INTO EMPLOYEE 
VALUES(101, 'John',    'Miller',    75000.00, '2020-03-15', 'Data Analyst',       'john.miller@company.com',   '408-555-1101'),
    (102, 'Sophia',  'Johnson',   82000.00, '2019-07-10', 'Project Manager',    'sophia.johnson@company.com','206-555-2234'),
    (103, 'Liam',    'Williams',  65000.00, '2021-01-05', 'Software Engineer',  'liam.williams@company.com', '212-555-3345'),
    (104, 'Olivia',  'Brown',     90000.00, '2018-11-20', 'Finance Manager',    'olivia.brown@company.com',  '312-555-4456'),
    (105, 'Noah',    'Davis',     70000.00, '2022-02-14', 'Business Analyst',   'noah.davis@company.com',    '214-555-5567'),
    (106, 'Emma',    'Garcia',    67000.00, '2021-06-25', 'HR Specialist',      'emma.garcia@company.com',   '512-555-6678'),
    (107, 'James',   'Martinez',  88000.00, '2017-09-12', 'Operations Lead',    'james.martinez@company.com','305-555-7789'),
    (108, 'Ava',     'Rodriguez', 72000.00, '2020-08-18', 'Marketing Manager',  'ava.rodriguez@company.com', '720-555-8890'),
    (109, 'William', 'Hernandez', 95000.00, '2016-04-04', 'Senior Consultant',  'william.hernandez@company.com','617-555-9901'),
    (110, 'Isabella','Lopez',     68000.00, '2023-05-30', 'Customer Support',   'isabella.lopez@company.com','602-555-1011');
    
SELECT * FROM EMPLOYEE;

# QUESTION 4
UPDATE EMPLOYEE  SET PHONE  = '215-555-8800' WHERE  FIRST_NAME = 'SOPHIA';

#QUESTION 5
UPDATE COMPANY SET COMAPNY_NAME = 'TechNova Solutions LTD' WHERE ZIP = '95134';

#question 6
delete from COMPANY
where company_id= '3';

select * from company;

#QUESTION  8) What is the significance of “%” and “_” operators in the LIKE statement?
/*Significance of % and _ in LIKE:

% : wildcard for 0 or more characters.
Example: LIKE 'A%' → matches A, Ajay, Apple.

_ : wildcard for exactly 1 character.
Example: LIKE 'A_y' → matches Any, Amy.*/

#QUESTION 9) Explain normalization in the context of databases
/*Normalization is the process of structuring a database to reduce redundancy and improve data integrity.
It organizes data into separate related tables so each fact is stored only once.
This avoids update, insert, and delete anomalies.
Common steps are 1NF, 2NF, 3NF, where each step removes different types of dependency.
Example: storing customers in a separate table instead of repeating their details in every order.
Result: a database that is efficient, consistent, and easier to maintain.*/

#QUESTION 10) What does a join in MySQL mean? 
/*A JOIN in MySQL is used to combine rows from two or more tables based on a related column between them.
It lets you query data that is stored across multiple tables as if it were in a single table.

Types of joins:

INNER JOIN – returns only matching rows in both tables.

LEFT JOIN (LEFT OUTER) – returns all rows from the left table and matching rows from the right.

RIGHT JOIN (RIGHT OUTER) – returns all rows from the right table and matching rows from the left.

FULL OUTER JOIN – returns all rows from both tables (MySQL emulates this with UNION).

CROSS JOIN – returns every possible combination (Cartesian product).*/

#QUESTION 11).What do you understand about DDL, DCL, and DML in MySQL? 
/*1. DDL (Data Definition Language) – Commands that define or modify the database structure itself.
They create, change or remove database objects like tables, views, or indexes.
Examples: CREATE, ALTER, DROP, TRUNCATE.

2. DML (Data Manipulation Language) – Commands that work with the actual data stored inside the tables.
They insert new data, change existing data, delete rows or retrieve data.
Examples: INSERT, UPDATE, DELETE, SELECT.

3. DCL (Data Control Language) – Commands that control user access and permissions to the database.
They grant or revoke rights to users or roles.
Examples: GRANT, REVOKE.

In short, DDL defines the structure, DML manages the data, and DCL manages access control within a MySQL database*/

#QUESTION 12 12) What is the role of the MySQL JOIN clause in a query, and what are some common types of joins? 
/*The JOIN clause in MySQL is used to combine rows from two or more tables into a single result set, based on a related column (usually a primary key–foreign key relationship).
It allows you to retrieve related information that is stored across different tables.

Common Types of Joins:

INNER JOIN – Returns only rows that have matching values in both tables.

LEFT JOIN (LEFT OUTER JOIN) – Returns all rows from the left table and the matching rows from the right table; unmatched right-table rows appear as NULL.

RIGHT JOIN (RIGHT OUTER JOIN) – Returns all rows from the right table and the matching rows from the left table; unmatched left-table rows appear as NULL.

FULL OUTER JOIN – Returns all rows from both tables, with NULLs for non-matches (not directly supported in MySQL but can be emulated with UNION).

CROSS JOIN – Produces a Cartesian product of the two tables (every row of the first table combined with every row of the second).*/

