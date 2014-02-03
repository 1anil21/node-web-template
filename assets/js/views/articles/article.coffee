class App.views.Article extends App.View
  template: 'articles/show'
  view_name: 'Article'
  dom_events:
    'click #destroy_article': 'destroy'

  destroy: ->
    return unless confirm('Are you sure?')
    @model.destroy success: ->
      App.router.navigate('/articles', trigger: true)