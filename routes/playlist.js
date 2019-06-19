const express = require('express');
const connection = require('../conf');
const router = express.Router();


router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /playlist')
});



// Lecture de playlist

router.get('/get_playlist', (req, res) => {
    connection.query('SELECT * FROM playlist ', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération de playlist ');
      } else {
        res.json(results);
      }
    });
  });
  
  router.post('/post_playlist', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO playlist SET ?', formData, err => {
      if (err) {
        res.status(500).send('Erreur lors de la sauvegarde de playlist');
      } else {
        res.sendStatus(200);
      }
    })
  });
  
  module.exports = router;