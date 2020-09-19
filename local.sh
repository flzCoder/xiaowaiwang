#!/bin/bash

TARGET=$1
BASEDIR="."

usage()
{
    echo "USAGE:"
    echo "start: 启动服务"
    echo "online: 启动线上服务"
    echo "stop: 停止服务"
    echo "restart: 重启服务"
    echo "pull: 拉取github文件"
    echo "redeploy: 在项目目录 pull stop online"
    echo "login: 登录阿里云主机"
    echo "exportDB: 导出线上数据库"
    exit 1
}
start(){
    cd $BASEDIR & pm2 start ecosystem.config.js
}
online(){
    cd $BASEDIR & pm2 start ecosystem.config.js --env prod
}
stop(){
    pm2 delete ecosystem.config.js
}
restart() {
    pm2 reload ecosystem.config.js
}
pull(){
    git pull origin master
}
redeploy(){
    pull;
    stop;
    online;
}
login(){
    ssh root@47.93.34.232 -p22
}
exportDB(){
    mysqldump -h127.0.0.1 -uroot -proot -P3306 netease_news > netease_news.sql
}
if [ $# -eq 0 ]; then
    usage;
else
    echo "${TARGET} begin";
    $TARGET
    echo "${TARGET} end";
fi
