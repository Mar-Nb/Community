require('localenv');
const express = require('express'),
app = express(),
bodyParser = require('body-parser'),
port = process.env.PORT || 3030;
const cors = require('cors');

//App configuration
app.use(cors());
app.use(bodyParser.urlencoded({ limit: '50mb', extended: false, parameterLimit: 50000 }));
app.use(bodyParser.json({ limit: '50mb' }));
app.use(function nocache(req, res, next) {
  res.header('Cache-Control', 'private, no-cache, no-store, must-revalidate');
  res.header('Expires', '-1');
  res.header('Pragma', 'no-cache');
  next();
});

//Database connection
const db = require('./services/Database');
app.use(function(req, res, next){
    res.locals.connection= db;
    next();
});

//Routes....
const shopusers_routes = require('./routes/user');
shopusers_routes(app);

const default_routes = require('./routes/default');
default_routes(app);

app.listen(port);
console.log('Community REST API server started on: ' + port);
