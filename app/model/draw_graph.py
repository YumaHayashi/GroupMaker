#! /usr/bin/python
# -*- coding: utf-8 -*-

import networkx
import make_group
import matplotlib.pyplot as plt


connection = make_group.get_user_connection()

G = networkx.Graph()
G.add_nodes_from(range(1,9))
# G.add_edges_from(map(lambda x: x[0], connection))
for pair, w in connection:
    G.add_edge(pair[0], pair[1], weight=w)

networkx.draw(G)
plt.show()
