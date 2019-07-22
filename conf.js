const mysql = require('mysql')
const connection = mysql.createConnection({

    host : 'localhost',
    user : 'root',
    password : 'Delpiero92!',
    database : 'tripitto'
})

module.exports = connection;