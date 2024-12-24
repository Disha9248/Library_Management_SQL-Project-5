

-- Libraray management system project


ALTER TABLE return_status
DROP COLUMN return_book_name;

ALTER TABLE return_status
DROP COLUMN return_book_isbn;

--------- TASK AND KEY PROBLEMS  ------------



-- Task 1. Create a New Book Record 
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

-- Task 2: Update an Existing Member's Address 
-- change address to '125 Oak St' of member_id C103

-- Task 3: Delete a Record from the Issued Status Table 
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

-- Task 4: Retrieve All Books Issued by a Specific Employee 
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

-- Task 5: List Members Who Have Issued More Than One Book 
-- Objective: Use GROUP BY to find members who have issued more than one book.

-- Task 6: Create Summary Tables: 
-- Used CTAS to generate new tables based on query results - each book and total book_issued_cnt

-- Task 7. Retrieve All Books in a Specific Category:
-- Put category as classic

-- Task 8: Find Total Rental Income by Category:

-- Task 9: List Members Who Registered in the Last 180 Days:

-- Task 10: List Employees with Their Branch Manager's Name and their branch details:

-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold:

-- Task 12: Retrieve the List of Books Not Yet Returned


------------------ SOLUTION ----------------------

SELECT * FROM books;
SELECT * FROM branch;
SELECT * FROM employees;
SELECT * FROM members;
SELECT * FROM issued_status;
SELECT * FROM return_status;



-- Task 1. Create a New Book Record 
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO books (isbn, book_title, category, rental_price, status, author, publisher)
VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
SELECT * FROM books;



-- Task 2: Update an Existing Member's Address 
-- change address to '125 Oak St' of member_id C103

UPDATE members
SET member_address = '125 Oak St'
WHERE member_id = 'C103';

SELECT * FROM members;



-- Task 3: Delete a Record from the Issued Status Table 
-- Objective: Delete the record with issued_ID = 'IS125' from the issued_status table.

DELETE FROM issued_status
WHERE issued_id = 'IS125';

SELECT * FROM issued_status;



-- Task 4: Retrieve All Books Issued by a Specific Employee 
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT issued_book_name,
       issued_emp_id
FROM issued_status
WHERE issued_emp_id = 'E101';



-- Task 5: List Members Who Have Issued More Than One Book 
-- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT issued_member_id,
       COUNT(issued_book_name) AS book_count
FROM issued_status
GROUP BY issued_member_id
HAVING COUNT(issued_book_name) > 1;



-- Task 6: Create Summary Tables: 
-- Used CTAS to generate new tables based on query results - each book and total book_issued_cnt

CREATE TABLE new_table 
AS
	SELECT issued_book_name AS book_name,
	       COUNT(issued_id) AS book_issued_count
	FROM issued_status
	GROUP BY book_name;

SELECT *
FROM new_table;



-- Task 7. Retrieve All Books in a Specific Category:
-- Put category as classic

SELECT book_title,
       category
FROM books
WHERE category = 'Classic';



-- Task 8: Find Total Rental Income by Category:

SELECT books.category,
       SUM(books.rental_price) AS total_rental_income
	   -- COUNT(issued_status.issued_book_name) AS book_count
FROM books
JOIN issued_status
ON books.isbn = issued_status.issued_book_isbn
GROUP BY category;



-- Task 9: List Members Who Registered in the Last 180 Days consider current date as '2024-06-01':

WITH member_registered AS (
	
	SELECT member_name,
	       reg_date,
		   ('2024-06-01'::DATE - reg_date) AS days
	FROM members
)

SELECT member_name
FROM member_registered
WHERE days <= 180;



-- Task 10: List Employees with Their Branch Manager's Name and their branch details:

WITH branch_details AS (

	SELECT branch.branch_id,
	       branch.manager_id,
		   employees.emp_id,
		   employees.emp_name,
		   branch.branch_address,
		   branch.contact_no
	FROM branch
	JOIN employees
	ON branch.branch_id = employees.branch_id
	ORDER BY employees.branch_id
),
manager_name AS (

    SELECT *,
	       CASE 
		       WHEN manager_id:: VARCHAR = 'E109' THEN  'Daniel Anderson'
			   WHEN manager_id:: VARCHAR = 'E110' THEN  'Laura Martinez'
			   ELSE  manager_id:: VARCHAR
			END AS manager_name
			   
	FROM branch_details
)

SELECT emp_name,
       manager_name,
	   branch_id,
	   branch_address,
	   contact_no
FROM manager_name;

-- SECOND APPROACH

SELECT emp.emp_name,
	   emp2.emp_name AS manager_name,
       b.*
FROM employees AS emp
JOIN branch AS b
ON b.branch_id = emp.branch_id
JOIN employees AS emp2
ON b.manager_id = emp2.emp_id;



-- Task 11. Create a Table of rental_books with Rental Price Above a Certain Threshold(7):

CREATE TABLE rental_books AS

SELECT *
FROM books
WHERE rental_price > 7;

SELECT * FROM rental_books;



-- Task 12: Retrieve the List of Books Not Yet Returned

WITH books_returned AS (
	SELECT issued_status.issued_book_name AS books_name,
	       issued_status.issued_id AS books_issued_id,
		   return_status.issued_id AS books_return_id
	FROM return_status
	
	FULL OUTER JOIN  issued_status
	ON return_status.issued_id = issued_status.issued_id
)

SELECT books_name
FROM books_returned
WHERE books_return_id IS NULL;

