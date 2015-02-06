Phaser = require 'Phaser'

class Game extends Phaser.State
	constructor: -> super

	create: ->
		@world.setBounds 0, 0, 1920, 1920
		@background = @add.tileSprite 0, 0, @world.width, @world.height, 'space'

		# Player
		@player = @add.sprite @world.centerX, @world.centerY, 'playerShip'
		@player.scale.setTo 2
		@player.animations.add 'fly', [0, 1, 2, 3], 5, true
		@player.animations.play 'fly'

		@playerScore = 0

		# Physics
		@physics.arcade.enable @player
		@playerSpeed = 120
		@player.body.collideWorldBounds = true

		# Camera
		@camera.follow @player

		@generateCollectibles()
		@generateAsteroids()
		@showLabels()

		@explosionSound = @add.audio('explosion')
		@collectSound = @add.audio('collect')

	update: ->
		if @input.activePointer.justPressed()
			@physics.arcade.moveToPointer @player, @playerSpeed

		@physics.arcade.collide @player, @asteroids, @hitAsteroid, null, this
		@physics.arcade.overlap @player, @collectibles, @collect, null, this

	generateCollectibles: ->
		@collectibles = @add.group()
		@collectibles.enableBody = true
		@collectibles.physicsBodyType = Phaser.Physics.ARCADE

		num = @rnd.integerInRange 100, 150

		for i in [0..num] by 1
			collectible = @collectibles.create @world.randomX, @world.randomY, 'power'
			collectible.animations.add 'fly', [0, 1, 2, 3], 5, true
			collectible.animations.play 'fly'

	generateAsteroids: ->
		@asteroids = @add.group()
		@asteroids.enableBody = true
		@asteroids.physicsBodyType = Phaser.Physics.ARCADE

		num = @rnd.integerInRange 150, 200

		for i in [0..num] by 1
			asteroid = @asteroids.create @world.randomX, @world.randomY, 'rock'
			asteroid.scale.setTo @rnd.integerInRange(10, 40) / 10
			asteroid.body.velocity.x = @rnd.integerInRange -20, 20
			asteroid.body.velocity.y = @rnd.integerInRange -20, 20
			asteroid.body.immovable = true
			asteroid.body.collideWorldBounds = true

	hitAsteroid: (player, asteroid) ->
		@explosionSound.play()

		# Explode player
		emitter = @add.emitter @player.x, @player.y, 100
		emitter.makeParticles 'playerParticle'
		emitter.minParticleSpeed.setTo -200, -200
		emitter.maxParticleSpeed.setTo 200, 200
		emitter.gravity = 0
		emitter.start true, 1000, null, 100
		@player.destroy()

		@time.events.add 800, @gameOver, this

	gameOver: ->
		@state.start 'Menu', true, false, @playerScore

	collect: (player, collectible) ->
		@collectSound.play()

		@playerScore += 1
		@scoreLabel.text = @playerScore

		collectible.destroy()

	showLabels: ->
		text = '0'
		style =
			font: '20px Acme'
			fill: 'white'
			align: 'center'
		@scoreLabel = @add.text @game.width - 50, @game.height - 50, text, style
		@scoreLabel.fixedToCamera = true

module.exports = Game
