const express = require('express')
const router = express.Router();
const os = require('os');
const fs = require('fs')
const path = require('path')
var uuid = require('uuid');
var formidable = require('formidable');
const {
  sqlQuery
} = require('./dao')

router.use((req, res, next) => {
  var form = new formidable.IncomingForm();
  form.parse(req, function(err, fields, files) {
    var file = files.files;
    form.encoding = 'utf-8';
    form.uploadDir = "public/img";
    form.keepExtensions = true;
    form.maxFieldsSize = 5 * 1024 * 1024;
    let picName = uuid.v1() + path.extname(file.name);
    let sysType = os.type();
    console.log('sysType',sysType);
    let pathtmp = 'public\/img\/';
    if(sysType==="Windows_NT"){
      pathtmp = 'public\\img\\';
    }
    fs.rename(file.path, pathtmp + picName, function(err) {
      if (err) return res.send({
        "error": 403,
        "message": "图片保存异常！"
      });
      res.send({
        "picAddr": picName
      });
    });
  });
  return;
})
module.exports = router;
