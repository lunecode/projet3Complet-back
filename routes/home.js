const express = require('express');
const connection = require('../conf');
const router = express.Router();


router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /home')
});





//**************************************************************************************** */ CRUD table general_video/*********************************************************************************** */


// récupération des données

router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /home')
});


router.get('/datageneralvideo', (req, res) => {

  connection.query('SELECT * FROM general_video', (err, results) => {

      if (err) {

        res.status(500).send('Erreur lors de la récupération des données');
        
      }else{

        res.json(results);
      }
      
    });

});


// Insertion des donneés


router.post('/insertgeneralvideo', (req, res) => {


  const formData = req.body;

  connection.query('INSERT INTO general_video SET ?', formData, (err, results) => {

    if (err) {
      
      
      res.status(500).send("Erreur lors de la sauvegarde des datas");
    } else {
      
      res.sendStatus(200);
    }

  });

});

// Mise a jour des données

router.put('/updategeneralvideo/:id', (req, res) => {

  const idGeneralVid = req.params.id;
  const formData = req.body;

  connection.query('UPDATE general_video SET ? WHERE id_general_video = ?', [formData, idGeneralVid], err => {

    if (err) {
      
      res.status(500).send("Erreur lors de la modification des données");
    } else {
      res.sendStatus(200);
    }

  });

});

//suppression des données

router.delete('/deletegeneralvideo/:id', (req, res) => {

  const dropGeneralVideo = req.params.id;

  connection.query('DELETE FROM general_video WHERE id_general_video = ?', [dropGeneralVideo], err => {

    if (err) {
      console.log(err);
      res.status(500).send("Erreur lors de la suppression des données");
    } else {

      res.sendStatus(200);
    }

  });
  
});

//***************************************************************************************** */CRUD travel information***********************************************************************************************/

// récupération des données

router.get('/datatravelinformation', (req, res) => {

  connection.query('SELECT * FROM travel_information', (err, results) => {

      if (err) {

        res.status(500).send('Erreur lors de la récupération des données');
      }else{

        res.json(results);
      }

    });

});


// Insertion des donneés

router.post('/inserttravelinformation', (req, res) => {


  const formData = req.body;

  connection.query('INSERT INTO travel_information SET ?', formData, (err, results) => {

    if (err) {
      
      res.status(500).send("Erreur lors de la sauvegarde des données");
    } else {
      
      res.sendStatus(200);
    }

  });
  
});


// Mise a jour des données

router.put('/updatetravelinformation/:id', (req, res) => {

  const idTravelInformation = req.params.id;
  const formData = req.body;

  connection.query('UPDATE travel_information SET ? WHERE id_travel_information = ?', [formData, idTravelInformation], err => {

    if (err) {
      
      res.status(500).send("Erreur lors de la modification des données");
    } else {
      res.sendStatus(200);
    }

  });

});

// Supression des données

router.delete('/deletetravelinformation/:id', (req, res) => {

  const dropTravelInformation = req.params.id;

  connection.query('DELETE FROM travel_information  WHERE id_travel_information = ?', [dropTravelInformation], err => {

    if (err) {
      console.log(err);
      res.status(500).send("Erreur lors de la suppression des données");
    } else {

      res.sendStatus(200);
    }

  });

});

//****************************************************************************************************************** */ Crud Profil*********************************************************************************/

// récupération des données

router.get('/dataprofil', (req, res) => {

  connection.query('SELECT * FROM profil', (err, results) => {

      if (err) {

        res.status(500).send('Erreur lors de la récupération des données');
      }else{

        res.json(results);
      }

    });

});

// insertion des données

