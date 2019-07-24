const express = require('express');
const connection = require('../conf');
const router = express.Router();


router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /change_history_video')
});




/* ****************************** CRUD table contact change history video*********************/
router.get('/get_change_history_video', (req, res) => {
    connection.query('SELECT * from change_history_video', (err, results) => {
      if (err) {
        res.status(500).send("Erreur lors de la récupération des changements de l'historique des videos");
      } else {
        res.json(results);
      }
    });
  });
  
  router.post('/post_change_history_video', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO change_history_video SET ?', formData,(err, results) => {
      if (err) {
        res.status(500).send("Erreur lors de l'envoi de l'historique des videos");
      } else {
        res.sendStatus(200);
      }
    });
  });
  
  router.put('/put_datachange_history_video/:id', (req, res) => {
    const idchange_history_video = req.params.id;
    const formData = req.body;
    connection.query('UPDATE change_history_video SET ? WHERE id_change_history_video = ?', [formData, idchange_history_video], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la modification de l'historique des videos");
      } else {
        res.sendStatus(200);
      }
    });
  });
  
  router.delete('/delete_datachange_history_video/:id', (req, res) => {
    const dropchange_history_video = req.params.id;
    connection.query('DELETE FROM change_history_video WHERE id_change_history_video = ?', [dropchange_history_video], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la suppression de l'historique des videos");
      } else {
        res.sendStatus(200);
      }
    });
  });

  
  module.exports = router;