project = 'Dave Likes Pizza Too!'

def build():
	ok.run(test).node('gulp', module=True)

def test():
	pass

def install():
	ok.npm('install')

def default():
	ok.node('http-server dist', module=True)
