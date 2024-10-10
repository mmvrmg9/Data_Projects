-- Created a table and inserted data which I imported from a csv file in SQLite

CREATE TABLE BIT_DB.Spotifydata (
id integer PRIMARY KEY,
artist_name varchar NOT NULL,
track_name varchar NOT NULL,
track_id varchar NOT NULL,
popularity integer NOT NULL,
danceability decimal(4,3) NOT NULL,
energy decimal(4,3) NOT NULL,
song_key integer NOT NULL,
loudness decimal(5,3) NOT NULL,
song_mode integer NOT NULL,
speechiness decimal(5,4) NOT NULL,
acousticness decimal(6,5) NOT NULL,
instrumentalness decimal(8,7) NOT NULL,
liveness decimal(5,4) NOT NULL,
valence decimal(4,3) NOT NULL,
tempo decimal(6,3) NOT NULL,
duration_ms integer NOT NULL,
time_signature integer NOT NULL )
;


-- What is the average danceability, popularity and energy by artist and track?
SELECT artist_name, track_name, AVG(popularity), AVG(danceability), AVG(energy)
FROM BIT_DB.Spotifydata

GROUP BY artist_name, track_name
;

-- Who are the top 10 artists based on popularity?
SELECT track_name, artist_name, popularity
FROM BIT_DB.Spotifydata

ORDER BY popularity DESC
LIMIT 10
;


-- The longest songs and their respective popularity?
SELECT track_name, artist_name, duration_ms, popularity
FROM BIT_DB.Spotifydata

ORDER BY duration_ms DESC
LIMIT 15
;


-- What's the average danceability for the 10 most popular songs?
SELECT track_name, popularity, AVG(danceability) 
FROM BIT_DB.Spotifydata

GROUP BY track_name
ORDER BY popularity DESC
LIMIT 10
;

