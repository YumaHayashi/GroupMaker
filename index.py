#! /usr/bin/python
# -*- coding: utf-8 -*-

import sys
import os
sys.path.append('libs')
sys.path.append('app/model')
import utility

from bottle import route,post, static_file, run, template, static_file, view,request,Bottle,redirect

# from app.controllers import *
import get_db
import draw_graph
# import bottle_fbauth
# import secret as sc
# app = Bottle()
# plugin = bottle_fbauth.FBAuthPlugin(sc.FACEBOOK_APP_ID, FACEBOOK_APP_SECRET)
# app.install(plugin)

dbcon, dbcur = get_db.get_db()
max_student = 5

@route('/static/<filepath:path>')
def server_static(filepath):
	return static_file(filepath, root='./static/')

@route('/')
@view('index')
def index():
	return dict(author='unknown')

@route('/registry')
@view('registry')
def registry(author="unknown"):
	return dict(author=author)

@route('/showgroup')
@view('showgroup')
def showgroup():
	team_info = []
	total_team_number = 3
	for i in range(total_team_number):
		team_info.append(zip(utility.get_team_member(i, total_team_number), map(lambda x: x[1], utility.get_team_power(utility.get_team_member_id(i, total_team_number)))))
	return dict(team_info=team_info)

@post('/registry')
def submit():
	registry_list =[]
	query = "INSERT INTO users("
	item_list = ['name','sex','skl_direction','skl_presentation','skl_research','skl_contentsmaking','skl_ios','skl_android','skl_windows8','skl_html','skl_css','skl_javascript','skl_python','skl_ruby','skl_php','skl_java', 'skl_perl','skl_c','skl_cpp','skl_wordpress','pr_logical','pr_indoor','pr_aggressive']
	for item in item_list:
		registry_list.append(request.forms.get(item))
		if item != item_list[-1]:
			query += item +", "
		else:
			query += "%s) VALUES("%item
	for value in registry_list[:2]:
		query += "'%s'," %value
	for value in registry_list[2:-1]:
		query += "%s," %value
	query += "%s);" %registry_list[-1]
	dbcur.execute(query)
	dbcon.commit()
	query = "SELECT id from users WHERE name = '%s';"% registry_list[0]
	dbcur.execute(query)
	user_id = dbcur.fetchall() [0][0]
	return template( "d_select", id =user_id)

@post("/d_select")
def submit_d():
	user_id = request.forms.get("user_id")
	item_list =["skl_design","d_simple","d_pop","d_illust","d_cute","d_japanese","d_art","d_cool","d_natural","d_ellegant","d_retro"]
	query = "UPDATE users SET "
	for item in item_list:
		if request.forms.get(item):
			query += "%s = 1"%item
		else:
			query += "%s = 0"%item
		if item != item_list[-1]:
			query +=  ", "
		else:
			query += " WHERE id = %s;"%user_id
	dbcur.execute(query)
	dbcon.commit()
	redirect("/waiting")

@route("/waiting")
def waiting():
	query = "SELECT count(*) from users;"
	dbcur.execute(query)
	cnt = dbcur.fetchall()[0][0]
	if cnt > max_student:
		draw_graph.make_network(n_team=6)
		redirect("/showgroup")
	if cnt  < max_student:
		return template("waiting",cnt = cnt,max_student=max_student)


@route("/design")
@view("design")
def design():
	pass


if __name__ == '__main__':
	port = int(os.environ.get('PORT', 8080))
	run(host='localhost', port=port, debug=True, reloader=True)

	# ## in a case using gunicorn
	# app = default_app()
