
create user testmysql@localhost identified by '123456';
-- 修改密码 当前用户
set password =password ('123456');


-- 修改密码 指定用户
set password  for  mytest =password ('111111');

-- 重命名
rename user testmysql@localhost to testmysql1@localhost;

-- 用户授权 all privileges 全部权限 ,库，表
grant all privileges on *.* to testmysql1@localhost;

select user();
select user,host from mysql.user;

-- 查询权限
show grants ;
show grants for testmysql1@"localhost";

show grants for root@localhost;


-- 撤销权限 revoke 哪些权限 在哪个库撤销给谁撤销

revoke all privileges on *.* from testmysql1@localhost;

-- 删除用户
drop user testmysql1@localhost;