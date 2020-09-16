INSERT INTO wap3g_news ( title, content, pic ) VALUES ( '今天天气不错', '蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg' );
INSERT INTO wap3g_news ( title, content, pic ) VALUES ( '长三角一体化发展如何推进？习近平再次强调两个关键词', '紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg' );
DELETE FROM wap3g_news;
UPDATE message SET name = '';
UPDATE wap3g_comment SET status = 1 WHERE title = '长三角一体化发展如何推进？习近平再次强调两个关键词';
select * from wap3g_news;
select a.*,b.name from message a left join user b on a.userid = b.id;

alter table wap3g_news add column create_time timestamp default value;
ALTER TABLE message ADD column userid int(11);
ALTER TABLE user ADD column avator varchar(2024) NOT NULL COMMENT '头像'
alter table message drop column name;
ALTER TABLE wap3g_comment ALTER status SET DEFAULT 1;

增加属性
ALTER TABLE wap3g_comment ADD status INT;
改属性名
ALTER TABLE message CHANGE name userid int(11);

desc wap3g_news;

winpty mysql -uroot -p111111

show variables like '%char%';
show charset
charset gbk


INSERT INTO wap3g_comment ( name, pic, program ) VALUES ( '默认小王', '','' );

CREATE TABLE `user` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
`name` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
`password` varchar(2024) NOT NULL COMMENT '密码',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='用户表'

CREATE TABLE `message` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
`name` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
`pic` varchar(2024) NOT NULL COMMENT '图片',
`program` varchar(8192) NOT NULL COMMENT '内容',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='跟帖表'

CREATE TABLE `social` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
`userid` int(11) NOT NULL COMMENT '用户id',
`apply` varchar(2048) NOT NULL COMMENT '好友申请列表,用逗号隔开如 10001,10002',
`agree` varchar(8192) NOT NULL COMMENT '同意好友申请列表',
`refuse` varchar(2048) NOT NULL COMMENT '拒绝好友申请列表',
`block` varchar(2048) NOT NULL COMMENT '屏蔽好友申请列表',
`blocked` varchar(2048) NOT NULL COMMENT '被屏蔽好友申请列表',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='好友关系表'

ALTER TABLE `social` ADD INDEX userid ( `column` )
唯一所以可以有多个，前提是该索引列是唯一的。
alter table social add unique userid (userid);


alter table user AUTO_INCREMENT=10000;
alter table wap3g_comment rename to message;
RENAME database netease_news TO xiaowaiwang

修改数据库密码
winpty mysqladmin -uroot -p111111 password root
