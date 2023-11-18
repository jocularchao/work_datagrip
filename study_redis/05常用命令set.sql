
select 3

-- 1 存储数据
sadd s 1 2 3 4

-- 2 获取数据（获取全部数据）
smembers s

-- 3 随机获取一个数据（获取的同时，移除数据，count默认为1，代表弹出数据的数量）
spop s 3

-- 4 交集（取多个set集合交集）
sadd s1 1 2
sadd s2 2 3

sinter s s1 s2

-- 5 并集（获取全部集合中的数据）
sunion s1 s2

-- 6 差集（获取多个集合中不一样的数据）
sdiff s2 s1
sdiff s1 s2

-- 7 删除数据
srem s 3

-- 8 查看当前的set集合中是否包含这个值
sismember s 1


