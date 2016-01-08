gulp = require('gulp')
coffee = require('gulp-coffee')
watch = require('gulp-watch')
gutil = require('gulp-util')
express = require('express')
path = require('path')


gulp.task('server', ->
  app = express()
  app.use(express.static(path.join(__dirname, 'dist')));
  app.listen(3000)
)

gulp.task('html', -> 
  gulp.src('./src/views/*.html')
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest('./dist/'))
)

gulp.task('coffee', -> 
  gulp.src('./src/coffee/*.coffee')
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest('./dist/js/'))
)

gulp.task('watch', -> 
    watch('./src/coffee/*.coffee', (events, done)->
        gulp.start('coffee', done)
    )
)
gulp.task('default', ['coffee', 'watch', 'server'])
