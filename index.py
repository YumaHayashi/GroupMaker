#! /usr/bin/python
# -*- coding: utf-8 -*-

import sys
import os
sys.path.append('libs')

from bottle import route, static_file, run, template, static_file, view,Bottle
import bottle_mysql
# from bottle import route, static_file, default_app
# from app.controllers import *

# ====================================
#  adding static path
# ====================================

app = Bottle()
# dbhost is optional, default is localhost
plugin = bottle_mysql.Plugin(dbuser='ai', dbpass='miyuki', dbname='groupmaker')
app.install(plugin)


@route('/static/<filepath:path>')
def server_static(filepath):
	return static_file(filepath, root='./static/')

# # # # # # # # # # test # # # # # # # # # #

# index_html = '''my first web app! By {{ author }}'''

# @route('/<name>')
# def something(name=''):
#     return template(index_html, author=name)

# @route('/')
# def index():
#     return template(index_html, author='your name here')

@route('/')
@view('landing')
def index():
	return dict(author='unknown')

@route('/registry',method ="POST")
@view('registry')
def resistry(author='unknown'):
	return dict(author=author)



# operate with only bottle

if __name__ == '__main__':
	port = int(os.environ.get('PORT', 8080))
	run(host='localhost', port=port, debug=True, reloader=True)

	# ## in a case using gunicorn
	# app = default_app()
