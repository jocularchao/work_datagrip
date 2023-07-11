-- 视图 即虚拟表
-- 虚拟表product_customers
-- 联结三个表返回已订购了任意产品的所有客户的信息
create view product_customers as select cust_name,cust_contact,prod_id
from customers,orders,orderitems
where customers.cust_id=orders.cust_id
and orders.order_num = orderitems.order_num;


desc product_customers;

select *
from product_customers;

select cust_name,cust_contact from product_customers
where prod_id = 'BNBG01';

