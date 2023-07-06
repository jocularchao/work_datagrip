
# hmis_cmn
create database if not exists `hmis_cmn` character set utf8;

use `hmis_cmn`;

CREATE TABLE `dict` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '上级id',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `value` bigint(20) DEFAULT NULL COMMENT '值',
  `dict_code` varchar(20) DEFAULT NULL COMMENT '编码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '1' COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`),
  KEY `idx_dict_code` (`dict_code`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织架构表';


#hmis_hosp
create database if not exists `hmis_hosp` character set utf8;

use `hmis_hosp`;

create table `hospital_set` (
  `id` bigint(20) not null auto_increment comment '编号',
  `hosname` varchar(100) default null comment '医院名称',
  `hoscode` varchar(30) default null comment '医院编号',
  `api_url` varchar(100) default null comment 'api基础路径',
  `sign_key` varchar(50) default null comment '签名秘钥',
  `contacts_name` varchar(20) default null comment '联系人',
  `contacts_phone` varchar(11) default null comment '联系人手机',
  `status` tinyint(3) not null default '0' comment '状态',
  `create_time` timestamp not null default current_timestamp comment '创建时间',
  `update_time` timestamp not null default current_timestamp on update current_timestamp comment '更新时间',
  `is_deleted` tinyint(3) not null default '0' comment '逻辑删除(1:已删除，0:未删除)',
  primary key (`id`),
  unique key `uk_hoscode` (`hoscode`)
) engine=innodb auto_increment=2 default charset=utf8 comment='医院设置表';

# hmis_order

create database if not exists `hmis_order` character set utf8;

use `hmis_order`;

create table `order_info` (
  `id` bigint(20) not null auto_increment comment '编号',
  `user_id` bigint(20) default null,
  `out_trade_no` varchar(300) default null comment '订单交易号',
  `hoscode` varchar(30) default null comment '医院编号',
  `hosname` varchar(100) default null comment '医院名称',
  `depcode` varchar(30) default null comment '科室编号',
  `depname` varchar(20) default null comment '科室名称',
  `title` varchar(20) default null comment '医生职称',
  `hos_schedule_id` varchar(50) default null comment '排班编号（医院自己的排班主键）',
  `reserve_date` date default null comment '安排日期',
  `reserve_time` tinyint(3) default '0' comment '安排时间（0：上午 1：下午）',
  `patient_id` bigint(20) default null comment '就诊人id',
  `patient_name` varchar(20) default null comment '就诊人名称',
  `patient_phone` varchar(11) default null comment '就诊人手机',
  `hos_record_id` varchar(30) default null comment '预约记录唯一标识（医院预约记录主键）',
  `number` int(11) default null comment '预约号序',
  `fetch_time` varchar(50) default null comment '建议取号时间',
  `fetch_address` varchar(255) default null comment '取号地点',
  `amount` decimal(10,0) default null comment '医事服务费',
  `quit_time` datetime default null comment '退号时间',
  `order_status` tinyint(3) default null comment '订单状态',
  `create_time` timestamp not null default current_timestamp comment '创建时间',
  `update_time` timestamp not null default current_timestamp on update current_timestamp comment '更新时间',
  `is_deleted` tinyint(3) not null default '0' comment '逻辑删除(1:已删除，0:未删除)',
  primary key (`id`),
  unique key `uk_out_trade_no` (`out_trade_no`),
  key `idx_user_id` (`user_id`),
  key `idx_hoscode` (`hoscode`),
  key `idx_hos_schedule_id` (`hos_schedule_id`),
  key `idx_hos_record_id` (`hos_record_id`)
) engine=innodb auto_increment=12 default charset=utf8 comment='订单表';

#
# structure for table "payment_info"
#

create table `payment_info` (
  `id` int(11) not null auto_increment comment '编号',
  `out_trade_no` varchar(30) default null comment '对外业务编号',
  `order_id` bigint(20) default null comment '订单id',
  `payment_type` tinyint(1) default null comment '支付类型（微信 支付宝）',
  `trade_no` varchar(50) default null comment '交易编号',
  `total_amount` decimal(10,2) default null comment '支付金额',
  `subject` varchar(200) default null comment '交易内容',
  `payment_status` tinyint(3) default null comment '支付状态',
  `callback_time` datetime default null comment '回调时间',
  `callback_content` varchar(1000) default null comment '回调信息',
  `create_time` timestamp not null default current_timestamp comment '创建时间',
  `update_time` timestamp not null default current_timestamp on update current_timestamp comment '更新时间',
  `is_deleted` tinyint(3) not null default '0' comment '逻辑删除(1:已删除，0:未删除)',
  primary key (`id`),
  key `idx_out_trade_no` (`out_trade_no`),
  key `idx_order_id` (`order_id`)
) engine=innodb auto_increment=10 default charset=utf8 comment='支付信息表';

#
# structure for table "refund_info"
#

create table `refund_info` (
  `id` int(11) not null auto_increment comment '编号',
  `out_trade_no` varchar(50) default null comment '对外业务编号',
  `order_id` bigint(20) default null comment '订单编号',
  `payment_type` tinyint(3) default null comment '支付类型（微信 支付宝）',
  `trade_no` varchar(50) default null comment '交易编号',
  `total_amount` decimal(10,2) default null comment '退款金额',
  `subject` varchar(200) default null comment '交易内容',
  `refund_status` tinyint(3) default null comment '退款状态',
  `callback_content` varchar(1000) default null comment '回调信息',
  `callback_time` datetime default null,
  `create_time` timestamp not null default current_timestamp comment '创建时间',
  `update_time` timestamp not null default current_timestamp on update current_timestamp comment '更新时间',
  `is_deleted` tinyint(3) not null default '0' comment '逻辑删除(1:已删除，0:未删除)',
  primary key (`id`),
  key `idx_out_trade_no` (`out_trade_no`),
  key `idx_order_id` (`order_id`)
) engine=innodb default charset=utf8 comment='退款信息表';





# hmis_user
create database if not exists `hmis_user` character set utf8;

use `hmis_user`;

create table `patient`(
    `id` bigint(20) not null auto_increment comment '编号',
    `user_id` bigint(20) default null comment '用户id',
    `name` varchar(20) default null comment '姓名',
    `certificates_type` varchar(3) default null comment '证件类型',
    `certificates_no` varchar(30) default null comment '证件编号',
    `sex` tinyint(3) default null comment '性别',
    `birthdate` date default null comment '出生年月',
    `phone` varchar(11) default null comment '手机',
    `is_marry` tinyint(3) default null comment '是否结婚',
    `province_code` varchar(20) default null comment '省code',
    `city_code` varchar(20) default null comment '市code',
    `district_code` varchar(20) default null comment '区code',
    `address` varchar(100) default null comment '详情地址',
    `contacts_name` varchar(20) default null comment '联系人姓名',
    `contacts_certificates_type` varchar(3) default null comment '联系人证件类型',
    `contacts_certificates_no` varchar(30) default null comment '联系人证件号',
    `contacts_phone` varchar(11) default null comment '联系人手机',
    `card_no` varchar(50) default null comment '就诊卡号',
    `is_insure` tinyint(3) default '0' comment '是否有医保',
    `status` tinyint(3) not null default '0' comment '状态（0：默认 1：已认证）',
    `create_time` timestamp not null default current_timestamp comment '创建时间',
    `update_time` timestamp not null default current_timestamp on update current_timestamp comment '更新时间',
    `is_deleted` tinyint(3) not null default '0' comment '逻辑删除(1:已删除，0:未删除)',
    primary key (`id`),
    key `idx_user_id` (`user_id`)
)engine = innodb auto_increment=8 default charset = utf8 comment ='就诊人表';


create table `user_info` (
  `id` bigint(20) not null auto_increment comment '编号',
  `openid` varchar(100) default null comment '微信openid',
  `nick_name` varchar(20) default null comment '昵称',
  `phone` varchar(11) not null default '' comment '手机号',
  `name` varchar(20) default null comment '用户姓名',
  `certificates_type` varchar(3) default null comment '证件类型',
  `certificates_no` varchar(30) default null comment '证件编号',
  `certificates_url` varchar(200) default null comment '证件路径',
  `auth_status` tinyint(3) not null default '0' comment '认证状态（0：未认证 1：认证中 2：认证成功 -1：认证失败）',
  `status` tinyint(3) not null default '1' comment '状态（0：锁定 1：正常）',
  `create_time` timestamp not null default current_timestamp comment '创建时间',
  `update_time` timestamp not null default current_timestamp on update current_timestamp comment '更新时间',
  `is_deleted` tinyint(3) not null default '0' comment '逻辑删除(1:已删除，0:未删除)',
  primary key (`id`),
  key `uk_mobile` (`phone`)
) engine=innodb auto_increment=8 default charset=utf8 comment='用户表';


create table `user_login_record` (
  `id` bigint(20) not null auto_increment comment '编号',
  `user_id` bigint(20) default null comment '用户id',
  `ip` varchar(32) default null comment 'ip',
  `create_time` timestamp not null default current_timestamp comment '创建时间',
  `update_time` timestamp not null default current_timestamp on update current_timestamp comment '更新时间',
  `is_deleted` tinyint(3) not null default '0' comment '逻辑删除(1:已删除，0:未删除)',
  primary key (`id`),
  key `idx_user_id` (`user_id`)
) engine=innodb auto_increment=40 default charset=utf8 comment='用户登录记录表';
