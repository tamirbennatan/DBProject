import pandas as pd
from sqlalchemy import create_engine
import ConfigParser
import pdb

# read database credentials from config file
config = ConfigParser.ConfigParser(interpolation=ConfigParser.ExtendedInterpolation())
config = config.read("login_credentials.ini")
db_credentials = config["database"]
db_url = db_credentials["url"]

# get db engine
engine = create_engine(db_url)

# pandas to read from db
df = pd.read_sql_query('select * from person',con=engine)
