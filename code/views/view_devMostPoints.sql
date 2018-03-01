
/*
* From this devMostPoints table we can get a list of developers,  
* we sort them based on the points they get in descending order. 
* From this table it's easy for the team and company 
* to distinguish which developers did more jobs. 

Relevent information extracted:
 * 
 * - developer id
 * - the points 

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