#!/bin/bash
# Lionel front-project starter
#author : lionel quellery 
#github: lionelquellery
#script use shell services

echo "Salut $USER Welcome in Front-starter " 
echo -e "Lionel install Shell: Nom du Projet"
read name
echo "project Name -> $name"


mkdir $name && cd $name

#js folder

mkdir js && cd js && mkdir app && mkdir dist && mkdir vendor &&  cd vendor && CURL -o vendor.js https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-beta1/jquery.js && cd ..


cd app && echo '$(document).ready(function() {

console.log(run your javascript);

});' > app.js

cd .. && cd .. 

# create assets folder and fonts folder

mkdir fonts && mkdir assets


#create stylesheets folder (compilated)





#script start gulp 


echo '<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>my project</title>
  <link rel="stylesheet" href="stylesheets/app.css">
</head>
<body>

  <h1>this file was generated with shell</h1>

  <script src="js/dist/vendor.js"></script>
  <script src="js/dist/app.js"></script>
</body>
</html>' > index.html



#creation of gulp file

echo "var gulp      = require('gulp');
var concat    = require('gulp-concat');
var sass      = require('gulp-sass');
var watch     = require('gulp-watch');
var plumber   = require('gulp-plumber');
var browserSync = require('browser-sync').create();
var reload      = browserSync.reload;




// Default build 
gulp.task('build', ['sass','js_app', 'js_libs','browser-sync']);

// Watch changments
gulp.task('default',['browser-sync'], function() {

  gulp.watch( 'js/app/*.js', ['js_app']).on('change', reload);

  gulp.watch( 'sass/**/*.scss', ['sass']).on('change', reload);

  gulp.watch( 'js/vendor/*.js', ['js_libs']).on('change', reload);

});

// App
gulp.task('js_app', function() {

  return gulp.src('js/app/*.js')
        .pipe(plumber({
          errorHandler: function (error) {
            console.log(error.message);
            this.emit('end');
        }}))
        .pipe(concat('app.js'))
        .pipe(gulp.dest('js/dist/'))

});

// Sass
gulp.task('sass', function()
{
  return gulp.src( 'sass/**/*.scss' )
        .pipe(plumber({
          errorHandler: function (error) {
            console.log(error.message);
            this.emit('end');
        }}))
        .pipe(sass({
          indentedSyntax: false
        }))
        .pipe(gulp.dest( 'stylesheets/' ))
});

// Vendors
gulp.task('js_libs', function() {

  return gulp.src('js/vendor/*.js')
        .pipe(plumber({
          errorHandler: function (error) {
            console.log(error.message);
            this.emit('end');
        }}))
        .pipe(concat('vendor.js'))
        .pipe(gulp.dest('js/dist/'))

});

gulp.task('browser-sync', function() {
    browserSync.init({
        server: {
            baseDir: './'
        }
    });
});" > gulpfile.js


mkdir stylesheets &&  mkdir sass && cd sass && echo "/* http://meyerweb.com/eric/tools/css/reset/ 
   v2.0 | 20110126
   License: none (public domain)
*/

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
  display: block;
}
body {
  line-height: 1;
}
ol, ul {
  list-style: none;
}
blockquote, q {
  quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
  content: '';
  content: none;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
}


/* apply a natural box layout model to all elements, but allowing components to change */
html {
  box-sizing: border-box;
}
*, *:before, *:after {
  box-sizing: inherit;
}" > _reset.scss


echo "// Reset import 
@import '_reset.scss';

// Views import
@import 'views/_main.scss';


" > app.scss

mkdir views && cd views && touch _main.scss


# remote from racine file 

cd .. && cd ..

#REMOTE where are you in directory path and seach the files 

# create package.json for npm dependencis

#init npm library and npm install

npm init && npm install bootstrap gulp gulp-concat gulp-plumber gulp-sass gulp-watch browser-sync --save


#create alias for most productivity , run the first build et run gulp for watching every files change 

alias gbg="gulp build && gulp" 

#alias for git add --all , git init , git status , git commit -m

alias ga="git add --all"
alias gi="git init"
alias gs="git status"
alias gc="git commit"
alias glg="git log"



# gulp start task with browsersnyc
gulp build && gulp













