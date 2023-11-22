-- 创建表
create table test(
    id  int ,
    create_time datetime ,
    update_time datetime,
    primary key (`id`)
);


-- 删除表
drop table test;


-- 列约束
create table test(
    id int unsigned,         -- 不能为负数
    create_time datetime not null , -- 非空
    update_time datetime not null default '2023-12-1', -- 设置默认值
    primary key (`id`),         -- 创建主键
    key `key_id` (`id`),        -- 创建外键key_id
    constraint `key_id` foreign key (`id`) references `test` (`id`) -- 给这个外键添加约束即连接其他表 （执行引用） references 引用  这里没有其他表就连自己了

);

-- 配置编码值、自增情况、数据表类型
create table test(
    id int unsigned,         -- 不能为负数
    create_time datetime not null , -- 非空
    update_time datetime not null default '2023-12-1', -- 设置默认值
    primary key (`id`)

)engine=innodb auto_increment=2 default charset=utf8mb4;


-- 查看库内的表
show tables ;

-- 查看表设计
describe test;

-- 返回创建表的语句
show create table test;

-- 修改表
-- 也可以不在表内创建外键
alter table `test` add constraint `key_test` foreign key (`id`) references `test` (`id`);

-- 增加列
alter table `test` add `name` varchar(255);

-- 改名
alter table `test` rename as `test1`;

-- 查看新表
describe test1;

-- 改字段
alter table `test1` modify `name` varchar(100);

-- 改字段并改字段名
alter table `test1` change `name` `name1` varchar(255);

-- 删除字段
alter table `test1` drop `name1`;

-- 要删除外键关系的表，必须先删除引用外键的表，再删除被引用的表  就是先删除references前的表，再删除references后的表
drop table test1;
drop table if exists test;  -- 删除前可以先判断一下



