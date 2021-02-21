-- chart 1
-- to visualize the urgency of all the projects 
-- this would be useful for the company to see how many projects are urgent
-- so they can better arrange the workload and assign more developers on those projects 
-- to view the google spreadsheet:
-- https://docs.google.com/spreadsheets/d/1EQD9_qwBDZU99k0VAJVqrcIXhso0wAzouZvjUikjLv8/edit#gid=1627835924 
select urgency,count(tid) from 
        (select urgency, ticket.tid from ticket) as b
group by urgency 
order by urgency




-- chart 2
-- to visualize how many projects we had in year 2017 
-- it would be useful to know in order to better plan the work load 
-- and time management for the next year
-- view google spreadsheet:
-- https://docs.google.com/spreadsheets/d/1DmS5s4LqbkwHBqmfBEgC0yxJug2Yl2up_c8tLmjrS9c/edit#gid=1509411321

select EXTRACT( MONTH FROM b.datecreated) as month,count(datecreated) 
from
   (SELECT project.datecreated, EXTRACT(MONTH FROM project.datecreated) from project )as b
   where
   (EXTRACT(YEAR FROM b.datecreated) = 2017 )
group by EXTRACT(MONTH FROM b.datecreated)
order by EXTRACT(MONTH FROM b.datecreated)