-- informal description of what data each view represents 
-- show CREAT VIEW statements and response of the system 
-- query involving view&response 
-- script of what happens when try run SQL UPDATE statement of each vie
-- summarize con that must hold so DB2/postgreSQL allows updating a view

CREATE view devMostPoints AS 
        SELECT 
        ticketdeveloperassignment.devid, lowticket.pointestimate      
        FROM 
                lowticket, ticketdeveloperassignment
                WHERE lowticket.tid = ticketdeveloperassignment.tid 
                ORDER BY pointestimate DESC;

/* LeastUrgentTask represent the tasks that are of least urgency, 
we select them based on their urgency value, and group those that are 
less than 2 to be the least urgent tasks. 
Views are read only, the system does not change according to an update on a
view. We can get the effect of an updatable view by creating INSTEAD triggers 
on the view, which must convert attempted inserts, etc. on the view into 
appropriate actions on other tables. Another possibility is to create rules 
(see CREATE RULE), but in practice triggers are easier to understand and use 
correctly.*/