#! /usr/bin/python
# -*- coding: utf-8 -*-

import networkx
import make_group
import matplotlib.pyplot as plt
import sys
sys.path.append('../../libs')
import get_db

dbcon, dbcur = get_db.get_db()
dbcur.execute('select id,name from users')
user_list = dbcur.fetchall()

id_name_map = {k:v for k, v in user_list}

connection = make_group.get_user_connection()

G = networkx.Graph()
G.add_nodes_from(id_name_map.values())
# G.add_edges_from(map(lambda x: x[0], connection))
for pair, w in connection:
    G.add_edge(id_name_map[pair[0]], id_name_map[pair[1]], weight=w)

networkx.draw(G)
plt.show()
