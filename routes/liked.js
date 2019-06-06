const express = require('express');
const connection = require('../conf');
const router = express.Router();


router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /linked')
});


//*********************** */Lecture de like (like une vidéo) ******************************************

router.get('/get_like_video', (req, res) => {
    connection.query('SELECT * FROM liked', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération de popularity');
      } else {
        res.json(results);
      }
    });
  });
  
  router.post('/post_like_video', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO liked SET ?', formData, err => {
      if (err) {
        res.status(500).send('Erreur lors de la sauvegarde du like');
      } else {
        res.sendStatus(200);
      }
    })
  });
  
  
  //  Suppression d'une données via DELETE
  router.delete('/delete_like_video/:id', (req, res) => {
    const idLiked = req.params.id
    connection.query('DELETE FROM liked WHERE id_like = ?', [idLiked], err => {
      if (err) {
        res.status(500).send('Erreur lors de la suppression des données')
      } else {
        res.sendStatus(200)
      }
    })
  })

  module.exports = router;