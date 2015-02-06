Phaser = require 'Phaser'

config = require './config.coffee'

class Boot extends Phaser.State
	constructor: -> super

	preload: ->
		# Load all assets needed for preload
		@load.image name, path for name, path of config.preload

	create: ->
		@stage.backgroundColor = 'black'
		@physics.startSystem Phaser.Physics.ARCADE
		@state.start 'Preload'

module.exports = Boot
