fs = require 'fs'

for file in fs.readdirSync(__dirname) when /\.json$/.test(file)
  data    = fs.readFileSync("./configs/#{file}", 'utf8')
  data    = data.replace /#\{(.+)\}/g, (match, text) -> eval(text)
  json    = JSON.parse(data)
  config  = _.extend {}, json.default, json[app.get('env')]

  app.set "#{file.replace('.json', '')}_config", config