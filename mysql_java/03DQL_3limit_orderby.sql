-- ========= 分页limit 排序 order by ===========

-- 排序order by 升序asc  降序desc
select s.studentno,studentname,subjectname,studentresult
from student s
right join result r on s.studentno = r.studentno
inner join `subject` sub on r.subjectno=sub.subjectno
order by studentresult desc;

-- 分页
-- why? 缓解数据库压力  给人更好的体验  瀑布流
-- limit 第n页 一页最多d个        (n-1)*d,d
-- 总页数 总数/页面大小
select s.studentno,studentname,subjectname,studentresult
from student s
right join result r on s.studentno = r.studentno
inner join `subject` sub on r.subjectno=sub.subjectno
order by studentresult desc;

-- 查询java课程出成绩排名前十，并且分数大于80的学生(学号 姓名 课程名称 成绩)

select s.`studentno`,`studentname`,`subjectname`,`studentresult`
from student s
inner join result r on s.studentno = r.studentno
inner join subject sub on r.subjectno=sub.subjectno
-- where subjectname='java' and studentresult>=80
order by studentresult desc
limit 0,10;

-- =======子查询=========
-- 1、查询python的所有考试结果（学号、考试编号、成绩）,降序
-- 方式一、使用连接查询
select `studentno`,`subjectname`,`studentresult`
from result r
inner join subject sub on r.subjectno=sub.subjectno
where subjectname = 'python'
order by studentresult desc ;

-- 方式二、使用子查询
select `studentno`,`subjectno`,`studentresult`
from result
where subjectno = (
    select subjectno from subject
                     where subjectname = 'python'
    );


-- 2、分数不小于80分的学生的学号和姓名
select s.`studentno`,`studentname`
from student s
inner join result r on r.`studentno`=s.`studentno`
where studentresult>=80;

-- 在此基础上增加一个科目 ，python
select s.`studentno`,`studentname`
from student s
inner join result r on r.`studentno`=s.`studentno`
where studentresult>=80
 -- and subjectname='python';-- 查不了需要查python的编号
 and subjectno=(
     select subjectno from subject where `subjectname`='python'
    );


-- 查询课程为python 且分数不小于80的同学的学号和姓名
select s.studentno,studentname
from student s
inner join result r on s.studentno = r.studentno
inner join subject s2 on r.subjectno = s2.subjectno
where `subjectname`='python' and studentresult>=80;

-- 再改造
select s.studentno,studentname from student s where studentno in (
    select studentno from result where studentresult>80 and subjectno=(
        select subjectno from subject where subjectname ='python'
        )
    );

