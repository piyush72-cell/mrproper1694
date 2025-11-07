SELECT * FROM genre
SELECT * FROM artist

--SET 2 MODERATE
--Q1 Write a query to return the email, first name, last name and genre of all rock music listeners.
-- Return your ordered list alphabetically by email starting with A.

SELECT DISTINCT email, first_name, last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
SELECT track_id FROM track
JOIN genre ON track.genre_id=genre.genre_id
WHERE genre.name LIKE 'ROCK'
)
ORDER BY email;

SELECT * FROM customer

--Q2 Let's invite the artist who have written the most rock music in our dataset. Write a query that returns
-- the artist name and total track count on the top 10 rock bands.

SELECT * FROM artist

SELECT artist.artist_id, artist.name, COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'ROCK'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10

--Q3 Return all the track names that have a song length longer than the average song length. Return the name and 
-- milliseconds for each track. Order by the song length with the longest songs first.
SELECT name, milliseconds
FROM track 
WHERE milliseconds > (
SELECT AVG(milliseconds) AS avg_track_length
FROM track)
ORDER BY milliseconds DESC;
