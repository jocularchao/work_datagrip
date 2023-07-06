-- md5加密
create  table if not exists `testmd5`(
    `id` int(4) not null ,
    `name` varchar(20) not null ,
    `pwd` varchar(50) not null ,
    primary key (`id`)
)engine = innodb default charset = utf8;

desc testmd5;
-- 明文密码
insert into testmd5 values (1,'zhangsan','123456'),
                           (2,'luoxiang','123456'),
                           (3,'aiyuejin','123456');

select *
from testmd5;

-- 加密
update testmd5 set pwd=md5(pwd) where id =1;
-- 加密全部
update testmd5 set pwd=md5(pwd);

drop table testmd5;


-- 插入时加密
insert into testmd5 values (1,'zhangsan',md5('123456')),
                           (2,'luoxiang',md5('123456')),
                           (3,'aiyuejin',md5('123456'));

-- 如何校验:将用户传进来的密码进行md5加密，然后对比加密后的值
select * from testmd5 where `name`='aiyuejin' and pwd=md5('123456');