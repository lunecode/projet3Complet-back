const express = require("express")
const Router = express.Router()
const bcrypt = require('bcrypt')

const User = require('../../models/User')


Router.get("/", (req, res, next) => {
  res.send("I am in GET auth YOLO");
})


//  http://localhost:3000/registration/registration


Router.post('/registration', (req, res) => {
  const userData = {
    firstname: req.body.firstname,
    lastname: req.body.lastname,
    email: req.body.email,
    password: req.body.password,
    isAdmin: 0
  }

  User.findOne({
    where: {
      email: req.body.email
    }
  })
    .then(user => {
      if (!user) {
        bcrypt.hash(req.body.password, 10, (err, hash) => {
          userData.password = hash
          User.create(userData)
            .then(user => {
              res.json({ status: user.email + ' registered' })
            })
            .catch(err => {
              res.send('error: ' + err)
            })
        })
      } else {
        res.json({ error: 'User already exists' })
      }
    })
    .catch(err => {
      res.send('error:' + err)
    })
})


module.exports = Router