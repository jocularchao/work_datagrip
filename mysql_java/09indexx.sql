-- 索引的使用

-- 1、在创建表的时候给字段增加索引
-- 2、创建完毕后，增加索引

-- 显示所有的索引信息
show index from student;

-- 增加一个全文索引
alter table school.`student`
    add fulltext index `studentname` (`studentname`);

-- explain 分析sql执行的状况

explain
select *
from student; -- 非全文索引

explain
select *
from student
where match(studentname) against('刘');


-- 测试索引

create table `app_user`
(
    `id`          bigint(20) unsigned not null auto_increment,
    `name`        varchar(50)         default '' comment '用户昵称',
    `email`       varchar(50)         not null comment '用户邮箱',
    `phone`       varchar(20)         default '' comment '手机号',
    `gender`      tinyint(4) unsigned default '0' comment '性别（0：男 1：女）',
    `password`    varchar(100)        not null comment '密码',
    `age`         tinyint(4)          default '0' comment '年龄',
    `create_time` datetime            default current_timestamp on update current_timestamp,
    primary key (`id`)
) engine = innodb
  default charset = utf8 comment = 'app用户表';

desc app_user;



-- 插入100万数据
-- 写函数之前必须要写，标志
delimiter $$
create function mock_data()
    returns int  -- 定义返回类型
begin -- 开始
    declare num int default 1000000; -- 定义变量
    declare i int default 0;
    while i < num
        DO
            set i = i + 1;
    end while ;

    return i;
    end;  -- 结束

insert into app_user(`name`,`email`,`phone`,`gender`,`password`,`age`)
values (concat('用户1')
,concat(floor(rand()*100),'@',ran_email())
,concat('18',ceiling(rand()*((999999999-100000000)+100000000)))
,floor(rand()*2)
,uuid()
,floor(rand()*100));


delimiter $$
create function mock_data()
    returns int
begin
    declare num int default 1000000;
    declare i int default 0;
    while i < num
        DO
        insert into app_user(`name`,`email`,`phone`,`gender`,`password`,`age`)
values (concat('用户',i)
,concat(floor(rand()*100),'@',ran_email(),'.com')
,concat('18',ceiling(rand()*((999999999-100000000)+100000000)))
,floor(rand()*2)
,uuid()
,floor(rand()*100));
        set i = i + 1;
    end while ;

    return i;
    end;

select mock_data();

drop function mock_data;


-- ==========开玩索引=================
 truncate app_user;

select * from app_user where name='用户9999';-- 0.885s

explain select * from app_user where name='用户9999';

select * from app_user;

-- id 表名
-- create index 索引名 on 表 （字段）
create index id_app_user_name on `app_user`(`name`);

select * from app_user where name='用户9999';-- 0.111s

explain select * from app_user where name='用户9999';


