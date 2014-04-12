#! /usr/bin/python
# -*- coding: utf-8 -*-

import sys
import os
sys.path.append('libs')


from bottle import route,post, static_file, run, template, static_file, view,request,Bottle
# from bottle import route, static_file, default_app
# from app.controllers import *
import bottle_mysql

app = Bottle()
# dbhost is optional, default is localhost
plugin = bottle_mysql.Plugin(dbuser='ai', dbpass='miyuki', dbname='groupmaker')
app.install(plugin)

# ====================================
#  adding static path
# ====================================
@route('/static/<filepath:path>')
def server_static(filepath):
	return static_file(filepath, root='./static/')

@route('/')
@view('landing')
def index():
	return dict(author='unknown')

@route('/registry',method ="POST")
@view('registry')
def resistry(author='unknown'):
	return dict(author=author)

@post('/registry')
def submit(db):
	name = request.forms.get('name')
	db.excute("INSERT INTO users(name) VALUES('%s')"%name)


if __name__ == '__main__':
	port = int(os.environ.get('PORT', 8080))
	run(host='localhost', port=port, debug=True, reloader=True)

	# ## in a case using gunicorn
	# app = default_app()
