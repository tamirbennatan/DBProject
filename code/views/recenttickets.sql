/*
 * A view which extracts the relevent information about
 * low-level tickets that are sheduled to the _most recent_ sprint. 
 * 
 * This is likely useful, as a company will frequently want to see the status of 
 * tasks relevent to their current sprint.
 * 
 * Relevent information extracted:
 * 
 * - ticket id
 * - sprint number (most recent for that team)
 * - team name (which scheduled the ticket)
 * - business owner which partitioned ticket from a high level ticket
 * - high level ticket id from which each ticket was partitioned
 * - point estimate of low level ticket. 
 */
create view recenttickets as
	with activesprints as (
		select s.teamname, 
			s.sprintnumber
			from (
				select sprintnumber, 
					teamname, 
					max (sprintnumber) over (partition by teamname) as activesprint
				from sprint 
			) s
		where s.sprintnumber = s.activesprint
	)
	select lt.tid, 
		ta.sprintnumber, 
		ta.teamname, 
		ta.datescheduled, 
		lt.bownercreatorid, 
		lt.highticketid, 
		lt.pointestimate
	from ticketsprintassignment ta
	inner join lowticket lt 
		on ta.tid = lt.tid
	inner join activesprints s 
		on ta.sprintnumber = s.sprintnumber
		and ta.teamname = s.teamname;


