project = 'Dave Likes Pizza Too!'

def build():
	strap.run(test).node('gulp', module=True)

def test():
	pass

def install():
	strap.npm('install')

def default():
	strap.node('http-server dist', module=True)
