drop database chao_blog;
create database if not exists chao_blog character set utf8 collate utf8_general_ci ;

create table `user`(
    `id` int(10) not null auto_increment comment '用户的唯一id',
    `username` varchar(60) not null comment '用户名',
    `password` varchar(60) not null comment '用户密码',
    `sex` varchar(2) not null comment '性别',
    `age` int(3) comment '年龄',
    `sign` varchar(200) comment '签名',
    primary key (`id`)
)engine = innodb default charset = utf8;

create table `category`(
    `id` int(10) not null comment '分类id',
    `category_name` varchar(30) not null comment '分类标题',
    `create_user_id` int(10) not null comment '创建用户的id',
    primary key (`id`)
)engine = innodb default charset = utf8;

drop table category;

create table `blog`(
    `id` int(10) not null comment '文章的唯一标识',
    `title` varchar(100) not null comment '文章标题',
    `author_id` int(10) not null comment '编写文章的用户',
    `category_id` int(10) not null comment '文章分类',
    `content` text comment '文章内容',
    `create_time` datetime not null comment '创建时间',
    `update_time` datetime not null comment '修改时间',
    `love` int(10) comment '喜欢',
    primary key (`id`)
)engine = innodb default charset = utf8;

create table `comment`(
    `id` int(10) not null comment '评论id',
    `blog_id` int(10) not null comment '所属的文章',
    `user_id` int(10) not null comment '评论的内容',
    `content` varchar(2000) not null comment  '评论内容',
    `create_time` datetime not null comment '评论时间',
    `user_id_parent` int(10) not null comment '回复的人的id',
    primary key (`id`)
)engine = innodb default charset = utf8;

create table `links`(
    `id` int(10) not null comment '友链id',
    `links` varchar(50) not null  comment '网站名称',
    `href` varchar(2000) not null comment '网站链接',
    `sort` int(10) not null comment '排序',
    primary key (`id`)
)engine = innodb default charset = utf8;

create table `user_follow` (
    `id` int(10) not null comment '唯一标识',
    `user_id` int(10) not null comment '被关注的id',
    `follow_id` int(10) not null comment '关注人的id',
    primary key (`id`)
)engine = innodb default charset = utf8;

-- nosql (1001:[])