create database jdbcStudy character set utf8 collate utf8_general_ci;

use jdbcStudy;

create table `users`(
    `id` int ,
    `name` varchar(40),
    `password` varchar(40),
    `email` varchar(60),
    `birthday` date,
    primary key (`id`)
)engine = innodb default charset = utf8;

insert into users (id, name, password, email, birthday)
values (1,'zhangsan','123456','zs@sina.com','1980-12-04'),
       (2,'luoxaing','123456','lx@sina.com','1910-12-04'),
       (3,'lixi','123456','lxi@sina.com','1982-12-04');

select *
from `users`;

insert into `users` (`id`, `name`, `password`, `email`, `birthday`)values (4,'梅长苏','123456','mcs@sin.com','2000-1-1');

delete from users where id=4;

update users set name='胡歌' where name = '赵丽颖';

select `id`, `name`, `password`, `email`, `birthday` from `users` where id = 4;


create table `account`(
    `id` int auto_increment,
    `name` varchar(40),
    `money` float,
    primary key (`id`)
)engine = innodb default charset = utf8;

insert into `account` (`name`,`money`)
values ('A',1000),
       ('B',2000),
       ('C',3000);

select *
from account;