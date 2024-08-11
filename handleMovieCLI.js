import sqlite3 from 'better-sqlite3';

const args = process.argv.slice(2);

// args[0] is the movie title, args[1] is the year
const movieTitle = args[0];
const movieYear = args[1];

if (!movieTitle || !movieYear) {
    console.error('Please provide both a movie title and a year.');
    process.exit(1);
}

const dbPath = './movies.db';
const db = sqlite3(dbPath);

const transaction = db.transaction(() => {
    const existingMovie = db.prepare(`
        SELECT id FROM movies
        WHERE title = ?
        AND year = ?
        `).get(movieTitle, movieYear);

    if (existingMovie) {
        console.error(`Error: Movie "${movieTitle}" from ${movieYear} already exists in the database.`);
        process.exit(1);
    }

    const insertMovie = db.prepare(`
        INSERT INTO movies (title, year)
        VALUES (?, ?)
        `);
    const info = insertMovie.run(movieTitle, movieYear);

    const insertRating = db.prepare(`
        INSERT INTO ratings (movie_id, rating, votes)
        VALUES (?, ' ', 0)
        `);
    insertRating.run(info.lastInsertRowid);

    console.log(`New movie added with ID: ${info.lastInsertRowid}`);
});

try {
    transaction();
} catch (error) {
    console.error('Transaction failed:', error);
    process.exit(1);
}