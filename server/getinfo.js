const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')
const crypto = require('./crypto')

router.use((req, res, next) => {
  let usernameCookie = req.signedCookies.skr;
  if (usernameCookie) {
    let username = crypto.decrypt(usernameCookie, 'cun cookie');
    let sql = `select name,id,avator,mobilephone from user where name = '${username}' `;
    sqlQuery(sql).then((data) => {
      res.send({
        code: 200,
        res: data
      })
    })
  } else {
    res.send({
      code: 401
    })
  }

  return;
});

module.exports = router;
