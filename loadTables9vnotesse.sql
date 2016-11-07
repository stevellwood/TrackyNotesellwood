drop database if exists tracky;

create database tracky;

use tracky;

drop table if exists member;
drop table if exists team;
drop table if exists project;
drop table if exists note;
drop table if exists user;
drop table if exists team_project_relationship;
drop table if exists member_team_relationship;



create table member (
	id int primary key auto_increment,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	gs_grade varchar(2),
	role varchar(30)
	);
insert into member (id, first_name, last_name, gs_grade, role) values(100,'Janet','Dyne', '05', 'Developer');
insert into member (id, first_name, last_name, gs_grade, role) values(110,'Simon','Williams', '09','Analyst');
insert into member (id, first_name, last_name, gs_grade, role) values(120,'Bruce','Banner', '11','Developer');
insert into member (id, first_name, last_name, gs_grade, role) values(130,'Wade','Wilson', '07','Validator');
insert into member (id, first_name, last_name, gs_grade, role) values(140,'Carol','Danvers', '13','Analyst');
insert into member (id, first_name, last_name, gs_grade, role) values(150,'Pietro','Maximoff', '11','Developer');
insert into member (id, first_name, last_name, gs_grade, role) values(160,'Clinton','Barton', '05','Project Manager');
insert into member (id, first_name, last_name, gs_grade, role) values(170,'Jessica','Drew', '07','Developer');
insert into member (id, first_name, last_name, gs_grade, role) values(180,'Stephen','Strange', '09','Team Lead');
insert into member (id, first_name, last_name, gs_grade, role) values(190,'Emma','Frost', '15', 'Validator');
insert into member (id, first_name, last_name, gs_grade, role) values(200,'James','Howlett', '12', 'Analyst');
insert into member (id, first_name, last_name, gs_grade, role) values(210,'Steven','Rogers', '11', 'Validator');
insert into member (id, first_name, last_name, gs_grade, role) values(220,'Jennifer','Walters', '13', 'Validator');
insert into member (id, first_name, last_name, gs_grade, role) values(230,'Matthew','Murdock', '05', 'Developer');
insert into member (id, first_name, last_name, gs_grade, role) values(240,'Anthony','Stark', '07', 'Developer');
insert into member (id, first_name, last_name, gs_grade, role) values(250,'Peter','Parker', '09', 'Team Lead');
insert into member (id, first_name, last_name, gs_grade, role) values(260,'Johann','Shmidt', '14', 'Project Manager');
insert into member (id, first_name, last_name, gs_grade, role) values(270,'Natasha','Romanova', '14', 'Developer');
insert into member (id, first_name, last_name, gs_grade, role) values(280,'Wanda','Maximoff', '07', 'Project Manager');
insert into member (id, first_name, last_name, gs_grade, role) values(290,'Norman','Osborn', '13', 'Analyst');



create table team(
	id int primary key auto_increment,
	description varchar(50) not null,
    member_id int,
     foreign key (member_id)
      references member(id)
        ON DELETE CASCADE ON UPDATE CASCADE
	);
insert into team (id, description, member_id) values(10101,'Red',110);
insert into team (id, description, member_id) values(10102,'Blue',120);
insert into team (id, description, member_id) values(10103,'Orange',130);
insert into team (id, description, member_id) values(10201,'Yellow',140);
insert into team (id, description, member_id) values(10202,'Black',150);
insert into team (id, description, member_id) values(10203,'White',160);
insert into team (id, description, member_id) values(10301,'Green',170);
insert into team (id, description, member_id) values(10302,'Brown',180);
insert into team (id, description, member_id) values(10303,'Grey',190);
insert into team (id, description, member_id) values(10401,'Purple',100);
insert into team (id, description, member_id) values(10402,'Gold',200);
insert into team (id, description, member_id) values(10403,'Aqua',210);
insert into team (id, description, member_id) values(10501,'Silver',220);
insert into team (id, description, member_id) values(10502,'Maroon',230);
insert into team (id, description, member_id) values(10503,'Lime',240);
insert into team (id, description, member_id) values(10601,'Pink',250);
insert into team (id, description, member_id) values(10602,'Teal',260);
insert into team (id, description, member_id) values(10603,'Taupe',270);
insert into team (id, description, member_id) values(10701,'Maroon',280);
insert into team (id, description, member_id) values(10702,'Beige',290);



