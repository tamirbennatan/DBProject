-- Load movies
movies = LOAD '/data/movies.csv' USING PigStorage(',') AS (movieid:INT, title:CHARARRAY, year:INT);
-- LOAD GENRES
genres = LOAD '/data/moviegenres.csv' USING PigStorage(',') AS (movieid:INT, genre:CHARARRAY);
-- filter only the required movies
movies15_16 = filter movies by year == 2015 or year == 2016;
-- join
joined = join movies15_16 by movieid, genres by movieid;
-- group by year and genre
grouped = group joined by (genre, year);
-- count movies by year
moviecount = foreach grouped generate flatten($0), COUNT($1);
-- order
ordered = order moviecount by genre, year;
-- print
dump ordered;