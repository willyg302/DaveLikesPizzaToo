Phaser = require 'Phaser'

utils = require './utils.coffee'

class Menu extends Phaser.State
  constructor: -> super

  create: ->
    utils.music this, 'menuMusic'
    new utils.Gradient '#72B9FF', '#B2FEFF'
      .mount @

    # Overlay concrete
    concrete = @add.sprite 0, 0, 'concrete'
    concrete.alpha = 0
    @add.tween concrete
      .to {alpha: 1}, 500
      .start()

    #logo = @add.sprite 150, 80, 'logo'
    ##logo.scale.set 1.5, 4.0/3
    #@add.tween logo
      #.to {y: 100}
      #.to {y: 80}
      #.loop()
      #.start()

  update: ->
    #if @input.activePointer.justPressed()
    # @state.start 'Game'

module.exports = Menu
