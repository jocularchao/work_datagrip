use mysql_advanced;

-- 字符串函数

-- substring 分割 当它参数为空时，返回null，len<1，结果为空字符串
-- 从中提取子字符串的字符串中第一个字符的位置被视为 1
-- 该函数多字节安全
-- substring(str,pos)
select substring('123456789',5);          -- 56789
-- substring(str from pos)
select substring('123456789' from 4);     -- 456789
-- substring(str,pos,len)
select substring('123456789',5,6);        -- 56789

select substring('123456789', -3);        -- 789

select substring('123456789', -5, 3);     -- 567
-- substring(str from pos for len)
select substring('123456789' from -4 for 2);  -- 67


-- substring_index(str,delim,count)         返回字符串中指定分隔符出现次数之前的子字符串
-- 如果参数为正数，则返回最终分隔符左侧（从左侧算起）的所有内容。
-- 如果为负数，则返回最终分隔符右侧（从右侧算起）的所有内容。
select substring_index('www.mysql.com', '.', 2);    -- www.mysql

select substring_index('www.mysql.com', '.', -2);   -- mysql.com


-- left(str,len)        返回指定的最左边的字符数
-- 该函数是多字节安全的
select left('nihao',2);     -- ni

-- right(str,len)       返回指定的最右边字符数
-- 该函数是多字节安全的
select right('nihao',3);     -- hao

-- trim(str)            删除前导和尾随的空格
-- 该函数是多字节安全的
select ' hello ' ;
select trim(' hello ');

-- rtrim                删除尾随的空格
select rtrim(' hello ');
-- ltrim                删除前导的空格
select ltrim(' hello ');

