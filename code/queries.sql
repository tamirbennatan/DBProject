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
    (-- (tid, devid) for all assigned but unfinished tickets
        SELECT tda.tid, tda.devid
        FROM ticketdeveloperassignment AS tda
        WHERE tda.tid IN
        (
            SELECT tid
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
    p.pid,
    p.name,
    p.phonenumber,
    p.email,
    cp.pointsum,
    cc.pointbudget
FROM
	clientcompany AS cc
	JOIN
        (
            SELECT
                cp.pid,
                c.ccid,
                cp.pointsum
            FROM
                (-- pid and point total for all clients
                    SELECT
                        ht.clientcreatorid AS pid,
                        sum(lt.pointestimate) AS pointsum
                    FROM
                        highticket AS ht
                        JOIN lowticket AS lt
                        ON ht.tid = lt.highticketid
                    GROUP BY
                        ht.tid
                ) AS cp -- Client with Point total
                JOIN client AS c
                ON c.pid = cp.pid
        ) AS cp           
    ON cp.ccid = cc.ccid  
    JOIN person AS p
    ON cp.pid = p.pid
ORDER BY
    cc.companyname,
    p.name
;

--	