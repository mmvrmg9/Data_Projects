-- How many movie titles are there in the database?

SELECT COUNT(*)
FROM "netflix_titles_info"
WHERE type = 'Movie'
;

-- When was the most recent batch of tv shows and/or movies added to the database?

SELECT MAX(DATE(date_added))
FROM "netflix_titles_info"
;


-- List all the movies and tv shows in alphabetical order.

SELECT title
FROM "netflix_titles_info" 
ORDER BY title ASC
;

-- Who was the Director for the movie The Starling?
SELECT title, director
FROM "netflix_titles_info" 
JOIN "netflix_people"
ON "netflix_titles_info".show_id = "netflix_people".show_id
WHERE title = 'The Starling'
;


-- What is the oldest movie in the database and what year was it made?

SELECT title, release_year
FROM "netflix_titles_info"
WHERE type = 'Movie'
AND release_year <=
(SELECT MIN(release_year)
FROM "netflix_titles_info"
WHERE type = 'Movie')
;
