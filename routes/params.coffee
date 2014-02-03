app.param ':article_id', (req, res, next, id) ->
  Article.findById id, (err, article) ->
    return next(err) if err?.status = 404
    req.article = article
    next()