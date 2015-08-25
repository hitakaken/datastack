straw = require 'straw';
module.exports = straw.node
  total: 0,
  opts: {topology: null, max: 10}
  initialize: (opts, done) ->
    @opts.max = opts && opts.max || 10
    done()
  process: (msg, done) ->
    @total++;
    console.log(this.total + " / " +@opts.max)
    @output
      count: @total,
      done


