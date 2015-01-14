var Boot = function(game) {};

Boot.prototype.preload = function() {
	this.load.image('logo', 'assets/img/phaser-logo.png');
};

Boot.prototype.create = function() {
	var logo = this.add.sprite(this.world.centerX, this.world.centerY, 'logo');
	logo.anchor.setTo(0.5, 0.5);
};

module.exports = Boot;
