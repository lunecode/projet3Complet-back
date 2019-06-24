const mysql = require('mysql')
const connection = mysql.createConnection({

    host : 'localhost',
    user : 'root',
    password : 'tengo5975',
    database : 'tripitto'
})

module.exports = connection;