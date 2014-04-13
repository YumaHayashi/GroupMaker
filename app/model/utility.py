#! /usr/bin/python
# -*- coding: utf-8 -*-

import sys
sys.path.append('../../libs')

import get_db
import make_group
from get_data import GetData

def get_team_member(target_team_number, total_team_number):

    dbcon, dbcur = get_db.get_db()

    group = make_group.get_final_group(total_team_number)[target_team_number]
    name_list = []
    for member in group:
        dbcur.execute("select name from users where id = '%d'" %member)
        name_list.append(dbcur.fetchone()[0])
    dbcur.close()
    dbcon.close()

    return name_list

def get_team_member_id(target_team_number, total_team_number):
    return make_group.get_final_group(total_team_number)[target_team_number]

def get_team_power(group_members):
    # group_members: list of user id
    dbcon, dbcur = get_db.get_db()
    dbcur.execute('select * from users')
    user_list = dbcur.fetchall()
    dbcur.close()
    dbcon.close()

    gd = GetData(user_list)

    user_skils = []
    for member in group_members:
        user_skils.append(gd.get_user_skill_type(member))
    return user_skils

