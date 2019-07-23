const express = require('express');
const connection = require('../conf');
const router = express.Router();


router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /general_video')
});


//***************************************/general_video/*********************************************************************************** */

// récupération des données

router.get('/get_general_video', (req, res) => {
  connection.query('SELECT * FROM general_video', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des données');
      } else {
        res.json(results);
      }
    });
});

// Insertion des donneés

router.post('/insert_general_video', (req, res) => {
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

router.put('/update_general_video/:id', (req, res) => {
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

router.delete('/delete_general_video/:id', (req, res) => {
  const dropGeneralVideo = req.params.id;
  connection.query('DELETE  FROM general_video WHERE profil_id_profil = ?', [dropGeneralVideo], err => {
    if (err) {
      console.log(err);
      res.status(500).send("Erreur lors de la suppression des données");
    } else {
      res.sendStatus(200);
    }
  });
});


router.get('/get_general_video_liked_popularitylimit', (req, res) => {
  connection.query('SELECT * FROM general_video INNER JOIN liked ON id_general_video=liked.general_video_id_general_video INNER JOIN popularity ON id_popularity=liked.popularity_id_popularity LIMIT 4', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des données');
      }else{
        res.json(results);
      }
    });
});

router.get('/get_profil_limite1/:offset', (req, res) => {
  const offset = +req.params.offset
  connection.query('SELECT * FROM profil LIMIT ? , 1;', [offset], (err, results) => {
      if (err) {
        console.log(err);
 
        res.status(500).send('Erreur lors de la récupération des données');
      }else{
        res.json(results);
      }
    });
 });

//************************ */JOINTURE /********************************************************** */

// récupération des données general_video/popularity/liked

router.get('/get_general_video_liked_popularity', (req, res) => {
  connection.query('SELECT * FROM general_video INNER JOIN liked ON id_general_video=liked.general_video_id_general_video INNER JOIN popularity ON id_popularity=liked.popularity_id_popularity', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des données');
      }else{
        res.json(results);
      }
    });
});


//************************ */LIMITE /********************************************************** */

//******* RECENT PUBLISHED******* */

router.get('/get_general_video_limite/:offset', (req, res) => {
  const offset = +req.params.offset
  connection.query('SELECT * FROM general_video LIMIT ? , 5;', [offset], (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des données');
      }else{
        res.json(results);
      }
    });
});

//******* NEXT DESTINATION ******* */
router.get('/get_general_video_nextdestination', (req, res) => {
  connection.query('SELECT * from general_video JOIN travel_information ON id_general_video=travel_information.general_video_id_general_video LIMIT 5', (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des données');
    } else {
      res.json(results);
    }
  });
});


// TEST GET VIDEO FOR HOME PAGE WITH COUNTRY

router.get('/get_general_video_home', (req, res) => {
  connection.query('SELECT * from general_video JOIN travel_information ON id_general_video=travel_information.general_video_id_general_video LIMIT 5', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des données');
      } else {
        res.json(results);
      }
    });
});



// GET VIDEO BY ID

router.get('/get_id_general_video', (req, res) => {
  connection.query('SELECT id_general_video FROM general_video ORDER BY id_general_video DESC', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des données');
      } else {
        res.json(results);
      }
    });
});



/******* NEXT DESTINATION ******* */
router.get('/get_general_video_nextdestination', (req, res) => {
  connection.query('SELECT * from general_video JOIN travel_information ON id_general_video=travel_information.general_video_id_general_video LIMIT 5', (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des données');
    } else {
      res.json(results);
    }
  });
});



// ***********************************GET VIDEO WITH ID PROFIL******************************************


// TEST OK WITH POSTMAN
router.get('/get_video_id_profil/:id', (req, res) => {
  const getVideoProfil = req.params.id
  connection.query('SELECT * FROM general_video WHERE profil_id_profil = ?', [getVideoProfil], (err, results) => {
    if (err) {
      res.status(500).send('Erreur dans la récupération des données');
    } else {
      res.json(results)
    }
  })
})


// TEST
router.get('/get_general_video_travel_information/:id', (req, res) => {
  const getVideoByProfil = req.params.id
  connection.query('SELECT * from general_video JOIN travel_information ON id_general_video=travel_information.general_video_id_general_video WHERE profil_id_profil = ?', [getVideoByProfil], (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des données');
    } else {
      res.json(results);
    }
  });
});

// GET TAUX DE REMPLISSAGE 

router.get('/get_general_video_nextdestination_tauxderemplissage', (req, res) => {
  connection.query('SELECT video_title, video_link,video_user,video_duration, ROUND(100-(ISNULL(NULLIF(video_title,"")) + ISNULL(NULLIF(video_link,"")) + ISNULL(NULLIF(video_user,"")) + ISNULL(NULLIF(video_duration,"")))*100/5) AS tx_remplissage FROM general_video', (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des données');
    } else {
      res.json(results);
    }
  });
});



router.get('/get_general_video_lim/:offset', (req, res) => {
  const offset = +req.params.offset
  connection.query('SELECT * FROM general_video LIMIT ? , 4;', [offset], (err, results) => {
      if (err) {
        console.log(err);
        
        res.status(500).send('Erreur lors de la récupération des données');
      }else{
        res.json(results);
      }
    });
});

router.get('/get_Page_Afrique/:offset', (req, res) => {
  const offset = +req.params.offset
  connection.query('SELECT * FROM general_video LIMIT ? , 8;', [offset], (err, results) => {
      if (err) {
        console.log(err);
        
        res.status(500).send('Erreur lors de la récupération des données');
      }else{
        res.json(results);
      }
    });
});


module.exports = router;