use sams_teach_yourself_sql;

# 检索单个列
select vend_address from vendors;


# 检索多个列
select prod_id, prod_name, prod_price from products;


# 检索所有列
select *
from products;

# 检索不同的值 distinct去重
select distinct vend_id from products;
select distinct vend_id , prod_price from products;

# 限制结果
# 限制5行前五行 第0行~第4行
select `prod_desc` from products limit 5 ;
/*
"Fish bean bag toy, complete with bean bag worms with which to feed it"
"Bird bean bag toy, eggs are not included"
"Rabbit bean bag toy, comes with bean bag carrots"
"8 inch teddy bear, comes with cap and jacket"
"12 inch teddy bear, comes with cap and jacket"
*/
# 从第五行开始的五行数据   第5行~第8行
select `prod_desc` from products limit 5 offset 5;
# 简化 limit[offset , limit]
select `prod_desc` from products limit 5,5;
/*
"18 inch teddy bear, comes with cap and jacket"
18 inch Raggedy Ann doll
12 inch king doll with royal garments and crown
12 inch queen doll with royal garments and crown
*/
