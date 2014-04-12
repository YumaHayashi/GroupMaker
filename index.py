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
plugin = bottle_mysql.Plugin(dbuser='user', dbpass='pass', dbname='db')
app.install(plugin)


@route('/static/<filepath:path>')
def server_static(filepath):
	return static_file(filepath, root='./static/')

@route('/')
@view('landing')
def index():
	return dict(author='unknown')

@route('/registry')
@view('registry')
def resistry(author='unknown'):
	return dict(author=author)

@post('/registry')
def submit():
	name = request.forms.get('name')
	# db.excute("INSERT INTO users(name) VALUES('%s')",name)
	return template(select,name=name)

@route("/select")
def select(name):
	pass



if __name__ == '__main__':
	port = int(os.environ.get('PORT', 8080))
	run(host='localhost', port=port, debug=True, reloader=True)

	# ## in a case using gunicorn
	# app = default_app()
