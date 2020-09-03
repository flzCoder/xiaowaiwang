#!/bin/bash
TARGET=$1
BASEDIR="../home/fengluzhe"

usage()
{
    echo "USAGE:"
    echo "social: 进入创业项目"
    echo "one: 进入项目、下载github代码、重启pm2服务"
    exit 1
}
social(){
    cd $BASEDIR"/rich"
    pwd
    ls -l
}
one(){
    social;
    ./ctrl.sh pull;
    ./ctrl.sh restart
}

if [ $# -eq 0 ]; then
    usage;
else
    echo "${TARGET} begin";
    $TARGET
    echo "${TARGET} end";
fi
