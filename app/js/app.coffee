Phaser = require 'Phaser'

Boot = require './boot.coffee'

game = new Phaser.Game 960, 640, Phaser.AUTO, 'game-stage'
game.state.add 'Boot', Boot
game.state.start 'Boot'
