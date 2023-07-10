-- 分组
select vend_id,count(*) as num_prods from products
group by vend_id;

-- 过滤分组
select vend_id, count(*) as pro from products
where prod_price>=5
group by vend_id having count(*) >=3;

--

