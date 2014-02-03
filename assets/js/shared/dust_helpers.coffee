dust.helpers.page_title = (chunk, context, bodies, params) ->
  title = params.value
  params.suffix = switch params.suffix
    when 'false' then false
    else true

  title += shared_config.title_suffix if params.suffix

  if window?
    document.title = title
  else
    context.blocks[0]?.page_title = (chunk) -> chunk.write(title)

  return chunk