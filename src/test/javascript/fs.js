/**
 * Created by hp on 2015/8/28.
 */
var fs = require('fs-extra');
var _ = require('highland');

var filenames = fs.readdirSync('./');
_(filenames).each(function(file){
    console.log(file);
    console.log(JSON.stringify(fs.lstatSync('./' + file)));
});
