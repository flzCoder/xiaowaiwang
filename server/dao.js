var mysql = require('mysql');
var config = require('./dbconfig');
let env = process.env.NODE_ENV

module.exports = {
  sqlQuery: function(query) {
    var connection = mysql.createConnection(config[env]);
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
