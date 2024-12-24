-- Libraray management system project
-- Adding Data Through CSV Files

-- Database creation

DROP DATABASE IF EXISTS file_management_db;
CREATE DATABASE file_management_db;



-- Table 1 structure creation

DROP TABLE IF EXISTS books;
CREATE TABLE books (

isbn VARCHAR(50) PRIMARY KEY,
book_title VARCHAR(100),
category VARCHAR(50),
rental_price FLOAT,
status VARCHAR(10),
author VARCHAR(50),
publisher VARCHAR(100)

);


-- Table 2 structure creation

DROP TABLE IF EXISTS branch;
CREATE TABLE branch (

branch_id VARCHAR(10) PRIMARY KEY,
manager_id VARCHAR(10),
branch_address VARCHAR(200),
contact_no VARCHAR(20)

);


-- Table 3 structure creation

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (

emp_id VARCHAR(10) PRIMARY KEY,
emp_name VARCHAR(50),
positions VARCHAR(50),
salary FLOAT,
branch_id VARCHAR(10),
CONSTRAINT fk_branch FOREIGN KEY (branch_id) REFERENCES branch(branch_id)

);


-- Table 4 structure creation


DROP TABLE IF EXISTS members;
CREATE TABLE members (

member_id VARCHAR(10) PRIMARY KEY,
member_name VARCHAR(50),
member_address VARCHAR(100),
reg_date DATE

);



-- Table 5 structure creation

DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status (

issued_id VARCHAR(10) PRIMARY KEY,
issued_member_id VARCHAR(10),
issued_book_name VARCHAR(100),
issued_date DATE,
issued_book_isbn VARCHAR(50),
issued_emp_id VARCHAR(10),
CONSTRAINT fk_emp FOREIGN KEY (issued_emp_id ) REFERENCES employees(emp_id),
CONSTRAINT fk_member FOREIGN KEY (issued_member_id) REFERENCES members(member_id),
CONSTRAINT fk_isbn FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn)

);

-- Table 6 structure creation

DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status (

return_id VARCHAR(10) PRIMARY KEY,
issued_id VARCHAR(10),
return_book_name VARCHAR(100),
return_date DATE,
return_book_isbn VARCHAR(10),
CONSTRAINT fK_issue_id FOREIGN KEY (issued_id) REFERENCES issued_status(issued_id)

);



