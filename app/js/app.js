var Phaser = require('Phaser');

window.onload = function() {
	var game = new Phaser.Game(960, 640, Phaser.AUTO, 'game-stage', {preload: preload, create: create});

	function preload() {
		game.load.image('logo', 'assets/img/phaser-logo.png');
	}

	function create() {
		var logo = game.add.sprite(game.world.centerX, game.world.centerY, 'logo');
		logo.anchor.setTo(0.5, 0.5);
	}
};
