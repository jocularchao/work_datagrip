-- =============聚合函数 ============
select count(studentname) from student;  -- count(字段)指定列  会忽略所有的null
select count(*)from student;             -- count(*) ,不会忽略null值,包括了所有的列相当于行数
select count(1)from student;             -- count(1) ,忽略了所有的列，用1代表代码行，不会忽略null值
select sum(`studentresult`)as '总和' from result;
select avg(`studentresult`)as '平均分' from result;
select max(`studentresult`)as '最高分' from result;
select min(`studentresult`)as '最低分' from result;

-- 查询不同课程的平均分、最高分、最低分
-- 核心：（根据不同的课程分组）
select subjectname,avg(studentresult),max(studentresult),min(studentresult),sum(studentresult)
from result r inner join subject s on r.subjectno = s.subjectno
group by r.subjectno
having avg(studentresult)>80;


-- 分组和过滤

