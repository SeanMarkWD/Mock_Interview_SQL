/* Do starting letters correlate with the average movie rating? List movie title starting letters and an average rating associated with them. Ignore non-Latin and non-uppercase letters. */
SELECT UPPER(SUBSTR(title, 1, 1)) AS first_letter,
    AVG(r.rating) AS average_rating
FROM movies AS m
    JOIN ratings AS r ON r.movie_id = m.id
WHERE UPPER(SUBSTR(title, 1, 1)) BETWEEN 'A' AND 'Z'
GROUP BY UPPER(SUBSTR(title, 1, 1))
ORDER BY first_letter;