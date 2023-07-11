-- 关于建表操作
create table test_test
(
    id   int          not null auto_increment,
    name varchar(255) not null ,
    create_time datetime not null ,
    primary key (`id`)
)engine = innodb charset = utf8;

desc test_test;             -- 查询表结构

alter table test_test add phone char(20) not null ;    -- 更新表
drop table test_test;                                  -- 删除表

rename table test_test to test_tes;                    -- 重命名表

