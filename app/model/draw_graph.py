#! /usr/bin/python
# -*- coding: utf-8 -*-

import networkx
import make_group
import matplotlib.pyplot as plt
import sys
sys.path.append('../../libs')
import get_db
import utility


dbcon, dbcur = get_db.get_db()
dbcur.execute('select id,name from users')
user_list = dbcur.fetchall()

id_name_map = {k:v for k, v in user_list}

color_d={0:{"r":255,"g":0,"b":0},
	1:{"r":255,"g":128,"b":0},
	2:{"r":255,"g":255,"b":0},
	3:{"r":0,"g":153,"b":0},
	4:{"r":0,"g":0,"b":255},
	5:{"r":0,"g":0,"b":204},
	6:{"r":102,"g":0,"b":204}}

conn = make_group.get_user_connection()

def get_all(n_team):
	user_st={}
	team_li={}
	user_skl = {u:li for u ,li in utility.get_team_power(id_name_map.keys())}
	for user in id_name_map.keys():
 		user_st[user] ={"skill":sum(user_skl[user]),"name":id_name_map[user]} 
 	for i in range(n_team):
 		for u in utility.get_team_member_id(i,n_team):
 			user_st[u]["team"] = i
	return user_st


def make_network(n_team=4,limit_weight=8):
	user_d = get_all(n_team)
	G = networkx.Graph()
	for u,d in user_d.items():
		G.add_node(d["name"])
		color = color_d[d["team"]]
		G.node[d["name"]]["viz"] = {"size":d["skill"],"color":{"r":color["r"],"g":color["g"],"b":color["b"]}}
	for t in conn:
		if t[1] < limit_weight:
			continue
		G.add_edge(user_d[t[0][0]]["name"],user_d[t[0][1]]["name"],{"weight":t[1]})
	pos=networkx.spring_layout(G)
	for n in pos.keys():
		G.node[n]["viz"]["position"]={"x":pos[n][0],"y":pos[n][1]}
	networkx.write_gexf(G, "/Users/yuya/projects/GroupMaker/static/output/output.gexf")

if __name__ == "__main__":
	make_network(3,5)