(($) ->
  $.fn.lazyLoad = ->
    @each ->
      el  = $(this)
      src = el.data('src')
      img = new Image()
      img.onload = -> el.attr('src', src)
      img.src = src
      el.removeAttr('data-src')
) jQuery