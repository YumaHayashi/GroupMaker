#! /usr/bin/python
# -*- coding: utf-8 -*-

import sys
import os
sys.path.append('libs')


from bottle import route,post, static_file, run, template, static_file, view,request,Bottle,redirect
# from bottle import route, static_file, default_app
# from app.controllers import *
import get_db
# import bottle_fbauth
# import secret as sc
# app = Bottle()
# plugin = bottle_fbauth.FBAuthPlugin(sc.FACEBOOK_APP_ID, FACEBOOK_APP_SECRET)
# app.install(plugin)

dbcon,dbcur = get_db.get_db()

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

@post('/registry')
def submit():
	registry_list =[]
	query = "INSERT INTO users("
	item_list = ['name','sex','skl_direction','skl_presentation','skl_research','skl_contentsmaking','skl_ios','skl_android','skl_windows8','skl_html','skl_css','skl_javascript','skl_python','skl_ruby','skl_php','skl_java', 'skl_perl','skl_c','skl_cpp','skl_wordpress','skl_motivation']
	for item in item_list:
		registry_list.append(request.forms.get(item))
		if item != 'skl_motivation':
			query += item +", "
		else:
			query += "%s) VALUES("%item
	for value in registry_list[:-1]:
		query += "'%s'," %value
	query += "'%s');" %registry_list[-1]
	dbcur.execute(query)
	dbcon.commit()
	path = '/design/'+registry_list[0]
	redirect(path)

@route("/design/<name>")
# @view("design")
def design(name):
	return name

# @route("/evaluate")
# @view()


if __name__ == '__main__':
	port = int(os.environ.get('PORT', 8080))
	run(host='localhost', port=port, debug=True, reloader=True)

	# ## in a case using gunicorn
	# app = default_app()
