#!/bin/bash

TARGET=$1
BASEDIR="."

usage()
{
    echo "USAGE:"
    echo "login: 进入数据库"
    echo "xiaowaiwang: 进入xiaowaiwang数据库"
    echo "importDB: 导入数据到xiaowaiwang"
    echo "exportDB: 导出xiaowaiwang数据"
    exit 1
}
login(){
    mysql -uroot -proot 
}
xiaowaiwang(){
    mysql -uroot -proot xiaowaiwang
}
importDB(){
    mysql -h127.0.0.1 -uroot -proot -P3306 xiaowaiwang --default-character-set=utf8 < ~/project/xiaowaiwang/xiaowaiwang.sql
}
exportDB(){
    mysqldump -h127.0.0.1 -uroot -proot -P3306 xiaowaiwang > ~/databases/xiaowaiwang.sql
}
if [ $# -eq 0 ]; then
    usage;
else
    echo "${TARGET} begin";
    $TARGET
    echo "${TARGET} end";
fi
