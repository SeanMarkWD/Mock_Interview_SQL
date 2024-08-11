/* 5. List star names and the number of movies they have appeared in (acted). List only the stars that have appeared in at least 300 movies. */
SELECT DISTINCT p.name,
    COUNT(m.title)
FROM people AS p
    JOIN stars AS s ON s.person_id = p.id
    JOIN movies AS m ON m.id = s.movie_id
GROUP BY p.name
HAVING COUNT(m.title) >= 300;