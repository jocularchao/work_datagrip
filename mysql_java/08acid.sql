-- ========事务=========
-- mysql是默认开启事务自动提交
set autocommit = 0; -- 关闭
set autocommit = 1; -- 开启 默认

-- 手动处理事务
set autocommit = 0;
-- 事务开启
start transaction ; -- 标记一个事务开始，从这个之后的sql都在同一个事务内

-- 提交：持久化

commit ;
-- 回滚：回到原来的样子
rollback ;

-- 事务结束
set autocommit = 1;

-- 了解
savepoint 保存点名称;  -- 设置一个事务的保持点

rollback to savepoint 保存点名称;  -- 回滚到保存点

release savepoint 保存点名称; -- 撤销保存点





-- =========模拟场景 转账===========
create database shop charset utf8 collate utf8_general_ci;

use shop;

create table `account`(
    `id` int(3) not null auto_increment,
    `name` varchar(30) not null ,
    `money` decimal(9,2) not null ,
    primary key (`id`)
)engine = innodb default charset = utf8;


insert into account(`name`,`money`)
values ('A',2000.00),('B',10000.00);

select *
from account;

-- 事务
set autocommit = 0;
start transaction ;
update account set money = money-500 where `name`='A';
update account set money = money+500 where `name`='B';

commit ;

rollback ;

set autocommit = 1;


