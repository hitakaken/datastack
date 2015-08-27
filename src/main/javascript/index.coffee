os = require 'os'
jvm = (require './jvm').jvm()

jvm. callStaticMethodSync 'com.novbank.server.EmbeddedVertxServer', 'main', jvm.newArray("java.lang.String", []);

console.log jvm.isJvmCreated()

process.stdin.resume()
