class Boot
	constructor: (@game) ->

	preload: ->
		@load.image 'logo', 'assets/img/phaser-logo.png'

	create: ->
		logo = @add.sprite @world.centerX, @world.centerY, 'logo'
		logo.anchor.setTo 0.5, 0.5

module.exports = Boot
