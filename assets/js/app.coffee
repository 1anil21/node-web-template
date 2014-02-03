window.App =
  models:       {}
  collections:  {}
  views:        {}
  current:      []

  initialize: (opts={}) ->
    Backbone.history.start(pushState: true)

  remove_view: (view) ->
    @current = _(@current).reject (v) -> v.cid is view.cid
    return this

_(App).extend(Backbone.Events)
_(App).bindAll('remove_view')
App.router = new AppRouter

$window   = $(window)
$document = $(document)

on_scroll = _.throttle (e) ->
  height  = $window.height()
  scroll  = $window.scrollTop()
  offset  = ($document.height() - height) - scroll
  @$('img[data-src]:in-viewport').lazyLoad()
  App.trigger('app:scroll', e, offset)
, 10

$ ->
  App.initialize()
  $('img[data-src]:in-viewport').lazyLoad()
  $.ajaxSetup { cache: false }
  $window.on 'scroll', on_scroll