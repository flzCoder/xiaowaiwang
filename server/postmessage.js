const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')

router.use((req, res, next) => {
  let content = req.body.content;
  let name = req.body.name;
  let pic = req.body.pic;
  let sql = `INSERT INTO wap3g_comment ( name, pic, content ) VALUES ( '${name}', '${pic}', '${content}' );`;
  sqlQuery(sql).then((data) => {
    res.send({status: 'ok'})
  })
  return;
});

module.exports = router;
