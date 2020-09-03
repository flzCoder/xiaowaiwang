# vue-ssr
mysql (5.5)
express
vue-ssr
vuex
vue-router
webpack

**Requires Node.js 7+**

``` bash
# install dependencies
npm install # or yarn

安装mysql
http://bj.bcebos.com/v1/videopc-final/video-edit-tool/202008_1598413474941_10787792_mysql-5.5.61-winx64.jpg (另存为到本地后缀改为rar解压即可)

导入数据库文件
./sync_db.sh

# serve in dev mode, with hot reload at localhost:8080
./local.sh start
本地8088端口

# login ecs
./local.sh login

#一键部署
. ./deploy.sh deploy

# build for production
npm run build

# serve in production mode
npm start
```

## License

MIT
