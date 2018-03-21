from abc import ABC, abstractmethod
# import gui
import pandas as pd

from utils import get_integer_option, get_integer_input, get_confirmation

class ReturnMainMenu(Exception):
    pass

class Submenu(ABC):
    """
    All submenus should be able to be `runned.`
    """
    @abstractmethod
    def run(self, engine):
        pass

    def back_to_main(self, *args):
        raise ReturnMainMenu

class ProjectMenu(Submenu):

    def __init__(self):
        pass


    def run(self, engine):
        message = """
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Projects Menu ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        What would you like to do?

                0. Return to main menu
                1. See all projects.
                2. View the details of a specific project.
                3. Delete a project.
                4. See the employees who are working or have worked on a project.
                5. Add a project.
                6. Back """
        # all the sub-options for this sub-menu
        option_funcs = [
            self.back_to_main,
            self._see_projects,
            self._project_details,
            self._delete_project
            ]
        try:
            while True:
                print(message)
                option = get_integer_option(len(option_funcs))
                # run the desired option
                option_funcs[option](engine)
        except (ReturnMainMenu, KeyboardInterrupt):
            return

    def _see_projects(self,engine):
        sql = "select * from project"
        result = pd.read_sql_query(sql, engine)
        print(result)
        return


    def _project_details(self,engine):
        """
        Get the projectid from the user
        """
        print("""Please input the projectid you'd like to query. 
             hit control-c to go back. """)
        try:
            projid = get_integer_input()
        except KeyboardInterrupt:
            return()
        # make sql query. 
        sql = """
        with t as (
            select p.projid, 
                c.ccid,
                p.description as project_description,
                c.companyname as client_company_name,
                ab.pid as accountable_bowner_id
            from project p 
            inner join clientcompany c
                on p.ccid = c.ccid
            inner join accountablebowner ab
                on p.projid = ab.projid
            where p.projid = %d
            )
            select t.projid, 
                t.ccid, 
                t.project_description, 
                t.client_company_name, 
                p.name as accountable_bowner_name,
                e.title
            from t 
            inner join person p 
                on p.pid = t.accountable_bowner_id
            inner join employee e
                on e.pid = t.accountable_bowner_id
        """% (projid)
        result = pd.read_sql_query(sql, engine)

        print(result)
        return()

    def _delete_project(self, engine):
        """
        Get the projectid you want to delete from the user
        """
        print("""Please input the projectid you'd like to delete. 
             hit control-c to go back. """)
        try:
            projid = get_integer_input()
        except KeyboardInterrupt:
            return()
        """
        Make sure the user knows what he's doing. 
        Very big delete (like a CASCADE)
        """
        warning_msg = """WARNING: Are you sure you want to delete this project?
            All record of the project will be removed, including 
            employee records, tickets associated with the project, etc.)"""
        print(warning_msg)
        # get confirmation from the user that he wants to destroy this table
        try:
            confirmation = get_confirmation()
        except KeyboardInterrupt:
            return()
        if confirmation == 1:
            # write the deletion sql
            sql = """
            -- delete project assigments
            delete 
                from projectassignment 
                where projid = {0};
            -- isolate low tickets that need to be deleted
            drop table if exists lowtickets_to_delete;
            create temporary table lowtickets_to_delete as
                select tid
                from lowticket
                where highticketid in (
                select tid 
                from highticket
                where projid = {0})
                or tid = {0};
            -- drop sprint assignments with dirty tickets
            delete from ticketsprintassignment
            where tid in (select * from lowtickets_to_delete);
            -- delete ticket developer assignments
            delete from ticketdeveloperassignment
                where tid in (select * from lowtickets_to_delete);
            -- delete dirty low-tickets
            delete from lowticket
                where tid in (select * from lowtickets_to_delete);
            -- isolate the hightickets to delete
            drop table if exists high_tickets_to_delete;
            create temporary table high_tickets_to_delete as
	            select tid 
	            from highticket
            where projid = {0};
            -- delete the drity high tickets
            delete from highticket
            	where tid in (select tid from high_tickets_to_delete);
            -- drop all the tickets that need not be there
            delete from ticket
            where tid in (select tid from high_tickets_to_delete)
                or tid in (select tid from lowtickets_to_delete);
            -- delete thedirty clientstakeholders
            delete from clientstakeholder
            where projid = {0};
            -- delete all accountability records
            delete from accountablebowner
            where projid = {0};
            -- delete the project entirely
            delete from project 
            where projid = {0};
            -- drop the temporary table
            drop table if exists lowtickets_to_delete;
            drop table if exists high_tickets_to_delete;
            """.format(projid)
            connection = engine.begin()
            # try and execute delete:
            try:
            	connection.execute(sql)
            	proxy.close()
            	connection.close()
            except Exception as e:
            	print(e)
            	# close the connection
            	connection.close()
        else:
            # if the user changed his mind, go back
            return
























