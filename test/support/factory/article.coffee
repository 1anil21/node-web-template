module.exports = (article={}) ->
  _(article).defaults
    title: faker.Lorem.sentence()
    content: faker.Lorem.paragraphs()