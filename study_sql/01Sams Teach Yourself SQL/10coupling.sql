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


