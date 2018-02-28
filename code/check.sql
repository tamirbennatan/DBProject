CREATE TABLE urgentTask (
    tid integer,
	urgency smallint CHECK(urgency>=4),  
	datecreated date,
	status varchar(50),
	description text, 
	primary key (tid)
)


create table lowPointsTickets (
	tid integer, 
	bownercreatorid integer not null, 
	highticketid integer not null, 
	pointestimate smallint CHECK(pointestimate <= 2), 
	primary key (tid), 
	foreign key (tid) references ticket(tid),
	foreign key (highticketid) references highticket(tid), 
	foreign key (bownercreatorid) references businessowner(pid)
);