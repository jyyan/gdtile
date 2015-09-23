#!../bin/python
# coding: utf-8

import os
import os.path
import sys
from string import Template

# 簡易寫檔
def write_file(filename, content):
	f = open(filename, 'w')
	f.write(content)
	f.close()

# 簡易讀檔
def read_file(filename):
	f = open(filename, 'r')
	c = f.read()
	f.close()
	return c

# 重建暫存目錄
if os.path.isdir('build'):
	os.system('rm -rf build')
os.system('mkdir build')

# 產生每一個 style 的 mapnik configuration xml
themes = ['default', 'cycling']
tpl = Template(read_file('layers.mml'))
for t in themes:
	layers = tpl.substitute(theme=t)
	lyfile = 'build/%s.mml' % t
	write_file(lyfile, layers)
	cmd = '../bin/cascadenik-compile.py %s build/%s.xml' % (lyfile, t)
	ret = os.system(cmd)
	if ret!=0:
		print(u'無法產生 mapnik XML 設定檔')
		exit()

# 砍快取
#cmd = 'rm -rf /tmp/stache'
#os.system(cmd)

# 用 uwsgi 啟動 TileStache
if len(sys.argv)>=2 and sys.argv[1]=='nginx':	
	cmd = '../bin/uwsgi --ini uwsgi-nginx.ini'
else:
	cmd = '../bin/uwsgi --ini uwsgi-local.ini'

os.system(cmd)
