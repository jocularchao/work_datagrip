select 2

-- 1 存储数据（从左侧插入数据，从右侧插入数据）
lpush key value
rpush key value

-- 2 存储数据（如果key不存在，什么事都不做，如果key存在，但是不是list结构，什么都不做）
lpushx key value
rpushx key value

-- 3 修改数据（在存储数据时，指定好你的索引位置,覆盖之前索引位置的数据，index超出整个列表的长度，也会失败）
lset key 0 value1

-- 4 弹栈方式获取数据（左侧弹出数据，从右侧弹出数据）
lpop key
rpop key

-- 5 获取指定索引范围的数据（start从0开始，stop输入-1，代表最后一个，-2代表倒数第二个）
lrange key 0 -1

-- 6 获取指定索引位置的数据
lindex key 0

-- 7 获取整个列表的长度
llen key

-- 8 删除列表中的数据（他是删除当前列表中的count个value值，count > 0从左侧向右侧删除，count < 0从右侧向左侧删除，count == 0删除列表中全部的value）
lrem key 1 value

-- 9 保留列表中的数据（保留你指定索引范围内的数据，超过整个索引范围被移除掉）
ltrim key 0 -1

-- 10 将一个列表中最后的一个数据，插入到另外一个列表的头部位置
rpoplpush list1 list2