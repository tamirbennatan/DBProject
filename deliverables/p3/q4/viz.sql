/*
 * Querries to generate data for visualizations. 
 */ 

/*
 * Query 1: 
 * Get the total number of points scheduled by each client company, per project. 
 * This will be used to create a treemap, to guage how much work each of our clients
 * is asking for. 
 */

select cc.companyname, 
	pr.projid, 
	sum(lt.pointestimate) as total_points
from ticketsprintassignment tsa
inner join lowticket lt 
	on tsa.tid = lt.tid
inner join highticket ht
	on lt.highticketid = ht.tid
inner join project pr 
	on ht.projid = pr.projid
inner join clientcompany cc
	on pr.ccid = cc.ccid
group by (cc.companyname, pr.projid);

/*
 * Query 2:
 * Get the total points achieved by each team in each sprint,
 * and also the point goal.
 * 
 * This is to be used to visualize how the teams are performing, relative to their goals. 
 */
select t.*,
	s.pointgoal
from(
	select tsa.teamname, 
		tsa.sprintnumber, 
		sum(lt.pointestimate) as total_points
	from ticketsprintassignment tsa
	inner join lowticket lt
		on tsa.tid = lt.tid
	group by (tsa.teamname, tsa.sprintnumber)
) t
inner join sprint s
		on t.sprintnumber = s.sprintnumber and
			t.teamname = s.teamname;

