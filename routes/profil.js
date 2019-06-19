const express = require('express');
const router = express.Router();
connection = require('../conf');

router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /profil')
});


//***************************************************** */ Crud Profil*********************************************************************************/


// test post données sur la table enum

router.post('/enum', (req, res) => {
  const formData = req.body;
  connection.query('INSERT INTO testenum SET ?', formData, (err, results) => {
    if (err) {
      res.status(500).send("Erreur lors de l'insertion des données");
    } else {
      res.sendStatus(200);
    }
  });
});


// récupération des données
router.get('/get_profil', (req, res) => {
  connection.query('SELECT * FROM profil', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des données');
      }else{
        res.json(results);
      }
    });
});

// insertion des données
router.post('/insert_profil', (req, res) => {
  const formData = req.body;
  connection.query('INSERT INTO profil SET ?', formData, (err, results) => {
    if (err) {
      res.status(500).send("Erreur lors de l'insertion des données");
    } else {
      res.sendStatus(200);
    }
  });
});

// Mise a jour des données
router.put('/update_profil/:id', (req, res) => {
  const idProfil = req.params.id;
  const formData = req.body;
  connection.query('UPDATE profil SET ? WHERE id_profil = ?', [formData, idProfil], err => {
    if (err) {
      res.status(500).send("Erreur lors de la modification des données");
    } else {
      res.sendStatus(200);
    }
  });
});

// supression des données
router.delete('/delete_profil/:id', (req, res) => {
  const dropProfil = req.params.id;
  connection.query('DELETE FROM profil  WHERE id_profil = ?', [dropProfil], err => {
    if (err) {
      res.status(500).send("Erreur lors de la suppression des données");
    } else {
      res.sendStatus(200);
    }
  });
});

//***************************************************** */ Crud JOIN Profil*********************************************************************************/
router.get('/get_profil_videaste_home', (req, res) => {
  connection.query('SELECT * FROM profil LIMIT 1', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des données');
      }else{
        res.json(results);
      }
    });
});



module.exports = router;