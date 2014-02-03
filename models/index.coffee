global.mongoose = require('mongoose')

connect = ->
  mongoose.connect(app.get('mongo_config').url)
  console.log 'Connected Mongodb'

mongoose.connection.on 'error', (err) ->
  console.log(err)

mongoose.connection.on 'disconnected', ->
  connect()

connect()

# require all models
require(file) for file in utils.walk_dir(__dirname) when /coffee$/.test(file)