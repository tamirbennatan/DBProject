/* 
 * Isert sample data into the databse. 
 * Around 10 records per table. 
 */ 

-- Sample tuples into the person table
insert into person values 
 	(1, 'Jeff Bezos', '7801331224', 'jeffy@amazon.com'), 
 	(2, 'Tamir Bennatan', '188812213', 'timib@amazon.com'), 
 	(3, 'Jeff Dean', '7842993952', 'chiefjeff@amazon.com'), 
 	(4, 'Ben Tau', '1849482841', 'bennyboo@amazon.com'), 
 	(5, 'Paul Line', '9993991113', 'pauline@amazon.com'),
 	(6, 'Benji Taubenblatt','1234432155','benji@mail.mcgill.ca'),
 	(7, 'Eric Andre', '82746465724', 'ericandre@gmail.com') 
 


insert into clientcompany values 
	(1,'Mango Madness Inc', 3),
	(2,'Killa Bee Records', 1),
	(3,'Seal Brigade Sofas', 2),
	(4,'Al and Co Solutions', 4),
	(5,'Good ol Beef Jerky', 5),
	(6,'Atmosphere Visual Effects', 4),
	(7,'ATB Financial', 2),
	(8,'Bank of Montreal', 3),
	(9,'Bard Ventures', 5),
	(10,'Pure Gold',5) 

insert into team values
	('Enterprise'),
	('Siren')

insert into client values
	(5,8),
	(4,2),
	(7,1)
	
insert into Employee values
	(1, 'Enterprise', 'Lead Developer'),
	(2, 'Enterprise', 'DBA'),
	(3, 'Siren', 'Lead Developer'),
	(6, 'Enterprise', 'Software Developer')
	
insert into developer values
	(1),
	(2),
	(3),
	(6)

insert into project values
	(1,8,'Algorithmic Trading Application', '20017-10-05', 'PULSE')

insert into clientstakeholder values
	(1,5,'Overview project completion')

	

