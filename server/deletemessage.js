const { sqlQuery } = require('./dao')
module.exports = (req, res, next) => {
  let id = req.params.id;
  let sql = `UPDATE message SET status = 2 WHERE id=${id};`;
  sqlQuery(sql).then((data) => {
    res.send({
      title: '删除数据',
      res: data
    })
  })
  return;
};
