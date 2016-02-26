express = require('express')
fs = require('fs')

app = express()
app.use(express.static('../dist'))
app.use('/assets', express.static(__dirname + '/dist/assets'));

app.get('/', (req, res)->

  index = fs.readFileSync('./dist/index.html', 'utf8')
  res.send(index)
)

server = app.listen(8080, -> 
  host = server.address().address
  port = server.address().port

  console.log('Example app listening at http://%s:%s', host, port)
)
