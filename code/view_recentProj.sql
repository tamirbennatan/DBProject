CREATE VIEW recent_project AS 
   SELECT proj_id
   FROM project 
   WHERE date_created > '2017-01-01';

   
/* Recent_project represents the tasks that are the most recent (after 2017-01-01), 
we select them based on their date_created, those that were created after 2017-01-01 
are treated as recent. */