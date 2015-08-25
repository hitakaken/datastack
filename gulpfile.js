/**
 * Created by ken on 15-8-22.
 */
var gulp = require('gulp');
var gutil = require('gulp-util');
var coffee = require('gulp-coffee');
var sourcemaps = require('gulp-sourcemaps');

gulp.task('default', function() {
    gulp.src([
        './src/main/coffee/**/*.coffee',
        './src/test/coffee/**/*.coffee'])
        //.pipe(sourcemaps.init())
        .pipe(coffee({ bare: true })).on('error', gutil.log)
        //.pipe(sourcemaps.write('./maps'))
        .pipe(gulp.dest('./lib/js'));
});