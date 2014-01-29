express = require('express')
routes = require('./routes/web')
connect = require('connect')
http = require('http')
path = require('path')

app = express()

app.set('port', process.env.PORT || 5445)
app.set('views', path.join(__dirname, 'views'))

app.set('view engine', 'jade')
app.use(connect.compress())
app.use(express.logger('dev'))
app.use(express.json())
app.use(express.urlencoded())
app.use(express.methodOverride())
app.use(app.router)
app.use(express.static(path.join(__dirname, 'public')))

if ('development' == app.get('env'))
  app.use(express.errorHandler())



app.get('/', routes.index)

http.createServer(app).listen app.get('port'), ()->
  console.log('node-dna has started on ' + app.get('port'))
