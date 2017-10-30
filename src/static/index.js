require('./bootstrap')
require('../elm/Stylesheets')

var $ = jQuery = require( '../../node_modules/jquery/dist/jquery.js' );           // <--- remove if jQuery not needed

// inject bundled Elm app into div#main
var Elm = require( '../elm/Main' );
Elm.Main.embed( document.getElementById( 'main' ) );
