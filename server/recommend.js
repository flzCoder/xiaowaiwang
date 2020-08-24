const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')

router.use((req, res, next) => {
  let sql = `select * from wap3g_news where type=2 limit 3`;
  sqlQuery(sql).then((data) => {
    res.send({
      title: '推荐页推荐数据',
      res: data
    })
  })

  return;
});

module.exports = router;
