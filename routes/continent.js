const express = require('express');
const connection = require('../conf');
const router = express.Router();


router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /continent')
});



// THIS TABLE DOES NOT HAVE VOCATION TO CHANGE ( TABLE CONTINENT)

//************************************/continent/******************************************************* */

// DISPLAY DATA OF "CONTINENT" TABLE

router.get('/get_continent', (req, res) => {
  connection.query('SELECT * FROM continent', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des données');
      } else {
        res.json(results);
      }
    });
});


// UPDATE DATA IN "CONTINENT" TABLE

router.put('/update_continent/:id', (req, res) => {
  const idGeneralVid = req.params.id;
  const formData = req.body;
  connection.query('UPDATE general_video SET ? WHERE id_continent = ?', [formData, idGeneralVid], err => {
    if (err) {
      res.status(500).send("Erreur lors de la modification des données");
    } else {
      res.sendStatus(200);
    }
  });
});





module.exports = router;