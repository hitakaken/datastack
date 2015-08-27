straw = require 'straw';

opts =
  nodes_dir: __dirname + '/handlers'

topo = straw.create(opts);

topo.add [
    id: 'ping'
    node: 'ping'
    output: 'ping-out'
  ,
    id: 'count'
    node: 'count'
    input: 'ping-out'
    output: 'count-out'
    max: 5
  ,
    id: 'print',
    node: 'print',
    input: 'count-out'
  ], ->
    topo.start({purge: true});

process.on 'SIGINT', ->
  topo.destroy ->
    console.log 'Finished.'