describe 'API: Articles: index', ->
  articles = []

  before (done) ->
    # remove all documents
    Article.collection.drop()

    # add 3 document
    Article.create [factory.article(), factory.article(), factory.article()], (err, article1, article2, article3) ->
      articles.push(article1.as_json(), article2.as_json(), article3.as_json())
      done()

  it 'returns all articles', (done) ->
    api.get '/articles', (err, res, body) ->
      expect(body.length).to.equal 3
      expect(body).to.eql articles
      done()


describe 'API: Articles: create', ->
  it 'creates article correctly', (done) ->
    data = factory.article()
    api.post '/articles', data, (err, res, body) ->
      expect(res.statusCode).to.equal 200
      expect(body.id).to.be.exist
      expect(body.title).to.equal data.title
      expect(body.content).to.equal data.content
      done()


describe 'API: Articles: show', ->
  article = null
  before (done) ->
    Article.create factory.article(), (err, data) ->
      article = data
      done()

  it 'returns the data correctly', (done) ->
    api.get "/articles/#{article.id}", (err, res, body) ->
      expect(res.statusCode).to.equal 200
      expect(body.title).to.equal article.title
      expect(body.content).to.equal article.content
      done()


describe 'API: Articles: destroy', ->
  article = null
  before (done) ->
    Article.create factory.article(), (err, data) ->
      article = data
      done()

  it 'deletes the article correctly', (done) ->
    api.delete "/articles/#{article.id}", (err, res, body) ->
      expect(res.statusCode).to.equal 200

      # check it was deleted
      Article.findById article.id, (err, article) ->
        expect(article).to.be.null
        done()