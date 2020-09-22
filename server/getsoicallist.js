const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')
router.use((req, res, next) => {
  let id = req.query.userid;
  let sql = `select a.*,b.name,b.avator from social a left join user b on a.friendid=b.id where userid=${id} order by update_time desc`;
  let firstsql = `select a.*,b.name,b.avator from social a left join user b on a.userid=b.id where friendid=${id} order by update_time desc`;
  Promise.all([sqlQuery(sql),sqlQuery(firstsql)]).then((values) => {
      let data = [...values[0], ...values[1]];
      res.send({
        title: '好友数据',
        res: data
      })
  })
  return;
});

module.exports = router;
