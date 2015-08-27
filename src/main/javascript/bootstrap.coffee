System = require('es6-module-loader').System;

System
.import('./index')
.then (index) ->
  index.run(__dirname);
.catch((err) ->
  console.log('err', err);
)