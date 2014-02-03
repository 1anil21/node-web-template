require('../app')

# remove db
before (done) ->
  mongoose.connection.on 'open', -> mongoose.connection.db.dropDatabase(done)

# create browser
before ->
  @browser = new browser