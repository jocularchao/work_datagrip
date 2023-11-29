-- 创建多个表用于多表查询和连接查询测试

use mysql_basis;

-- 用户表
drop table if exists `t_user`;
create table `t_user`
(
    `id`               int          not null auto_increment,
    `user_uuid`        varchar(36)  null default null comment '用户编号',
    `user_name`        varchar(255) null default null comment '用户名',
    `password`         varchar(255) null default null comment '密码',
    `real_name`        varchar(20)  null default null comment '真实姓名',
    `age`              int          null default null comment '年龄',
    `sex`              int          null default null comment '性别，1男或2女',
    `birth_day`        datetime     null default null comment '出生日期',
    `user_level`       int          null default null comment '学生年级(1-12)',
    `phone`            varchar(255) null default null comment '联系电话',
    `role`             int          null default null comment '用户权限: 1学生 3管理员',
    `status`           int          null default null comment '状态: 1启用 2禁用',
    `image_path`       varchar(255) null default null comment '头像地址',
    `create_time`      datetime     null default null comment '创建时间',
    `modify_time`      datetime     null default null comment '修改时间',
    `last_active_time` datetime     null default null comment '最后激活时间',
    `deleted`          bit(1)       null default null comment '是否删除',
    `wx_open_id`       varchar(255) null default null comment '微信openId',
    primary key (`id`)
) engine = innodb default charset = utf8mb4;

insert into `t_user` values (1,
                             'd2d29da2-dcb3-4013-b874-727626236f47',
                             'student',
                             'd1agfl+gx37t0npg4d6biyp5z31cnbwhk5w1lueihb2zagqbk8efyfsjyoh1z/j1dkirjhu+b0epwzch8igsksjjzd65ci5lsnodqvf4uj6d3pwoscxgqmkjjpzvsjbx42swwnta+qodu8ylo7jhtbuk2x0qcjfgpd+8ej5bgvk=',
                             '学生',
                             18,
                             1,
                             '2019-09-01 16:00:00',
                             1,
                             '19171171610',
                             1,
                             1,
                             'https://www.mindskip.net:9008/image/ba607a75-83ba-4530-8e23-660b72dc4953/头像.jpg',
                             '2019-09-07 18:55:02',
                             '2020-02-04 08:26:54',
                             null,
                             b'0',
                             null);
insert into `t_user` values (2,
                             '52045f5f-a13f-4ccc-93dd-f7ee8270ad4c',
                             'admin',
                             'd1agfl+gx37t0npg4d6biyp5z31cnbwhk5w1lueihb2zagqbk8efyfsjyoh1z/j1dkirjhu+b0epwzch8igsksjjzd65ci5lsnodqvf4uj6d3pwoscxgqmkjjpzvsjbx42swwnta+qodu8ylo7jhtbuk2x0qcjfgpd+8ej5bgvk=',
                             '管理员',
                             30,
                             1,
                             '2019-09-07 18:56:07',
                             null,
                             null,
                             3,
                             1,
                             null,
                             '2019-09-07 18:56:21',
                             null,
                             null,
                             b'0',
                             null);

truncate t_user;
drop table if exists t_user;

-- 用户日志表
drop table if exists `t_user_event_log`;
create table if not exists `t_user_event_log`
(
    `id`          int          not null auto_increment,
    `user_id`     int          null default null comment '用户id',
    `user_name`   varchar(255) null default null comment '用户名',
    `real_name`   varchar(255) null default null comment '真实姓名',
    `content`     text         null default null comment '内容',
    `create_time` datetime     null default null comment '时间',
    primary key (`id`)
) engine = innodb default charset = utf8mb4;



