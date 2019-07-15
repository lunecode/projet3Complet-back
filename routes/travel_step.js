const express = require('express');
const connection = require('../conf');
const router = express.Router();


router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /travel_step')
});


// *******************************************************************table travel_step****************************************************************************

// Affichage de toutes les données de la table travel_step (testé )
router.get('/get_travelstep', (req, res) => {
    connection.query('SELECT * FROM travel_step', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des données')
        } else {
            res.json(results)
        }
    })
})

// Route pour insérer des données via un POST ( testé )
router.post('/insert_travelstep', (req, res) => {
    const formData = req.body
    connection.query('INSERT INTO travel_step SET ?', formData, (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de l\'insertion de données')
        } else {
            res.sendStatus(200)
        }
    })
})

// Route pour modifier des donneés via un PUT (testé )
router.put('/update_travelstep/:id', (req, res) => {
    const idTravelStep = req.params.id
    const formData = req.body
    connection.query('UPDATE travel_step SET ? WHERE id_travel_step = ?', [formData, idTravelStep], err => {
        if (err) {
            console.log(err)
            res.status(500).send('Erreur lors de la modification des données')
        } else {
            res.sendStatus(200)
        }
    })
})

// Route pour supprimer une données via DELETE ( testé )
router.delete('/delete_travelstep/:id', (req, res) => {
    const idTravelStep = req.params.id
    connection.query('DELETE FROM travel_step WHERE id_travel_step = ?', [idTravelStep], err => {
        if (err) {
            console.log(err)
            res.status(500).send('Erreur lors de la suppression des données')
        } else {
            res.sendStatus(200)
        }
    })
})

module.exports = router;
