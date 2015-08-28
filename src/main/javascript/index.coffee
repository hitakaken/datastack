os = require 'os'
jvm = (require './jvm').jvm()

jvm. callStaticMethodSync 'com.novbank.server.EmbeddedVertxServer', 'main', jvm.newArray("java.lang.String", []);

es = jvm.newInstanceSync 'com.novbank.server.EmbeddedElasticSearchServer'

console.log jvm.isJvmCreated()

process.stdin.resume()

exitHandler = (options, err)->
  es.shutdownSync()
  console.log 'elasticsearch stop'
  console.log 'clean' if options.cleanup
  console.log err.stack if err
  process.exit() if options.exit

process.on 'SIGINT', exitHandler.bind null,{cleanup:true, exit:true}

process.on 'exit', exitHandler.bind null, {exit:true}

process.on 'uncaughtException', exitHandler.bind null, {exit:true}