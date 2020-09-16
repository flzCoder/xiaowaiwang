const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')
router.use((req, res, next) => {
  let userid = req.query.userid;
  let tmp = '';
  if (userid) {
    tmp = `and userid=${userid}`
  }
  let sql = `select a.*,b.name,b.avator from message a left join user b on a.userid = b.id where status=1 ${tmp} order by update_time desc`;
  sqlQuery(sql).then((data) => {
    res.send({
      title: '评论数据',
      res: data
    })
  })

  return;
});

module.exports = router;
