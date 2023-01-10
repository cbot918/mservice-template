-- create table
CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50)
);

CREATE TABLE `follow` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_name` int,
  `follow_id` int
);

-- insert data
insert into users (name) values('yale');
insert into users (name) values('node');
insert into users (name) values('kenny');
insert into users (name) values('aaa');
insert into users (name) values('bbb');
insert into users (name) values('ccc');