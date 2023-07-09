-- 函数

-- 1、文本处理函数
select *
from customers;
-- left ltrim right rtrim length lower upper substring  soundex
-- left 返回字符串左边的字符-----------------------失败
select left('lane') from customers where cust_address like '200%';
-- 长度 length
select length(cust_address)from customers where cust_address like '200%';
-- 大写 upper
select cust_id, upper(cust_address) as cust_address_upper from customers;
-- 小写 lower
select cust_id, lower(upper(cust_address)) as cust_address_lower from customers;
-- 截取字符串 substring
select cust_id,substring(cust_address,3,6) from customers;
select cust_id,substring(cust_address,3) from customers;
-- 返回字符串的soundex值
select soundex(cust_address)from customers where cust_address like '200%';


-- 2、数值处理函数
-- abs ceiling floor round rand sign cos exp pi sin sqrt tan
select abs (-8);        -- 绝对值
select ceiling(0.1);    -- 向上取整
select floor(0.3);      -- 向下取整
select round(0.5);      -- 四舍五入
select rand();          -- 返回一个0-1之间的随机数
select sign(0);         -- 判断一个数的符号  负数返回-1  正数返回1  0返回0
select exp(2);          -- 返回e的n次幂的值
select sqrt(4);         -- 平方根
select pi();            -- 圆周率
select cos(0);          -- 余弦
select sin(pi()/2);     -- 正弦
select tan(pi()/4);     -- 正切

-- 3、字符串函数
-- char_length concat insert lower upper instr replace substr substring reverse
select char_length('hello');                    -- 长度
select concat('i','love','you');                -- 拼接字符串
select insert('i love code',2,5,' bake');       -- 查询，从某个位置开始替换
select lower('CHAO');                           -- 全换成小写
select UPPER('chao');                           -- 全换成大写
select instr('chao','h');                       -- 返回索引值
select replace('i love code','love','bake');    -- 替换指定字符串
select substr('i love code',4,6);               -- 返回指定字符串
select reverse('i love code');                  -- 反转字符串


-- 4、日期和时间处理函数
select current_date(); -- 获取当前日期
select curdate();      -- 获取当前日期
select now();          -- 获取当前日期+时间
select localtime();    -- 获取本地时间
select sysdate();      -- 获取系统时间

select year(now());
select month(now());
select day(now());
select hour(now());
select minute(now());
select second(now());

-- 5、系统
select system_user();
select user();
select version();
