# generating data
import pandas as pd
from pandas.tseries.offsets import MonthBegin, MonthEnd
import numpy as np
import random

# reading command-line args and config files
import configparser
import argparse

# connecting to database
from sqlalchemy import create_engine
import pdb

# read command-line args
argparser = argparse.ArgumentParser()
argparser.add_argument("-l", "--local", action="store_true",
                       help="connect to local db or mcgill server")
args = argparser.parse_args()

# read database credentials from config file
config = configparser.ConfigParser()
config.read("login_credentials.ini")
db_credentials = config["database"]
db_url = db_credentials["url"]

# connect to local or mcgill db based on command-line '--local' option
if args.local:
    db_url = db_url.format(db_credentials["local_hostname"])
else:
    db_url = db_url.format(db_credentials["mcgill_hostname"])

engine = create_engine(db_url)


def wordperm_factory(word_list):
    """
    Return a closure to sample random sentences by taking one word from each string of an input list.

    input: word_list - list of strings
    output: stringgen - closure
        Takes one tken randomly from each of the strings in the input list
    """
    split = [s.split() for s in word_list]
    def stringgen():
        return " ".join([random.sample(l,1)[0] for l in split])

    return stringgen

# Create dummy projects for a list of clientcompanies
def randomProjects(clientcompany, daterange):
    """
    Create randome entries to the `project` table,
    given entries of the `clientcompany` table.

    Randomly select a number of projects for each client company, and a random
    start date for each of these projects.

    input: clientcompany - pandas DataFrame
    returns: project - pandas DataFrame
        In the schema of the `project` table.
    """

    # get a function to generate descriptions for the projects
    descwords = ["A The", "important first test demo",
                "project assignment test proof-of-concept sample"]
    descfunc = wordperm_factory(descwords)

    # get a function to generate random names for the projects
    namewords = ["codename:", "project mission",
               " ".join(str(i) for i in range(100))]
    namefunc = wordperm_factory(namewords)

    # accumulate the projects in a dataframe
    project = pd.DataFrame({"ccid":[], "description":[], "datecreated":[], "name":[]})

    # Add projects for each company
    for ccid in clientcompany['ccid']:
        # pick a random number of projects to have been initialized
        numprojects = np.random.choice(range(11))
        # pick random dates on which the projects were initialized
        projectstarts = np.random.choice(daterange, numprojects)

        # build up a temporary dataframe
        tmp = pd.DataFrame({"ccid": np.repeat(ccid, len(projectstarts)),
                           "datecreated" : projectstarts})
        # add descriptions
        tmp['description'] = [descfunc() for i in range(tmp.shape[0])]
        # add names
        tmp['name'] = [namefunc() for i in range(tmp.shape[0])]

        # add the projects of the current company (tmp) to the global dataframe
        project = pd.concat([project, tmp], ignore_index = True)

    # Finally, add project-id's for each row
    project['projid'] = range(1, project.shape[0] + 1)
    return (project)

# Create (n) randomly populated Tickets, returned as tuples.
# Omit ticket id.

def randomTickets(n, datestart = "2017-01-01", dateend = "2018-02-01"):
    """
    Return n tuples, corresponding to n randomly generated tickets.
    All tickets have datecreated betweeen January 1, 2017  and February 1, 2018.
    All tickets initally have 'status' equal to 'backlog'

    Input: n - integer
        the number of tickets to simulate

    Returns: tics - DataFrame
        Generated tickets - pandas DataFrame.
    """
    # possible urgency values
    urgencies = range(1,6)
    # possible date values
    daterange = pd.date_range(start = datestart, end = dateend)
    # make a function for generating random descriptions
    descriptionwords = ["A The Another",
        "big important critical easy",
        "project untertaking challenge",
        "with for",
        "annoying important needy",
        "client customer teammate manager"]
    description_func = wordperm_factory(descriptionwords)



    # accumulate the generated tickets
    tics = pd.DataFrame({"urgency":[],\
        "datecreated": [], "status":[],\
        "description":[]})
    random.seed(1)
    for i in range(1,n+1):
        # get random date
        datecreated = random.choice(daterange)
        # get a random urgency
        urgency = random.choice(urgencies)
        # get a random description
        description = description_func()

        # add to dataframe. Status is fixed at 'backlog'
        tics = tics.append({"urgency":urgency,\
        "datecreated": datecreated, "status":'backlog',\
        "description":description}, ignore_index = True)

    return tics


