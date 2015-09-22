import os
from string import Template

'''
if [ ! -d build ]; then
	mkdir build
fi
'''

def write_file(filename, content):
	f = open(filename, 'w')
	f.write(content)
	f.close()

def read_file(filename):
	f = open(filename, 'r')
	c = f.read()
	f.close()
	return c


tpl = Template(read_file('layers.mml'))
themes = ['default', 'cycling']
for t in themes:
	layers = tpl.substitute(theme=t)
	lyfile = 'build/%s.mml' % t
	write_file(lyfile, layers)
	cmd = '../bin/cascadenik-compile.py %s build/%s.xml' % (lyfile, t)
	os.system(cmd)

cmd = 'rm -rf /tmp/stache'
os.system(cmd)

cmd = '../bin/uwsgi --http :10080 --wsgi-file gdtile.py'
os.system(cmd)