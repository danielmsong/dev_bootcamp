(function(window) {
  function Player(initials) {
    var _initials = initials;
    this.initials = function(){return _initials;};
  }


  Player.prototype.move = function(key){
    this.currentCol = $('#player_'+key+'_strip .active_'+key);

    this.currentCol.removeClass('active_'+key);
    this.currentCol.next().addClass('active_'+key);
  };

  Player.prototype.checkLocation = function(key){
    if (this.currentCol.next().attr('id') === 'finish_line_'+key) {
      $(document).unbind('keyup');
      return "winner";
    }
  };


  window.Player = Player;


})(window);



