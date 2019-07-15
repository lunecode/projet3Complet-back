const express = require('express');
const connection = require('../conf');
const router = express.Router();


router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /favorites')
});


/* ********************************* favorites*******************************/

router.get('/get_favorites', (req, res) => {
    connection.query('SELECT * from favorites', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des favoris');
      } else {
        res.json(results);
      }
    });
  });

router.post('/post_favorites', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO favorites SET ?', formData,(err, results) => {
      if (err) {
        res.status(500).send("Erreur lors de l'envoi des favoris");
      } else {
        res.sendStatus(200);
      }
    });
  });

  router.put('/put_favorites/:id', (req, res) => {
    const idfavorites = req.params.id;
    const formData = req.body;
    connection.query('UPDATE favorites SET ? WHERE id_favorites = ?', [formData, idfavorites], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la modification des favoris");
      } else {
        res.sendStatus(200);
      }
    });
  });

  router.delete('/delete_favorites/:id', (req, res) => {
    const dropfavorites = req.params.id;
    connection.query('DELETE FROM favorites WHERE id_favorites = ?', [dropfavorites], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la suppression des favoris");
      } else {
        res.sendStatus(200);
      }
    });
  });

  module.exports = router;