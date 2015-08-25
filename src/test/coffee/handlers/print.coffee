straw = require 'straw'

module.exports = straw.node
  process: (msg, done) ->
    console.log(JSON.stringify(msg));
    done(false);