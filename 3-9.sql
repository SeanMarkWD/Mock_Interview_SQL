/* The script should return a list of movies the favorite director directed.
 
 The list should be ordered by movie rating in descending order. */
SELECT m.title,
    r.rating
FROM movies AS m
    JOIN directors AS d ON d.movie_id = m.id
    JOIN people AS p ON p.id = d.person_id
    JOIN ratings AS r ON r.movie_id = m.id
WHERE p.name = ?
ORDER BY r.rating DESC