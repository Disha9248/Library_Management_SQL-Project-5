# Library Management System 

## Project Overview

**Project Title**: Library Management System  
**Level**: Intermediate  

This project demonstrates the implementation of a Library Management System using SQL. It includes creating and managing tables, 
performing CRUD operations, and executing advanced SQL queries. The goal is to showcase skills in database design, manipulation, and querying.

![Library_project](https://github.com/najirh/Library-System-Management---P2/blob/main/library.jpg)

## Objectives

1. **Set up the Library Management System Database**:
   Create and populate the database with tables for branches, employees, members, books, issued status, and return status.
2. **CRUD Operations**:
   Perform Create, Read, Update, and Delete operations on the data.
3. **CTAS (Create Table As Select)**:
   Utilize CTAS to create new tables based on query results.
4. **Advanced SQL Queries**:
   Develop complex queries to analyze and retrieve specific data.

## Project Structure

### 1. Database Setup

![ERD](https://github.com/najirh/Library-System-Management---P2/blob/main/library_erd.png)

- **Database Creation**: Created a database.
- **Table Creation**: Created tables for branches, employees, members, books, issued status, and return status.
                      Each table includes relevant columns and relationships.


### 2. CRUD Operations

- **Create**: Inserted sample records into the `books` table.
- **Read**: Retrieved and displayed data from various tables.
- **Update**: Updated records in the `employees` table.
- **Delete**: Removed records from the `members` table as needed.

**Task 1. Create a New Book Record**
-- 
"978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

**Task 2: Update an Existing Member's Address**
-- change address to '125 Oak St' of member_id C103

**Task 3: Delete a Record from the Issued Status Table**
-- Objective: Delete the record with issued_id = 'IS125' from the issued_status table.

**Task 4: Retrieve All Books Issued by a Specific Employee** 
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

**Task 5: List Members Who Have Issued More Than One Book**
-- Objective: Use GROUP BY to find members who have issued more than one book.


### 3. CTAS (Create Table As Select)

**Task 6: Create Summary Tables**
-- Used CTAS to generate new tables based on query results - each book and total book_issued_cnt.


### 4. Data Analysis & Findings

The following SQL queries were used to address specific questions:

 **Task 7: Retrieve All Books in a Specific Category(Classic)**

**Task 8: Find Total Rental Income by Category**

**Task 9: List Members Who Registered in the Last 180 Days**

**Task 10: List Employees with Their Branch Manager's Name and their branch details**

**Task 11. Create a Table of rental_books with Rental Price Above a Certain Threshold(7)**

**Task 12: Retrieve the List of Books Not Yet Returned**


## Advanced SQL Operations

**Task 13: Identify Members with Overdue Books**  
-- Write a query to identify members who have overdue books (assume a 30-day return period). 
   Display the member's_id, member's name, book title, issue date, and days overdue.

**Task 14: Update Book Status on Return**  
-- Write a query to update the status of books in the books table to "Yes" when they are returned 
   (based on entries in the return_status table).

**Task 15: Branch Performance Report**  
-- Create a query that generates a performance report for each branch, showing the number of books issued, 
   the number of books returned, and the total revenue generated from book rentals.

**Task 16: CTAS: Create a Table of Active Members**  
-- Use the CREATE TABLE AS (CTAS) statement to create a new table active_members containing members who have 
   issued at least one book in the last 2 months.


**Task 17: Find Employees with the Most Book Issues Processed**  
-- Write a query to find the top 3 employees who have processed the most book issues. Display the employee name, 
   number of books processed, and their branch.

**Task 18: Identify Members Issuing High-Risk Books**  
-- Write a query to identify members who have issued books more than twice with the status "damaged" in the books table.
   Display the member name, book title, and the number of times they've issued damaged books.    


