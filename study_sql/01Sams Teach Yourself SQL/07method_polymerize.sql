-- 聚合函数
-- 对某些行运行的行数，计算并返回一个值
select count(cust_name) from customers; -- count(字段)指定列  会忽略所有的null
select count(*)from customers;          -- count(*) ,不会忽略null值,包括了所有的列相当于行数
select count(1)from customers;          -- count(1) ,忽略了所有的列，用1代表代码行，不会忽略null值

select sum(prod_price) as '总和' from products;
select avg(prod_price) as '平均' from products;
select max(prod_price) as '最高' from products;
select min(prod_price) as '最低' from products;


-- 聚合不同的值
select avg(distinct prod_price) as avg_price from products
where vend_id like 'BR%';

