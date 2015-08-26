'use strict'

fs = require 'fs'
java = require 'java'

jarsDirectory = __dirname + '/lib/jars'
dependencies = fs.readdirSync(jarsDirectory);

console.log jarsDirectory

dependencies.forEach (dependency)->
  java.classpath.push jarsDirectory + '/' + dependency

java.classpath.push __dirname + '/target/classes';

module.exports.jvm = () -> java