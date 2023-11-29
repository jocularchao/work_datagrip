-- =========== 常用函数================
select abs (-8);        -- 绝对值
select ceiling(0.1);    -- 向上取整
select floor(0.3);      -- 向下取整
select round(0.5);      -- 四舍五入
select rand();          -- 返回一个0-1之间的随机数
select sign(0);        -- 判断一个数的符号  负数返回-1  正数返回1  0返回0

-- 字符串函数
select char_length('hello'); -- 长度
select concat('i','love','you');  --  拼接字符串
select insert('i love code',2,5,' bake');-- 查询，从某个位置开始替换
select lower('CHAO');  -- 全换成小写
select UPPER('chao');  -- 全换成大写
select instr('chao','h');  -- 返回索引值
select replace('i love code','love','bake');-- 替换指定字符串
select substr('i love code',4,6);  -- 返回指定字符串
select reverse('i love code');  -- 反转字符串



-- 日期和时间函数（重点）
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

-- 系统
select system_user();
select user();
select version();




select user,host from mysql.user;

select concat(round(sum(`studentno`/1024),2),'MB') as data from student;


show databases ;