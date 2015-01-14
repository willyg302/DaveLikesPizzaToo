var Phaser = require('Phaser');

var Boot = require('./boot');

(function() {
	var game = new Phaser.Game(960, 640, Phaser.AUTO, 'game-stage');
	game.state.add('Boot', Boot);
	game.state.start('Boot');
})();
