const mysql = require('mysql')
const connection = mysql.createConnection({

multipleStatements:true,
    host : 'localhost',
    user : 'root',
    password : '',
    database : 'tripitto'
})

module.exports = connection;