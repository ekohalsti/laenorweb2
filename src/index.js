'use strict';

// require index.html so it gets copied to dist
require('./index.html');
require('./styles/pure-min.css');
require('./styles/grids-responsive-min.css');
require('./styles/style.css');

// use the webpack elm loader to load elm code directly
var Elm = require('./Main.elm');

// find the root dom node we'll mount our app in
var mountNode = document.getElementById('layout');

// mount elm app
var app = Elm.Main.embed(mountNode);
