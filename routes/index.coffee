params = require('./params')
site = require('./site')
templates = require('./templates')
articles = require('./articles')

app.get '/templates/:templates', templates.read
app.get '/', site.index
app.use site.error
app.use site.not_found

app.get '/articles', articles.index
app.get '/articles/new', articles.new
app.get '/articles/:article_id', articles.show
app.delete '/articles/:article_id', articles.destroy
app.post '/articles', articles.create