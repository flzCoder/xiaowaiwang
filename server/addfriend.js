const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')

router.use((req, res, next) => {
  let userid = req.body.userid;
  let friendid = req.body.friendid;
  let sql = `INSERT INTO social ( userid, friendid ) VALUES ( '${userid}', '${friendid}' );`;
  sqlQuery(sql).then((data) => {
    res.send({
      status: 'ok'
    })
  }).catch(ex => {
    res.send({
      status: 'err',
      ex: ex
    })
  })
  return;
});

module.exports = router;
