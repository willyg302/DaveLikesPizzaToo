Parse = require 'Parse'
Phaser = require 'Phaser'

config = require './config.coffee'

class Preload extends Phaser.State
	constructor: -> super

	preload: ->
		# Show loading screen
		text = 'Loading...'
		style =
			font: '24px Acme'
			fill: 'white'
			align: 'center'
		t = @add.text @game.world.centerX, @game.world.centerY, text, style
		t.anchor.set 0.5

		@preloadBar = @add.sprite @game.world.centerX - 128, @game.world.centerY + 32, 'preloadBar'
		@load.setPreloadSprite @preloadBar

		# Initialize Parse
		Parse.initialize 'rGCUdAT8KpF4ZdJCR2QgVReggxqKIHmGyjEnSlsX', 'BvbgWQKlKDflqNtebL4WNA9PxSsRUksOyTxstTVP'

		# Load game assets
		@load.image name, "assets/img/#{ path }.png" for name, path of config.images
		@load.audio name, ["assets/snd/#{ path }.mp3", "assets/snd/#{ path }.ogg"] for name, path of config.sounds
		#@load.spritesheet name, sprite.path, sprite.x, sprite.y for name, sprite of config.sprites

	create: ->
		@state.start 'Menu'

module.exports = Preload
