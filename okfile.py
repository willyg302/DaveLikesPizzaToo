project = 'Dave Likes Pizza Too!'

def bake():
	'''Bake raw assets'''
	with ok.root('raw'):
		ok.make()

def build():
	ok.run(test).node('gulp', module=True)

def test():
	ok.node('gulp lint', module=True)

def install():
	ok.npm('install')

def default():
	ok.node('http-server dist', module=True)
