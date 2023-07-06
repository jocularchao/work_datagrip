-- WHERE
select `studentno`,`studentresult` from result;

-- 成绩在98到100之间
select `studentno`,`studentresult` from result
where studentresult >=95 and studentresult <=100;

select `studentno`,`studentresult` from result
where studentresult >=95 && studentresult <=100;

-- 模糊查询
select  `studentno`,`studentresult`
from result
where studentresult between 95 and 100;

-- 除了1000号学生之外的成绩
select  `studentno`,`studentresult`
from result
where studentno!=1000;

select  `studentno`,`studentresult`
from result
where not studentno =1000;

-- 模糊查询 比较运算符
-- is null    is not null  between and
-- like    a like b            如果a匹配b则返回真
-- in      a in (a1,a2,a3...)  a在a1，a2中某个值，为真


-- 查询姓刘的同学
-- like 结合百分号% 代表0到任意个字符
select `studentno`,`studentname`from student
where studentname like '刘%';

-- 名字后只有一个字
select `studentno`,`studentname`from student
where studentname like '刘_';


-- 名字后只有两个字
select `studentno`,`studentname`from student
where studentname like '刘__';

-- 查询名字中间有嘉字的同学
select `studentno`,`studentname`from student
where studentname like '%祥%';


-- in  具体的一个或者多个值
-- 查询 1001 1002 1003 号学员
select `studentno`,`studentname`from student
where studentno in (1001,1002,1003);


-- 查询在北京的学生
select `studentno`,`studentname`,`address` from student
where `address` in ('北京');

-- null not null

-- 查询地址为空的学生 null ''

select `studentno`,`studentname`from student
where address='' or address is null;


-- 查询有出生日期的学生 不为空
select `studentno`,`studentname`from student
where `borndate` is not null;

-- 查询有出生日期的学生 为空
select `studentno`,`studentname`from student
where `borndate` is null;


-- ==================联表查询join=====================


-- 查询参加了考试的同学（学号、姓名、科目编号、分数）

select *
from student;

select *
from result;


/*
1、分析需求，分析查询的字段来自那些表（连接查询）
2、确定使用哪种连接查询？ 7种
确定交叉点（这俩个表中那个数据是相同的）
判断的条件：学生表中的studentno=成绩表中的studentno

-- join(连接的表) on(判断的条件) 连接查询
-- where                        等值查询
*/

-- inner join
select s.studentno,studentname,subjectno,studentresult
from student as s
inner join result as r
where s.studentno=r.studentno;


-- right join
select s.studentno,studentname,subjectno,studentresult
from student as s
right join result as r on s.studentno=r.studentno;


-- left join
select s.studentno,studentname,subjectno,studentresult
from student as s
left join result as r on s.studentno=r.studentno;

/*
inner join  如果表中至少有一个匹配上
left join   会从左表中返回，即使右表中没有匹配
right join  会从右表中返回，即使左表中没有匹配
*/

-- 查询缺考的同学
select s.studentno,studentname,subjectno,studentresult
from student as s
left join result as r on s.studentno=r.studentno
where studentresult is null;

-- 思考题（查询了参加考试的同学信息： 学号，学生姓名，科目名，分数）
/*
1、分析需求，分析查询的字段来自那些表（连接查询） student result subject
2、确定使用哪种连接查询？ 7种          right join
确定交叉点（这俩个表中那个数据是相同的）
判断的条件：学生表中的studentno=成绩表中的studentno

-- join(连接的表) on(判断的条件) 连接查询
-- where                        等值查询
*/
select s.studentno,studentname,subjectname,studentresult
from student s
right join result r on s.studentno = r.studentno
inner join `subject` sub on r.subjectno=sub.subjectno;


-- 我要查询哪些数据 select 。。。
-- 从那几个表查 from 表 xxx join 连接的表 on 交叉条件
-- 假设存在一种多张表查询，慢慢来，先查询俩张表在慢慢增加

-- from a left join b
-- from a right join b


-- =======自连接========

create table `category`(
    `categoryid` int(10) unsigned not null auto_increment comment '主题id',
    `pid` int(10) not null comment '父id',
    `categoryName` varchar(50) not null comment '主题名字',
    primary key (`categoryid`)
)engine = innodb auto_increment=9 default charset = utf8;

insert into `category`(`categoryid`,`pid`,`categoryName`)
values ('2','1','信息技术'),
       ('3','1','软件开发'),
       ('4','3','数据库'),
       ('5','1','美术设计'),
       ('6','3','web开发'),
       ('7','5','ps开发'),
       ('8','2','办公信息');

-- 自己的表和自己的表连接 核心：一张表拆为两张一样的表即可

-- 查询父子信息
select a.`categoryName` as '父栏目', b.`categoryName` as '子栏目'
from `category` as a, `category` as b
where a.`categoryid`=b.`pid`;

-- 查询学员所属的年级(学号、姓名、年级)
select `studentno`,`studentname`,`gradename`
from student s
inner join grade g on s.gradeid=g.gradeid;

-- 查询 科目所属的年级(科目名称，年级名称 )
select `subjectname`,`gradename`
from `subject` sub inner join `grade` g on sub.gradeid=g.gradeid;


-- 参加了 考试的同学的同学信息：学号，学生姓名，科目姓名，分数
select s.`studentno`,`studentname`,`subjectname`,`studentresult`
from student s
inner join `result` r on s.studentno=r.studentno
inner join `subject` sub on sub.subjectno=r.subjectno
where subjectname='python';


select *
from subject;


