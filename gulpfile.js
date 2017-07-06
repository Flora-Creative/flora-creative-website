var gulp  = require('gulp')
var elm   = require('gulp-elm')
var gutil = require('gulp-util')


function buildElmJs() {
  gutil.log('building Elm JS')
  return gulp.src(['src/*.elm', '!src/Styles.elm'])
    .pipe(elm())
    .pipe(gulp.dest('site/gen/js'))
    .on('end', function(){ gutil.log('Elm JS built')});
}

function buildElmCss() {

}


gulp.task('elm-init', elm.init)

gulp.task('elm', ['elm-init'], function () {
  buildElmJs()
})

gulp.task('build', ['elm-init'], function() {
  var gen_js = buildElmJs()
})
