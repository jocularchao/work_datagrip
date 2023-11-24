

-- 1、创建用户
-- CREATE USER 用户名 identified by 密码;
create user jocualrchao identified by '123456';

-- 可以不带密码
-- CREATE USER 用户名;
create user jocualrchao;





-- 2、用户登录
-- 在管理员模式cmd中，进入使用的mysql目录bin中，登录
-- login -u 用户名 -p密码   -p和密码之间不能有空格，且大多数情况都是不写-p，另起一行写密码
-- login -u jocualrchao -p123456


-- 虽然此用户能够成功登录，但是并不能查看完整的数据库列表，这是因为此用户还没有权限！
show databases;


-- 3、用户授权
-- 使用grant来为一个数据库用户进行授权：
-- grant all|权限1,权限2...(列1,...) on 数据库.表 to 用户 [with grant option]
-- 其中all代表授予所有权限，当数据库和表为*，代表为所有的数据库和表都授权。如果在最后添加了with grant option，那么被授权的用户还能将已获得的授权继续授权给其他用户
grant all on *.* to jocualrchao with grant option;


-- 我们可以使用revoke来收回一个权限：
-- revoke all|权限1,权限2...(列1,...) on 数据库.表 from 用户
revoke all on *.* from jocualrchao;

-- 登录策略
-- 通过@来限制用户登录的登录IP地址，%表示匹配所有的IP地址，默认使用的就是任意IP地址





