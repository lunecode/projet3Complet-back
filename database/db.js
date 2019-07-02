const Sequelize = require('sequelize')
const db = {}

const sequelize = new Sequelize('tripitto', 'root', 'Azerty@78', {
  host: 'localhost',
  dialect: 'mysql',
  operatorsAliases: false, // A voir l'utilité 

  // To create a pool of connections
  pool: {
    max: 5,
    min: 0,
    acquire: 30000, // A voir l'utilité
    idle: 10000,
  }
})

db.sequelize = sequelize;
db.sequelize = sequelize;


module.exports = db