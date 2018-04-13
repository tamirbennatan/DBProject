-- Get the movies
movies = LOAD '/data/movies.csv' USING PigStorage(',') AS (movieid:INT, title:CHARARRAY, year:INT);
-- Get the ratings
ratings = LOAD '/data/ratings.csv' USING PigStorage(',') AS (movieid:INT, title:CHARARRAY, year:INT);
-- get the genres
genres = LOAD '/data/moviegenres.csv' USING PigStorage(',') AS (movieid:INT, genre:CHARARRAY);
-- keep only movies from 2016
movies2016 = filter movies by year == 2016;
-- Count number of genres movie is a part of. First group by movie and genre to deduplictae
genresgrouped = group genres by (movieid, genre);
-- flatten result
uniq_genres = foreach genresgrouped generate flatten($0);
-- count number of genres
genresgrouped_uniq = group uniq_genres by movieid;
-- count the number of genres movie participates in
genrecount = foreach genresgrouped_uniq generate $0 as movieid, COUNT($1) as numgenres;
-- Count the number of ratings each movie gets
ratinggrouped = group ratings by movieid;
ratingcount = foreach ratinggrouped generate $0 as movieid, COUNT($1) as numratings;
-- Join the three tables
alljoined = join movies2016 by movieid, genrecount by movieid, ratingcount by movieid;
-- Keep necessary columns
proj = foreach alljoined generate $0 as movieid, title, numgenres, numratings;
