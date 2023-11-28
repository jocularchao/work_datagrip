use mysql_basis;

-- 创建用户表做查询用

drop table if exists `t_user`;

create table if not exists `t_user`  (
  `id` bigint(20) not null auto_increment,
  `user_uuid` varchar(128)  not null comment '用户编号',
  `user_name` varchar(32)  null comment '用户名',
  `password` varchar(255)  null comment '密码',
  `nickname` varchar(32)  null comment '昵称',
  `email` varchar(255)  null comment '邮箱',
  `status` int null comment '1.启用 2.禁用',
  `image_path` varchar(255)  null comment '头像地址',
  `create_time` datetime null comment '创建时间',
  `modify_time` datetime null comment '修改时间',
  `last_active_time` datetime null comment '最近登录时间',
  `is_delete` bit(1) null comment '是否删除',
  primary key (`id`),
  unique key `Key_mail` (`email`)
) engine = innodb  default charset utf8mb4;

insert into t_user (id, user_uuid, user_name, password, nickname, email, status, image_path, create_time, modify_time,
                    last_active_time, is_delete)
values (1,'20231101','username1','123456','u1','u1@user.com',1,'test','2023-11-01 12:00:00','2023-11-02 12:00:00',null,b'0'),
       (2,'20231102','username2','123456','u2','u2@user.com',1,'test','2023-11-01 12:00:00','2023-11-02 12:00:00',null,b'0'),
       (3,'20231103','username3','123456','u3','u3@user.com',1,'test','2023-11-01 12:00:00','2023-11-02 12:00:00',null,b'0'),
       (4,'20231104','username4','123456','u4','u4@user.com',1,'test','2023-11-01 12:00:00','2023-11-02 12:00:00',null,b'0'),
       (5,'20231105','username5','123456','u5','u5@user.com',1,'test','2023-11-01 12:00:00','2023-11-02 12:00:00',null,b'0');

-- 查询所有信息
select *
from t_user;

-- where子句 运算符 id等于 大于 某个值，在某个区间内修改。。。
-- 操作符会返回 布尔值
/*
    一般的比较运算符：包括=、>、<、>=、<=、!=等。
    是否在集合中：in、not in
        in(11,22,33)
        in('北京')

    字符模糊匹配：
        like或not like:
            % 代表0到任意个字符
            _一个字
            __只有两个字
            %1%中间有1的行
        between and  从。。到。。闭合区间
        查询字段为空的行 null ''        where id ='' or id is null   where id ='' or id is not null
    多重条件连接查询：

     and     &&
     or      ||
     not     !
 */


-- 查询指定字段
select id, user_name from t_user where id>1;

-- 别名
select id,user_name as 用户名 from t_user where id>2;

-- 去除select查询出来的结果重复的数据，只显示一条
select distinct id,user_name from t_user;

-- 用来计算
select 1+100 as 加;

-- 设置自增步长
set @auto_increment = 1;

-- 查询自增的步长
select @auto_increment;


-- 数据库中的表达式：文本值，列，函数，计算表达式，系统变量
-- select 表达式