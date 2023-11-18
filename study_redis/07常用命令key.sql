
select 5

sadd set1 1 2 3 4
-- 1 查看Redis中的全部的key（pattern：* ，xxx*，*xxx）
keys *

-- 2 查看某一个key是否存在（1 - key存在，0 - key不存在）
exists set1

-- 3 删除key
del set1

-- 4 设置key的生存时间，单位为秒，单位为毫秒,设置还能活多久
expire key second
pexpire key milliseconds


-- 5 设置key的生存时间，单位为秒，单位为毫秒,设置能活到什么时间点
expireat key timestamp
pexpireat key milliseconds

-- 6 查看key的剩余生存时间,单位为秒，单位为毫秒（-2 - 当前key不存在，-1 - 当前key没有设置生存时间，具体剩余的生存时间）
ttl key
pttl key

-- 7 移除key的生存时间（1 - 移除成功，0 - key不存在生存时间，key不存在）
persist key