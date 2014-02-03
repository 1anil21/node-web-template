exports.index = (req, res) ->
  res.render 'templates/home'

exports.error = (err, req, res, next) ->
  res.format
    html: -> res.status(err.status or 500).render("errors/error", {url: req.url, status_code: (err.status or res.statusCode), err: err})
    json: -> res.json(err.status or 500, {url: req.url, error: err.message})

exports.not_found = (req, res, next) ->
  exports.error({ status: 404 }, req, res, next)