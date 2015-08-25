straw = require 'straw'

module.exports = straw.node
  timer: null,
  opts: {interval: 1000},
  initialize: (opts, done) ->
    this.opts.interval = opts && opts.interval || 1000;
    done();
  start: (done) ->
    this.timer = setInterval(this.ping.bind(this), this.opts.interval);
    done(false);
  stop: (done) ->
    clearInterval(this.timer);
    done(false);
  ping: ->
    this.output
      'ping': new Date().getTime();