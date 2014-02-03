exports.index = (req, res) ->
  Article.find {}, (err, articles) ->
    json = articles.map (article) ->
      article.as_json()

    res.format
      html: -> res.render('templates/articles/index', model: json)
      json: -> res.json(json)

exports.show = (req, res, next) ->
  res.format
    html: -> res.render('templates/articles/show', model: req.article.as_json())
    json: -> res.json(req.article.as_json())

exports.new = (req, res) ->
  res.render('templates/articles/new')

exports.create = (req, res, next) ->
  new Article(req.body).save (err, article) ->
    next(err) if err?.status = 404
    res.json(article.as_json())

exports.destroy = (req, res, next) ->
  req.article.remove (err) ->
    next(err) if err
    res.json({})