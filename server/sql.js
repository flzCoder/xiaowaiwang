INSERT INTO wap3g_news ( title, content, pic ) VALUES ( '今天天气不错', '蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg' );
INSERT INTO wap3g_news ( title, content, pic ) VALUES ( '长三角一体化发展如何推进？习近平再次强调两个关键词', '紧扣一体化和高质量两个关键词抓好重点工作。','http://cms-bucket.ws.126.net/2020/0824/933204baj00qfjlxc00i7c000zk00k0c.jpg' );
DELETE FROM wap3g_news;
UPDATE wap3g_comment SET status = 2 WHERE id=20;
UPDATE wap3g_comment SET status = 1 WHERE title = '长三角一体化发展如何推进？习近平再次强调两个关键词';
select * from wap3g_news;

alter table wap3g_news add column create_time timestamp default value;
ALTER TABLE wap3g_news ADD column type INT;
alter table wap3g_news drop column create_time;
ALTER TABLE wap3g_comment ALTER status SET DEFAULT 1;

增加属性
ALTER TABLE wap3g_comment ADD status INT;
改属性名
ALTER TABLE wap3g_comment CHANGE program content varchar(8192);

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
