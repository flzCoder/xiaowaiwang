var mysql = require('mysql');

module.exports = {
  sqlQuery: function(query) {
    var connection = mysql.createConnection({
      host: '47.93.34.232',
      port: '3306',
      user: 'root',
      password: 'root',
      database: 'netease_news',
    });

    return new Promise(function(resolve, reject){
      connection.connect(function(err) {
        if (err) {
          console.error('error connecting: ' + err.stack);
          connection.end();
          reject();
        }
        connection.query(query, (error, results, fields) => {
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
