CREATE TABLE Books(
Book_ID INT8 PRIMARY KEY NOT NULL,
Title VARCHAR(100),
Author VARCHAR(100),
Genre VARCHAR(100),
Published_Year INT8,
Price NUMERIC,
Stock NUMERIC
);

SELECT * FROM Books

--Q1 Retrieve all books in the fiction genre?
SELECT * FROM Books
WHERE Genre = 'Fiction'
ORDER BY title ASC

--Q2 Find the books published after the year 1950?
SELECT * FROM Books
WHERE published_year > 1950
ORDER BY book_id ASC

--Q5 Retrieve the total stock of the books available?
SELECT SUM(stock) AS Total_stock
FROM Books

--Q6 Find the most expensive book?
SELECT * FROM Books
ORDER BY Price DESC
LIMIT 1;

--Q9 List all the genre available in the books table?
SELECT DISTINCT(genre) FROM Books

--Q10 Find the book with the lowest stock?
SELECT * FROM Books
WHERE stock = (SELECT MIN(stock) FROM Books)
LIMIT 1;

-- ADVANCE QUERIES
--Q1 Retrieve the total number of books sold for each genre?
SELECT b.genre, SUM(o.quantity) AS Total_books_sold
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.genre;

--Q2 Find the average price of the books in the "Fantasy Genre"?
SELECT AVG(price) AS avg_price FROM Books 
WHERE genre = 'Fantasy'

--Q5 Show the top 3 most expensive book of 'Fantasy Genre'?
SELECT * FROM Books
WHERE genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;

--Q6 Retrieve the total quantity of book sold by each author?
SELECT b.author, SUM(o.quantity) AS Total_books_sold
FROM Orders O
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.author;