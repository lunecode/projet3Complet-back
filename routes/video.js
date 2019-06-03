const express = require('express');
const router = express.Router();
const connection = require('../conf');

router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /video')
});


// Lecture de la vidéo

router.get('/play_video', (req, res) => {
    connection.query('SELECT * FROM general_video', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération de general_video');
          } else {
            res.json(results);
          }
      });
  });

  router.post('/post_play_video', (req, res) => {
    // récupération des données envoyées
    const formData = req.body;
    // connexion à la base de données, et insertion des données
    connection.query('INSERT INTO general_video SET ?', formData, err => {
        if (err) {
            // Si une erreur est survenue, alors on informe l'utilisateur de l'erreur
            res.status(500).send('Erreur lors de la sauvegarde de general_video');
        } else {
            // Si tout s'est bien passé, on envoie un statut "ok".
            res.sendStatus(200);
        }
    })
 });

//   Fin de lecture de la vidéo
//------------------------//
//------------------------//
//------------------------//
// Lecture de data popularity video (like,nombre de vues, nombre de j'aime...)

router.get('/get_data_popularity_video', (req, res) => {
    connection.query('SELECT * FROM popularity ', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération de popularity ');
          } else {
            res.json(results);
          }
      });
  });

  router.post('/post_data_popularity_video', (req, res) => {
    // récupération des données envoyées
    const formData = req.body;
    // connexion à la base de données, et insertion des données
    connection.query('INSERT INTO popularity SET ?', formData, err => {
        if (err) {
            // Si une erreur est survenue, alors on informe l'utilisateur de l'erreur
            res.status(500).send('Erreur lors de la sauvegarde de data popularity video');
        } else {
            // Si tout s'est bien passé, on envoie un statut "ok".
            res.sendStatus(200);
        }
    })
 });

 router.put('/put_data_popularity_video/:id', (req, res) => {
    // récupération des données envoyées
    const idPopularity = req.params.id;
    const formData = req.body;
    // connection à la base de données, et modification de popularity
    connection.query('UPDATE popularity SET ? WHERE id_popularity = ?', [formData, idPopularity], err => {
        if (err) {
            // Si une erreur est survenue, alors on informe l'utilisateur de l'erreur
            res.status(500).send("Erreur lors de la modification de popularity");
        } else {
            // Si tout s'est bien passé, on envoie un statut "ok".
            res.sendStatus(200);
        }
    });
  });

  
// Fin de lecture de data popularity video
//------------------------//
//------------------------//
//------------------------//
// Lecture de like (like une vidéo) 

router.get('/get_data_like_video', (req, res) => {
    connection.query('SELECT * FROM liked', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération de popularity');
          } else {
            res.json(results);
          }
      });
  });

  router.post('/post_data_like_video', (req, res) => {
    // récupération des données envoyées
    const formData = req.body;
    // connexion à la base de données, et insertion des données
    connection.query('INSERT INTO liked SET ?', formData, err => {
        if (err) {
            // Si une erreur est survenue, alors on informe l'utilisateur de l'erreur
            res.status(500).send('Erreur lors de la sauvegarde du like');
        } else {
            // Si tout s'est bien passé, on envoie un statut "ok".
            res.sendStatus(200);
        }
    })
 });


//  Suppression d'une données via DELETE
 router.delete('/delete_data_like_video/:id', (req, res) => {
   // récupération des données liked
  const idLiked = req.params.id
   // connexion à la base de données, et suppression de liked
  connection.query('DELETE FROM liked WHERE id_like = ?', [idLiked], err => {
      if (err) {
        // Si une erreur est survenue, alors on informe l'utilisateur de l'erreur
          res.status(500).send('Erreur lors de la suppression des données')
      } else {
         // Si tout s'est bien passé, on envoie un statut "ok".
          res.sendStatus(200)
      }
  })
})

//   Fin de lecture de like
//------------------------//
//------------------------//
//------------------------//
// Lecture de comment (commente une vidéo) 

router.get('/get_data_comment', (req, res) => {
  connection.query('SELECT * FROM comment ', (err, results) => {
      if (err) {
          res.status(500).send('Erreur lors de la récupération de comment ');
        } else {
          res.json(results);
        }
    });
});

router.post('/post_data_comment', (req, res) => {
  // récupération des données comment
  const formData = req.body;
  // connexion à la base de données, et insertion des données
  connection.query('INSERT INTO comment SET ?', formData, err => {
      if (err) {
          // Si une erreur est survenue, alors on informe l'utilisateur de l'erreur
          res.status(500).send('Erreur lors de la sauvegarde de comment');
      } else {
          // Si tout s'est bien passé, on envoie un statut "ok".
          res.sendStatus(200);
      }
  })
});

router.put('/put_data_comment/:id', (req, res) => {
  // récupération des données comment
  const idComment = req.params.id;
  const formData = req.body;
  // connection à la base de données, et modification de comment
  connection.query('UPDATE comment SET ? WHERE id_comment = ?', [formData, idComment], err => {
      if (err) {
          // Si une erreur est survenue, alors on informe l'utilisateur de l'erreur
          console.log(err);
          res.status(500).send("Erreur lors de la modification de comment");
      } else {
          // Si tout s'est bien passé, on envoie un statut "ok".
          res.sendStatus(200);
      }
  });
});

