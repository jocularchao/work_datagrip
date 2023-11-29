-- mysqldump
-- pro_xzs、用mysql yog  导出时注意 -d 是只要求结构
-- 2、命令
mysqldump -hlocalhost -uroot -p123456 school student >D:/sql/school/school1.sql;


mysqldump -hlocalhost -uroot -p123456 school student app_user >D:/sql/school/school1.sql;



-- 导入
use school;

source D:/sql/school/school1.sql;

mysql -uroot -p123456 student  < D:/sql/school/school1.sql;

    -- 假设 你要备份数据库，防止数据丢失
    -- 把数据库给朋友sql文件给别人即可
    --

