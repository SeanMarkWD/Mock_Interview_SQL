/* Letters from a stoic. List the names of the 10 oldest people and how many years have passed since they were born in the current year. Do not include people who do not have a birth year. */
SELECT name,
    birth,
    (2024 - birth) AS age
FROM people
WHERE birth IS NOT NULL
    AND birth <> ''
ORDER BY birth ASC
LIMIT 10;