-- 库命令
-- 1 通过 select 语句进行切换数据库  0~15
select 0

-- 2 移动key到另一个库
move key1 1

-- 3 清空当前所在数据库
flushdb

-- 4 情况全部数据库
flushall

-- 5 查看当前数据库中有多少key
dbsize

-- 6 查看最后一次操作
lastsave

-- 7 实时 监控redis接收到的命令
monitor





