const View = require('./ttt-view.js');
const Game = require('./game.js');


$( () => {
  let $container = $('figure.ttt');
  let game = new Game();

  new View(game, $container);

  
});
