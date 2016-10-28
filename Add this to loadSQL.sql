Add this to loadSQL;
=================================================
create table note (
	id int primary key auto_increment,
	message varchar(300) NOT NULL,
	time_stamp TIMESTAMP(6),
	flagged boolean NOT NULL,
	resolved boolean NOT NULL,
    project_id int NOT NULL,
       	foreign key (project_id) 
        	references project(id) 
        		ON DELETE CASCADE ON UPDATE CASCADE
	);
insert into note (message, flagged, resolved, project_id) values ('Awesome', 0,0, 10);
insert into note (message, flagged, resolved,project_id) values ('Bad', 0,0, 20);
insert into note (message, flagged, resolved,project_id) values ('Amazing', 0,0, 30);
insert into note (message, flagged, resolved,project_id) values ('Classic', 0,0, 40);
insert into note (message, flagged, resolved,project_id) values ('Great', 0,0, 50);
insert into note (message, flagged, resolved,project_id) values ('Super', 0,0, 60);
insert into note (message, flagged, resolved,project_id) values ('Impressive', 0,0, 70);
insert into note (message, flagged, resolved,project_id) values ('Needs Improvement', 0,0, 80);
insert into note (message, flagged, resolved,project_id) values ('Lackluster', 0,0, 90);
insert into note (message, flagged, resolved,project_id) values ('Well Done', 0,0, 100);
insert into note (message, flagged, resolved,project_id) values ('Poor Performance', 0,0, 120);
insert into note (message, flagged, resolved,project_id) values ('Behind Schedule', 0,0, 140);
insert into note (message, flagged, resolved,project_id) values ('Nice', 0,0, 160);
insert into note (message, flagged, resolved,project_id) values ('Okay', 0,0, 180);
insert into note (message, flagged, resolved,project_id) values ('Good Work', 0,0, 200);