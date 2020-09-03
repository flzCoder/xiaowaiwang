#!/bin/bash
TARGET=$1
BASEDIR="../home/fengluzhe"

usage()
{
    echo "USAGE:"
    echo "project: 进入创业项目"
    echo "deploy: 进入项目、下载github代码、重启pm2服务"
    exit 1
}
project(){
    cd $BASEDIR"/rich"
    pwd
    ls -l
}
deploy(){
    project;
    ./local.sh pull;
    ./local.sh stop;
    ./local.sh online;
}

if [ $# -eq 0 ]; then
    usage;
else
    echo "${TARGET} begin";
    $TARGET
    echo "${TARGET} end";
fi
