

$(document).ready(function() {

  var save_to_db = function(data) {
    $.post('/save_game', data);
  };

  $('.winner').hide();
    var x = 0;

  $(document).on('keyup', function(event) {
    x ++;
    if (x === 1) {
      start = new Date();
    };

    if (event.which === 80) {
      var currentCol = $('#player_fox_strip .active_fox');

      currentCol.removeClass('active_fox');
      currentCol.next().addClass('active_fox');
      if (currentCol.next().attr('id') === "finish_line_fox") {
        $(document).unbind('keyup');
        var end = new Date();
        var race_time = (end - start) / 1000
        $('.winner h2').text('You win, Speedy Foxzales! ' + race_time + ' seconds!' );
        $('.winner').show();
        var data = { 'time': race_time, 'winner': player1_id };
        save_to_db(data);
      }
    }
    else if (event.which === 81) {
      var currentCol = $('#player_squirrel_strip .active_squirrel');

      currentCol.removeClass('active_squirrel');
      currentCol.next().addClass('active_squirrel');

      if (currentCol.next().attr('id') === "finish_line_squirrel") {
        $(document).unbind('keyup');
        var end = new Date();
        var race_time = (end - start) / 1000
        $('.winner h2').text('You win, flying Squirrel! ' + race_time + ' seconds! You so speeeeeedy!' );
        $('.winner').show();
        var data = { 'time': race_time, 'winner': player2_id };
        save_to_db(data);
      }
    }

  });
});



// q = 81
// p = 80


// {id: player.id}
