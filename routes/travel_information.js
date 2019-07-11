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

// **************************************** travel_information / JOINTURE****************************************

// Affichage de toutes les données de la table travel_information et general_video
router.get('/get_travelinformation_general_video', (req, res) => {
    connection.query('SELECT * FROM travel_information JOIN general_video ON id_general_video=travel_information.general_video_id_general_video LIMIT 5', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des datas')
        } else {
            res.json(results)
        }
    })
})


// INSERT DATA TO TRAVEL_INFORMATION WITH CONTINENT
router.post('/insert_travelinformationContinent', (req, res) => {
    const formData = req.body
    connection.query('INSERT INTO travel_information SET ?', formData, (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de l\'insertion de données')
        } else {
            res.sendStatus(200)
        }
    })
})

////////////////////////  TO GET COUNTRIES IN CONTINENT    ///////////////////////

///////////  AFRIQUE ///////////////
router.get('/get_travelinformation_continent_afrique', (req, res) => {
    connection.query('SELECT * FROM travel_information JOIN continent ON id_continent=continent_id_continent WHERE continent_id_continent=2 LIMIT 3', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des datas')
        } else {
            res.json(results)
        }
    })
})

///////////  ASIE OCEANIE ///////////////
router.get('/get_travelinformation_continent_asieoceanie', (req, res) => {
    connection.query('SELECT * FROM travel_information JOIN continent ON id_continent=continent_id_continent WHERE continent_id_continent=4 LIMIT 3', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des datas')
        } else {
            res.json(results)
        }
    })
})

///////////  EUROPE ///////////////
router.get('/get_travelinformation_continent_europe', (req, res) => {
    connection.query('SELECT * FROM travel_information JOIN continent ON id_continent=continent_id_continent WHERE continent_id_continent=5 LIMIT 3', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des datas')
        } else {
            res.json(results)
        }
    })
})

///////////  AMERIQUE ///////////////
router.get('/get_travelinformation_continent_amerique', (req, res) => {
    connection.query('SELECT * FROM travel_information JOIN continent ON id_continent=continent_id_continent WHERE continent_id_continent=3 LIMIT 3', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des datas')
        } else {
            res.json(results)
        }
    })
})

///////////  AUTRES ///////////////
router.get('/get_travelinformation_continent_autres', (req, res) => {
    connection.query('SELECT * FROM travel_information JOIN continent ON id_continent=continent_id_continent WHERE continent_id_continent=1 LIMIT 3', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des datas')
        } else {
            res.json(results)
        }
    })
})

module.exports = router;




