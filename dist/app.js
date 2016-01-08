var app, express, server;

express = require('express');

app = express();

app.get('/', function(req, res) {
  return res.send('Hello World!');
});

server = app.listen(3000, function() {
  var host, port;
  host = server.address().address;
  port = server.address().port;
  return console.log('Example app listening at http://%s:%s', host, port);
});
