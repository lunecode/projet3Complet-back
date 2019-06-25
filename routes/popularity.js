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

/* ******************************  popularity_liked_general_video**************************************/


/* ORDER By nb_liked*/
router.get('/get_popularity_liked_general_video_travel_information', (req, res) => {
  connection.query('SELECT * FROM popularity INNER JOIN liked ON id_popularity=liked.popularity_id_popularity INNER JOIN general_video ON id_general_video=liked.general_video_id_general_video INNER JOIN travel_information ON id_general_video=travel_information.general_video_id_general_video ORDER BY nb_like_popularity ASC LIMIT 5', (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des populaires');
    } else {
      res.json(results);
    }
  });
});


/* ORDER By number_tips*/
router.get('/get_popularity_liked_general_video_travel_information2', (req, res) => {
  connection.query('SELECT * FROM popularity INNER JOIN liked ON id_popularity=liked.popularity_id_popularity INNER JOIN general_video ON id_general_video=liked.general_video_id_general_video INNER JOIN travel_information ON id_general_video=travel_information.general_video_id_general_video ORDER BY nb_like_popularity ASC LIMIT 4', (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des populaires');
    } else {
      res.json(results);
    }
  });
});


  module.exports = router;