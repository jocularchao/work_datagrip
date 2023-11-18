-- order by 子句  切记必须在select子句的最后

select prod_name from  products order by prod_name;


-- 按多个列排序
select prod_id, prod_name, prod_price from  products order by prod_price,prod_id;

-- 按位置排序 第二列，第三列排序
select prod_id,prod_price,prod_name from products order by 2,3;

-- 指定排序方向 descending(desc)降序
select prod_id,prod_price,prod_name from products order by prod_price desc ;
select prod_id,prod_price,prod_name from products order by prod_price desc,prod_name;