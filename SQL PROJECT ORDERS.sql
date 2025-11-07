CREATE TABLE Orders(
Order_ID INT8 PRIMARY KEY NOT NULL,
Customer_ID int8,
Book_ID int8,
Order_Date DATE,
Quantity int8,
Total_Amount NUMERIC
);

SELECT * FROM Orders

--Q4 Show orders placed in NOVEMBER 2023?
SELECT * FROM Orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

--Q7 Show the customers who ordered  more than one quantity of a book?
SELECT * FROM Orders
WHERE quantity > 1
ORDER BY order_id ASC

--Q8 Retrieve all the orders where order amount exceeds $20?
SELECT * FROM Orders
WHERE total_amount > 20 

--Q11 Calculate the total revenve generated from orders?
SELECT SUM(total_amount) AS Total_Revenue FROM Orders

--ADVANCE QUERIES
--Q3 List the customers who have placed atleast 2 orders?
SELECT o.customer_id, c.name, COUNT(Order_id) AS ORDER_COUNT
FROM Orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(Order_id) >= 2;


--Q4 Find the frequently ordered book?
SELECT book_id, COUNT(order_id) AS ORDER_COUNT
FROM Orders 
GROUP BY book_id
ORDER BY ORDER_COUNT DESC
LIMIT 1

--
SELECT o.book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY o.book_id, b.title
ORDER BY ORDER_COUNT DESC 
LIMIT 1;

--Q9 Calculate the stock remaining after fulfilling all order?
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_Quantity,
b.stock - COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM Books b
LEFT JOIN Orders o ON b.book_id = o.book_id
GROUP BY b.book_id
ORDER BY b.book_id;
