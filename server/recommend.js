const express = require('express')
const router = express.Router();
const utils = require('./dao')

router.use((req, res, next) => {
  utils.sqlQuery().then((data) => {
    res.send({
      title: 'data from database',
      res: data
    })
  })

  return;
});

module.exports = router;
