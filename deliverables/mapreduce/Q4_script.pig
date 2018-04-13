-- Get the movies
movies = LOAD '/data/movies.csv' USING PigStorage(',') AS (movieid:INT, title:CHARARRAY, year:INT);
-- group by year
grouped = group movies by year;
-- get yearly counts
yearcounts = foreach grouped generate $0 AS year , COUNT($1) as nummovies;
yearcounts2 = yearcounts;
yearcounts2 = foreach yearcounts2 generate year, nummovies as nextyearmovies, year - 1 as prevyear;
-- join year == prev(next year)
joined = join yearcounts by year, yearcounts2 by prevyear;
-- filter movies where previous years count is greater than next year
filtered = filter joined by nummovies > nextyearmovies; 
-- project
result = foreach filtered generate $2, nextyearmovies as count, nummovies as prev_count;
-- store to file system
store result into 'q4' using PigStorage(',');