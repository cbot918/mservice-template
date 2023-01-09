CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50)
);

CREATE TABLE `follow` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_name` int,
  `follow_id` int
);