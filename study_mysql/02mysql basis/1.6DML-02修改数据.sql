-- 修改数据
-- update 表名 set 要更改的数据列 = 要更改的值 [,要更改的数据列2=要更改的值] where 筛选条件

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
update test set update_time = '2023-11-20 18:00:00' where id = 1;
