const express = require('express');
const connection = require('../conf');
const router = express.Router();


router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /contact_request')
});


/* *********************CRUD table contact request**********************************/

router.get('/get_contactrequest', (req, res) => {
    connection.query('SELECT * from contact_request', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des messages');
      } else {
        res.json(results);
      }
    });
  });

router.post('/post_contactrequest', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO contact_request SET ?', formData,(err, results) => {
      if (err) {
        res.status(500).send("Erreur lors de l'envoi du message");
      } else {
        res.sendStatus(200);
      }
    });
  });

  router.put('/put_contactrequest/:id', (req, res) => {
    const idcontact_request = req.params.id;
    const formData = req.body;
    connection.query('UPDATE contact_request SET ? WHERE id_contact_request = ?', [formData, idcontact_request], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la modification d'un message");
      } else {
        res.sendStatus(200);
      }
    });
  });

  router.delete('/delete_contactrequest/:id', (req, res) => {
    const dropcontact_request = req.params.id;
    connection.query('DELETE FROM contact_request WHERE id_contact_request = ?', [dropcontact_request], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la suppression d'un wilder");
      } else {
        res.sendStatus(200);
      }
    });
  });

  module.exports = router;