-- 用户Token表
drop table if exists `t_user_token`;
create table if not exists `t_user_token`
(
    `id`          int          not null auto_increment,
    `token`       varchar(36)  null default null comment 'token值',
    `user_id`     int          null default null comment '用户id',
    `wx_open_id`  varchar(255) null default null comment '微信openId',
    `create_time` datetime     null default null comment '创建时间',
    `end_time`    datetime     null default null comment '过期时间',
    `user_name`   varchar(255) null default null comment '用户名',
    primary key (`id`)
) engine = innodb default charset = utf8mb4;


-- 消息表
drop table if exists `t_message`;
create table if not exists `t_message`
(
    `id`                 int          not null auto_increment,
    `title`              varchar(255) null default null comment '标题',
    `content`            varchar(500) null default null comment '内容',
    `create_time`        datetime     null default null,
    `send_user_id`       int          null default null comment '发送者用户id',
    `send_user_name`     varchar(255) null default null comment '发送者用户名',
    `send_real_name`     varchar(255) null default null comment '发送者真实姓名',
    `receive_user_count` int          null default null comment '接受人数',
    `read_count`         int          null default null comment '已读人数',
    primary key (`id`)
) engine = innodb
  default charset = utf8mb4;


-- 用户消息表
drop table if exists `t_message_user`;
create table if not exists `t_message_user`
(
    `id`                int          not null auto_increment,
    `message_id`        int          null default null comment '消息内容Id',
    `receive_user_id`   int          null default null comment '接收人Id',
    `receive_user_name` varchar(255) null default null comment '接收人用户名',
    `receive_real_name` varchar(255) null default null comment '接收人真实姓名',
    `readed`            bit(1)       null default null comment '是否已读',
    `create_time`       datetime     null default null,
    `read_time`         datetime     null default null comment '阅读时间',
    primary key (`id`)
) engine = innodb default charset = utf8mb4;


-- 任务表
drop table if exists `t_task_exam`;
create table if not exists `t_task_exam`
(
    `id`                    int not null auto_increment,
    `title`                 varchar(255) null default null comment '任务主题',
    `grade_level`           int          null default null comment '级别',
    `frame_text_content_id` int          null default null comment '任务框架 JSON格式',
    `create_user`           int          null default null comment '创建任务的用户id',
    `create_time`           datetime     null default null,
    `deleted`               bit(1)       null default null comment '是否删除',
    `create_user_name`      varchar(255) null default null comment '创建任务的用户名',
    primary key (`id`)
) engine = innodb
  default charset = utf8mb4;


-- 用户任务表
drop table if exists `t_task_exam_customer_answer`;
create table if not exists `t_task_exam_customer_answer`
(
    `id`              int      not null auto_increment,
    `task_exam_id`    int      null default null comment '任务id',
    `create_user`     int      null default null comment '创建任务的用户id',
    `create_time`     datetime null default null,
    `text_content_id` int      null default null comment '任务完成情况',
    primary key (`id`)
) engine = innodb
  default charset = utf8mb4;

-- 文本表
drop table if exists `t_text_content`;
create table if not exists `t_text_content`
(
    `id`          int      not null auto_increment,
    `content`     text     null comment '内容',
    `create_time` datetime null default null,
    primary key (`id`)
) engine = innodb
  default charset = utf8mb4;


-- 学科表
drop table if exists `t_subject`;
create table if not exists `t_subject`
(
    `id`         int          not null auto_increment,
    `name`       varchar(255) null default null comment '学科名称',
    `level`      int          null default null comment '年级 (1-12) 小学1-6 初中7-9 高中10 大学11 研究生12',
    `level_name` varchar(255) null default null comment '年级名称(一年级、二年级...)',
    `item_order` int          null default null comment '排序',
    `deleted`    bit(1)       null default null,
    primary key (`id`)
) engine = innodb
  default charset = utf8mb4;


