const express = require('express');
const router = express.Router();
connection = require('../conf');

router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /profil')
});



//* ********************* route for profil ************************* */

router.get('/get_profil', (req, res) => {
  connection.query('SELECT*FROM profil', (err, results) => {

    if (err) {
      res.status(500).send('Erreur lors de la récupération des données');
    } else {
      res.json(results);
    }
  });
});

router.post('/post_profil', (req, res) => {
  const formData = req.body;
  connection.query('INSERT INTO profil SET ?', formData, (err, results) => {
    if (err) {
      console.log(err);
      res.status(500).send("Erreur");
    } else {
      res.sendStatus(200);
    }
  });
});

router.put('/put_profil/:id', (req, res) => {
  const idProfil = req.params.id;
  const formData = req.body;

  connection.query('UPDATE profil SET ? WHERE id_profil = ?', [formData, idProfil], err => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des données');
    } else {
      res.sendStatus(200);
    }
  });
});
router.delete('/delete_profil/:id', (req, res) => {
  const idProfil = req.params.id;
  connection.query('DELETE FROM profil WHERE id_profil = ?', [idProfil], err => {
    if (err) {
      res.status(500).send('Erreur lors de la suppression de profil');
    } else {
      res.sendStatus(200);
    }
  });
});

//************************** route for Génerale video************************* */

router.get('/get_general_video', (req, res) => {
  connection.query('SELECT*FROM general_video', (err, results) => {

    if (err) {
      res.status(500).send('Erreur lors de la récupération des données');
    } else {
      res.json(results);
    }
  });
});

router.post('/post_general_video', (req, res) => {
  const formData = req.body;
  connection.query('INSERT INTO general_video SET ?', formData, (err, results) => {
    if (err) {
      console.log(err);
      res.status(500).send("Erreur");
    } else {
      res.sendStatus(200);
    }
  });
});

router.put('/put_general_video/:id', (req, res) => {
  const id_generalvideo = req.params.id;
  const formData = req.body;

  connection.query('UPDATE general_video SET ? WHERE id_general_video = ?', [formData, id_generalvideo], err => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des données');
    } else {
      res.sendStatus(200);
    }
  });
});

router.delete('/delete_general_video/:id', (req, res) => {
  const id_generalvideo = req.params.id;
  connection.query('DELETE FROM general_video WHERE id_general_video = ?', [id_generalvideo], err => {
    if (err) {
      res.status(500).send('Erreur lors de la suppression de profil');
    } else {
      res.sendStatus(200);
    }
  });
});


module.exports = router;