-- 创建多个表用于联结查询测试

-- 用户日志表
drop table if exists `t_user_event_log`;
create table if not exists `t_user_event_log`  (
  `id` bigint(20) not null auto_increment,
  `user_id` int null comment '用户id',
  `user_name` varchar(32) null comment '用户名',
  `content` text null comment '内容',
  `create_time` datetime null comment '时间',
  primary key (`id`)
) engine = innodb  default charset utf8mb4;
insert into t_user_event_log (id, user_id, user_name, content, create_time)
values (1,1121,'username1','content1-1','2023-11-01 12:00:00'),
       (2,1121,'username1','content1-2','2023-11-02 12:00:00'),
       (3,1122,'username2','content2-1','2023-11-01 12:00:00'),
       (4,1122,'username2','content2-1','2023-11-02 12:00:00'),
       (5,1123,'username3','content3-1','2023-11-01 12:00:00'),
       (6,1123,'username3','content3-2','2023-11-02 12:00:00'),
       (7,1124,'username4','content4-1','2023-11-01 12:00:00'),
       (8,1124,'username4','content4-2','2023-11-02 12:00:00'),
       (9,1125,'username5','content5-1','2023-11-01 12:00:00'),
       (10,1125,'username5','content5-2','2023-11-02 12:00:00');


-- 用户token表
drop table if exists `t_user_token`;
create table if not exists `t_user_token`  (
  `id` bigint(20) auto_increment,
  `token` varchar(36) null comment 'token值',
  `user_id` int null comment '用户id',
  `create_time` datetime null comment '创建时间',
  `end_time` datetime null comment '结束时间',
  `user_name` varchar(32) null comment '用户名',
  primary key (`id`)
) engine = innodb  default charset utf8mb4;
insert into t_user_token (id, token, user_id, create_time, end_time, user_name)
values (1,'asdfghjkl1',1121,'2023-11-01 12:00:00','2023-11-08 12:00:00','username1'),
       (2,'asdfghjkl2',1122,'2023-11-01 12:00:00','2023-11-08 12:00:00','username2'),
       (3,'asdfghjkl3',1123,'2023-11-01 12:00:00','2023-11-08 12:00:00','username3'),
       (4,'asdfghjkl4',1124,'2023-11-01 12:00:00','2023-11-08 12:00:00','username4'),
       (5,'asdfghjkl5',1125,'2023-11-01 12:00:00','2023-11-08 12:00:00','username5');

-- 多表查询
select * from t_user_token,t_user_event_log;

-- 连接查询
