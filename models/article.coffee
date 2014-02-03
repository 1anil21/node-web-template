article_schema = mongoose.Schema
  title:
    type: String
    required: true
  content:
    type: String

article_schema.methods.as_json = ->
  id: @_id.toString()
  title: @title
  content: @content

global.Article = mongoose.model('Article', article_schema)