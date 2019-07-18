const express = require('express');
const connection = require('../conf');
const router = express.Router();


router.get('/music', (req, res) => {
    res.status(200).send('Je suis dans /popularity')
});


/* ****************************** CRUD table contact popularity*********************/

router.get('/get_popularity', (req, res) => {
    connection.query('SELECT * from popularity', (err, results) => {
      if (err) {
        res.status(500).send('Erreur lors de la récupération des populaires');
      } else {
        res.json(results);
      }
    });
  });

  router.post('/post_popularity', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO popularity SET ?', formData,(err, results) => {
      if (err) {
        res.status(500).send("Erreur lors de l'envoi des populaires");
      } else {
        res.sendStatus(200);
      }
    });
  });


  router.put('/put_popularity/:id', (req, res) => {
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

  router.delete('/delete_popularity/:id', (req, res) => {
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

/* ******************************  popularity_liked_general_video**************************************/


/* ORDER By nb_liked*/
router.get('/get_popularity_liked_general_video_travel_information', (req, res) => {
  connection.query('SELECT * FROM popularity INNER JOIN liked ON id_popularity=liked.popularity_id_popularity INNER JOIN general_video ON id_general_video=liked.general_video_id_general_video INNER JOIN travel_information ON id_general_video=travel_information.general_video_id_general_video ORDER BY nb_like_popularity ASC LIMIT 5', (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des populaires');
    } else {
      res.json(results);
    }
  });
});


/* ORDER By number_tips*/
router.get('/get_popularity_liked_general_video_travel_information2', (req, res) => {
  const offset= + req.params.offset
  connection.query('SELECT *, ROUND(100-(ISNULL(NULLIF(video_title,"")) + ISNULL(NULLIF(video_description,"")) + ISNULL(NULLIF(cover_picture,"")) + ISNULL(NULLIF(link_equipment,"")) + ISNULL(NULLIF(video_link,"")))*100/5) AS tx_remplissage FROM general_video INNER JOIN liked ON id_general_video=liked.general_video_id_general_video INNER JOIN popularity ON id_popularity=liked.popularity_id_popularity INNER JOIN travel_information ON id_general_video=travel_information.general_video_id_general_video ORDER BY nb_like_popularity ASC LIMIT 4',[offset], (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des populaires');
    } else {
      res.json(results);
    }
  });
});

/* ORDER By number_tips LIMIT  */
router.get('/get_popularity_liked_general_video_travel_information_limit', (req, res) => {
  connection.query('SELECT * FROM popularity INNER JOIN liked ON id_popularity=liked.popularity_id_popularity INNER JOIN general_video ON id_general_video=liked.general_video_id_general_video INNER JOIN travel_information ON id_general_video=travel_information.general_video_id_general_video ORDER BY nb_like_popularity ASC LIMIT 5,5 O', (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des populaires');
    } else {
      res.json(results);
    }
  });
});


/* ******************************  popularity_liked_general_video**************************************/

/* ORDER By nb_liked LIMITE*/
router.get('/get_popularity_liked_general_video_travel_information/:offset', (req, res) => {
  const offset = +req.params.offset
  connection.query('SELECT * FROM popularity INNER JOIN liked ON id_popularity=liked.popularity_id_popularity INNER JOIN general_video ON id_general_video=liked.general_video_id_general_video INNER JOIN travel_information ON id_general_video=travel_information.general_video_id_general_video ORDER BY nb_like_popularity ASC LIMIT ? , 5;', [offset], (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des populaires');
    } else {
      res.json(results);
    }
  });
});

