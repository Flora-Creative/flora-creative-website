require('../elm/Stylesheets')
require('../../node_modules/slick-carousel/slick/slick.css')
require('../../node_modules/slick-carousel/slick/slick.js')

var $ = jQuery = require( '../../node_modules/jquery/dist/jquery.js' );           // <--- remove if jQuery not needed

// inject bundled Elm app into div#main
var Elm = require( '../elm/Main' );
var app = Elm.Main.embed( document.getElementById( 'main' ) );

app.ports.initCarousel.subscribe(function(className) {
  window.requestAnimationFrame(function () {
    $("."+className).slick({
      arrows: false,
      autoplay: true,
      focusOnSelect: true,
      autoplayspeed: 4000,
      centerMode: true,
      centerPadding: '0px',
      slidesToShow: 1,
      dots: true
    });
  });
});
