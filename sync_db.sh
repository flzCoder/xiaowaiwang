# 导出到sql文件
# mysqldump -h127.0.0.1 -uroot -proot -P3306 netease_news > netease_news.sql

# 导入sql文件到数据库
# mysql -h127.0.0.1 -uroot -proot -P3306 netease_news --default-character-set=utf8 < netease_news.sql

mysql -h182.92.163.121 -uroot -proot -P3306 xiaowaiwang --default-character-set=utf8 < xiaowaiwang.sql
