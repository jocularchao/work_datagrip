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

-- 用户信息表
drop table if exists `user_profile`;
drop table if  exists `question_practice_detail`;
CREATE TABLE `user_profile` (
`id` int NOT NULL,
`device_id` int NOT NULL,
`gender` varchar(14) NOT NULL,
`age` int ,
`university` varchar(32) NOT NULL,
`gpa` float,
`active_days_within_30` int ,
`question_cnt` int ,
`answer_cnt` int
);
-- 答题情况表
CREATE TABLE `question_practice_detail` (
`id` int NOT NULL,
`device_id` int NOT NULL,
`question_id`int NOT NULL,
`result` varchar(32) NOT NULL
);
INSERT INTO user_profile VALUES(1,2138,'male',21,'北京大学',3.4,7,2,12);
INSERT INTO user_profile VALUES(2,3214,'male',null,'复旦大学',4.0,15,5,25);
INSERT INTO user_profile VALUES(3,6543,'female',20,'北京大学',3.2,12,3,30);
INSERT INTO user_profile VALUES(4,2315,'female',23,'浙江大学',3.6,5,1,2);
INSERT INTO user_profile VALUES(5,5432,'male',25,'山东大学',3.8,20,15,70);
INSERT INTO user_profile VALUES(6,2131,'male',28,'山东大学',3.3,15,7,13);
INSERT INTO user_profile VALUES(7,4321,'male',28,'复旦大学',3.6,9,6,52);
INSERT INTO question_practice_detail VALUES(1,2138,111,'wrong');
INSERT INTO question_practice_detail VALUES(2,3214,112,'wrong');
INSERT INTO question_practice_detail VALUES(3,3214,113,'wrong');
INSERT INTO question_practice_detail VALUES(4,6543,111,'right');
INSERT INTO question_practice_detail VALUES(5,2315,115,'right');
INSERT INTO question_practice_detail VALUES(6,2315,116,'right');
INSERT INTO question_practice_detail VALUES(7,2315,117,'wrong');
INSERT INTO question_practice_detail VALUES(8,5432,118,'wrong');
INSERT INTO question_practice_detail VALUES(9,5432,112,'wrong');
INSERT INTO question_practice_detail VALUES(10,2131,114,'right');
INSERT INTO question_practice_detail VALUES(11,5432,113,'wrong');

select qpd.`device_id`,qpd.`question_id`,qpd.`result`
from question_practice_detail as qpd
inner join user_profile on qpd.device_id = user_profile.device_id and user_profile.university = '浙江大学'
order by question_id;


select university,count(question_id)/count(distinct qpd.device_id)
from question_practice_detail as qpd
inner join user_profile up on qpd.device_id = up.device_id
group by university;

-- 题目难度表
CREATE TABLE `question_detail` (
`id` int NOT NULL,
`question_id`int NOT NULL,
`difficult_level` varchar(32) NOT NULL
);

INSERT INTO question_detail VALUES(1,111,'hard');
INSERT INTO question_detail VALUES(2,112,'medium');
INSERT INTO question_detail VALUES(3,113,'easy');
INSERT INTO question_detail VALUES(4,115,'easy');
INSERT INTO question_detail VALUES(5,116,'medium');
INSERT INTO question_detail VALUES(6,117,'easy');



select `university`,`difficult_level`,round(count(qpd.question_id)/count(distinct qpd.device_id),4)  as 'avg_answer_cnt'
from question_practice_detail qpd
inner join user_profile up on qpd.device_id = up.device_id and university = '山东大学'
inner join question_detail qd on qd.question_id = qpd.question_id
group by university,difficult_level;

select `device_id`,`gender`,`age`,`gpa` from user_profile
where university = '山东大学'
union all
select `device_id`,`gender`,`age`,`gpa` from user_profile
where gender = 'male';

select if(age>=25,'25岁及以上','25岁以下') as age_cut,count(*)
from user_profile
group by age_cut;

select
    (case
        when age>=25 then '25岁及以上'
        else '25岁以下' end)as age_cut,
    count(*) from user_profile
group by age_cut;


select device_id,gender,
       (case
           when age<20 then '二十岁以下'
           when age<=24 then '20-24岁'
           when 24<age then '25岁及以上'
           else '其他' end) as age_cut
from user_profile;


-- 平均次日留存率
/*
限定条件：第二天再来。
解法1：表里的数据可以看作是全部第一天来刷题了的，那么我们需要构造出第二天来了的字段，因此可以考虑用left join把第二天来了的拼起来，
限定第二天来了的可以用date_add(date1, interval 1 day)=date2筛选，并用device_id限定是同一个用户。
解法2：用lead函数将同一用户连续两天的记录拼接起来。先按用户分组partition by device_id，再按日期升序排序order by date，
再两两拼接（最后一个默认和null拼接），即lead(date) over (partition by device_id order by date)
平均概率：
解法1：可以count(date1)得到左表全部的date记录数作为分母，count(date2)得到右表关联上了的date记录数作为分子，相除即可得到平均概率
解法2：检查date2和date1的日期差是不是为1，是则为1（次日留存了），否则为0（次日未留存），取avg即可得平均概率。
*/

select avg(if(datediff(date2, date1)=1, 1, 0)) as avg_ret
from (
    select
        distinct device_id,
        date as date1,
        lead(date) over (partition by device_id order by date) as date2
    from (
        select distinct device_id, date
        from question_practice_detail
    ) as uniq_id_date
) as id_last_next_date;


-- 参赛申请
drop table if exists user_submit;
CREATE TABLE `user_submit` (
`id` int NOT NULL,
`device_id` int NOT NULL,
`profile` varchar(100) NOT NULL,
`blog_url` varchar(100) NOT NULL
);
INSERT INTO user_submit VALUES(1,2138,'180cm,75kg,27,male','http:/url/bisdgboy777');
INSERT INTO user_submit VALUES(1,3214,'165cm,45kg,26,female','http:/url/dkittycc');
INSERT INTO user_submit VALUES(1,6543,'178cm,65kg,25,male','http:/url/tigaer');
INSERT INTO user_submit VALUES(1,4321,'171cm,55kg,23,female','http:/url/uhsksd');
INSERT INTO user_submit VALUES(1,2131,'168cm,45kg,22,female','http:/url/sysdney');


select substring_index(profile,',',-1) as gender ,count(device_id) as number
from user_submit
group by gender;

select device_id,substring_index(blog_url,'/',-1) as user_name
from user_submit;

select substring_index(substring_index(profile,',',3),',',-1) as age ,count(device_id) as number
from user_submit
group by age;

select device_id,university,gpa
from user_profile
where (university,gpa) in
      (select university,min(gpa) from user_profile group by university)
order by university;

-- 统计复旦用户8月练题情况
select up.device_id,up.university,sum(if(month(date)=8,1,0)) question_cnt,sum(if(month(date)=8 and result='right',1,0)) right_question_cnt from user_profile up
left join question_practice_detail qpd on up.device_id = qpd.device_id
where university = '复旦大学'
group by up.device_id;

-- 不同难度题目的正确率
select difficult_level,round(sum(if(result='right',1,0))/count(qpd.question_id),4) correct_rate from question_practice_detail qpd
left join user_profile up on qpd.device_id = up.device_id
inner join question_detail qd on qpd.question_id = qd.question_id
where up.university = '浙江大学'
group by difficult_level
order by correct_rate;

