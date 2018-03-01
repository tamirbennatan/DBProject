-- informal description of what data each view represents 
-- show CREAT VIEW statements and response of the system 
-- query involving view&response 
-- script of what happens when try run SQL UPDATE statement of each vie
-- summarize con that must hold so DB2/postgreSQL allows updating a view

/*
* From this devMostPoints table we can get a list of developers,  
* we sort them based on the points they get in descending order. 
* From this table it's easy for the team and company 
* to distinguish which developers did more jobs. 

Relevent information extracted:
 * 
 * - developer id
 * - the point
 * - team name (which scheduled the ticket)
 * - business owner which partitioned ticket from a high level ticket
 * - high level ticket id from which each ticket was partitioned
 * - point estimate of low level ticket.

*/


create view devMostPoints as 
    select devid, sum(pointestimate) FROM 
        (select 
               ticketDeveloperassignment.devid, lowticket.pointestimate
               from 
                        lowticket, ticketdeveloperassignment
                        where lowticket.tid = ticketdeveloperassignment.tid
                        order by pointestimate desc) a 
     group by devid order by sum(pointestimate) desc;




/* 
Views are read only, the system does not change according to an update on a
view. We can get the effect of an updatable view by creating INSTEAD triggers 
on the view, which must convert attempted inserts, etc. on the view into 
appropriate actions on other tables. Another possibility is to create rules 
(see CREATE RULE), but in practice triggers are easier to understand and use 
correctly.*/