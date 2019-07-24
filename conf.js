const mysql = require('mysql')
const connection = mysql.createConnection({

    host : 'localhost',
    user : 'root',
    password : 'Azerty@78',   // WRITE THE MSQL PASSWORD HERE
    database : 'tripitto'
})

module.exports = connection;