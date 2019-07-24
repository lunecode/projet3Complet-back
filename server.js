const express = require('express');
const bodyParser = require('body-parser');
const morgan = require('morgan');
const routes = require('./routes/index');
const cors = require('cors')
const app = express();
const port = 3000;

const login = require('./routes/auth/login.js')
const registration = require('./routes/auth/registration.js')

app.use(cors())

app.use(morgan('dev'));
app.use(morgan(':method :url :status : res [content-length] - : response-time'));

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));
// parse application/json
app.use(bodyParser.json());

app.use('/login', login)
app.use('/registration', registration)
app.use('/change_history_video', routes.change_history_video);
app.use('/comment', routes.comment);
app.use('/contact_request', routes.contact_request);
app.use('/favorites', routes.favorites);
app.use('/follower', routes.follower);
app.use('/following', routes.following);
app.use('/general_video', routes.general_video);
app.use('/notification', routes.notification);
app.use('/liked', routes.liked);
app.use('/playlist', routes.playlist);
app.use('/popularity', routes.popularity);
app.use('/profil', routes.profil);
app.use('/travel_information', routes.travel_information);
app.use('/travel_step', routes.travel_step);
app.use('/watch_later', routes.watch_later);
app.use('/continent', routes.continent);


app.get('/', (req, res) => {
    res.status(200).send('Page du localhost')
})

app.listen(port, console.log(`http://localhost:${port}`));