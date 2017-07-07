var gulp      = require('gulp')
var elm       = require('gulp-elm')
var gutil     = require('gulp-util')
var exec      = require('child_process').exec;
var webserver = require('gulp-webserver');
var del       = require('del');
var siteDir   = './site/';


function buildElmJs() {
  gutil.log('building Elm JS')
  return gulp.src(['src/*.elm', '!src/Styles.elm'])
    .pipe(elm())
    .pipe(gulp.dest('site/gen/js'))
    .on('end', function(){ gutil.log('Elm JS built')});
}

function buildElmCss(cb) {
  gutil.log('building Elm CSS')
  exec('elm-css src/Stylesheets.elm', function (err, stdout, stderr) {
    gutil.log(stdout);
    gutil.log(stderr);
    cb(err);
  })
}


gulp.task('elm-init', elm.init);

gulp.task('elm', ['elm-init'], function () {
  buildElmJs();
});

gulp.task('css', function (cb) {
  buildElmCss(cb);
});

gulp.task('build', ['elm-init', 'elm', 'css'], function() {});

gulp.task('serve', function () {
  gulp.src('./site/')
    .pipe(webserver({
      livereload: true,
      directoryListing: false,
      open: true,
    }));
});

gulp.task('clean', function () {
  return del('site/gen');
});
