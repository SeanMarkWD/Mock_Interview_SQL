/* List all the movies directed by Frank Darabont and their release years. Order the results by the movie's release year in descending order. */
SELECT m.title,
    m.year
FROM directors AS d
    JOIN people AS p ON d.person_id = p.id
    JOIN movies AS m ON m.id = d.movie_id
WHERE p.name = 'Frank Darabont'
GROUP BY m.title,
    m.year
ORDER BY m.year DESC;