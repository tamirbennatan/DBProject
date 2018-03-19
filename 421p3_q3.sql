/* create at lease 2 useful indexes for your project database 
 * Do not build indexes on primary keys and unique constraints.
 * For each of the created indexes indicate why this index is useful by describing 
 * which application relevant queries would execute quicker
*/

/* Index 1 --------------------------------------------------------------------------
 * Create index most_urgent, to find 10 most urgent tasks: those labelled with 
 * urgency 5 and created the earliest.
 * If don't create index, database will have to scan it through the whole table
 * to find the urgency of each task, creating index can speed up the searching 
 * process 
 */

CREATE INDEX most_urgent ON ticket(urgency DESC, datecreated asc);
CLUSTER ticket using most_urgent;

select * from ticket LIMIT 10;

-- DROP INDEX most_urgent;


/* Index 2 --------------------------------------------------------------------------
 * Create index most_budget, to find projects with the most points budget, same reasoning as above 
 */

CREATE INDEX most_budget ON clientcompany(pointbudget DESC, companyname); 
cluster clientcompany using most_budget;

select * from clientcompany 

--DROP INDEX most_budget;


