-- where 子句 过滤条件
select prod_id,prod_price from products where prod_price = 3.49;

-- where 操作符
-- = < > <= >= != <> ! 不小于 !> 不大于 between and  is null
-- 逻辑操作符 and  or  in   not   <>
-- 通配符进行过滤 like

-- %  可以匹配多个字符，不能匹配null  即不能写成  '%'
-- %  找到以fish开头的产品
select prod_id,prod_name from products
where prod_name like 'Fish%';

-- % 找到中间内容是 bean bag
select prod_id,prod_name from products
where prod_name like '%bean bag%';

-- % 找到以F y开头结尾的  若以y空格结尾  就F%y%
select prod_id,prod_name from products
where prod_name like 'F%y';

-- 下划线_  只匹配单个字符  一个下划线代表一个字符 写法与%相同
-- 方括号[]  指定一个字符集 匹配指定位置

-- 找到以M或J开头的 -----------------------------------------------失败
select cust_city from customers
where cust_city like '[CD]%'
order by cust_city;


