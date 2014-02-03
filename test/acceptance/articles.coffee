describe 'Articles show', ->
  article = null

  # create a article and visit
  before (done) ->
    Article.create factory.article(), (err, data) =>
      article = data
      @browser.visit "/articles/#{article.id}", done

  it 'has h2 element and no other h2 element', (done) ->
    h2 = @browser.queryAll('h2')
    expect(h2).to.have.length(1)
    expect(h2[0].textContent).to.equal article.title
    done()

  it 'has article content', (done) ->
    content = @browser.queryAll('#article-content')
    expect(content).to.be.ok
    expect(content.length).to.equal 1
    done()