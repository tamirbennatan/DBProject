-- Get the movies
movies = LOAD '/data/movies.csv' USING PigStorage(',') AS (movieid:INT, title:CHARARRAY, year:INT);
-- Get the ratings
ratings = LOAD '/data/ratings.csv' USING PigStorage(',') AS (movieid:INT, title:CHARARRAY, year:INT);
-- get the genres
genres = LOAD '/data/moviegenres.csv' USING PigStorage(',') AS (movieid:INT, genre:CHARARRAY);
-- group ratings by movies 
grouped = group ratings by movieid;
-- count number of ratings for each movie
ratingcount = foreach grouped generate $0 as movieid, COUNT($1) as numratings;
-- join movies with genres
moviegenres = join movies by movieid, genres by movieid;
-- filter only the scifi movies
scifi_movies = filter moviegenres by genre == 'Sci-Fi' AND year == 2015;
scifi_movies = foreach scifi_movies generate $0 as movieid, title, year;

-- join back with rating coints
joined = join scifi_movies by movieid, ratingcount by movieid;
-- project and sort
proj = foreach joined generate title, numratings;
sorted = order proj by numratings desc;
-- Keep top five
top5 = limit sorted 5;
dump top5;