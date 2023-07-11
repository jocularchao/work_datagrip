-- 联结
-- 1、有联结条件
select vend_name,prod_name,prod_price
from vendors,products
where vendors.vend_id = products.vend_id  -- 此为联结条件
order by vend_name,prod_name;


-- 2、无联结条件  实际上有的供应商根本没有匹配一些产品
select vend_name,prod_name,prod_price
from vendors,products
order by vend_name,prod_name;


-- 左连接 右连接  内连接
-- 内连接 等值联结  基于两表之间相等部分的联结
select vend_name,prod_name,prod_price       -- 与第一条有联结条件的语句相同
from vendors inner join products p on vendors.vend_id = p.vend_id;

--


-- union  直接连接两个查询  包含在select语句之间 有自动去重
select vend_id,prod_id,prod_price
from products
where prod_price<=5
union
select vend_id,prod_id,prod_price
from products
where vend_id in (1001,1002);


--