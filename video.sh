#!/bin/bash

TARGET=$1
DOWNLOAD=$2
BASEDIR="/home/users/wangxunxun_vd/workspace/node-webapp-base-qa"

usage()
{
    echo "USAGE:"
    echo "list: 显示nohup进程"
    echo "start: 启动服务"
    echo "stop: 停止服务"
    echo "restart: 重启服务"
    echo "loc: 本地化文件"
    echo "download: 下载文件，后面要带agail下载链接"
    echo "unpack: 解压缩包"
    echo "updateDB: 导出数据库"
    exit 1
}
list(){
    jobs
}
start(){
    cd $BASEDIR & nohup npm run test &
}
stop(){
    process='yog|app.js'
    pids=`ps -ef | grep -E $process | grep -v grep | awk '{print $2}'`
    for pid in $pids
    do
        echo $pid
        if [ -n $pid ]; then
            kill -9 $pid
        else
            echo 'no pid'
        fi
    done
}
restart() {
    stop;
    start;
}
loc(){
    sh $BASEDIR"/local/loc.sh"
}
download(){
    cd $BASEDIR"/release"
    $DOWNLOAD
}
unpack(){
    FILES=`ls $BASEDIR"/release/output/"`
    echo $FILES
    for i in $FILES
    do
        if [[ $i =~ '.gz' ]]; then
            tar -xvzf $BASEDIR"/release/output/$i" -C $BASEDIR
            echo $i
        fi
    done
}
updateDB(){
    sh $BASEDIR"/syncdb.sh"
}
if [ $# -eq 0 ]; then
    usage;
else
    echo "${TARGET} begin";
    $TARGET
    echo "${TARGET} end";
fi
