const express = require('express');
const router = express.Router();
connection = require('../conf');

router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /profil')
});


//***************************************************** */ Crud Profil*********************************************************************************/

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
  connection.query('SELECT * FROM profil ORDER BY RAND() LIMIT 4', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des données');
      }else{
        res.json(results);
      }
    });
});



//* ********************* route for profil Join general_video ************************* */

router.get('/get_profil_general_video', (req, res) => {
  connection.query('SELECT lastname, firstname, location FROM profil JOIN general_video on profil.id_profil = general_video.profil_id_profil', (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des données');
    } else {
      res.json(results);
    }
  });
});



module.exports = router;