
--Returns the employee names of employees who are on teams who have started a sprint after 2017-01-01--
select P1.name 
from person P1
where P1.pid in (select E.pid
				from employee E
				where E.teamname in (select T.teamname
									 from team T
									 where T.teamname in (select S.teamname
									 					  from sprint S	
									 					  where startdate > '2018-01-01')))

-- Selects all pid, name, and teamname of employees who have been assigned to a ticket with priority value = 5 --
-- and grouped and ordered by teamname --	
								 					  
select P.pid, P.name, T.teamname   
from (
	select E.pid, E.teamname --employees pid, teamname whos team has high urgency tickets
	from Employee E 
	where E.teamname in (select A.teamname --teamnames that have high urgency tickets
						from ticketsprintassignment A
						where A.tid in (
							select Tick.tid   --all tickets where urgency is high
							from ticket Tick 
							where Tick.urgency = 5))) as T
join person P on P.pid = T.pid
order by T.teamname, P.name




select S.teamname, S.sprintnumber, sum(T.pointestimate), sum(T.pointactual)
from
	(
		select
    T.tid, T.pointestimate, T2.pointestimate as pointactual
from
    (
        select LowTick.tid, LowTick.pointestimate, T.status
	    from lowticket LowTick
	    join ticket as T on LowTick.tid = T.tid
	) as T
	left join
	(
        select LowTick.tid, LowTick.pointestimate, T.status
	    from lowticket LowTick
	    join ticket as T on LowTick.tid = T.tid
	    where T.status = 'complete'
	) as T2
	on T.tid = T2.tid
	) as T
	join 
	(
		select S.teamname, S.sprintnumber, S.tid
		from ticketsprintassignment S, lowticket T2
		where S.tid = T2.tid
	) as S 
	on S.tid = T.tid
group by S.teamname, S.sprintnumber
order by S.teamname, S.sprintnumber
