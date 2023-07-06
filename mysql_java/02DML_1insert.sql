-- 插入语句
insert into `grade`(`gradename`) values('大四');
select *
from grade;

-- 由于主键自增我们可以忽略，（如果不写表的字段，他就会一一匹配）
insert into `grade`
values ('大三');
-- Column count doesn't match value count at row 1
-- 一般写插入语句，我们一定要一一对应
insert into `grade` (`gradeid`, `gradename`)
values ('2','大三'),
       ('3','大二');