//  Suppression d'une données via DELETE
router.delete('/delete_data_comment/:id', (req, res) => {
  // récupération des données comment
 const idComment = req.params.id
  // connexion à la base de données, et suppression de comment
 connection.query('DELETE FROM comment WHERE id_comment = ?', [idComment], err => {
     if (err) {
       // Si une erreur est survenue, alors on informe l'utilisateur de l'erreur
         res.status(500).send('Erreur lors de la suppression des données comment')
     } else {
        // Si tout s'est bien passé, on envoie un statut "ok".
         res.sendStatus(200)
     }
 })
})

//   Fin de lecture de comment
//------------------------//
//------------------------//
//------------------------//
// Lecture de playlist

router.get('/get_data_playlist', (req, res) => {
  connection.query('SELECT * FROM playlist ', (err, results) => {
      if (err) {
          res.status(500).send('Erreur lors de la récupération de playlist ');
        } else {
          res.json(results);
        }
    });
});

router.post('/post_data_playlist', (req, res) => {
  // récupération des données playlist
  const formData = req.body;
  // connexion à la base de données, et insertion des données
  connection.query('INSERT INTO playlist SET ?', formData, err => {
      if (err) {
          // Si une erreur est survenue, alors on informe l'utilisateur de l'erreur
          res.status(500).send('Erreur lors de la sauvegarde de playlist');
      } else {
          // Si tout s'est bien passé, on envoie un statut "ok".
          res.sendStatus(200);
      }
  })
});

//   Fin de lecture de comment
//------------------------//
//------------------------//
//------------------------//
// Lecture de "À regarder plus tard"

router.get('/get_data_watch_later', (req, res) => {
  connection.query('SELECT * FROM watch_later ', (err, results) => {
      if (err) {
          res.status(500).send('Erreur lors de la récupération de À regarder plus tard ');
        } else {
          res.json(results);
        }
    });
});

router.post('/post_data_watch_later', (req, res) => {
  // récupération des données "À regarder plus tard"
  const formData = req.body;
  // connexion à la base de données, et insertion des données
  connection.query('INSERT INTO watch_later SET ?', formData, err => {
      if (err) {
          // Si une erreur est survenue, alors on informe l'utilisateur de l'erreur
          res.status(500).send('Erreur lors de la sauvegarde à regarder plus tard');
      } else {
          // Si tout s'est bien passé, on envoie un statut "ok".
          res.sendStatus(200);
      }
  })
});

//   Fin de lecture de "À regarder plus tard"
//------------------------//
//------------------------//
//------------------------//
// Lecture de favoris

router.get('/get_data_favorites', (req, res) => {
  connection.query('SELECT * FROM favorites ', (err, results) => {
      if (err) {
          res.status(500).send('Erreur lors de la récupération de favoris ');
        } else {
          res.json(results);
        }
    });
});

router.post('/post_data_favorites', (req, res) => {
  // récupération des données favoris
  const formData = req.body;
  // connexion à la base de données, et insertion des données
  connection.query('INSERT INTO favorites SET ?', formData, err => {
      if (err) {
          // Si une erreur est survenue, alors on informe l'utilisateur de l'erreur
          res.status(500).send('Erreur lors de la sauvegarde de favoris');
      } else {
          // Si tout s'est bien passé, on envoie un statut "ok".
          res.sendStatus(200);
      }
  })
});

//   Fin de lecture de favoris
//------------------------//
//------------------------//
//------------------------//
// Lecture de follower

router.get('/get_data_follower', (req, res) => {
  connection.query('SELECT * FROM follower ', (err, results) => {
      if (err) {
          res.status(500).send('Erreur lors de la récupération de follower');
        } else {
          res.json(results);
        }
    });
});

router.post('/post_data_follower', (req, res) => {
  // récupération des données follower
  const formData = req.body;
  // connexion à la base de données, et insertion des données
  connection.query('INSERT INTO follower SET ?', formData, err => {
      if (err) {
          // Si une erreur est survenue, alors on informe l'utilisateur de l'erreur
          res.status(500).send('Erreur lors de la sauvegarde de follower');
      } else {
          // Si tout s'est bien passé, on envoie un statut "ok".
          res.sendStatus(200);
      }
  })
});

//   Fin de lecture de follower
//------------------------//
//------------------------//
//------------------------//
// Lecture de following
router.get('/get_data_following', (req, res) => {
  connection.query('SELECT * FROM following ', (err, results) => {
      if (err) {
          res.status(500).send('Erreur lors de la récupération de following');
        } else {
          res.json(results);
        }
    });
});

router.post('/post_data_following', (req, res) => {
  // récupération des données following
  const formData = req.body;
  // connexion à la base de données, et insertion des données
  connection.query('INSERT INTO following SET ?', formData, err => {
      if (err) {
          // Si une erreur est survenue, alors on informe l'utilisateur de l'erreur
          res.status(500).send('Erreur lors de la sauvegarde de following');
      } else {
          // Si tout s'est bien passé, on envoie un statut "ok".
          res.sendStatus(200);
      }
  })
});

//   Fin de lecture de following
//------------------------//
//------------------------//
//------------------------//


module.exports = router;