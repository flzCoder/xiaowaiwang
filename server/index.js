const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')

router.use((req, res, next) => {
  let sql = `select * from wap3g_news where type=1 limit 7`;
  sqlQuery(sql).then((data) => {
    res.send({
      title: '首页推荐数据',
      res: data
    })
  })

  return;
});

module.exports = router;
