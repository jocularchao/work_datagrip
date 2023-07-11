-- 增删改查
-- 插入  insert into table_name values (),(),();

insert into vendors values ('JTS02','jocularchao','36 tiananmen','beijing','ON','12345','China'),
                           ('JTS03','jocularchao','200 tiananmen','beijing','OF','65432','China');


-- 更新   update table_name set [name] = '' where id = ;

update vendors set vend_name = 'jocularchao0'
where vend_id = 'JTS03';


-- 删除  delete from table_name where id = ;

delete from vendors where vend_name = 'jocularchao0';

truncate  table  vendors;       -- 删除整个表内容