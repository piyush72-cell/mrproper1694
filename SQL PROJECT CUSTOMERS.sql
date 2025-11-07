CREATE TABLE Customers(
Customer_ID INT8 PRIMARY KEY NOT NULL,
Name VARCHAR(100),
Email VARCHAR(100),
Phone NUMERIC,
City VARCHAR(100),
Country VARCHAR(100)
)
 SELECT * FROM Customers

--Q3 List all the customers from the CANADA?
SELECT * FROM Customers
WHERE Country = 'Canada'
ORDER BY customer_id ASC

-- ADVANCE QUERIES
--Q7 List the cities where customers who spent  over $30 are located?
SELECT DISTINCT c.city, total_amount
FROM  Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.total_amount > 30;

--Q8 Find the customers who spent the most on orders?
SELECT c.customer_id, c.name, SUM(o.total_amount) AS TOTAL_Spent
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY TOTAL_Spent DESC
LIMIT 10;




 