/**
 * Created by ken on 15-8-22.
 */
var gulp = require('gulp');
var gutil = require('gulp-util');
var sourcemaps = require('gulp-sourcemaps');
var coffee = require('gulp-coffee');
var ts = require('gulp-typescript');
var jshint = require('gulp-jshint');

var srcDir = './src/main/javascript';
var testDir= './src/test/javascript';
var testBuild = true;
var targetDir = './lib/js';

//编译 CoffeeScript, TypeScript脚本, 复制 Javascript 脚本
gulp.task('compile',function(){
    gulp.src(testBuild?[srcDir + '/**/*.js',testDir + '/**/*.js']: srcDir + '/**/*.js')
        .pipe(gulp.dest(targetDir));
    gulp.src(testBuild?[srcDir + '/**/*.coffee',testDir + '/**/*.coffee']: srcDir + '/**/*.coffee')
        .pipe(coffee({ bare: true })).on('error', gutil.log)
        .pipe(gulp.dest(targetDir));
    gulp.src(testBuild?[srcDir + '/**/*.ts',testDir + '/**/*.ts']: srcDir + '/**/*.ts')
        .pipe(ts()).on('error', gutil.log)
        .pipe(gulp.dest(targetDir));
});

gulp.task('lint', function() {
    gulp.src(targetDir+ '/*.js')
        .pipe(jshint())
        .pipe(jshint.reporter('default'));
});

//默认任务
gulp.task('default', function() {
    gulp.run('compile');

    // 监听文件变化
    //gulp.watch(srcDir, function(){ gulp.run('scripts'); });
});