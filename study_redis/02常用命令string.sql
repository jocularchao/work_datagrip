-- string常用命令
-- 1 添加值
set key1 1

-- 2 取值
get key1

-- 3 批量操作
mset key2 "value2" key3 "value3"

-- 4 自增命令
incr key1

-- 5 自减命令
decr key1

-- 6 自增或自减指定数量
incrby key1 4
decrby key1 3

-- 7 设置的同时，指定生存时间（每次向Redis中添加数据时，尽量都设置上生存空间）
setex key1 second value

-- 8 设置值，如果当前key不存在的话（如果这个key存在，什么事都不做，如果这个key不存在，和set命令一样）
setnx key value

-- 9 在key对应的value后，追加内容
append key value

-- 10 查看value字符串的长度
strlen key
