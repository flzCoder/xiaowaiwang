const express = require('express')
const router = express.Router();
const { sqlQuery } = require('./dao')

router.use((req, res, next) => {
  let nickname = req.body.nickname;
  let userid = req.body.userid;
  let avator = req.body.avator;
  let mobilephone = req.body.mobilephone;
  let sql = `UPDATE user SET name = "${nickname}",avator = "${avator}",mobilephone = ${mobilephone} WHERE id = ${userid}`;
  sqlQuery(sql).then((data) => {
    res.send({
      status: 'ok',
      id: userid
    })
  }).catch(ex => {
    console.log('ex',ex);
  })
  return;
});

module.exports = router;
