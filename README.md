# Dave Likes Pizza Too!

This game is still in development. In the meantime, you can check out its [predecessor](http://willyg302.github.io/Dave-Likes-Pizza/).

## Developing

### Quick Start

1. Install [ok](https://github.com/willyg302/ok)

2. Grab *Dave Likes Pizza Too!*, build it, and start the development server

   ```bash
   ok init gh:willyg302/DaveLikesPizzaToo
   cd DaveLikesPizzaToo/
   ok run build
   ok
   ```

You should now be able to visit `http://localhost:8080/` in your favorite browser to play the game.

### Baking Assets

Wherever possible, raw assets for the game have been stored in `raw/` (e.g. SVG files that are compiled into PNG images). If an asset ever changes, it should be baked into the game again by calling `ok run bake`. This process assumes several tools are installed on your system and available on the command line:

- [Inkscape](https://inkscape.org/en/)

## Credits

- Powered by [Phaser](https://github.com/photonstorm/phaser) and [Parse](https://parse.com/)
