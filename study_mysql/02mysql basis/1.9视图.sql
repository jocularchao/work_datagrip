-- 视图

-- create view 视图名称(列名) as 子查询语句 [with check option];
create view user_info(`user_uuid` ,`user_name`,`password`,`nickname`,`email`) as select `user_uuid`,`user_name`,`password`,
                                                                                        `nickname`,`email` from t_user
with check option ;

-- 删除视图
drop view user_info;