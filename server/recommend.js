const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')

router.use((req, res, next) => {
  let sql = `select * from news where type=2 limit 7`;
  sqlQuery(sql).then((data) => {
    res.send({
      title: '推荐页推荐数据',
      res: data
    })
  })

  return;
});

module.exports = router;
