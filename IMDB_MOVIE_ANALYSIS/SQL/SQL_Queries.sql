-- Use database---
USE imdb_project;

---Verify data---
SELECT * FROM imdb_movies LIMIT 10;

-- 1. Count of movies by IMDb rating category---
SELECT
  CASE
    WHEN imdb_score >= 7 THEN 'High'
    WHEN imdb_score BETWEEN 5 AND 6.9 THEN 'Medium'
    ELSE 'Low'
  END AS rating_category,
  COUNT(*) AS movie_count
FROM imdb_movies
GROUP BY rating_category;

-- 2. Total gross revenue by genre---
SELECT
  genre,
  SUM(gross) AS total_gross
FROM imdb_movies
GROUP BY genre;

-- 3. Average movie duration by genre---
SELECT
  genre,
  AVG(duration) AS avg_duration
FROM imdb_movies
GROUP BY genre;

-- 4. Number of movies released per year---
SELECT
  title_year,
  COUNT(*) AS movies_per_year
FROM imdb_movies
GROUP BY title_year;

-- 5. Movies count by genre and rating category---
SELECT
  genre,
  CASE
    WHEN imdb_score >= 7 THEN 'High'
    WHEN imdb_score BETWEEN 5 AND 6.9 THEN 'Medium'
    ELSE 'Low'
  END AS rating_category,
  COUNT(*) AS movie_count
FROM imdb_movies
GROUP BY genre, rating_category;