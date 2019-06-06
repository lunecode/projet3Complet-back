const express = require('express');
const connection = require('../conf');
const router = express.Router();


router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /watch_later')
});


// *****************************watch_later*************************************************

router.get('/get_watch_later', (req, res) => {
    connection.query('SELECT * FROM watch_later ', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération de À regarder plus tard ');
      } else {
        res.json(results);
      }
    });
  });
  
  router.post('/post_watch_later', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO watch_later SET ?', formData, err => {
      if (err) {
        res.status(500).send('Erreur lors de la sauvegarde à regarder plus tard');
      } else {
        res.sendStatus(200);
      }
    })
  });

  module.exports = router;