const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')

router.use((req, res, next) => {
  let content = req.body.content;
  let userid = req.body.userid;
  let pic = req.body.pic;
  let sql = `INSERT INTO message ( userid, pic, content ) VALUES ( '${userid}', '${pic}', '${content}' );`;
  sqlQuery(sql).then((data) => {
    res.send({status: 'ok'})
  })
  return;
});

module.exports = router;
