const mysql = require('mysql')
const connection = mysql.createConnection({

    host : 'localhost',
    user : 'root',
    password : 'Bonjour',
    database : 'tripitto'
})

module.exports = connection;