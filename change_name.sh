#!/bin/bash
mysql -uroot -proot -e 'create database if not exists xiaowaiwang'
list_table=$(mysql -uroot -proot -Nse "select table_name from information_schema.TABLES where TABLE_SCHEMA='netease_news'")

for table in $list_table
do
    mysql -uroot -proot -e "rename table netease_news.$table to xiaowaiwang.$table"
done
