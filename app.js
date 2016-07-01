var express = require('express');
var app = express();
var path = require('path');
var bodyParser = require('body-parser');

var timeController = require('./controllers/time');
var homeController = require('./controllers/home');

app.use(express.static(__dirname + '/public'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: true
}));

app.set('views', path.join(__dirname, 'views'));
app.get('/', homeController.index, timeController.getDate);
app.set('view engine', 'jade');

app.post('/catch', function(request, response){
  var body = request.body;
  console.log("Received: ", body);
  response.sendStatus(200);
});

app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

var server = app.listen(process.env.PORT || 3000, function (){
  var port = server.address().port;
  console.log('Magic is happening on port', port, " at ", timeController.getDate());
});
