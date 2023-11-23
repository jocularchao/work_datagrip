-- 删除数据

-- delete
delete from test where true;

insert into test (create_time)
values ('2000-10-12 12:00:00');

-- truncate
truncate test;

insert into test (create_time)
values ('2000-10-12 12:00:00');

-- truncate删除数据,自增当前值会恢复到初始值重新开始;不会记录日志.

-- 同样使用DELETE清空不同引擎的数据库表数据.重启数据库服务后
-- InnoDB : 自增列从初始值重新开始 (因为是存储在内存中,断电即失)
-- MyISAM : 自增列依然从上一个自增数据基础上开始 (存在文件中,不会丢失)
