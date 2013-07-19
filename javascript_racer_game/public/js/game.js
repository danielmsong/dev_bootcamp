(function (window) {
    function Game(player1, player2) {
        this.player1 = player1;
        this.player2 = player2;
        count = 0;
    }

    Game.prototype = {
        incrementCounter: function () {
            count++;
        },

        startTimers: function () {
            if (count === 1) {
                start = new Date();
            }
        },

        stopTimers: function () {
            end = new Date();
            race_time = (end - start) / 1000;
            return race_time;
        },

        declareWinner: function (player) {
            if (player === this.player1) {
                shoutOut = ", you're a Speedy Foxzales! ";
            } else if (player === this.player2) {
                shoutOut = " is a flying Squirrel! ";
            }
            $('.winner h2').text(player.initials() + shoutOut + race_time + ' seconds!');
            $('.winner').show();
        },

        saveToDB: function (player) {
            var data = {
                'time': race_time,
                'winner': player.initials()
            };
            alert(data["winner"]);
            $.post('/save_game', data);
        },

        movePlayer: function (player, key) {
            player.move(key);
            if (player.checkLocation(key) === "winner") {
                this.stopTimers();
                this.declareWinner(player);
                this.saveToDB(player);
            }
        },

        onKeyUp: function (key) {
            this.incrementCounter();
            this.startTimers();

            if (key === 80) {
                this.movePlayer(this.player1, key);

            } else if (key === 81) {
                this.movePlayer(this.player2, key);
            }
        }
    };

    window.Game = Game;

})(window);
