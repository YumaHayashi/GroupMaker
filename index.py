#! /usr/bin/python
# -*- coding: utf-8 -*-

import sys
import os
sys.path.append('libs')
sys.path.append('app/model')
import utility

from bottle import route, post, static_file, run, template, static_file, view, request, Bottle
# from bottle import route, static_file, default_app
# from app.controllers import *
import get_db
# import bottle_fbauth
# import secret as sc
# app = Bottle()
# plugin = bottle_fbauth.FBAuthPlugin(sc.FACEBOOK_APP_ID, FACEBOOK_APP_SECRET)
# app.install(plugin)

dbcon, dbcur = get_db.get_db()

@route('/static/<filepath:path>')
def server_static(filepath):
	return static_file(filepath, root='./static/')

@route('/')
@view('landing')
def index():
	return dict(author='unknown')

@route('/registry')
@view('registry')
def registry(author="unknown"):
	return dict(author=author)

@route('/showgroup')
@view('showgroup')
def showgroup(author="unknown"):
	team_info = []
	total_team_number = 3
	for i in range(total_team_number):
		team_info.append(zip(utility.get_team_member(i, total_team_number), map(lambda x: x[1], utility.get_team_power(utility.get_team_member_id(i, total_team_number)))))
	return dict(team_info=team_info)

@post('/registry')
def submit():
	name = request.forms.get('name')
	query = "INSERT INTO users(name) VALUES('%s')" %name
	dbcur.execute(query)
	dbcon.commit()
	return template('select',name = name)

@route("/select")
def select():
	pass

if __name__ == '__main__':
	port = int(os.environ.get('PORT', 8080))
	run(host='localhost', port=port, debug=True, reloader=True)

	# ## in a case using gunicorn
	# app = default_app()
