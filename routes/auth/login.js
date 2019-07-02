const express = require('express')
const jwt = require('jsonwebtoken')
const Router = express.Router()
const bcrypt = require('bcrypt')

const User = require('../../models/User')

process.env.SECRET_KEY = 'secret'  // VOIR OU STOCKER CETTE CLE

Router.get("/", (req, res, next) => {
  res.send("Je suis sur la route GET de login");
})


// http://localhost:3000/login/login   TEST A CONFIRMER VIA POSTMAN ET EN FRONT POUR LE TOKEN

Router.post('/login', (req, res) => {
  console.log(req.body)
  User.findOne({
    where: { email: req.body.email }  // MUST SEE IF PASSWORD VERIFICATION IS NECESSARY
  })
    .then(user => {
      if (user) {
        if (bcrypt.compareSync(req.body.password, user.password)) {
          let tokenUserinfo = { username: user.username, status: user.statut }
          let token = jwt.sign(tokenUserinfo, process.env.SECRET_KEY, {
            expiresIn: 1440
          })
          res.header("Access-Control-Expose-Headers", "x-access-token")
          res.set("x-access-token", token)
          res.status(200).send({ details: "user connected", user })
        }
      } else {
        res.status(400).json({ error: 'User does not exist ' })
      }
    })
    .catch(err => {
      res.status(400).json({ error: err })
    })
})


const getToken = req => {
  if (
    req.headers.authorization &&
    req.headers.authorization.split(" ")[0] === "Bearer"
  ) {
    return req.headers.authorization.split(" ")[1]
  } else if (req.query && req.query.token) {
    return req.query.token;
  }
  return null;
};



Router.post("/protected", (req, res, next) => {
  const token = getToken(req);
  const objectTests = { // exemple de data à appeler par la bdd 
    test: 'ok',
  }
  jwt.verify(token, process.env.SECRET_KEY, (err, decoded) => {
    if (err) {
      console.log(err)
      return res.status(200).send({ mess: 'N\'a pas acces au donnees' })
    }
    console.log('decode', decoded)
    return res.status(200).send({ mess: 'Donne du user', objectTests })
  })
})


module.exports = Router