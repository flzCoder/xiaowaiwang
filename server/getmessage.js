const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')

router.use((req, res, next) => {
  let sql = `select * from message where status=1 order by update_time desc`;
  sqlQuery(sql).then((data) => {
    res.send({
      title: '评论数据',
      res: data
    })
  })

  return;
});

module.exports = router;
