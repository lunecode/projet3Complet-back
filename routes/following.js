const express = require('express');
const router = express.Router();
connection = require('../conf');

router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /following')
});



// ********************************************* following ********************************

//  require get following
router.get('/get_following', (req, res) => {
    connection.query('SELECT * FROM following ', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des données');
      } else {
        res.json(results);
      }
    });
  });
  
//request put following
  router.put('/put_following/:id', (req, res) => {
    const idFollowing = req.params.id;
    const formData = req.body;
    connection.query('UPDATE following SET ? WHERE id_following = ?', [formData, idFollowing], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la modification d'un following");
      } else {
        res.sendStatus(200);
      }
    });
  });
  
  // request post following
  router.post('/post_following', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO following SET ?', formData, (err, results) => {
      if (err) {
        console.log(err)
        res.status(500).send("Erreur lors de la sauvegarde d'un following");
      } else {
        res.sendStatus(200);
      }
    });
  });

  //request delete following
  router.delete('/delete_following', (req, res) => {
    const dropFollowing = req.params.id;
    connection.query('DELETE FROM following WHERE id_following= ?', [dropFollowing], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la suppression d'un following");
      } else {
        res.sendStatus(200);
      }
    });
  });
  
  module.exports = router;