class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    const $listItems = $('li');
    $listItems.on('click', event => {
      let data = $(event.target).attr("data");
      let data2 = data.split(',').map((el) => parseInt(el));
      this.makeMove(event.target);
      this.game.playMove(data2);
      }
      );
    }

  makeMove($square) {
    let target = $($square);
    let symbol = this.game.currentPlayer;
    let isOver = this.game.isOver();

    if (isOver) {
      $('li').off('click');
      $('li').removeClass('square');
      console.warn(this.game.winner());
    }

    if (symbol === 'x') {
      target.css('background-color',"red");
    } else if (symbol === 'o') {
      target.css('background-color',"blue");
    }
    target.append(symbol);
    console.warn(this.game.isOver());
  }

  setupBoard() {
    let a = $('<ul><ul>');

    for (var j = 0; j < 3; j++) {
      for (var k = 0; k < 3; k++) {

        a.append($(`<li class='square' data=${[j,k]}></li>`));
      }
    }

    $('figure.ttt').append(a);

  }
}

module.exports = View;
