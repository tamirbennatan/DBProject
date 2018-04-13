-- Load movies
movies = LOAD '/data/movies.csv' USING PigStorage(',') AS (movieid:INT, title:CHARARRAY, year:INT);
-- select movies where year is 2015
movies2015 = filter movies by year == 2015;
-- Load genres
genres = LOAD '/data/moviegenres.csv' USING PigStorage(',') AS (movieid:INT, genre:CHARARRAY);
-- Join
joined = join movies2015 by movieid, genres by movieid;
-- filter genres of interest
movies_genres = filter joined by genre == 'Comedy' or genre == 'Sci-Fi';
-- keep only the titles
titles = foreach movies_genres generate title;
-- Remove duplicates
groupedtitles = group titles by title;
deduped = foreach groupedtitles generate group as title;
-- Order results
ordered = order deduped by title desc;
-- dump
dump ordered;