if __name__ == '__main__':
    """
    Some of the tables were manually filled in `inserts.sql`, including:

    - people
    - clientcompany
    - team

    This script is to use this data to simulate entries for the rest of the tables.
    """
    np.random.seed(1)
    # First, isolate the tables that were manually filled.
    # These will not be altered by this script
    person = pd.read_sql_query("select * from person", engine)
    clientcompany = pd.read_sql_query("select * from clientcompany", engine)
    team = pd.read_sql_query("select * from team", engine)

    # isolate the date range in question
    daterange = pd.date_range(start = "2017-01-01", end = "2018-02-01")

    """
    Take the existing people in the DB, and split them into employees and clients
    """
    # get the indecies for the employees
    emp_idx = np.random.choice([True, False], person.shape[0], p=[.7, .3])
    # isolate employees and clients
    employee = person.loc[emp_idx]
    client = person.loc[np.logical_not(emp_idx)]

    """
    Clients need to be part of client companies.
    For each client, pick a random client company
    """
    # only keep the person id, and the client company id.
    client = client[['pid']]
    client['ccid'] = np.random.choice(clientcompany['ccid'], size = client.shape[0], replace = True)
    # Clients are ready - can push to database
    client.to_sql('client', engine, if_exists='append', index=False)

    """
    Employees need to be associated with teams.
    For each employee, select a random team (with replacement.
    """
    # only keep the pid column from `person`
    employee = employee[['pid']]
    # pick a random team for each employee
    employee['teamname'] = np.random.choice(team['teamname'], size = employee.shape[0],\
        replace = True)
    # get a function for creating random titles
    titlewords = ["Senior Junior Lead Chief",
        "data web backend full-stack client database",
        "architect engineer scientist developer consultant officer"]
    titlefunc = wordperm_factory(titlewords)
    employee['title'] = [titlefunc() for i in range(employee.shape[0])]

    # employees is ready to go. Push it to the database
    employee.to_sql('employee', engine, if_exists="append", index = False)

    """
    Employees are either developers or business owners.
    They could be both, or neither.
    Sample from employees (with replacement) to populate these individual tables
    """
    developer = employee.sample(frac=.7, random_state = 1)[['pid']]
    businessowner = employee.sample(frac=.4, random_state = 1)[['pid']]
    # push these tables to the database
    developer.to_sql('developer', engine, if_exists = "append", index = False)
    businessowner.to_sql('businessowner', engine, if_exists = "append", index = False)

    """
    Simulate a bunch of projects.
    Projects are associated with client companies, and have a date created.

    Randomly pick a number of projects for each client company,
    then randomly select a date created for each project.
    """
    project = randomProjects(clientcompany, daterange)
    # push it the the database
    project.to_sql("project", engine, if_exists = "append", index = False)

    """
    For each project, there is a business owner accountable for said project.
    This is the contents of the `accountablebowner` table.

    For each project, pick a random business owner to be the accountable bowner.
    """
    # every project has an accountable business onwer (though ER doesn't enforce participation)
    accountablebowner = project[['projid']]
    # pick a random bowner (with replacement) for each project.
    accountablebowner['pid'] = np.random.choice(businessowner['pid'],
        size = accountablebowner.shape[0], replace = True)
    # push to database
    accountablebowner.to_sql("accountablebowner", engine, if_exists = "append", index = False)

    """
    Populate the stakeholder table.
    Each entry is a pairing of a client and project id.
    Only put clients with projects if the employer of that client created the project.
    """
    # merge the clients with projects that their employers have initialized.
    clientstakeholder = pd.merge(client, project, on = "ccid", how = "left")
    clientstakeholder = clientstakeholder[['projid', 'pid']]
    # only keep clients who are working on a project - drop NA
    clientstakeholder.dropna(inplace = True)
    # Put a role for each of the stakeholders
    rolewords = ["Lead Project Feature", "manager requester point-of-contact"]
    rolefunc = wordperm_factory(rolewords)
    clientstakeholder['role'] = [rolefunc() for i in range(clientstakeholder.shape[0])]
    # sample from these client-project combinatinots - not all clients are stakeholers
    clientstakeholder = clientstakeholder.sample(frac = .5, random_state = 1)
    # push this table to the database.
    clientstakeholder.to_sql("clientstakeholder", engine, if_exists = "append", index = False)

    """
    Create the sprints.
    For each team, randomly choose a month of the first sprint.
    From that point on, create monthly sprints for said teams.
    """
    #accumulate the sprints in a dataframe
    sprint = pd.DataFrame({"sprintnumber": [], "teamname": [], "startdate": [], "enddate": []})

    # simulate the sprints for each individual team, and add them to the `sprint` dataframe.
    for t in team['teamname']:
        # get the range of start and enddates for the sprints of that team
        startdate = pd.date_range(start = "2017-01-01", end = "2018-02-01", freq = "M") + MonthBegin(0)
        enddate = startdate + MonthEnd(0)
        # build up a temporary dataframe for the sprints of that team
        tmp = pd.DataFrame({"startdate": startdate, "enddate": enddate})
        # add sprint numbers and team name
        tmp['sprintnumber'] = range(1, tmp.shape[0] + 1)
        tmp['teamname'] = np.repeat(t, tmp.shape[0])
        # for now, put the point goal to thirty - a baseline
        tmp['pointgoal'] = 30

        # accumulate the sprints of all the teams
        sprint = pd.concat([sprint,tmp], ignore_index=True)
    # push sprint to database
    sprint.to_sql("sprint", engine, if_exists = "append", index = False)

    """
    We need to first create the tickets.
    This is so that we can put reasonable point estimates for each sprint - based on
    the tickets that are assigned to that sprint.

    Creating the tickets will be done in stages. First, I'll creat the high-level tickets.
    Then, I'll split each of these high level tickets into several low-level tickets,
    and associate them with sprints.

    All tickets (high and low) are accumulated in the `ticket` table.
    """
    # accumulate all tickets (high and low)
    ticket = pd.DataFrame({"tid":[], "datecreated":[],
                      "description":[], "status":[],
                      "urgency":[]})
    # accumulate high-level tickets as well
    highticket = pd.DataFrame({"tid":[], "projid":[], "clientcreatorid":[]})
    """
    Create 1-5 high level tickets for each project.
    Pretend that one of the employees who work for the client company which
    requested said projects created the high level tickets.
    """
    nextid = 1
    for i in range(project.shape[0]):
        # isolate the given project
        p = project.loc[i]
        # simulate 1-5 tickets for that project - these are to be the high level tickets.
        tmptickets = randomTickets(np.random.choice(range(1,6)),
                                   datestart = p['datecreated'],
                                   dateend = p['datecreated'] + np.timedelta64(30,'D'))
        tmptickets['tid'] = range(nextid, nextid + tmptickets.shape[0])
        nextid += tmptickets.shape[0]
        # add those tickets to the bank of all tickets
        ticket = pd.concat([ticket, tmptickets], ignore_index=True)

        """
        Now add these simulated tickets to the bank of high-level tickets.
        Keep only the needed info on the tickets, and find a client who works
        at the company who initialized the project associated with the ticket to populate
        the `clientcreatorid` field.
        """
        tmptickets = tmptickets[['tid']]
        tmptickets['projid'] = p['projid']
        # isolate the clients that work at the company who requeted this project
        potential_creators = client[client['ccid'] == p['ccid']]['pid']
        tmptickets['clientcreatorid'] = [np.random.choice(potential_creators)
                                         for i in range(tmptickets.shape[0])]

        # add the tickets to the acccumulated high-level tickets
        highticket = pd.concat([highticket, tmptickets], ignore_index=True)

    """
    Now create a bunch of low-level tickets from each high level ticket.
    For low-level ticket, the accountable business owner splits it into low-level tickets
    (although this is is not enforced by the ER.)

    Each low-level ticket generated will popoulate the `lowticket` table,
    as well as appear in the `ticket` table.

    As such, I'll build up a dataframe called `lowticket_extra`, which will contain
    the information needed for the `lowticket` table as well as that of the `ticket` table.

    I'll then project this larger dataframe to get the information for each table individually,
    and push it to the database.
    """
    # Get all the information about the high level tickets in one place
    lowticket_extra = pd.merge(pd.merge(highticket, ticket),accountablebowner).rename(
    columns = {"tid": "highticketid", "pid":"bownercreatorid", 'datecreated':'date_highcreated'})
    # expand each high level ticket to a random number of low level tickets (between 1 and 5)
    lowticket_extra['numtics'] = np.random.choice(range(1,6), size = lowticket_extra.shape[0])
    lowticket_extra = pd.DataFrame([lowticket_extra.ix[idx]
                       for idx in lowticket_extra.index
                       for _ in range(lowticket_extra.ix[idx]['numtics'])]).reset_index(drop=True)

    # Have the date each low-level ticket was created be a between (0,30) days after the
    # date the associated high-level ticket was created.
    lowticket_extra['datecreated'] = [d + np.timedelta64(random.randint(0,31), "D")
                                  for d in lowticket_extra['date_highcreated']]

    # increment the existing ticket id's to add new ticket id's to these low-level tickets.
    lowticket_extra['tid'] = range(int(max(ticket['tid']) + 1),\
         int(max(ticket['tid']) + 1 + lowticket_extra.shape[0]))

    # add random point estimates and urgencies to the low-level tickets.
    lowticket_extra['pointestimate'] = np.random.choice(range(1,6),
        size = lowticket_extra.shape[0])
    lowticket_extra['urgency'] = np.random.choice(range(1,6),
        size = lowticket_extra.shape[0])

    # Isolate the information that belongs in the `lowticket` table.
    lowticket = lowticket_extra[['tid', 'bownercreatorid', 'highticketid', 'pointestimate']]
    # add these generated low-level tickets to the bank of all tickets.
    ticket = pd.concat([ticket, lowticket_extra[['tid', 'urgency',
        'datecreated', 'status','description']]])

    # push `ticket`, `lowticket`, and `highticket` to the database
    ticket.to_sql("ticket", engine, if_exists="append", index = False)
    highticket.to_sql("highticket", engine, if_exists="append", index = False)
    lowticket.to_sql("lowticket", engine, if_exists="append", index = False)

    """
    Assign tickets to sprints to populate the `ticketsprintassignment` table.


    """
    # get the low level tickets, and the dates on which they were created
    ticketsprintassignment = pd.merge(lowticket,ticket)[['tid', 'datecreated']]
    # Pick a random team which will assign this ticket to one of their sprints.
    ticketsprintassignment['teamname'] = np.random.choice(team['teamname'],
                                    size = ticketsprintassignment.shape[0], replace = True)
    # associate the sprint which was active while the ticket was created to the ticket
    ticketsprintassignment['sprintdate'] = ticketsprintassignment['datecreated'].apply(lambda x:
                                         x + MonthBegin(0))
    ticketsprintassignment = pd.merge(ticketsprintassignment, sprint,\
        left_on=['teamname', 'sprintdate'],\
        right_on=['teamname', 'startdate'])[
            ['tid','datecreated', 'teamname', 'enddate', 'sprintnumber']]
    """
    let the date the sprint was scheduled to the sprint be between (0,4)
    days after the ticket was created.
    But it must be the case that that it was assigned to the sprint before the end of the sprint.
    """
    ticketsprintassignment['datescheduled'] = ticketsprintassignment.apply(lambda x:
                                    min(x['datecreated'] + pd.Timedelta(random.randint(0,4), "D"),
                                       x['enddate']), axis = 1)
    # isolate the columns needed
    ticketsprintassignment = ticketsprintassignment[
        ['tid', 'teamname', 'sprintnumber', 'datescheduled']]

    # push to the database
    ticketsprintassignment.to_sql("ticketsprintassignment", engine,
        if_exists = "append", index = False)

    """
    For variety, it would be nice to have some tickets carry over to two consecutive sprints.
    This represents an assigned ticket not being completed in time.

    To do this, I'll sample around one third of the tickets, and put in another entry into
    the `ticketsprintassignment` table, with the same team and ticket number, but the
    `datescheduled` field as the first day of the following month.
    """
    # Select a sample of tickets to carry over to a consecutive sprint.
    notcomplete = ticketsprintassignment[
    ticketsprintassignment['datescheduled'] < pd.to_datetime('2018-01-01').date()
    ].sample(frac = .33, random_state = 1)
    # increment the sprint number
    notcomplete['sprintnumber'] = notcomplete['sprintnumber'] + 1
    # update the `datescheduled` field the the first day of the following month
    notcomplete['datescheduled'] = notcomplete['datescheduled'] + MonthEnd(0) + pd.Timedelta(1, "D")
    # push to the database
    notcomplete.to_sql("ticketsprintassignment", engine, if_exists = "append", index = False)

    """
    Create the table `ticketdeveloperassignment`,
    which keeps track of which developer is assigned to each ticket.

    To do so, look at which team scheduled each low-level ticket to their sprint.
    Then, pick a random developer from said team for each low ticket.
    Mark that the low ticket was assigned to that developer (0-3) days after the
    ticket was scheduled for the sprint.
    """
    # get the date the ticket was scheduled to the sprint by a team,
    # and the developers of that team in one place.
    ticketdeveloperassignment = pd.merge(ticketsprintassignment,
                            pd.merge(employee, developer), how="left")
    # randomly select one developer per developer to assign each ticket to.
    ticketdeveloperassignment = ticketdeveloperassignment.groupby('tid', as_index=False).apply(
    lambda obj: obj.loc[np.random.choice(obj.index, 1),:])
    # Rename `pid` as `devid`
    ticketdeveloperassignment.rename(columns = {"pid": "devid"}, inplace = True)
    # set the date the ticket was assigned to be (0-3) days after the ticket
    # was scheduled to the sprint.
    ticketdeveloperassignment['dateassigned'] = ticketdeveloperassignment['datescheduled'].apply(
    lambda x: x + pd.Timedelta(random.randint(0,4), "D"))
    # Some tickets may not be assigned at all, if the team has no develpers (unlikely).
    # drop them.
    ticketdeveloperassignment.dropna(inplace=True)
    # keep only columns that are neccessary
    ticketdeveloperassignment = ticketdeveloperassignment[['tid', 'devid', 'dateassigned']]
    # push to database.
    ticketdeveloperassignment.to_sql("ticketdeveloperassignment", engine,
        if_exists = "append", index = False)

    """
    Now, need to populate the `projectassignment` table.
    This records all the employees "assinged" to a project.

    To populate this, I'll gather all the developers working on tickets for each project,
    as well as the accountable business owners of said projects,
    and record that they are "assigned" to that project.
    """
    # merge the accountable business owner and the associate project to the low tickets.
    tmp = pd.merge(lowticket, highticket,
        left_on = ['highticketid'], right_on = ['tid'], suffixes=('', '_high'))[
        ['tid', 'bownercreatorid', 'projid']]
    # record the accountable business owner for each project.
    bownerassignments = tmp[['bownercreatorid', 'projid']].drop_duplicates().rename(
        columns = {"bownercreatorid":"pid"})
    bownerassignments['role'] = "Accountable Business Owner"
    # If a developer is assigned to a ticket associated with a certain project,
    # then that developer is assigned to that that project.
    devassignments = pd.merge(ticketdeveloperassignment, tmp,
        how = "left")[['devid', 'projid']].drop_duplicates().rename(
        columns = {"devid":"pid"})
    # Merge the developer and businss owner project assignements to make the `projectassignment` table
    projectassignment = pd.concat([devassignments, bownerassignments])
    """
    An employee may be a business owner as well as a developer.
    Thus, one may be assigned to a project twice - once as a developer and once as a bowner.
    This will violate a key constraint - pk is (pid, projid).

    Instead, keep only the first assignment per employee.
    """
    projectassignment = projectassignment.groupby(['pid', 'projid'], as_index=False).first()
    # push to the database.
    projectassignment.to_sql("projectassignment", engine, if_exists = "append", index = False)
