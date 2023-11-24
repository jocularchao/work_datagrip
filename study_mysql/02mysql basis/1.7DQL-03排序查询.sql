/*============== 排序 ================
语法 : ORDER BY
ORDER BY 语句用于根据指定的列对结果集进行排序。
ORDER BY 语句默认按照ASC升序对记录进行排序。
如果您希望按照降序对记录进行排序，可以使用 DESC 关键字。
*/

select * from mysql_basis.t_user order by id desc ;

-- 同时添加多个排序，给多个列排序，按顺序进行
select * from t_user order by id ,status desc ;

