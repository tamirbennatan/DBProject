import pandas as pd
from sqlalchemy import create_engine

# config parser
import ConfigParser
Config = ConfigParser.ConfigParser()
import pdb

# Read the conig file, and store the database password as a global variable
Config.read("../../config.ini")
DBPWD = Config.get("DBPassword", "Value")

engine =  create_engine('postgresql://cs421g51:{0}@comp421.cs.mcgill.ca:5432/cs421'.format(DBPWD))

df = pd.read_sql_query('select * from person',con=engine)
