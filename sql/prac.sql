-- init table
create table users(
	name VARCHAR(50) NOT NULL 
	PRIMARY KEY(name)
	);

create table subscribe(
	sid int  AUTO_INCREMENT, 
	username VARCHAR(50) NOT NULL, 
	target VARCHAR(50) NOT NULL
	PRIMARY KEY(sid)
);

-- insert data
insert into users (name) values('yale');
insert into users (name) values('node');
insert into users (name) values('kenny');
insert into users (name) values('aaa');
insert into users (name) values('bbb');
insert into users (name) values('ccc');

-- show data
select * from users;
select * from subscribe;

-- show columns
show COLUMNS from users;
show COLUMNS from subscribe;




CREATE TABLE `parent` (
  `id` int PRIMARY KEY
);

CREATE TABLE `child` (
  `id` int,
  `parent_id` int
);

ALTER TABLE `child` ADD FOREIGN KEY (`parent_id`) REFERENCES `parent` (`id`);

