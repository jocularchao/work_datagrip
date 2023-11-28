/*
连接查询
如需要多张数据表的数据进行查询,则可通过连接运算符实现多个查询
内连接 inner join
查询两个表中的结果集中的交集
外连接 outer join
左外连接 left join
(以左表作为基准,右边表来一一匹配,匹配不上的,返回左表的记录,右表以NULL填充)
右外连接 right join
(以右表作为基准,左边表来一一匹配,匹配不上的,返回右表的记录,左表以NULL填充)
*/
select * from t_user_event_log;

select * from t_user_token;
-- 内连接
select t1.user_id,t1.user_name from t_user_token t1
inner join t_user_event_log t2
on t2.user_id=t1.user_id;


-- 左连接



-- 右连接


