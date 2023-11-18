select 1


-- 1 存储数据
hset key5 field value
hset key6 number 1

-- 2 获取数据
hget key5 field

-- 3 批量操作
hmset key5 field1 "value1" field2 "value2"

-- 4 自增
hincrby key6 number 5

-- 5 设置值（如果key-field不存在，那么就正常添加，如果存在，什么事都不做）
hsetnx key field value

-- 6 检查field是否存在
hexists key6 number

-- 7 删除key对应的field，可以删除多个
hdel key5 field1 field2

-- 8 获取当前hash结构中的全部field和value
hgetall key5

-- 9 获取当前hash结构中的全部field
hkeys key5

-- 10 获取当前hash结构中的全部value
hvals key5

-- 11 获取当前hash结构中field的数量
hlen key5
