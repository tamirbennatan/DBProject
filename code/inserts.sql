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
 	(7, 'Eric Andre', '82746465724', 'ericandre@gmail.com'), 
 	(8, 'Tif Fany', '3824832238', 'tiff@email.com'), 
 	(9, 'Joe Rogan', '9783224258', 'therealjoe@joe.com'), 
 	(10, 'Max Mcdan', '1984839591' , 'max@hotmail.com'), 
 	(11, 'Jimmy Kim', '2948422039', 'jimmk@yahoo.com'), 
 	(12, 'Jenny Bass', '23855391285', 'jenb@gmail.com'), 
 	(13, 'Dennis Misty', '2484829492', 'missdennis@yahoo.com'), 
 	(14, 'Jeffery Cost', '3942349492', 'costlyjeff@gmail.com'), 
 	(15, 'Tim Chooch', '18883942322', 'tim.chooch@gmail.com'), 
 	(16, 'Colonel Moostard', '2352556245', 'innocentcolonel@gmail.com'), 
 	(17, 'Foo Kyoo', '235925924', 'kfoo@yahoo.com'), 
 	(18, 'Amir Ben-Yehuda', '23345524524', 'amirby@hotmail.com'), 
 	(19, 'Omer Tsion', '2939482948', 'omertz@yahoo.com'),
 	(20, 'Sammy Sprinkle', '2938581948', 'sammyspk@hotmail.com');
 


insert into clientcompany values 
	(1,'Mango Madness Inc', 30),
	(2,'Killa Bee Records', 25),
	(3,'Seal Brigade Sofas', 30),
	(4,'Al and Co Solutions', 40),
	(5,'Good ol Beef Jerky', 35),
	(6,'Atmosphere Visual Effects', 40),
	(7,'ATB Financial', 20),
	(8,'Bank of Montreal', 30),
	(9,'Bard Ventures', 35),
	(10,'Pure Gold',35) ;

insert into team values
	('Web Dev'),
	('Management'), 
	('HR'), 
	('Ad Operations'), 
	('Support'), 
	('Core Dev'), 
	('Data Science'), 
	('Public Relations'), 
	('Sales'), 
	('Office Management');

/*
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
*/

