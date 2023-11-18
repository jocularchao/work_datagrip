-- 首先查看mysql版本
select version(); -- 8.1.0

# student

create table student
(
    id   int          not null auto_increment,
    name varchar(255) not null,
    age  int          not null,
    primary key (`id`)
) engine = innodb charset = utf8;

select *
from student;

# user

create table user
(
    username varchar(255) not null,
    password varchar(255) not null,
    primary key (`username`)
) engine = innodb charset = utf8;
select *
from user;

select *
from user where username = 'test' and password = '123456';


# teacher

create table teacher
(
    tid  int          not null auto_increment,
    tname varchar(255) not null,
    primary key (`tid`)
) engine = innodb charset = utf8;


drop table teacher;


# teach
create table teach(
    tid int not null ,
    sid int not null
)engine = innodb charset = utf8;

select *, teacher.tname as tname from student inner join teach on student.id = teach.sid
                              inner join teacher on teach.tid = teacher.tid where teach.tid = 1