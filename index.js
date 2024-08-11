import 'dotenv/config';
import sqlite3 from 'better-sqlite3';

const favoriteDirector = process.env.FAVORITE_DIRECTOR;
const dbPath = process.env.DB_PATH;

const db = sqlite3(dbPath);

const stmt = db.prepare(`
    SELECT m.title, r.rating
    FROM movies AS m
    JOIN directors AS d ON d.movie_id = m.id
    JOIN people AS p ON p.id = d.person_id
    JOIN ratings AS r ON r.movie_id = m.id
    WHERE p.name = ?
    ORDER BY r.rating DESC
    `);
const movies = stmt.all(favoriteDirector);

console.log(`Movies directed by ${favoriteDirector}: `);
movies.forEach(movie => {
    console.log(`${movie.title} - Rating: ${movie.rating}`);
});