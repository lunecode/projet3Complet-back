const express = require('express');
const bodyParser = require('body-parser');
const morgan = require('morgan');
const routes = require('./routes/index');
const cors = require('cors')
const app = express();
const port = 3000;

app.use(cors())

app.use(morgan('dev'));
app.use(morgan(':method :url :status : res [content-length] - : response-time'));

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));
// parse application/json
app.use(bodyParser.json());

app.use('/home', routes.home);
app.use('/profil', routes.profil);
app.use('/video', routes.video);
app.use('/videoUpload', routes.videoUpload);
app.use('/link', routes.link);


app.get('/', (req, res) => {
    res.status(200).send('Page du localhost')
})

app.listen(port, console.log(`http://localhost:${port}`));