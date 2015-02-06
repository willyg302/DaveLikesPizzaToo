Phaser = require 'Phaser'

class Menu extends Phaser.State
	constructor: -> super

	create: ->
		@add.audio('menuMusic').play('', 0, 1, true)

		background = @add.tileSprite 0, 0, @game.width, @game.height, 'bg'
		background.scale.set 1.5, 4.0/3

		logo = @add.sprite 150, 80, 'logo'
		logo.scale.set 1.5, 4.0/3
		@add.tween logo
			.to {y: 100}
			.to {y: 80}
			.loop()
			.start()

	update: ->
		#if @input.activePointer.justPressed()
		#	@state.start 'Game'

module.exports = Menu




#Crafty.scene('Menu', function() {
#	
#	Crafty.audio.stop();
#	Crafty.audio.play('menumusic', -1);#

#	Crafty.e('DaveLogo').bob();#

#	var playTxt = Crafty.e('TxtLink').textFont({size: '36px'}).size(210, 50).at(5, 320).setup("playtxt", "Play");
#	var leaderTxt = Crafty.e('TxtLink').textFont({size: '36px'}).size(210, 50).at(215, 320).setup("leadertxt", "Leaderboards");
#	var creditsTxt = Crafty.e('TxtLink').textFont({size: '36px'}).size(210, 50).at(425, 320).setup("creditstxt", "Credits");#

#	Crafty.DrawManager.draw();
#	document.getElementById('playtxt').onclick = function() {
#		Crafty.scene('Game');
#	};
#	document.getElementById('leadertxt').onclick = function() {
#		Crafty.scene('Leaderboards');
#	};
#	document.getElementById('creditstxt').onclick = function() {
#		Crafty.scene('Credits');
#	};
#});