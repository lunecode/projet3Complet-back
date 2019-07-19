const mysql = require('mysql')
const connection = mysql.createConnection({

    host : 'localhost',
    user : 'root',
    password : '9423094800',
    database : 'tripitto'
})

module.exports = connection;