/* ORDER By number_tips LIMITE*/
router.get('/get_popularity_liked_general_video_travel_information2/:offsetBestplan', (req, res) => {
  const offsetBestplan= + req.params.offsetBestplan
  connection.query('SELECT *, ROUND(100-(ISNULL(NULLIF(video_title,"")) + ISNULL(NULLIF(video_description,"")) + ISNULL(NULLIF(cover_picture,"")) + ISNULL(NULLIF(link_equipment,"")) + ISNULL(NULLIF(video_link,"")))*100/5) AS tx_remplissage FROM general_video INNER JOIN liked ON id_general_video=liked.general_video_id_general_video INNER JOIN popularity ON id_popularity=liked.popularity_id_popularity INNER JOIN travel_information ON id_general_video=travel_information.general_video_id_general_video ORDER BY nb_like_popularity ASC LIMIT ? , 4;', [offsetBestplan], (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des populaires');
    } else {
      res.json(results);
    }
  });
});

/* ******************************  popularity/CONTINENT**************************************/

/* ORDER By AUTRES*/
router.get('/get_popularity_liked_general_video_travel_information_continent_autres', (req, res) => {
  connection.query('SELECT * FROM popularity INNER JOIN liked ON id_popularity=liked.popularity_id_popularity INNER JOIN general_video ON id_general_video=liked.general_video_id_general_video INNER JOIN travel_information ON id_general_video=travel_information.general_video_id_general_video INNER JOIN continent ON id_continent=travel_information.continent_id_continent WHERE continent_id_continent=1 ORDER BY nb_like_popularity ASC LIMIT 12', (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des populaires');
    } else {
      res.json(results);
    }
  });
});

/* ORDER By AFRIQUE*/
router.get('/get_popularity_liked_general_video_travel_information_continent_afrique', (req, res) => {
  connection.query('SELECT * FROM popularity INNER JOIN liked ON id_popularity=liked.popularity_id_popularity INNER JOIN general_video ON id_general_video=liked.general_video_id_general_video INNER JOIN travel_information ON id_general_video=travel_information.general_video_id_general_video INNER JOIN continent ON id_continent=travel_information.continent_id_continent WHERE continent_id_continent=2 ORDER BY nb_like_popularity ASC LIMIT 12', (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des populaires');
    } else {
      res.json(results);
    }
  });
});

/* ORDER By AMERIQUE*/
router.get('/get_popularity_liked_general_video_travel_information_continent_amerique', (req, res) => {
  connection.query('SELECT * FROM popularity INNER JOIN liked ON id_popularity=liked.popularity_id_popularity INNER JOIN general_video ON id_general_video=liked.general_video_id_general_video INNER JOIN travel_information ON id_general_video=travel_information.general_video_id_general_video INNER JOIN continent ON id_continent=travel_information.continent_id_continent WHERE continent_id_continent=3 ORDER BY nb_like_popularity ASC LIMIT 12', (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des populaires');
    } else {
      res.json(results);
    }
  });
});

/* ORDER By ASIE OCEANIE*/
router.get('/get_popularity_liked_general_video_travel_information_continent_asie_oceanie', (req, res) => {
  connection.query('SELECT * FROM popularity INNER JOIN liked ON id_popularity=liked.popularity_id_popularity INNER JOIN general_video ON id_general_video=liked.general_video_id_general_video INNER JOIN travel_information ON id_general_video=travel_information.general_video_id_general_video INNER JOIN continent ON id_continent=travel_information.continent_id_continent WHERE continent_id_continent=4 ORDER BY nb_like_popularity ASC LIMIT 12', (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des populaires');
    } else {
      res.json(results);
    }
  });
});

/* ORDER By EUROPE*/
router.get('/get_popularity_liked_general_video_travel_information_continent_europe', (req, res) => {
  connection.query('SELECT * FROM popularity INNER JOIN liked ON id_popularity=liked.popularity_id_popularity INNER JOIN general_video ON id_general_video=liked.general_video_id_general_video INNER JOIN travel_information ON id_general_video=travel_information.general_video_id_general_video INNER JOIN continent ON id_continent=travel_information.continent_id_continent WHERE continent_id_continent=5 ORDER BY nb_like_popularity ASC LIMIT 12', (err, results) => {
    if (err) {
      res.status(500).send('Erreur lors de la récupération des populaires');
    } else {
      res.json(results);
    }
  });
});
  module.exports = router;