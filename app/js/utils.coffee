class Element
	mount: (stage) ->
		@defaults stage


class Gradient extends Element
	constructor: (@_start, @_stop) ->
	at: (@_x, @_y) -> @
	dimensions: (@_w, @_h) -> @

	defaults: (stage) ->
		@_x ?= 0
		@_y ?= 0
		@_w ?= stage.game.width
		@_h ?= stage.game.height

	mount: (stage) ->
		super
		bmp = stage.add.bitmapData @_w, @_h
		gradient = bmp.context.createLinearGradient 0, 0, 0, @_h
		gradient.addColorStop 0, @_start
		gradient.addColorStop 1, @_stop
		bmp.context.fillStyle = gradient
		bmp.context.fillRect 0, 0, @_w, @_h
		stage.add.sprite @_x, @_y, bmp
		@


class Text extends Element
	constructor: (@_string) ->
	size: (@_size) -> @
	at: (@_x, @_y) -> @
	color: (@_color) -> @
	align: (@_align) -> @

	defaults: (stage) ->
		@_size ?= 24
		@_x ?= 0
		@_y ?= 0
		@_color ?= 'white'
		@_align ?= 'left'

	mount: (stage) ->
		super
		style =
			font: "#{ @_size }px Acme"
			fill: @_color
			align: @_align
		t = stage.add.text @_x, @_y, @_string, style
		t.anchor.set {
			left: 0,
			center: 0.5,
			right: 1
		}[@_align]
		@


module.exports =
	Gradient: Gradient
	Text: Text

	music: (stage, name) ->
		song = stage.add.audio name
		song.play '', 0, 1, true  # Music is implicitly looped
