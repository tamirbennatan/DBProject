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
    pid IN (SELECT pid FROM businessowner)
    AND
    pid IN (SELECT pid FROM developer)
;

-- for all developers, the number of uncompleted tickets assigned to them
WITH
incomplete_ticket_ids as (
    SELECT
        tid
    FROM
        ticket
    WHERE
        status != 'complete'
),
incomplete_tickets_and_their_devs as (
    SELECT
        tid,
        devid
    FROM
        ticketdeveloperassignment
    WHERE
        tid in (SELECT tid FROM incomplete_ticket_ids)
)
SELECT
    p.pid,
    p.name,
    p.email,
    count(d.tid)
FROM
    person AS p
    LEFT JOIN
    incomplete_tickets_and_their_devs AS d
    ON
        p.pid = d.devid
GROUP BY
    p.pid
;

/* clients create high level tickets, which are broken down into
 * low level tickets for developers to work on.  The low level tickets
 * have a point value representing how much work is needed to complete
 * the low level ticket.  client companies pay a monthly sum of dollars which
 * determines how many points worth of work can be done for them per sprint.
 * Therefore, it would be nice to see, for all clients from all client
 * companies, how many points of work that client has asked us to do,
 * compared to the points-per-sprint budget of their company.
 */
WITH
total_points_requested_per_client AS (
    SELECT
        ht.clientcreatorid AS pid,
        sum(lt.pointestimate) AS pointsum
    FROM
        highticket ht
        INNER JOIN
        lowticket lt
        ON
             ht.tid = lt.highticketid
    GROUP BY
         ht.tid
),
client_pointsum_and_clientcompany AS (
    SELECT
        c.pid,
        c.ccid,
        ppc.pointsum
    FROM
        total_points_requested_per_client AS ppc
        INNER JOIN
        client AS c
        ON
            c.pid = ppc.pid
)
SELECT
    cc.companyname,
    p.name,
    p.email,
    cp.pointsum total_points_requested_by_client,
    cc.pointbudget company_sprint_point_budget
FROM
    clientcompany cc
    INNER JOIN
    client_pointsum_and_clientcompany cp
    ON
        cp.ccid = cc.ccid
    INNER JOIN
    person AS p
    ON
        cp.pid = p.pid
ORDER BY
    cc.companyname,
    p.name
;

/*
 * for every sprint of every team, show attempted vs completed points
 */
WITH
lowticket_with_status AS (
    SELECT
        lt.tid,
        lt.pointestimate,
        t.status
    FROM
        lowticket lt
        INNER JOIN
        ticket t
        ON
            lt.tid = t.tid
),
lowticket_with_complete_status AS (
    SELECT
        lt.tid,
        lt.pointestimate,
        t.status
    FROM
       	lowticket lt
       	INNER JOIN
       	ticket AS t
   		     ON lt.tid = t.tid
      	WHERE
            t.status = 'complete'
),
lowticket_with_attemptedpoints_vs_completedpoints AS (
    SELECT
        ltap.tid,
        ltap.pointestimate,
        ltcp.pointestimate as pointactual
	FROM
        lowticket_with_status ltap
        LEFT JOIN
        lowticket_with_complete_status ltcp
        ON
            ltap.tid = ltcp.tid
)
SELECT
    s.teamname,
    s.sprintnumber,
    sum(ltapcp.pointestimate),
    sum(COALESCE(ltapcp.pointactual,0))
FROM
    lowticket_with_attemptedpoints_vs_completedpoints AS ltapcp
    JOIN
    ticketsprintassignment AS s
        ON s.tid = ltapcp.tid
group by s.teamname, s.sprintnumber
order by s.teamname, s.sprintnumber
;
