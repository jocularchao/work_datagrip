-- 创建用户信息表
drop table if exists user_profile;

create table `user_profile` (
`id` int not null,
`device_id` int not null,
`gender` varchar(14) not null,
`age` int ,
`university` varchar(32) not null,
`province` varchar(32)  not null);

insert into user_profile values(1,2138,'male',21,'北京大学','beijing');
insert into user_profile values(2,3214,'male',null,'复旦大学','shanghai');
insert into user_profile values(3,6543,'female',20,'北京大学','beijing');
insert into user_profile values(4,2315,'female',23,'浙江大学','zhejiang');
insert into user_profile values(5,5432,'male',25,'山东大学','shandong');

select *
from user_profile;

truncate user_profile;

select `device_id`,`gender`,`age`,`university` from `user_profile` where `university` != '复旦大学';

select `device_id`,`gender`,`age`,`university` from `user_profile` where age is not null ;

-- 计算男生人数以及平均GPA
# 表头重命名，用as语法
# 浮点数的平均值可能小数点位数很多，按照示例保存一位小数，用round函数
-- select count(`gender`) as male_num, round(avg(`gpa`),1) as avg_gpa from user_profile where gender= 'male';

--
