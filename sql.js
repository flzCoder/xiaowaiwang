INSERT INTO wap3g_news ( title, content, pic ) VALUES ( '今天天气不错', '蓝天白云 心情舒畅','https://bjnewsrec-cv.ws.126.net/little6457517d9c0j00qf20vv0010c000hs00dbm.jpg' );

alter table wap3g_news drop column create_time;

alter table wap3g_news add column create_time timestamp default value;

select * from wap3g_news;
DELETE FROM wap3g_news;


winpty mysql -uroot -p111111

show variables like '%char%';
show charset
charset gbk
