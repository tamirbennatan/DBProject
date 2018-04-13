-- Load movies
movies = LOAD '/data/movies.csv' USING PigStorage(',') AS (movieid:INT, title:CHARARRAY, year:INT);
-- Group by year
moviesperyear = group movies by year;
-- count the number of movies per year
yearcount = foreach moviesperyear generate ($0), count($1) as yearcount;
-- sort output
sorted = order yearcount by $0;
-- Store into folder
store sorted into 'q1';