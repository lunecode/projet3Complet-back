const Sequelize = require('sequelize')
const db = {}


const sequelize = new Sequelize('tripitto', 'root', 'Azerty@78', { // WRITE THE USER AND PASSWORD MYSQL HERE
  host: 'localhost',
  dialect: 'mysql',
  // operatorsAliases: false,

  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000,
  }
})

db.sequelize = sequelize;
db.sequelize = sequelize;


module.exports = db