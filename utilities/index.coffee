fs = require('fs')

exports.walk_dir = (dir) ->
  results = []
  for file in fs.readdirSync(dir)
    file = "#{dir}/#{file}"
    stat = fs.statSync(file)
    switch
      when stat?.isDirectory() then results = results.concat(utils.walk_dir(file))
      else results.push(file)
  return results