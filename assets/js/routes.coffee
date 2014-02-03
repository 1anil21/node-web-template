App.router.on 'route:before', (route, name) ->
  $('html,body').animate({scrollTop: 0}, 0)
  view.remove() for view in App.current

App.router.on 'route:home', ->
  new App.views.Home().render()

App.router.on 'route:articles', ->
  articles = new App.collections.Articles
  articles.fetch().always ->
    new App.views.Articles(collection: articles).render()

App.router.on 'route:articles:new', ->
  new App.views.NewArticle().render()

App.router.on 'route:articles:show', (id) ->
  article = new App.models.Article(id: id)
  article.fetch().done ->
    new App.views.Article(model: article).render()