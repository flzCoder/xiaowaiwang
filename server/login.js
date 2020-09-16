const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')
const crypto = require('./crypto')

router.use((req, res, next) => {
  let username = req.body.username;
  let usernameCookie = crypto.encrypt(username, 'cun cookie');
  let password = crypto.md5(req.body.password, 'jiami mima buke bei pojie');
  let sql = `select * from user where name = '${username}' `;
  sqlQuery(sql).then((data) => {
    if (!data.length) {
      res.send({status:3, msg: '无此用户'})
    } else {
      let realPass = data[0].password;
      if (realPass === password) {
        res.cookie('skr', usernameCookie, {
          httpOnly: true,
          signed: true
        });
        res.send({status:1, msg: '登录成功', name: data[0].name, avator: data[0].avator, id: data[0].id })
      } else {
        res.send({status:2, msg: '密码错误'})
      }
    }
  })

  return;
});

module.exports = router;
