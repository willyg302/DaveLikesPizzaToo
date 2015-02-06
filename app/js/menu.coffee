Phaser = require 'Phaser'

utils = require './utils.coffee'

class Menu extends Phaser.State
	constructor: -> super

	create: ->
		utils.music this, 'menuMusic'
		new utils.Gradient('#72B9FF', '#B2FEFF').mount(@)

		# Overlay concrete
		@add.sprite 0, 0, 'concrete'

		logo = @add.sprite 150, 80, 'logo'
		#logo.scale.set 1.5, 4.0/3
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