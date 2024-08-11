/* Write a query that lists all movie titles where Scarlett Johansson and Chris Evans starred together. */
SELECT m.title
FROM movies AS m
WHERE m.id IN (
        SELECT s1.movie_id
        FROM stars AS s1
            JOIN people AS p1 ON p1.id = s1.person_id
        WHERE name = 'Scarlett Johansson'
    )
    AND m.id IN (
        SELECT s2.movie_id
        FROM stars AS s2
            JOIN people AS p2 ON p2.id = s2.person_id
        WHERE name = 'Chris Evans'
    );