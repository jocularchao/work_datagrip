-- 聚合函数

--
-- count([distinct]*)   统计所有行数      不会忽略null值,包括了所有的列相当于行数
select count(*) from t_user;

-- count([distinct] 列名) 统计指定列的值的总和    会忽略所有的null
select count(distinct id) from t_user;

-- count(1)     忽略了所有的列，用1代表代码行，不会忽略null值
select count(1) from t_user;

-- sum([distinct]列名)求一列的和（注意必须是数字类型的）
select sum(id) as 'sum' from t_user;

-- avg([distinct]列名)求一列的平均值（注意必须是数字类型）
select avg(`id`)as 'avg' from t_user;

-- max([distinct]列名)求一列的最大值
select max(`id`)as 'max' from t_user;

-- min([distinct]列名)求一列的最小值
select min(`id`)as 'min' from t_user;



