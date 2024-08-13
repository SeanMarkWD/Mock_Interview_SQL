/*  write a SQL query to determine the average rating of all movies released in 2012. */
SELECT AVG(r.rating)
FROM movies as m
    JOIN ratings AS r ON m.id = r.movie_id
WHERE m.year = 2012;