require('./bootstrap')
require('../elm/Stylesheets')
require('../../node_modules/slick-carousel/slick/slick.css')
require('../../node_modules/slick-carousel/slick/slick.js')

var $ = jQuery = require( '../../node_modules/jquery/dist/jquery.js' );           // <--- remove if jQuery not needed

// inject bundled Elm app into div#main
var Elm = require( '../elm/Main' );
var app = Elm.Main.embed( document.getElementById( 'main' ) );

app.ports.initCarousel.subscribe(function(className) {
  $(className).slick();
  console.log("did a slick: " + className);
  console.log($(className));
});
