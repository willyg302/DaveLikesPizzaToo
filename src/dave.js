var Dave = {};


/**
 * Responsible for booting only those assets needed for the loading screen.
 */
Dave.Boot = function(game) {
	this.game = game;
};

Dave.Boot.prototype = {
	preload: function() {
		console.log("In Boot state!");
		this.load.image('loaderFull', 'assets/UI/loaderFull.png');
		this.load.image('loaderEmpty', 'assets/UI/loaderEmpty.png');
	},
	create: function() {
		this.game.state.start('preloader');
	},
};


/**
 * Responsible for loading all assets and showing a quick loading screen while doing so.
 */
Dave.Preloader = function(game) {
	this.game = game;
};

Dave.Preloader.prototype = {
	loaderEmpty: Phaser.Sprite,

	preload: function() {
		console.log("In Preloader state!");
		// Load all our assets
		this.load.image('background', 'assets/bg.png');

		this.load.image('logo', 'assets/dave-logo.png');

		this.load.spritesheet('dave', 'assets/dave-sprite.png', 64, 64);
		this.load.spritesheet('button', 'assets/sprite.png', 32, 32);
		this.load.audio('wah-game-loop', ['assets/wah_game_loop.mp3', 'assets/wah_game_loop.ogg']);
		this.load.audio('funk-game-loop', ['assets/funk_game_loop.mp3', 'assets/funk_game_loop.ogg']);

		// Manage our loading bar
		this.loaderEmpty = this.add.sprite(this.game.world.centerX, 285, 'loaderEmpty');
		this.preloadBar = this.add.sprite(this.loaderEmpty.x - this.loaderEmpty.width/2, 285, 'loaderFull');
		this.loaderEmpty.anchor.setTo(0.5, 0);
		this.load.setPreloadSprite(this.preloadBar);
	},
	create: function() {
		this.game.state.start('mainMenu');
	},
};


/**
 * Main menu.
 */
Dave.MainMenu = function(game) {
	this.game = game;
};

Dave.MainMenu.prototype = {

	create: function() {
		var bg = this.add.sprite(game.world.centerX, game.world.centerY, 'background');
		bg.anchor.setTo(0.5, 0.5);

		music = this.add.audio('wah-game-loop', 1, true);
		music.play('', 0, 1, true); // loop it!


		var logo = game.add.sprite(100, 60, 'logo');
		var logo_tween = game.add.tween(logo).to({y: 80}, 1000, Phaser.Easing.Linear.None).to({y: 60}, 1000, Phaser.Easing.Linear.None).loop().start();
	},
};


/**
 * Our main game.
 */
Dave.Game = function(game) {
	this.game = game;
};

Dave.Game.prototype = {
	//
};


var game = new Phaser.Game(640, 480, Phaser.AUTO, 'game-stage');

// Add our various states to the game
game.state.add('boot', Dave.Boot, true); // Start this one automatically
game.state.add('preloader', Dave.Preloader);
game.state.add('mainMenu', Dave.MainMenu);
game.state.add('game', Dave.Game);



/*
var music;

var score_txt;
var score;

var timer_txt;
var timer;

var pause_button;


function create () {
	var bg = game.add.sprite(game.world.centerX, game.world.centerY, 'background');
	bg.anchor.setTo(0.5, 0.5);

	platforms = game.add.group();
	var ground = platforms.create(0, game.world.height - 80);
	ground.scale.setTo(20, 2.5);
	ground.body.immovable = true;


	player = game.add.sprite(288, game.world.height - 200, 'dave');

	//  Player physics properties. Give the little guy a slight bounce.
	player.body.bounce.y = 0.2;
	player.body.gravity.y = 10;
	player.body.collideWorldBounds = true;

	//  Our two animations, walking left and right.
	player.animations.add('left', [10, 11, 12, 13, 14], 30, true);
	player.animations.add('right', [5, 6, 7, 8, 9], 30, true);

	cursors = game.input.keyboard.createCursorKeys();

	music = game.add.audio('funk-game-loop', 1, true);
	music.play('', 0, 1, true); // loop it!




	score = 0;

	score_txt = game.add.text(8, 5, "Score: 0", {
		font: "24px Acme",
		fill: "#ffffff",
		align: "left"
	});

	timer = "2:00.00";
	timer_txt = game.add.text(512, 5, "2:00.00", {
		font: "24px Acme",
		fill: "#ffffff",
		align: "right"
	});


	pause_button = game.add.button(600, 8, 'button', onPause, this, 1, 0, 2);
}

function update () {
	
	game.physics.collide(player, platforms);

	player.body.velocity.x = 0;

	if (cursors.left.isDown)
	{
		//  Move to the left
		player.body.velocity.x = -250;

		player.animations.play('left');
	}
	else if (cursors.right.isDown)
	{
		//  Move to the right
		player.body.velocity.x = 250;

		player.animations.play('right');
	}
	else
	{
		//  Stand still
		player.animations.stop();


		player.frame = 0;
	}

	//  Allow the player to jump if they are touching the ground.
	if (cursors.up.isDown && player.body.touching.down)
	{
		player.body.velocity.y = -250;
	}
}

function render() {
	//
}

function onPause() {
	game.paused = true;
}*/