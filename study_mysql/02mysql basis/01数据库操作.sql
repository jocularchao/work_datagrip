-- 创建数据库
create database mysql_basis;

-- 删除数据库
drop database mysql_basis;

-- 创建时设定编码格式
create database if not exists mysql_basis default char set utf8mb4 collate utf8mb4_general_ci;

-- 使用数据库
use mysql_basis;