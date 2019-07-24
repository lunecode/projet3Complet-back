const express = require('express');
const connection = require('../conf');
const router = express.Router();


router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /notification')
});


//************************************* */notification/**********************

// listen to the url “/notification”
router.get('/get_notification', (req, res) => {
    connection.query('SELECT * FROM notification ', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des données');
      } else {
        res.json(results);
      }
    });
  });
  
  //request put notification
  router.put('/put_notification/:id', (req, res) => {
    const idNotification = req.params.id;
    const formData = req.body;
    connection.query('UPDATE notification SET ? WHERE id_notification = ?', [formData, idNotification], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la modification d'une notification");
      } else {
        res.sendStatus(200);
      }
    });
  });
  
  // request post notificaiton
  router.post('/post_notification', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO notification SET ?', formData, (err, results) => {
      if (err) {
        console.log(err)
        res.status(500).send("Erreur lors de la sauvegarde d'un employé");
      } else {
        res.sendStatus(200);
      }
    });
  });

  //request delete notification
  router.delete('/delete_notification', (req, res) => {
    const dropNotification = req.params.id;
    connection.query('DELETE FROM notification WHERE id_notification = ?', [dropNotification], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la suppression des notifications");
      } else {
        res.sendStatus(200);
      }
    });
  });

  module.exports = router;