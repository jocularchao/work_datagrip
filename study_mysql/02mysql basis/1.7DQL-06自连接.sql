-- 等值连接和非等值连接  =>  自连接
-- 自连接
-- 自身连接，就是将表本身和表进行笛卡尔积计算，得到结果，但是由于表名相同，因此要先起一个别名：
select * from t_user_event_log as t1,t_user_event_log as t2;