create table project (
	id int primary key auto_increment not null, 
	name varchar(30) not null,
	description varchar(150),
	status int not null, 
	priority int,
	start_date date,
	deadline date,
	work_remaining int,
	phase varchar(30),
	tracked boolean not null,
	team_id int,
       	foreign key (team_id) 
        	references team(id) 
        		ON DELETE CASCADE ON UPDATE CASCADE
	);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(10,'CET12', 'Iteration for v12', 0, 1, 20161201, 20161222, 120, "Integration", 0, 10101);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(20,'CET12-SR', 'Story Review v12', 2, 2, 20160905, 20160926, 24, "Requirements", 0, 10102);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(30,'EmpPortalv34', 'Spring for v34', 1, 4, 20161031, 20161121, 56, "Development", 0, 10103);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(40,'EmpPortal34-SR', 'Scrum Review v34', 2, 3, 20161008, 20161029, 74, "Requirements", 0, 10201);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(50,'BNCphase2', 'Sprint 2 for BNC', 2, 1, 20160507, 20160528, 96, "Development", 0, 10202);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(60,'BNC-SR', 'BNC-2 Story Review', 0, 3, 20161209, 20161230, 104, "Requirements", 0, 10203);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(70,'DEDDMS Idx4', 'Indexing Spring v4', 2, 4, 20160915, 20161003, 8, "Development", 0, 10301);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(80,'DEDDMS SR','Scrum Review v4',1,3,20161018,20161111,75,"Requirements", 0, 10302);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(90,'DEDDMS Idx5','Indexing Spring v5',1,4,20161018,20161121,120,"Development", 0, 10303);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(100,'DEDDMS SR','Story Review v5',1,1,20161018,20161119, 92,"Requirements", 0, 10401);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(110,'OASQA','Integration Test',1,2,20161031,20161127,88,"Integration", 0, 10402);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(120,'ELearning-IT3','Iteration 3 for front',1,1,20161019,20161218,160,"Integration", 0, 10403);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(130,'E-learnDB-IT3','Iteration 3 Backend',0,3,20161204,20170108,176,"Development", 0, 10501);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(140,'ELearnPortal-SR','E-learnign Story Review',1,1,20160818,20161206,80,"Requirements", 0, 10502);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(150,'TelecenterIntRev','Review of Telecenter Monitor',0,2,20161111,20161229,400,"P&A", 0, 10503);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(160,'TelecenterIntv45','Phase 1 of v45',1,3,20160915,20170203,72,"Development", 0, 10601);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(170,'OAGS Redesign','OAGS Redesign Ph1',0,1,20161230,20170505,240,"P&A", 0, 10602);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(180,'OAGS Tracker','OAGS Tracker Prod Test',2,1,20161002,20161031,112,"Production", 0, 10603);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(190,'SEP','Stud Enrollment Portal',1,4,20160705,20161109,80,"P&A", 0, 10701);
insert into project (id, name, description, status, priority, start_date, deadline, work_remaining, phase, tracked, team_id) values(200,'College Critic','College Critic',2,3,20160628,20160915,26,"P&A", 0, 10702);



create table note (
	id int primary key auto_increment,
	message varchar(300) NOT NULL,
	time_stamp TIMESTAMP(6),
	flagged boolean NOT NULL,
    project_id int NOT NULL,
       	foreign key (project_id) 
        	references project(id) 
        		ON DELETE CASCADE ON UPDATE CASCADE
	);
insert into note (message, flagged, project_id) values ('Awesome', 0, 10);
insert into note (message, flagged, project_id) values ('Bad', 0, 20);
insert into note (message, flagged, project_id) values ('Amazing', 0, 30);
insert into note (message, flagged, project_id) values ('Classic', 0, 40);
insert into note (message, flagged, project_id) values ('Great', 0, 50);
insert into note (message, flagged, project_id) values ('Super', 0, 60);
insert into note (message, flagged, project_id) values ('Impressive', 0, 70);
insert into note (message, flagged, project_id) values ('Needs Improvement', 0, 80);
insert into note (message, flagged, project_id) values ('Lackluster', 0, 90);
insert into note (message, flagged, project_id) values ('Well Done', 0, 100);
insert into note (message, flagged, project_id) values ('Follow up', 0, 110);
insert into note (message, flagged, project_id) values ('Poor Performance', 0, 120);
insert into note (message, flagged, project_id) values ('Call Bob', 0, 130);
insert into note (message, flagged, project_id) values ('Behind Schedule', 0, 140);
insert into note (message, flagged, project_id) values ('On par with Project 2', 0, 150);
insert into note (message, flagged, project_id) values ('Nice', 0, 160);
insert into note (message, flagged, project_id) values ('Not sure of the new hours remaining', 0, 170);
insert into note (message, flagged, project_id) values ('Okay', 0, 180);
insert into note (message, flagged, project_id) values ('Fred is out sick', 0, 190);
insert into note (message, flagged, project_id) values ('Good Work', 0, 200);



create table member_team_relationship(
	id int primary key auto_increment,
	member_id int not null,
	team_id int not null,
	foreign key (member_id)
	  references member(id)
        ON DELETE CASCADE,
	foreign key (team_id)
	  references team(id)
        ON DELETE CASCADE
	);
insert into member_team_relationship (member_id, team_id) VALUES (100,10101);
insert into member_team_relationship (member_id, team_id) VALUES (160,10102);
insert into member_team_relationship (member_id, team_id) VALUES (190,10201);
insert into member_team_relationship (member_id, team_id) VALUES (150,10202);
insert into member_team_relationship (member_id, team_id) VALUES (170,10301);



create table team_project_relationship(
	id int primary key auto_increment,
	team_id int not null,
	project_id int not null,
	foreign key (team_id)
	  references team(id)
        ON DELETE CASCADE,
	foreign key (project_id)
	  references project(id)
        ON DELETE CASCADE
	);
insert into team_project_relationship (team_id, project_id) VALUES (10201,10);
insert into team_project_relationship (team_id, project_id) VALUES (10202,60);
insert into team_project_relationship (team_id, project_id) VALUES (10203,70);
insert into team_project_relationship (team_id, project_id) VALUES (10101,20);
insert into team_project_relationship (team_id, project_id) VALUES (10301,50);



create table user(
	id int primary key auto_increment,
	username varchar(30) not null,
	password varchar(30) not null,
	first_name varchar(30) not null,
	last_name varchar(30) not null
	);

insert into user (username, password, first_name, last_name) VALUES ('derp.dorpson@ssa.gov','password','Derp', 'Dorpson');
insert into user (username, password, first_name, last_name) VALUES ('pm@ssa.gov','pass','Jane', 'Doe');