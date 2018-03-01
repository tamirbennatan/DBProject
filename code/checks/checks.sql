/*
 * Alter tables to include checks on the the database.
 * Script assumes that database tables are initialized (run `resetDB.sql`).
 * Tables may be populated.
 * If they are populated with faulty values, the ALTER TABLE command will break.
*/

/*
 * Add a check constraint to `ticket`.
 * The field `urgency` should be an integer between 1 and 5.
 * Name the constraint `urgencycheck` for convineince.
 */
alter table ticket
    add constraint urgencycheck
    check (urgency between 1 and 5)
;

/*
 * Add a check constraint to `ticket`
 * The field `status` should be one of 'backlog', 'started', 'complete'
 * Name this constraint `ticketstatuscheck`
 */
 ALTER TABLE ticket
    ADD CONSTRAINT ticketstatuscheck
    CHECK (status in ('backlog', 'started', 'complete'))
;

/*
 * Add a check constraint to `lowticket`
 * The field `pointestimate` should be non-negative.
 * Name this constraint `positivepointestimatecheck`.
 */
alter table lowticket
    add constraint positivepointestimatecheck
    check (pointestimate >= 0)
;

/*
 * Add a check constraint to `sprint`
 * The field `pointgoal` should be non-negative.
 * Name this constraint `positivepointgoalcheck`.
 */
alter table sprint
    add constraint positivepointgoalcheck
    check (pointgoal >= 0)
;
