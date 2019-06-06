const express = require('express');
const connection = require('../conf');
const router = express.Router();


router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /follower')
});


// ****************************************** Follower ********************************

//  request get follower 
router.get('/get_follower', (req, res) => {
    connection.query('SELECT * FROM follower ', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des données');
      } else {
        res.json(results);
      }
    });
  });

  //request put follower
  router.put('/put_follower/:id', (req, res) => {
    const idFollower = req.params.id;
    const formData = req.body;
    connection.query('UPDATE follower SET ? WHERE id_follower = ?', [formData, idFollower], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la modification d'un follower");
      } else {
        res.sendStatus(200);
      }
    });
  });
  
  // request post follower
  router.post('/post_follower', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO follower SET ?', formData, (err, results) => {
      if (err) {
        console.log(err)
        res.status(500).send("Erreur lors de la sauvegarde d'un employé");
      } else {
        res.sendStatus(200);
      }
    });
  });

  //request delete follower
  router.delete('/delete_follower', (req, res) => {
    const dropFollower = req.params.id;
    connection.query('DELETE FROM follower WHERE id_follower= ?', [dropFollower], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la suppression d'un follower");
      } else {
        res.sendStatus(200);
      }
    });
  });
  
  module.exports = router;