router.post('/insertprofil', (req, res) => {


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

router.put('/updateprofil/:id', (req, res) => {

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

router.delete('/deleteprofil/:id', (req, res) => {

  const dropProfil = req.params.id;

  connection.query('DELETE FROM profil  WHERE id_profil = ?', [dropProfil], err => {

    if (err) {
      
      res.status(500).send("Erreur lors de la suppression des données");
    } else {

      res.sendStatus(200);
    }

  });

});



//**************************************************************************************************** */Crud notification *******************************************************************************/

// Récupération des données

router.get('/datanotification', (req, res) => {

  connection.query('SELECT * FROM notification', (err, results) => {

      if (err) {

        res.status(500).send('Erreur lors de la récupération des données');
      }else{

        res.json(results);
      }

    });

});

// insertion des données

router.post('/insertnotification', (req, res) => {


  const formData = req.body;

  connection.query('INSERT INTO notification SET ?', formData, (err, results) => {

    if (err) {
      
      res.status(500).send("Erreur lors de l'insertion des données");
    } else {
      
      res.sendStatus(200);
    }

  });

});

// modification des données

router.put('/updatenotification/:id', (req, res) => {

  const idNotification = req.params.id;
  const formData = req.body;

  connection.query('UPDATE notification SET ? WHERE id_notification = ?', [formData, idNotification], err => {

    if (err) {
      
      res.status(500).send("Erreur lors de la modification des données");
    } else {
      res.sendStatus(200);
    }
    
  });

});

//supression des données

router.delete('/deletenotification/:id', (req, res) => {

  const dropNotification = req.params.id;

  connection.query('DELETE FROM notification  WHERE id_notification = ?', [dropNotification], err => {

    if (err) {
      
      res.status(500).send("Erreur lors de la suppression des données");
    } else {

      res.sendStatus(200);
    }

  });

});

/* *********************CRUD table contact request**********************************/

router.get('/contactrequest', (req, res) => {
    connection.query('SELECT * from contact_request', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des messages');
      } else {
        res.json(results);
      }
    });
  });

router.post('/contactrequest', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO contact_request SET ?', formData,(err, results) => {
      if (err) {
        res.status(500).send("Erreur lors de l'envoi du message");
      } else {
        res.sendStatus(200);
      }
    });
  });

  router.put('/contactrequest/:id', (req, res) => {
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

  router.delete('/contactrequest/:id', (req, res) => {
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

/* *********************************CRUD table contact favorites*******************************/

router.get('/favorites', (req, res) => {
    connection.query('SELECT * from favorites', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des favoris');
      } else {
        res.json(results);
      }
    });
  });

router.post('/favorites', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO favorites SET ?', formData,(err, results) => {
      if (err) {
        res.status(500).send("Erreur lors de l'envoi des favoris");
      } else {
        res.sendStatus(200);
      }
    });
  });

  router.put('/favorites/:id', (req, res) => {
    const idfavorites = req.params.id;
    const formData = req.body;
    connection.query('UPDATE favorites SET ? WHERE id_favorites = ?', [formData, idfavorites], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la modification des favoris");
      } else {
        res.sendStatus(200);
      }
    });
  });

  router.delete('/favorites/:id', (req, res) => {
    const dropfavorites = req.params.id;
    connection.query('DELETE FROM favorites WHERE id_favorites = ?', [dropfavorites], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la suppression des favoris");
      } else {
        res.sendStatus(200);
      }
    });
  });

/* ****************************** CRUD table contact popularity*********************/

router.get('/popularity', (req, res) => {
    connection.query('SELECT * from popularity', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des populaires');
      } else {
        res.json(results);
      }
    });
  });

  router.post('/popularity', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO popularity SET ?', formData,(err, results) => {
      if (err) {
        res.status(500).send("Erreur lors de l'envoi des populaires");
      } else {
        res.sendStatus(200);
      }
    });
  });


  router.put('/popularity/:id', (req, res) => {
    const idpopularity = req.params.id;
    const formData = req.body;
    connection.query('UPDATE popularity SET ? WHERE id_popularity = ?', [formData, idpopularity], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la modification des populaires");
      } else {
        res.sendStatus(200);
      }
    });
  });

  router.delete('/popularity/:id', (req, res) => {
    const droppopularity = req.params.id;
    connection.query('DELETE FROM popularity WHERE id_popularity = ?', [droppopularity], err => {
      if (err) {
        console.log(err);
        res.status(500).send("Erreur lors de la suppression des populaires");
      } else {
        res.sendStatus(200);
      }
    });
  });

/* ****************************** CRUD table contact change history video*********************/
router.get('/change_history_video', (req, res) => {
  connection.query('SELECT * from change_history_video', (err, results) => {
    if (err) {
      res.status(500).send("Erreur lors de la récupération des changements de l'historique des videos");
    } else {
      res.json(results);
    }
  });
});

router.post('/change_history_video', (req, res) => {
  const formData = req.body;
  connection.query('INSERT INTO change_history_video SET ?', formData,(err, results) => {
    if (err) {
      res.status(500).send("Erreur lors de l'envoi de l'historique des videos");
    } else {
      res.sendStatus(200);
    }
  });
});

router.put('/change_history_video/:id', (req, res) => {
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

router.delete('/change_history_video/:id', (req, res) => {
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