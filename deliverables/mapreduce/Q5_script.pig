-- Get the movies
movies = LOAD '/data/movies.csv' USING PigStorage(',') AS (movieid:INT, title:CHARARRAY, year:INT);
-- Get the ratings
ratings = LOAD '/data/ratings.csv' USING PigStorage(',') AS (movieid:INT, title:CHARARRAY, year:INT);
-- group movies by 
grouped = group ratings by movieid;
-- count number of ratings for each movie
ratingcount = foreach grouped generate $0, COUNT($1) as numratings;
-- Keep top ten movies
sorted = order ratingcount by numratings desc;
top10 = limit sorted 10;
-- join back with movies
joined = join top10 by $0, movies by movieid;
-- project and sort
proj = foreach joined generate title, numratings;
sorted = order proj by numratings desc;
dump sorted;