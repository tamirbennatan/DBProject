import pandas as pd
import numpy as np
from sqlalchemy import create_engine
import configparser
import random
import pdb

# read database credentials from config file
config = configparser.ConfigParser()
config.read("login_credentials.ini")
db_credentials = config["database"]
db_user = db_credentials["username"]
db_pass = db_credentials["password"]
db_url = db_credentials["url"].format(db_user, db_pass)

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
def randomProjects(clientcompany, startdate ="2017-01-01" , enddate = "2018-02-01"):
	"""
	Create randome entries to the `project` table, 
	given entries of the `clientcompany` table. 

	Randomly select a number of projects for each client company, and a random
	start date for each of these projects. 

	input: clientcompany - pandas DataFrame
	returns: project - pandas DataFrame
		In the schema of the `project` table. 
	"""
    # get a range of dates where project may have been started
    daterange = pd.date_range(start = startdate, end = enddate)
    
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
        "annoying important needy scary", 
        "client customer teammate manager"]
    description_func = wordperm_factory(descriptionwords)

    """
    `tid` is the primary key in `tickets` table. 
    Get the maximum value in this column, and increment id's from there. 
    """
    existing_tids= pd.read_sql_query("select tid from ticket", con = engine)
    # get the maximum ticket id so far
    maxtid = (1 if existing_tids.shape[0] == 0 else max(existing_tids['tid']))

    # accumulate the generated tickets
    tics = pd.DataFrame({"tid":[], "urgency":[],\
        "datecreated": [], "status":[],\
        "descripion":[]})
    random.seed(1)
    for i in range(1,n+1):
        # current ticket id
        tid = maxtid + i
        # get random date
        datecreated = random.choice(daterange)
        # get a random urgency
        urgency = random.choice(urgencies)
        # get a random description
        description = description_func()

        # add to dataframe. Status is fixed at 'backlog'
        tics = tics.append({"tid":tid, "urgency":urgency,\
        "datecreated": datecreated, "status":'backlog',\
        "descripion":description}, ignore_index = True)

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
	developer = employee.sample(frac=.7)[['pid']]
	businessowner = employee.sample(frac=.4)[['pid']]
	# push these tables to the database
	developer.to_sql('developer', engine, if_exists = "append", index = False)
	businessowner.to_sql('businessowner', engine, if_exists = "append", index = False)

	"""
	Simulate a bunch of projects. 
	Projects are associated with client companies, and have a date created. 

	Randomly pick a number of projects for each client company, 
	then randomly select a date created for each project. 
	"""
	project = randomProjects(clientcompany)
	# push it the the database
	project.to_sql("project", engine, if_exists = "append", index = False)

	"""
	Populate the stakeholder table. 
	Each entry is a pairing of a client and project id. 
	Only put clients with projects if the employer of that client created the project. 
	"""
	# merge the clients with projects that their employers have initialized. 
	clientstakeholder = pd.merge(client, project, on = "ccid", how = "left")
	clientstakeholder = clientstakeholder[['projid', 'pid']]
	# Put a role for each of the stakeholders
	rolewords = ["Lead Project Feature", "manager requester point-of-contact"]
	rolefunc = wordperm_factory(rolewords)
	clientstakeholder['role'] = [rolefunc() for i in range(clientstakeholder.shape[0])]
	# sample from these client-project combinatinots - not all clients are stakeholers
	clientstakeholder = clientstakeholder.sample(frac = .5)

	# push this table to the database. 
	clientstakeholder.to_sql("clientstakeholder", engine, if_exists = "append", index = False)







































