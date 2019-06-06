const express = require('express');
const connection = require('../conf');
const router = express.Router();


router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /popularity')
});


/* ****************************** CRUD table contact popularity*********************/

router.get('/get_popularity', (req, res) => {
    connection.query('SELECT * from popularity', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des populaires');
      } else {
        res.json(results);
      }
    });
  });

  router.post('/post_popularity', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO popularity SET ?', formData,(err, results) => {
      if (err) {
        res.status(500).send("Erreur lors de l'envoi des populaires");
      } else {
        res.sendStatus(200);
      }
    });
  });


  router.put('/put_popularity/:id', (req, res) => {
    const idpopularity = req.params.id;
    const formData = req.body;
    connection.query('UPDATE popularity SET ? WHERE id_popularity = ?', [formData, idpopularity], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la modification des populaires");
      } else {
        res.sendStatus(200);
      }
    });
  });

  router.delete('/delete_popularity/:id', (req, res) => {
    const droppopularity = req.params.id;
    connection.query('DELETE FROM popularity WHERE id_popularity = ?', [droppopularity], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la suppression des populaires");
      } else {
        res.sendStatus(200);
      }
    });
  });

  module.exports = router;