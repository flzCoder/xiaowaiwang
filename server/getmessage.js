const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')
router.use((req, res, next) => {
  let sql = `select a.*,b.name from message a left join user b on a.userid = b.id where status=1 order by update_time desc`;
  sqlQuery(sql).then((data) => {
    res.send({
      title: '评论数据',
      res: data
    })
  })

  return;
});

module.exports = router;
