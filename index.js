var express = require('express')
const app = express();

app.get('/', function(request, response) {
  response.writeHead(200, {'Content-Type': 'text/html'})
  response.end("ok")
})

app.get('/health/live', function(request, response) {
  response.writeHead(200, {'Content-Type': 'text/html'})
  response.end("live")
})

app.get('/health/ready', function(request, response) {
  response.writeHead(200, {'Content-Type': 'text/html'})
  response.end("ready")
})

app.listen(3088, () => {
    console.log(`Listening on port: 3088`);
});