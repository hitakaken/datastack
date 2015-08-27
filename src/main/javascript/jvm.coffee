'use strict'

fs = require 'fs'
java = require 'java'

jarsDirectory = './lib/jars'
dependencies = fs.readdirSync(jarsDirectory);

console.log jarsDirectory

dependencies.forEach (dependency)->
  java.classpath.push jarsDirectory + '/' + dependency

java.classpath.push './target/classes';

module.exports.jvm = () -> java