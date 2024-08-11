/* List all the movies rated above 8.5 that feature a star born after 2005.
 
 Order the list by the movie's rating in descending order. 
 
 You should return the movie title, rating, and the star's name. A movie can have multiple stars, which means that a movie can appear multiple times in the result set. */
SELECT m.title,
    r.rating,
    p.name
FROM movies AS m
    JOIN ratings AS r ON r.movie_id = m.id
    JOIN stars AS s ON s.movie_id = m.id
    JOIN people AS p ON p.id = s.person_id
WHERE r.rating > 8.5
    AND p.birth > 2005
ORDER BY rating DESC;