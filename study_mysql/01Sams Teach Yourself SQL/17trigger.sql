-- 触发器      触发器名，关联的表，应该响应的活动，何时执行
-- 触发器在同一个表唯一 但数据库不唯一 不同的表可以有相同的触发器
-- 每个表最多支持6个触发器

-- 创建触发器
create trigger  newproduct after insert on products
    for each row select 'Product added';

-- 出现错误：Not allowed to return a result set from a trigger
-- MYSQL5以后，不允许触发器返回任何结果，因此使用into @变量名，将结果赋值到变量中，用select调用

-- 删除触发器
drop trigger newproduct;