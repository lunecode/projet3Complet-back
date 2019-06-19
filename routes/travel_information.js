const express = require('express');
const router = express.Router();
connection = require('../conf');

router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /travel_information')
});


// ****************************************CRUD de la table travel_information****************************************************************************

// Affichage de toutes les données de la table travel_information ( testé )
router.get('/get_travelinformation', (req, res) => {
    connection.query('SELECT * FROM travel_information', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des datas')
        } else {
            res.json(results)
        }
    })
})

// Route pour insérer des données via un POST ( testé )
router.post('/insert_travelinformation', (req, res) => {
    const formData = req.body
    connection.query('INSERT INTO travel_information SET ?', formData, (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de l\'insertion de données')
        } else {
            res.sendStatus(200)
        }
    })
})


// Route pour modifier des donneés via une PUT ( testé )
router.put('/update_travelinformation/:id', (req, res) => {
    const idTravelInfo = req.params.id
    const formData = req.body
    connection.query('UPDATE travel_information SET ? WHERE id_travel_information = ?', [formData, idTravelInfo], err => {
        if (err) {
            console.log(err)
            res.status(500).send('Erreur lors de la modification des données')
        } else {
            res.sendStatus(200)
        }
    })
})

// Route pour supprimer une données via DELETE ( testé )
router.delete('/delete_travelinformation/:id', (req, res) => {
    const idTravelInfo = req.params.id
    connection.query('DELETE FROM travel_information WHERE id_travel_information = ?', [idTravelInfo], err => {
        if (err) {
            console.log(err)
            res.status(500).send('Erreur lors de la suppression des données')
        } else {
            res.sendStatus(200)
        }
    })
})

// ****************************************CRUD de la table travel_information / JOINTURE****************************************

// Affichage de toutes les données de la table travel_information et general_video
router.get('/get_travelinformation_general_video', (req, res) => {
    connection.query('SELECT * FROM travel_information JOIN general_video ON id_general_video=travel_information.general_video_id_general_video', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des datas')
        } else {
            res.json(results)
        }
    })
})







module.exports = router;




