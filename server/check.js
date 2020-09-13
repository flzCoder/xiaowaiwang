const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')

router.use((req, res, next) => {
  let username = req.query.username;
  console.log('username',username);
  let sql = `select * from user where name = '${username}' `;
  sqlQuery(sql).then((data) => {
    if (data.length) {
      res.send({
        code: 1,
        res: '该用户名已被占用'
      })
    } else {
      res.send({
        code: 2,
        res: '恭喜,该用户名可用'
      })
    }
  })

  return;
});

module.exports = router;
