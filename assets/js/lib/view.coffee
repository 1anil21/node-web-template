class App.View extends Backbone.View

  events: ->
    _.extend {}, @dom_events

  stop_propagation: (e) ->
    e.stopPropagation() unless e.should_continue

  continue_propagation: (e) ->
    e.should_continue = true

  in_view: ->
    $.contains(document.documentElement, @$el[0])

  append: ->
    @$el.appendTo(@append_to or $('[role=main]')) unless @in_view()
    @$('img[data-src]:in-viewport').lazyLoad()
    for child in @$('[data-view]')
      el = $(child)
      new App.views[el.data('view')](el: el).trigger('view:init')
    @trigger('view:render')

  remove: ->
    @trigger('view:remove')
    @stopListening()
    App.remove_view(this)
    $('body').removeClass('noscroll') if @noscroll
    super()

  render: (@append_to) ->
    App.current.push(this)
    _el = $("[data-view=#{@view_name}]") if @view_name?
    @setElement(_el) if _el?.length
    return @append() if @in_view() and @$el?.html()?.length
    json = (@model or @collection)?.toJSON() or {}
    dust.render "templates/#{@template or @id or @view_name.toLowerCase()}", model: json, (err, out) =>
      @setElement(out)
      @append()
    return this