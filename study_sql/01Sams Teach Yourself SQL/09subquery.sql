-- 子查询 结合两个或以上的查询 嵌套原理
-- 1、检索prod_id = RGAN01 的 order_num列
select order_num from orderitems
where prod_id = 'RGAN01';

-- 2、查询20007 和 20008 相关的顾客ID
select cust_id from orders
where order_num in (20007,20008);

-- 3、结合成子查询
select cust_id from orders
where order_num in (select order_num from orderitems where prod_id = 'RGAN01');


-- 作为计算字段使用子查询
select count(*) as orders from orders
where cust_id = '1000000001';

select cust_name,cust_state,
(select count(*) from orders where orders.`cust_id` = customers.`cust_id`) as orders
from customers order by cust_name;



