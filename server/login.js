const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')

router.use((req, res, next) => {
  let username = req.body.username;
  let password = req.body.password;
  let sql = `select password from user where name = '${username}' `;
  sqlQuery(sql).then((data) => {
    if (!data.length) {
      res.send({status:3, msg: '无此用户'})
    } else {
      let realPass = data[0].password;
      if (realPass === password) {
        res.send({status:1, msg: '登录成功', name: username })
      } else {
        res.send({status:2, msg: '密码错误'})
      }
    }
  })

  return;
});

module.exports = router;
