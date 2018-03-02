-- how many employees of each title?
SELECT
	title,
	count(pid) AS num_employees
FROM
    employee
GROUP BY
    title
ORDER BY
    title
;

-- which businessowners are also developers?
SELECT
    pid,
    name,
    phonenumber,
    email
FROM
    person
WHERE
    pid IN
    (
        SELECT pid
        FROM businessowner
    )
    AND
    pid IN
    (
        SELECT pid
        FROM developer
    )
;

-- how many uncompleted tickets does each developer have?
-- (includes developers who are not assigned any tickets)
SELECT
    p.pid,
    p.name,
    p.email,
    count(t.tid)
FROM
    person AS p
    LEFT JOIN
    (SELECT
        tda.tid,
        tda.devid
    FROM
        ticketdeveloperassignment AS tda
    WHERE
        tda.tid IN
        (SELECT tid
         FROM ticket
         WHERE status != 'complete'
        )
    ) AS t
    ON p.pid = t.devid
GROUP BY
    p.pid
;

-- total sprint points per client and client company
SELECT
	cc.companyname,
    p.name,
    p.email,
    cp.pointsum total_points_requested_by_client,
    cc.pointbudget company_sprint_point_budget
FROM
    clientcompany cc
	JOIN
	(SELECT
	    cp.pid,
	    c.ccid,
	    cp.pointsum
    FROM
        (SELECT
            ht.clientcreatorid pid,
            sum(lt.pointestimate) pointsum
        FROM highticket ht
            JOIN
            lowticket lt
            ON ht.tid = lt.highticketid
        GROUP BY
             ht.tid
        ) AS cp -- Client with Point total
        JOIN client AS c
        ON c.pid = cp.pid
    ) AS cp           
    ON cp.ccid = cc.ccid    
    JOIN
    person AS p
    ON cp.pid = p.pid
ORDER BY
    cc.companyname,
    p.name
;

/*
 * for every sprint of every team, show attempted vs completed points
 */
select S.teamname, S.sprintnumber, sum(T.pointestimate), sum(COALESCE(T.pointactual,0))
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
;