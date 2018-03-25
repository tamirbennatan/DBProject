/* Index 1 --------------------------------------------------------------------------
 * Create clustered index on the 'urgency' field in the <ticket> table. 
 * 
 * This will be helpful in select statements containing urgency of a ticket. 
 * For example, if we want to see only the most urgent tickets:
 *		
 *		SELECT *
 *      WHERE urgency = 5
 * 		FROM ticket;
 *
 * Then we can use the index to save I/O. 
 * Without an index, we'd have to scan all tickets to perform the query above. 
 * With the clustered index, we can read only the data pages where 
 * records with <urgency = 5> reside. 
 */

CREATE INDEX ticket_urgency ON ticket(urgency DESC, datecreated asc);
CLUSTER ticket using ticket_urgency;


/* Index 2 --------------------------------------------------------------------------
 * Create an index on the date a ticket was created
 * This will help speed up range querries on the ticket creation date, such as:

 *		SELECT *
 *      WHERE datecreated > '2018-01-01'
 * 		FROM ticket;
 */

 CREATE INDEX ticket_urgency ON ticket(datecreated ASC);
