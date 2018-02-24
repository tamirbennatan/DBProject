import pandas as pd
from sqlalchemy import create_engine
import ConfigParser
import pdb

# read database credentials from config file
config = ConfigParser.ConfigParser().read("login_credentials.ini")
db_credentials = config["database"]
db_user = db_credentials["username"]
db_pass = db_credentials["password"]
db_url = db_credentials["url"].format(db_user, db_pass)

engine = create_engine(db_url)

df = pd.read_sql_query('select * from person',con=engine)
