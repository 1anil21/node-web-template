describe 'Article Model', ->
  it 'is valid with the factory', (done) ->
    data = factory.article()
    new Article(data).save (err, article) ->
      expect(err).to.be.null
      expect(article.title).to.equal data.title
      expect(article.content).to.equal data.content
      done()

  it 'is invalid without title', (done) ->
    data = factory.article(title: null)
    new Article(data).save (err, article) ->
      expect(err).to.be.exist
      done()