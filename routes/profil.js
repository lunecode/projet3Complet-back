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









// ***************************



// listen to the url “/notification”
router.get('/getnotification', (req, res) => {
  // connection to the database, and selection of employees
  connection.query('SELECT * FROM notification ', (err, results) => {
    if (err) {
      // If an error has occurred, then the user is informed of the error
      res.status(500).send('Erreur lors de la récupération des données');
    } else {
      // If everything went well, we send the result of the SQL query as JSON.
      res.json(results);
    }
  });
});

//request put notification
router.put('/putnotification/:id', (req, res) => {

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
router.post('/postnotification', (req, res) => {
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
router.delete('/deletenotification', (req, res) => {

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
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<
//  request get follower 

router.get('/getfollower', (req, res) => {

  connection.query('SELECT * FROM follower ', (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des données');
    } else {

      res.json(results);
    }


  });
});

//request put follower

router.put('/putfollower/:id', (req, res) => {
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
router.post('/postfollower', (req, res) => {

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
router.delete('/deletefollower', (req, res) => {
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

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<
//  require get following

router.get('/getfollowing', (req, res) => {

  connection.query('SELECT * FROM following ', (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des données');
    } else {

      res.json(results);
    }
  });
});

//request put following
router.put('/putfollowing/:id', (req, res) => {
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
router.post('/postfollowing', (req, res) => {

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
router.delete('/deletefollowing', (req, res) => {
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