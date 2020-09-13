const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')
const crypto = require('./crypto')

router.use((req, res, next) => {
  let username = req.body.username;
  let usernameCookie = crypto.encrypt(username, 'cun cookie');
  let password = crypto.md5(req.body.password, 'jiami mima buke bei pojie');
  let sql = `INSERT INTO user ( name, password ) VALUES ( '${username}', '${password}' );`;
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
