#! /usr/bin/python
# -*- coding: utf-8 -*-

import get_ranking
import sys
sys.path.append('../../libs')
import get_db

dbcon, dbcur = get_db.get_db()
dbcur.execute('select * from users')
user_list = dbcur.fetchall()

# print user_list

for i in range(8):
    print 'user', i+1, ': '
    print get_ranking.get_ranking(user_list, i+1)

dbcur.close()
dbcon.close()
