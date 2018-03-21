# reading command-line args and config files
import configparser
import argparse

import pandas as pd
import sys
import pdb
# connecting to database
from sqlalchemy import create_engine

from utils import get_integer_option

from submenus import ProjectMenu
# List of all submenus, which one can navigate to from the main menu.
all_submenus = [ProjectMenu()]

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



def main_menu():
    """
    Homepage. 
    Gives the user the options to do the different operations.
    Waits for imput from stddin in an infinite loop. 
    """
    # options to print to user upon reaching main menu. 
    message = """
    ~~~~~~~~~~~~~~~~~~~~~~ Welcome! ~~~~~~~~~~~~~~~~~~~~~~
    
    You've reached the main menu of our super fancy ticket
    support system. 
    
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    What would you like to do? (Hit control-c to quit.)
        
        0. View, delete, or add an active project.
        
    Please input the integer associated with your choice:
    """
    print(message)
    # Get the user input for one of the submenus
    option = get_integer_option(n_options = len(all_submenus))
    # run that submenu
    all_submenus[option].run(engine)

"""
Default to the main menu upon initialization. 
"""
if __name__ == '__main__':
    # open a connection to the database
    engine = create_engine(db_url)
    connection = engine.connect()
    try:
        # Whenever an operation is done, go back to the main menu.
        while True:
            main_menu()
    except (KeyboardInterrupt, SystemExit):
        print("""Thanks for using our DB client. 
            Have a good day.
            """)
        # close the open connection
        connection.close()
        sys.exit(1)
















