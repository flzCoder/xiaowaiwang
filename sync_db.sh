# 导出到sql文件
# mysqldump -h127.0.0.1 -uroot -p111111 -P3306 netease_news > netease_news.sql

# 导入sql文件到数据库
# mysql -h127.0.0.1 -uroot -p111111 -P3306 netease_news --default-character-set=utf8 < netease_news.sql

mysql -h47.93.34.232 -uroot -proot -P3306 netease_news --default-character-set=utf8 < netease_news.sql
