const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')

router.use((req, res, next) => {
  let userid = req.body.userid;
  let friendid = req.body.friendid;
  console.log(1122, userid, friendid);
  let sql = `INSERT INTO social ( userid, friendid ) VALUES ( '${userid}', '${friendid}' );`;
  console.log('sql',sql);
  sqlQuery(sql).then((data) => {
    console.log('data',data);
    res.send({
      status: 'ok'
    })
  }).catch(ex => {
    console.log('ex',ex);
    res.send({
      status: 'err',
      ex: ex
    })
  })
  return;
});

module.exports = router;
