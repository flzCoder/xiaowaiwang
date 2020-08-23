var mysql = require('mysql');

module.exports = {
  sqlQuery: function() {
    var connection = mysql.createConnection({
      host: '127.0.0.1',
      port: '3306',
      user: 'root',
      password: '111111',
      database: 'netease_news',
    });

    return new Promise(function(resolve, reject){
      connection.connect(function(err) {
        if (err) {
          console.error('error connecting: ' + err.stack);
          connection.end();
          reject();
        }
        connection.query('select * from wap3g_news limit 10;', function (error, results, fields) {
          if (error) {
            throw error;
            connection.end();
            reject();
          }
          connection.end();
          resolve(results);
        });
      });
  });
  }
}
