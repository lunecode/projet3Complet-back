const express = require('express');
const connection = require('../conf');
const router = express.Router();


router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /general_video')
});


//************************************* */general_video/*********************************************************************************** */

// récupération des données

router.get('/get_general_video', (req, res) => {
  connection.query('SELECT * FROM general_video', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des données');
      }else{
        res.json(results);
      }
    });
});

// Insertion des donneés

router.post('/insert_general_video', (req, res) => {
  const formData = req.body;
  connection.query('INSERT INTO general_video SET ?', formData, (err, results) => {
    if (err) {
      res.status(500).send("Erreur lors de la sauvegarde des datas");
    } else {
      res.sendStatus(200);
    }
  });
});

// Mise a jour des données

router.put('/update_general_video/:id', (req, res) => {
  const idGeneralVid = req.params.id;
  const formData = req.body;
  connection.query('UPDATE general_video SET ? WHERE id_general_video = ?', [formData, idGeneralVid], err => {
    if (err) {
      res.status(500).send("Erreur lors de la modification des données");
    } else {
      res.sendStatus(200);
    }
  });
});

//suppression des données

router.delete('/delete_general_video/:id', (req, res) => {
  const dropGeneralVideo = req.params.id;
  connection.query('DELETE FROM general_video WHERE id_general_video = ?', [dropGeneralVideo], err => {
    if (err) {
      console.log(err);
      res.status(500).send("Erreur lors de la suppression des données");
    } else {
      res.sendStatus(200);
    }
  });
});


//************************ */JOINTURE /********************************************************** */

// récupération des données general_video/popularity/liked

router.get('/get_general_video_liked_popularity', (req, res) => {
  connection.query('SELECT * FROM general_ video INNER JOIN liked ON id_general_video=liked.general_video_id_general_video INNER JOIN popularity ON id_popularity=liked.popularity_id_popularity', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des données');
      }else{
        res.json(results);
      }
    });
});


//************************ */LIMITE /********************************************************** */

router.get('/get_general_video_limite/:offset', (req, res) => {
  const offset = +req.params.offset
  connection.query('SELECT * FROM general_video LIMIT ? , 5;', [offset], (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des données');
      }else{
        res.json(results);
      }
    });
});

module.exports = router;