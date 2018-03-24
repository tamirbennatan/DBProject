/* data visualization 
 * make two charts that visualizes some important aspect of your application from data
 */

-- chart 1
-- list all the current employees info ordered by their teamname, this will allow the team leaders / HR 
-- to find specific person's contact information much easier & faster
-- link to the Google spreedsheet:
-- https://docs.google.com/spreadsheets/d/1pgzkiBT8_r_QXOr07tX4Wz18W3nioQ5iXZz4AIgBDjw/edit#gid=1275080232 

select employee.pid, 
       person.name, 
       employee.title, 
       employee.teamname, 
       person.phonenumber, 
       person.email
from employee, person
where employee.pid = person.pid
order by employee.teamname, person.name;


-- chart 2
-- list all the clients and the tasks, and the teams working on each specific tasks
-- link to the Google spreadsheet:
-- https://docs.google.com/spreadsheets/d/1f6mug-CCLIW1aNvud3YuYLh024P8maJGei8Jzm4hdeI/edit#gid=2037568260

select distinct clientstakeholder.projid, 
                clientstakeholder.pid,
                clientcompany.companyname, 
                clientstakeholder.role, 
                project.description, 
                project.datecreated, 
                project.name
from clientstakeholder, project, client, clientcompany
where clientstakeholder.projid=project.projid and clientstakeholder.pid=client.pid 
      and clientcompany.ccid=client.ccid
order by companyname

