-- 清空数据库表
truncate `student`;

select *
from student;

-- 测试delete 和 truncate
create table `test`(
    `id` int(4) not null auto_increment,
    `coll` varchar(20) not null ,
    primary key (`id`)
)engine = INNODB default charset = utf8;

insert into test (coll)
values ('1'),
       ('2'),
       ('3');

select *
from test;

-- 不影响自增
delete
from test;

/*
 UPDATE test_mysql.test SET coll = '1' WHERE id = 4;
UPDATE test_mysql.test SET coll = '2' WHERE id = 5;
UPDATE test_mysql.test SET coll = '3' WHERE id = 6;
*/



truncate test;
/*UPDATE test_mysql.test SET coll = '1' WHERE id = 1;
UPDATE test_mysql.test SET coll = '2' WHERE id = 2;
UPDATE test_mysql.test SET coll = '3' WHERE id = 3;
*/

