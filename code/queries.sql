-- how many employees of each title?
SELECT title, COUNT(pid) AS num_employees
FROM employee
GROUP BY title
ORDER BY title
;

-- which businessowners are also developers?
SELECT pid, name, phonenumber, email
FROM person
WHERE
    pid IN
    (
        SELECT pid FROM businessowner
    )
    AND pid IN
    (
        SELECT pid FROM developer
    )
;

-- how many uncompleted tickets does each developer have?
