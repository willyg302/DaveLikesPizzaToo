Parse = require 'Parse'
Phaser = require 'Phaser'

config = require './config.coffee'
utils = require './utils.coffee'

class Preload extends Phaser.State
	constructor: -> super

	preload: ->
		# Show loading screen
		new utils.Gradient('#72B9FF', '#B2FEFF').mount(@)
		new utils.Text('Loading...').size(40).at(@game.world.centerX, @game.world.centerY).align('center').mount(@)
		@preloadBar = @add.sprite @game.world.centerX - 128, @game.world.centerY + 32, 'preloadBar'
		@load.setPreloadSprite @preloadBar

		# Initialize Parse
		Parse.initialize 'rGCUdAT8KpF4ZdJCR2QgVReggxqKIHmGyjEnSlsX', 'BvbgWQKlKDflqNtebL4WNA9PxSsRUksOyTxstTVP'

		# Set up game defaults
		@stage.backgroundColor = 'black'
		@physics.startSystem Phaser.Physics.ARCADE

		# Load game assets
		@load.pack 'main', config.pack

	create: ->
		@state.start 'Menu'

module.exports = Preload
