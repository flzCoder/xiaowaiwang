const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')

router.use((req, res, next) => {
  let status = req.body.status;
  let id = req.body.id;
  let sql = `UPDATE social SET status=${status} where id = '${id}' `;
  sqlQuery(sql).then((data) => {
    res.send({ status })
  })

  return;
});

module.exports = router;
