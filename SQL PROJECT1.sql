SELECT * FROM employee
--SET 1 EASY
-- Q1 SENIOR EMPLOYEE BASED ON JOB TITLE
SELECT * FROM employee
ORDER BY levels DESC
LIMIT 1;

--Q2 WHICH COUNTRY HAVE THE MOST INVOICES
SELECT * FROM invoice

SELECT COUNT(*) AS c, billing_country
FROM invoice
GROUP BY billing_country
ORDER BY c DESC

--Q3 WHAT ARE THE TOP 3 VALUES OF TOTAL INVOICE
SELECT total FROM invoice
ORDER BY total DESC
LIMIT 3

--Q4 Which city has the best customers? We would like to throw a promotional music festival event in the city
-- we made most money. Write a query that returns one city that has the highest sum of total invoices. Return
-- both city name and sum of all invoice totals? 
SELECT * FROM invoice

SELECT SUM(total) AS invoice_total, billing_city
FROM invoice
GROUP BY billing_city
ORDER BY invoice_total DESC

--Q5 Who is the best customer? The customer who has spent the most money will be declared the best customer. 
-- Write a query that returns the person who has spent the most money?

SELECT * FROM customer

SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) AS TOTAL
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC
LIMIT 1

