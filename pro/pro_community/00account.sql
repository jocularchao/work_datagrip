-- 创建登录用户表

drop table if exists `db_account`;

create table `db_account` (
  `id` int not null auto_increment,
  `username` varchar(255) default null,
  `email` varchar(255) default null,
  `password` varchar(255) default null,
  `role` varchar(255) default null,
  `register_time` datetime default null,
  primary key (`id`),
  unique key `unique_email` (`email`),
  unique key `unique_username` (`username`)
) engine=innodb auto_increment=4 default charset=utf8mb4;
