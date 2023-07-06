-- 修改学员名字
update `student` set `name` = 'chao' where id = 1;

select *
from student;

update student
set name = 'yichao'
where id = 1;

-- where子句 运算符 id等于 大于 某个值，在某个区间内修改。。。
-- 操作符会返回 布尔值
/*
 == 等于
 <> || != 不等于
 >
 <
 >=
 <=
 between and  从。。到。。闭合区间
 and     &&
 or      ||

 */

-- 通过多个条件定位数据 and

update student
set name = '长江'
where name='yichao' and sex= '女';


