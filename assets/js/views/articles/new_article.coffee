class App.views.NewArticle extends App.View
  template: 'articles/new'
  view_name: 'NewArticle'
  dom_events:
    'click #create_button': 'create'

  create: ->
    title = @$('#title').val().trim()
    content = @$('#content').val()

    if title.length == 0
      return alert('Title is required field')

    article = new App.models.Article(title: title, content: content)
    article.save().done ->
      App.router.navigate("/articles/#{article.get('id')}", trigger: true)