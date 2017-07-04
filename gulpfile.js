var gulp = require('gulp')
var elm  = require('gulp-elm')


function buildElmJs() {
  return gulp.src(['src/*.elm', '!src/Styles.elm'])
    .pipe(elm())
    .pipe(gulp.dest('site/gen/js'));
}

function buildElmCss() {
  
}


gulp.task('elm-init', elm.init)

gulp.task('elm', ['elm-init'], function () {
  buildElmJs()
})

gulp.task('build', ['elm-init'], function() {

})
