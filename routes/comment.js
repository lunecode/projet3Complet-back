const express = require('express');
const connection = require('../conf');
const router = express.Router();


router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /comment')
});

// *************************Lecture de comment (commente une vidéo) ************************************

router.get('/get_comment', (req, res) => {
    connection.query('SELECT * FROM comment ORDER BY id_comment DESC LIMIT 7', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération de comment ');
      } else {
        res.json(results);
      }
    });
  });
  
  router.post('/post_data_comment', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO comment SET ?', formData, err => {
      if (err) {
        res.status(500).send('Erreur lors de la sauvegarde de comment');
      } else {
        res.sendStatus(200);
      }
    })
  });
  
  router.put('/put_comment/:id', (req, res) => {
    const idComment = req.params.id;
    const formData = req.body;
    connection.query('UPDATE comment SET ? WHERE id_comment = ?', [formData, idComment], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la modification de comment");
      } else {
        res.sendStatus(200);
      }
    });
  });
  
  //  Suppression d'une données via DELETE
  router.delete('/delete_comment/:id', (req, res) => {
    const idComment = req.params.id
    connection.query('DELETE FROM comment WHERE id_comment = ?', [idComment], err => {
      if (err) {
        res.status(500).send('Erreur lors de la suppression des données comment')
      } else {
        res.sendStatus(200)
      }
    })
  })
  
  module.exports = router;