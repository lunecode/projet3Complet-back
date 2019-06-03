const express = require('express');
const connection = require('../conf');
const router = express.Router();


router.get('/', (req, res) => {
    res.status(200).send('Je suis dans link')
});


//******************************************* */ CRUD  table de liaison profil / change history profil/*********************************************************************************** */
// récupération des données

router.get('/dataprofilchangehistoryprofil', (req, res) => {
    connection.query('SELECT * FROM profil_has_change_history_profil ', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des données');
        } else {
            res.json(results);
        }
    });
});

// Insertion des donneés


router.post('/insertprofilchangehistoryprofil', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO profil_has_change_history_profil SET ?', formData, (err, results) => {
        if (err) {
            res.status(500).send("Erreur lors de la sauvegarde des datas");
        } else {
            res.sendStatus(200);
        }
    });
});


//suppression des données
router.delete('/deleteprofilchangehistoryprofil/:id', (req, res) => {
    const dropChangeHistoryProfil = req.params.id;
    connection.query('DELETE FROM profil_has_change_history_profil WHERE profil_id_profil = ?', [dropChangeHistoryProfil], err => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la suppression des données");
        } else {
            res.sendStatus(200);
        }
    });
});




//*************************************** */ CRUD  table de liaison watch later with profil*********************************************************************************** */



// récupération des données
router.get('/datawatch_later_has_profil', (req, res) => {
    connection.query('SELECT * FROM watch_later_has_profil', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des données');
        } else {
            res.json(results);
        }
    });
});

// Insertion des donneés

router.post('/insertwatch_later_has_profil', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO watch_later_has_profil SET ?', formData, (err, results) => {
        if (err) {
            res.status(500).send("Erreur lors de la sauvegarde des datas");
        } else {
            res.sendStatus(200);
        }
    });
});

//suppression des données

router.delete('/deletewatch_later_has_profil/:id', (req, res) => {
    const dropWatchlaterHasProfil = req.params.id;
    connection.query('DELETE FROM watch_later_has_profil WHERE watch_later_id_watch_later = ?', [dropWatchlaterHasProfil], err => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la suppression des données");
        } else {
            res.sendStatus(200);
        }
    });
});






/* *********************CRUD table liaison profil/popularity**********************************/


router.get('/profil_has_popularity', (req, res) => {
    connection.query('SELECT * from profil_has_popularity', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération de la table des liaisons');
        } else {
            res.json(results);
        }
    });
});



router.post('/profil_has_popularity', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO profil_has_popularity SET ?', formData, (err, results) => {
        if (err) {
            res.status(500).send("Erreur lors de l'envoi du message");
        } else {
            res.sendStatus(200);
        }
    });
});



router.delete('/profil_has_popularity/:id', (req, res) => {
    const dropprofil_has_popularity = req.params.id;
    connection.query('DELETE FROM profil_has_popularity WHERE profil_id_profil = ?', [dropprofil_has_popularity], err => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la suppression d'une ");
        } else {
            res.sendStatus(200);
        }
    });
});




/* *********************CRUD table liaison profil/changehistoryvideo**********************************/



router.get('/profil_has_change_history_video', (req, res) => {
    connection.query('SELECT * from profil_has_change_history_video', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération de la table des liaisons');
        } else {
            res.json(results);
        }
    });
});




router.post('/profil_has_change_history_video', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO profil_has_change_history_video SET ?', formData, (err, results) => {
        if (err) {
            res.status(500).send("Erreur lors de l'envoi de la table des liaisons");
        } else {
            res.sendStatus(200);
        }
    });
});




router.delete('/profil_has_change_history_video/:id', (req, res) => {
    const dropprofil_has_change_history_video = req.params.id;
    connection.query('DELETE FROM profil_has_change_history_video WHERE profil_id_profil = ?', [dropprofil_has_change_history_video], err => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la suppression d'une ");
        } else {
            res.sendStatus(200);
        }
    });
});



//**************************** */Table de liaison profil - follower*****************************************


// requete get profil - follower
router.get('/getprofilfollower', (req, res) => {
    // connection to the database, and selection of employees
    connection.query('SELECT * FROM profil_has_follower ', (err, results) => {
        if (err) {
            // If an error has occurred, then the user is informed of the error
            res.status(500).send('Erreur lors de la récupération des données');
        } else {
            // If everything went well, we send the result of the SQL query as JSON.
            res.json(results);
        }
    });
});