-- 题目表
drop table if exists `t_question`;
create table `t_question`
(
    `id`                   int      not null auto_increment,
    `question_type`        int      null default null comment '题目类型(1.单选题2.多选题3.判断题4.填空题5.简答题)',
    `subject_id`           int      null default null comment '学科id',
    `score`                int      null default null comment '题目总分(千分制)',
    `grade_level`          int      null default null comment '级别',
    `difficult`            int      null default null comment '题目难度',
    `correct`              text     null  comment '正确答案',
    `info_text_content_id` int      null default null comment '题目内容 填空、题干、解析、答案等信息',
    `create_user`          int      null default null comment '创建人',
    `status`               int      null default null comment '1正常',
    `create_time`          datetime null default null comment '创建时间',
    `deleted`              bit(1)   null default null comment '是否删除',
    primary key (`id`)
) engine = innodb
  default charset = utf8mb4;


-- 试卷表
drop table if exists `t_exam_paper`;
create table if not exists `t_exam_paper`
(
    `id`                    int          not null auto_increment,
    `name`                  varchar(255) null default null comment '试卷名称',
    `subject_id`            int          null default null comment '学科id',
    `paper_type`            int          null default null comment '试卷类型（固定试卷 4.时段试卷 6.任务试卷）',
    `grade_level`           int          null default null comment '年级',
    `score`                 int          null default null comment '试卷总分',
    `question_count`        int          null default null comment '题目数量',
    `suggest_time`          int          null default null comment '建议时长（分钟）',
    `limit_start_time`      datetime     null default null comment '时段试卷 开始时间',
    `limit_end_time`        datetime     null default null comment '时段试卷 结束时间',
    `frame_text_content_id` int          null default null comment '试卷框架 内容为json',
    `create_user`           int          null default null comment '创建试卷的用户',
    `create_time`           datetime     null default null,
    `deleted`               bit(1)       null default null,
    `task_exam_id`          int          null default null comment '任务id',
    primary key (`id`)
) engine = innodb default charset = utf8mb4;


-- 试卷答案表
drop table if exists `t_exam_paper_answer`;
create table `t_exam_paper_answer`
(
    `id`               int          not null auto_increment,
    `exam_paper_id`    int          null default null comment '试卷id',
    `paper_name`       varchar(255) null default null comment '试卷名称',
    `paper_type`       int          null default null comment '试卷类型（固定试卷 4.时段试卷 6.任务试卷）',
    `subject_id`       int          null default null comment '科目id',
    `system_score`     int          null default null comment '系统判定得分',
    `user_score`       int          null default null comment '最终得分',
    `paper_score`      int          null default null comment '试卷总分',
    `question_correct` int          null default null comment '做对题目数量',
    `question_count`   int          null default null comment '题目总数量',
    `do_time`          int          null default null comment '做题时间',
    `status`           int          null default null comment '试卷状态(1待判分2完成)',
    `create_user`      int          null default null comment '学生id',
    `create_time`      datetime     null default null comment '提交时间',
    `task_exam_id`     int          null default null comment '任务id',
    primary key (`id`)
) engine = innodb default charset = utf8mb4;


-- 试卷题目答案表
drop table if exists `t_exam_paper_question_customer_answer`;
create table `t_exam_paper_question_customer_answer`
(
    `id`                       int          not null auto_increment,
    `question_id`              int          null default null comment '题目id',
    `exam_paper_id`            int          null default null comment '试卷id',
    `exam_paper_answer_id`     int          null default null comment '试卷答案id',
    `question_type`            int          null default null comment '题型',
    `subject_id`               int          null default null comment '学科',
    `customer_score`           int          null default null comment '得分',
    `question_score`           int          null default null comment '题目原始分数',
    `question_text_content_id` int          null default null comment '问题内容',
    `answer`                   varchar(255) null default null comment '做题答案',
    `text_content_id`          int          null default null comment '做题内容',
    `do_right`                 bit(1)       null default null comment '是否正确',
    `create_user`              int          null default null comment '做题人',
    `create_time`              datetime     null default null,
    `item_order`               int          null default null,
    primary key (`id`)
) engine = innodb
  default charset = utf8mb4;

