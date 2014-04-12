#! /usr/bin/python
# -*- coding: utf-8 -*-

import sys
import os
sys.path.append('libs')

from bottle import route, static_file, run, template, static_file, view
# from bottle import route, static_file, default_app
# from app.controllers import *

# ====================================
#  adding static path
# ====================================
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

@route('/registry')
@view('registry')
def test(author='unknown'):
	return dict(author=author)

# operate with only bottle

if __name__ == '__main__':
	port = int(os.environ.get('PORT', 8080))
	run(host='localhost', port=port, debug=True, reloader=True)

	# ## in a case using gunicorn
	# app = default_app()
