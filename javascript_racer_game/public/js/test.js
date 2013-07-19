$(document).ready(function() {
  var player1 = new Player(squirrel_id, 81);
  var player2 = new Player(fox_id, 80);

  var game = new Game(player1, player2);

  $(document).on('keyup', function(event) {
    game.onKeyUp(event.which);

  });
});
