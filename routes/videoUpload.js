const express = require('express');
const router = express.Router();
connection = require('../conf');

router.get('/', (req, res) => {
    res.status(200).send('Je suis dans /videoUpload')
});




// *******************************************************************CRUD de la table general_vidéo****************************************************************************

// Affichage de toutes les données de la table général vidéo ( testé )
router.get('/getdatavideo', (req, res) => {
    connection.query('SELECT * FROM general_video', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération de la table général vidéo')
        } else {
            res.json(results)
        }
    })
})

// Route pour insérer des données via un POST ( testé )
router.post('/insertdatavideo', (req, res) => {
    const formData = req.body
    connection.query('INSERT INTO general_video SET ?', formData, (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de l\'insertion de données')
        } else {
            res.sendStatus(200)
        }
    })
})


// Route pour modifier des donneés via une PUT ( testé )
router.put('/updatedatavideo/:id', (req, res) => {
    const idVideo = req.params.id
    const formData = req.body
    connection.query('UPDATE general_video SET ? WHERE id_general_video = ?', [formData, idVideo], err => {
        if (err) {
            console.log(err)
            res.status(500).send('Erreur lors de la modification des données')
        } else {
            res.sendStatus(200)
        }
    })
})



// Route pour supprimer une données via DELETE ( testé )
router.delete('/deletedatavideo/:id', (req, res) => {
    const idVideo = req.params.id
    connection.query('DELETE FROM general_video WHERE id_general_video = ?', [idVideo], err => {
        if (err) {
            console.log(err)
            res.status(500).send('Erreur lors de la suppression des données')
        } else {
            res.sendStatus(200)
        }
    })
})






// *******************************************************************CRUD de la table travel_information****************************************************************************


// Affichage de toutes les données de la table travel_information ( testé )
router.get('/getdatatravelinformation', (req, res) => {
    connection.query('SELECT * FROM travel_information', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des datas')
        } else {
            res.json(results)
        }
    })
})

// Route pour insérer des données via un POST ( testé )
router.post('/insertdatatravelinformation', (req, res) => {
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
router.put('/updatedatatravelinformation/:id', (req, res) => {
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
router.delete('/deletedatatravelinformation/:id', (req, res) => {
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






// *******************************************************************CRUD de la table travel_step****************************************************************************



// Affichage de toutes les données de la table travel_step (testé )
router.get('/getdatatravelstep', (req, res) => {
    connection.query('SELECT * FROM travel_step', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des données')
        } else {
            res.json(results)
        }
    })
})

// Route pour insérer des données via un POST ( testé )
router.post('/insertdatatravelstep', (req, res) => {
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
router.put('/updatedatatravelstep/:id', (req, res) => {
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
router.delete('/deletedatatravelstep/:id', (req, res) => {
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