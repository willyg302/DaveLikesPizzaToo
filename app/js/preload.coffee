Parse = require 'Parse'
Phaser = require 'Phaser'

config = require './config.coffee'
utils = require './utils.coffee'

class Preload extends Phaser.State
  constructor: -> super

  preload: ->
    # Show loading screen
    new utils.Gradient '#72B9FF', '#B2FEFF'
      .mount @
    new utils.Text 'Loading...'
      .size 64
      .at @game.world.centerX, @game.world.centerY - 48
      .align 'center'
      .mount @
    @load.setPreloadSprite @add.sprite @game.world.centerX - 160, @game.world.centerY, 'preloadBar'

    # Initialize Parse
    Parse.initialize 'rGCUdAT8KpF4ZdJCR2QgVReggxqKIHmGyjEnSlsX', 'BvbgWQKlKDflqNtebL4WNA9PxSsRUksOyTxstTVP'
    Parse.Analytics.track 'load', {
      language: window.navigator.language,
      platform: window.navigator.platform
    }

    # Set up game defaults
    @stage.backgroundColor = 'black'
    @physics.startSystem Phaser.Physics.ARCADE

    # Load game assets
    @load.pack 'main', config.pack

  create: ->
    @state.start 'Menu'

module.exports = Preload
