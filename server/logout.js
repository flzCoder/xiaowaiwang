const express = require('express')
const router = express.Router();

router.use((req, res, next) => {
  let usernameCookie = req.signedCookies.skr;
  if (usernameCookie) {
    res.cookie('skr','',{ maxAge:0 })
    res.send({
      code: 200,
      res: 'clear cookie'
    })
  }

  return;
});

module.exports = router;
