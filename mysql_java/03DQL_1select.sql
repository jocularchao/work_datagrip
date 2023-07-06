-- 查询所有信息
select *
from student;

-- 查询指定字段
select `studentno`,`studentname` from `student`;

-- 别名
select `studentno` as '学号',`studentname` as '姓名' from `student` as s;

-- 函数 concat(a,b)
select concat('姓名: ',`studentname`) as '学生姓名' from `student`;

select * from result;
-- 查询有哪些同学参加了考试
select `studentno`
from result;

-- 去除select查询出来的结果重复的数据只显示一条
select distinct `studentno` from result;

-- 查询系统版本
select version();

-- 用来计算
select 100*3-1 as 计算结果;

-- 查询自增的步长
select @@auto_increment_increment;

-- 学员考试成绩 +1分查看
select `studentno`,`studentresult`+1 as '提分后'from result;

-- 数据库中的表达式：文本值，列，函数，计算表达式，系统变量
-- select 表达式