// requete post profil - follower 

router.post('/postprofilfollower', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO profil_has_follower SET ?', formData, (err, results) => {
        if (err) {
            console.log(err)
            res.status(500).send("Erreur lors de la sauvegarde d'un employé");
        } else {
            res.sendStatus(200);
        }
    });
});


//request delete profil_has_follower
router.delete('/deleteprofilfollower', (req, res) => {
    const dropProfilFollower = req.params.id;
    connection.query('DELETE FROM profil_has_follower WHERE profil_id_profil = ?', [dropProfilFollower], err => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la suppression des données");
        } else {
            res.sendStatus(200);
        }
    });
});





// -------------------------***PROFIL PLAYLIST***-------------------------
// ---------Affichage des données de la table profil - playlist-----------

router.get('/profilplaylist', (req, res) => {
    connection.query('SELECT * FROM profil_has_playlist', (err, results) => {
        if (err) {
            res.status(500).send('Erreur de la récupération des données');
        } else {
            res.json(results);
        };
    });
});



// -----------Insérer les données de la table profil - playlist------------

router.post('/profilplaylist', (req, res) => {
    const formData = req.body;
    connection.query('INSERT INTO profil_has_playlist SET ?', formData, (err, results) => {
        if (err) {
            res.status(500).send("Erreur lors de l'envoi du message");
        }
        else {
            res.sendStatus(200);
        }
    })
});

// ----------Supprimer les données de la table profil - playlist-----------

router.delete('/profilplaylist/:id', (req, res) => {
    const dropprofil_has_playlist = req.params.id;
    connection.query('DELETE FROM profil_has_playlist WHERE profil_id_profil = ?', [dropprofil_has_playlist], err => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la suppression d'une playlist");
        } else {
            res.sendStatus(200);
        }
    });
});





// **************************CRUD de la table travel_step_has_change_history_travel_step***************************************************************************


// Affichage de toutes les données de la table travel_step_has_change_history_travel_step ( testé )
router.get('/getdatafkchangehistorytravelstep', (req, res) => {
    connection.query('SELECT * FROM travel_step_has_change_history_travel_step', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération de la table change history travel step')
        } else {
            res.json(results)
        };
    });
});



// Route pour insérer des données via un POST ( testé )
router.post('/insertdatafkchangehistorytravelstep', (req, res) => {
    const formData = req.body
    connection.query('INSERT INTO travel_step_has_change_history_travel_step SET ?', formData, (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de l\'insertion de données')
        } else {
            res.sendStatus(200)
        }
    });
});


// Route pour supprimer une données via DELETE ( testé )
router.delete('/deletedatafkchangehistorytravelstep/:id', (req, res) => {
    const idHistory = req.params.id
    connection.query('DELETE FROM travel_step_has_change_history_travel_step WHERE travel_step_id_travel_step = ?', [idHistory], err => {
        if (err) {
            console.log(err)
            res.status(500).send('Erreur lors de la suppression des données')
        } else {
            res.sendStatus(200)
        }
    });
});




// **************************************************************CRUD de la table comment_has_change_history_like_comment****************************************************************************


// Affichage de toutes les données de la table comment_has_change_history_like_comment( testé )
router.get('/getdatafkcomment_has_change_history_like_comment', (req, res) => {
    connection.query('SELECT * FROM comment_has_change_history_like_comment', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération de la table comment_has_change_history_like_comment')
        } else {
            res.json(results)
        }
    });
});

// Route pour insérer des données via un POST ( testé )
router.post('/insertdatafkcomment_has_change_history_like_comment', (req, res) => {
    const formData = req.body
    connection.query('INSERT INTO comment_has_change_history_like_comment SET ?', formData, (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de l\'insertion de données')
        } else {
            res.sendStatus(200)
        }
    });
});


// Route pour supprimer une données via DELETE ( testé )
router.delete('/deletedatafkcomment_has_change_history_like_comment/:id', (req, res) => {
    const idCommentHistory = req.params.id
    connection.query('DELETE FROM comment_has_change_history_like_comment WHERE comment_id_comment = ?', [idCommentHistory], err => {
        if (err) {
            console.log(err)
            res.status(500).send('Erreur lors de la suppression des données')
        } else {
            res.sendStatus(200)
        }
    });
});



module.exports = router;