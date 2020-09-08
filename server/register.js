const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')

router.use((req, res, next) => {
  let username = req.body.username;
  let password = req.body.password;
  let sql = `INSERT INTO user ( name, password ) VALUES ( '${username}', '${password}' );`;
  sqlQuery(sql).then((data) => {
    res.send({status: 'ok'})
  })
  return;
});

module.exports = router;
