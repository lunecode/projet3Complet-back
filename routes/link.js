const express = require('express');
const router = express.Router();
connection = require('../conf');

router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /link')
});




// **************************************************CRUD de la table travel_step_has_change_history_travel_step***************************************************************************


// Affichage de toutes les données de la table travel_step_has_change_history_travel_step ( testé )
router.get('/getdatafkchangehistorytravelstep', (req, res) => {
    connection.query('SELECT * FROM travel_step_has_change_history_travel_step', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération de la table change history travel step')
        } else {
            res.json(results)
        }
    })
})

// Route pour insérer des données via un POST ( testé )
router.post('/insertdatafkchangehistorytravelstep', (req, res) => {
    const formData = req.body
    connection.query('INSERT INTO travel_step_has_change_history_travel_step SET ?', formData, (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de l\'insertion de données')
        } else {
            res.sendStatus(200)
        }
    })
})


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
    })
})




// **************************************************************CRUD de la table comment_has_change_history_like_comment****************************************************************************


// Affichage de toutes les données de la table comment_has_change_history_like_comment( testé )
router.get('/getdatafkcomment_has_change_history_like_comment', (req, res) => {
    connection.query('SELECT * FROM comment_has_change_history_like_comment', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération de la table comment_has_change_history_like_comment')
        } else {
            res.json(results)
        }
    })
})

// Route pour insérer des données via un POST ( testé )
router.post('/insertdatafkcomment_has_change_history_like_comment', (req, res) => {
    const formData = req.body
    connection.query('INSERT INTO comment_has_change_history_like_comment SET ?', formData, (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de l\'insertion de données')
        } else {
            res.sendStatus(200)
        }
    })
})


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
    })
})



module.exports = router;