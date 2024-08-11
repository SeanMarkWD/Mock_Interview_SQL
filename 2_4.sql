/* Count all the times that Martin Scorsese directed. */
SELECT COUNT(d.movie_id)
FROM directors AS d
    JOIN people AS p ON d.person_id = p.id
WHERE p.name = 'Martin Scorsese';