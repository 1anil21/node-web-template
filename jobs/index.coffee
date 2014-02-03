# Example job usage: NODE_ENV=production coffee jobs.coffee remove_db
console.log "All jobs started, #{new Date}"
argv = require('optimist').argv

# load job files
jobs = {}
for name in argv._
  jobs[name] = (done)->
    require("./#{name}")(done)
    console.log "Finished #{name}, #{new Date}"

# run jobs as parallel
async.parallel jobs, (err, results) ->
  console.log "All jobs finished, #{new Date}"
  process.exit(1)