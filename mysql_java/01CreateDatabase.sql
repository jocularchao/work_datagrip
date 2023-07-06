


select * from student1;
alter table student1 rename as student2;
alter table student2 add age int(1);
select * from student2;
show create table student;
alter table  student2 modify age varchar(1);
alter table student2 change age age1 int(1);
alter table student2 drop age1;
drop table if exists student2;
drop table if exists student;




create table `grade`(
  `gradeid` int(10) not null auto_increment comment '年级id',
  `gradename` varchar(50) not null comment '年级名称',
  primary key (`gradeid`)
)engine = innodb default charset = utf8;
-- 学生表的gradeid字段，要去引用年级表的gradeid
-- 定义外键key
-- 给这个外键添加约束（执行引用） references 引用

create table `student` (
  `id` int(4) not null auto_increment comment '学号',
  `name` varchar(30) not null default '小明' comment '姓名',
  `pwd` varchar(20) not null default '123456' comment '密码',
  `sex` varchar(2) not null default '女' comment '性别',
  `birthday` date default null comment '出生年月',
  `gradeid` int(10) not null comment '学生的年级',
  `address` varchar(100) default null comment '家庭住址',
  `email` varchar(50) default null comment '邮箱',
  primary key (`id`),
  key `fk_gradeid`(`gradeid`),
  constraint `fk_gradeid` foreign key (`gradeid`) references `grade`(`gradeid`)
) engine=innodb auto_increment=2 default charset=utf8;

-- 删除有外键关系的表的时候，必须先删除引用外键的表，再删除被引用的表
drop table if exists student;
drop table if exists grade;




create table `student` (
  `id` int(4) not null auto_increment comment '学号',
  `name` varchar(30) not null default '小明' comment '姓名',
  `pwd` varchar(20) not null default '123456' comment '密码',
  `sex` varchar(2) not null default '女' comment '性别',
  `birthday` date default null comment '出生年月',
  `gradeid` int(10) not null comment '学生的年级',
  `address` varchar(100) default null comment '家庭住址',
  `email` varchar(50) default null comment '邮箱',
  primary key (`id`)
  ) engine=innodb default charset=utf8;

select *
from student;

-- 创建表的时候没有外键关系

alter table  `student`
add constraint `FK_gradeid` foreign key (`gradeid`)
references `grade`(`gradeid`);






