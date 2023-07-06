create database if not exists `school`;
-- 创建一个school数据库
use `school`;-- 创建学生表
drop table if exists `student`;
create table `student`
(
    `studentno`    int(4)       not null comment '学号',
    `loginpwd`     varchar(20) default null,
    `studentname`  varchar(20) default null comment '学生姓名',
    `sex`          tinyint(1)  default null comment '性别，0或1',
    `gradeid`      int(11)     default null comment '年级编号',
    `phone`        varchar(50)  not null comment '联系电话，允许为空',
    `address`      varchar(255) not null comment '地址，允许为空',
    `borndate`     datetime    default null comment '出生时间',
    `email`        varchar(50)  not null comment '邮箱账号允许为空',
    `identitycard` varchar(18) default null comment '身份证号',
    primary key (`studentno`),
    unique key `identitycard` (`identitycard`),
    key `email` (`email`)
) engine = myisam
  default charset = utf8;

drop table if exists `grade`;
create table `grade`
(
    `gradeid`   int(11)     not null auto_increment comment '年级编号',
    `gradename` varchar(50) not null comment '年级名称',
    primary key (`gradeid`)
) engine = innodb
  auto_increment = 6
  default charset = utf8;

-- 创建科目表
drop table if exists `subject`;
create table `subject`
(
    `subjectno`   int(11) not null auto_increment comment '课程编号',
    `subjectname` varchar(50) default null comment '课程名称',
    `classhour`   int(4)      default null comment '学时',
    `gradeid`     int(4)      default null comment '年级编号',
    primary key (`subjectno`)
) engine = innodb
  auto_increment = 19
  default charset = utf8;

-- 创建成绩表
drop table if exists `result`;
create table `result`
(
    `studentno`     int(4)   not null comment '学号',
    `subjectno`     int(4)   not null comment '课程编号',
    `examdate`      datetime not null comment '考试日期',
    `studentresult` int(4)   not null comment '考试成绩',
    key `subjectno` (`subjectno`)
) engine = innodb
  default charset = utf8;

insert into `grade` (gradeid, gradename)
values (1, '大一'),
       (2, '大二'),
       (3, '大三'),
       (4, '大四'),
       (5, '预科班');

truncate result;
insert into `result` (studentno, subjectno, examdate, studentresult)
values (1000, 4, '2013-11-11 16:00:00', 85),
       (1001, 7, '2013-11-12 16:00:00', 86),
       (1002, 8, '2013-11-13 16:00:00', 95),
       (1003, 9, '2013-11-11 16:00:00', 65),
       (1004, 2, '2013-11-12 16:00:00', 82),
       (1005, 4, '2013-11-13 16:00:00', 42),
       (1006, 3, '2013-11-12 16:00:00', 52),
       (1007, 4, '2013-11-13 16:00:00', 87),
       (1008, 9, '2013-11-12 16:00:00', 85),
       (1009, 4, '2013-11-13 16:00:00', 89),
       (1010, 6, '2013-11-12 16:00:00', 84),
       (1011, 4, '2013-11-13 16:00:00', 55),
       (1012, 4, '2013-11-11 16:00:00', 15),
       (1013, 6, '2013-11-12 16:00:00', 0),
       (1014, 9, '2013-11-11 16:00:00', 24),
       (1015, 5, '2013-11-13 16:00:00', 100),
       (1016, 9, '2013-11-11 16:00:00', 99),
       (1017, 5, '2013-11-12 16:00:00', 94),
       (1018, 4, '2013-11-13 16:00:00', 63);

truncate student;

insert into student (studentno, loginpwd, studentname, sex, gradeid, phone, address, borndate, email, identitycard)
values (1000, '123456', '郑家祥0', 2, 4, '11111111111', '地址不详', '2000-10-5 00:00:00', 'test@0.com',
        '111111111111111100'),
       (1001, '123456', '郑家祥1', 1, 2, '11111111111', '北京', '2000-10-5 00:00:00', 'test@1.com',
        '111111111111111101'),
       (1002, '123456', '郑家祥2', 1, 3, '11111111111', '天津', '2000-10-5 00:00:00', 'test@2.com',
        '111111111111111102'),
       (1003, '123456', '郑家祥3', 2, 4, '11111111111', '河南', '2000-10-5 00:00:00', 'test@3.com',
        '111111111111111103'),
       (1004, '123456', '郑家祥4', 1, 2, '11111111111', '河北', '2000-10-5 00:00:00', 'test@4.com',
        '111111111111111104'),
       (1005, '123456', '郑家祥5', 2, 4, '11111111111', '湖北', '2000-10-5 00:00:00', 'test@5.com',
        '111111111111111105'),
       (1006, '123456', '郑家祥6', 1, 3, '11111111111', '湖南', '2000-10-5 00:00:00', 'test@6.com',
        '111111111111111106'),
       (1007, '123456', '郑家祥7', 2, 4, '11111111111', '山东', '2000-10-5 00:00:00', 'test@7.com',
        '111111111111111107'),
       (1008, '123456', '郑家祥8', 1, 4, '11111111111', '长春', '2000-10-5 00:00:00', 'test@8.com',
        '111111111111111108'),
       (1009, '123456', '郑家祥9', 2, 4, '11111111111', '吉林', '2000-10-5 00:00:00', 'test@9.com',
        '111111111111111109'),
       (1010, '123456', '郑家祥10', 2, 1, '11111111111', '哈尔滨', '2000-10-5 00:00:00', 'test@10.com',
        '111111111111111110'),
       (1011, '123456', '郑家祥11', 2, 4, '11111111111', '辽宁', '2000-10-5 00:00:00', 'test@11.com',
        '111111111111111112'),
       (1012, '123456', '郑家祥12', 2, 4, '11111111111', '江西', '2000-10-5 00:00:00', 'test@12.com',
        '111111111111111113'),
       (1013, '123456', '郑家祥13', 1, 1, '11111111111', '广东', '2000-10-5 00:00:00', 'test@13.com',
        '111111111111111114'),
       (1014, '123456', '郑家祥14', 2, 4, '11111111111', '陕西', '2000-10-5 00:00:00', 'test@14.com',
        '111111111111111115'),
       (1015, '123456', '郑家祥15', 1, 5, '11111111111', '山西', '2000-10-5 00:00:00', 'test@15.com',
        '111111111111111116'),
       (1016, '123456', '郑家祥16', 2, 4, '11111111111', '甘肃', '2000-10-5 00:00:00', 'test@16.com',
        '111111111111111117'),
       (1017, '123456', '郑家祥17', 1, 5, '11111111111', '新疆', '2000-10-5 00:00:00', 'test@17.com',
        '111111111111111118'),
       (1018, '123456', '郑家祥18', 2, 4, '11111111111', '西藏', '2000-10-5 00:00:00', 'test@18.com',
        '111111111111111111');

insert into subject (subjectno, subjectname, classhour, gradeid)
values (1, '高等数学', 110, 1),
       (2, '大学英语', 100, 2),
       (3, 'java', 120, 3),
       (4, 'c', 130, 4),
       (5, 'c++', 90, 5),
       (6, 'php', 140, 1),
       (7, 'python', 150, 2),
       (8, 'sql', 160, 3),
       (9, 'go', 20, 4);



