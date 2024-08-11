/* 10. Barbenheimer. In 2023, Christopher Nolan and Greta Gerwig each released a new movie. These movies already exist in the database, but they have no ratings. Write a single query to add a rating to one of these movies. For these movies, you can assume there is only one movie with the same title and year in the database. */
INSERT INTO ratings (movie_id, rating, votes)
SELECT 15398776,
    8.5,
    1
WHERE EXISTS (
        SELECT 1
        FROM movies AS m
        WHERE m.id = 15398776
            AND m.year = 2023
            AND (
                m.id IN (
                    SELECT d1.movie_id
                    FROM directors AS d1
                        JOIN people AS p1 ON p1.id = d1.person_id
                    WHERE p1.name = 'Christopher Nolan'
                )
                OR m.id IN (
                    SELECT d2.movie_id
                    FROM directors AS d2
                        JOIN people AS p2 ON p2.id = d2.person_id
                    WHERE p2.name = 'Greta Gerwig'
                )
            )
    );