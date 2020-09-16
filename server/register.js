const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')
const { prefixPath } = require('./originConfig')
const crypto = require('./crypto')

router.use((req, res, next) => {
  let username = req.body.username;
  let random = Math.ceil(Math.random() * 11);
  let avator = `${prefixPath}/public/avator/${random}.jpg`;
  let usernameCookie = crypto.encrypt(username, 'cun cookie');
  let password = crypto.md5(req.body.password, 'jiami mima buke bei pojie');
  let sql = `INSERT INTO user ( name, password, avator ) VALUES ( '${username}', '${password}', '${avator}' );`;
  sqlQuery(sql).then((data) => {
    res.cookie('skr', usernameCookie, {
      httpOnly: true,
      signed: true
    });
    res.send({status: 'ok', data: data})
  })
  return;
});

module.exports = router;
