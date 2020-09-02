const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')

router.use((req, res, next) => {
  let content = req.body.content;
  let sql = `INSERT INTO wap3g_comment ( name, pic, program ) VALUES ( '默认小王', '', '${content}' );`;
  sqlQuery(sql).then((data) => {
    res.send({status: 'ok'})
  })
  return;
});

module.exports = router;
