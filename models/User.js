const Sequelize = require('sequelize');
const db = require('../database/db')

module.exports = db.sequelize.define(
  'profil',
  {
    id_profil: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    firstname: {
      type: Sequelize.STRING
    },
    lastname: {
      type: Sequelize.STRING
    },
    password: {
      type: Sequelize.STRING
    },
    email: {
      type: Sequelize.STRING
    }
  },
  {
    tableName: 'profil',
    timestamps: false
  }
)