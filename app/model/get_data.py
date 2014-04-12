#! /usr/bin/python
# -*- coding: utf-8 -*-

import sys
sys.path.append('../../libs')

import get_db
import numpy as np

class GetData(object):
    """
    MySQLからデータとってくるやつ
    """

    def __init__(self, user_list):
        """
        Arguments:
        - `user_list`: [(items of mysql for user1), (items of mysql for user1), ...]
        """
        self._user_list = user_list

    def get_user_skill_level(self, user_id):
        for user in self._user_list:
            if user[0] == user_id:
                return (user[0], np.array(user[20:34]))

    def get_others_skill_level(self, user_id):
        others_skill_data = []
        for user in self._user_list:
            if user[0] == user_id:
                continue
            others_skill_data.append((user[0], np.array(user[20:34])))
        return others_skill_data

    def get_user_skill_type(self, user_id):
        # [management, programming, design]
        for user in self._user_list:
            if user[0] == user_id:
                return (user[0], np.array([sum(user[5:9]), sum(user[20:34]), user[9]]))

    def get_others_skill_type(self, user_id):
        others_type_data = []
        for user in self._user_list:
            if user[0] == user_id:
                continue
            others_type_data.append((user[0], np.array([sum(user[5:9]), sum(user[20:34]), user[9]])))
        return others_type_data

    def get_user_design_favor(self, user_id):
        for user in self._user_list:
            if user[0] == user_id:
                return (user[0], np.array(user[10:20]))

    def get_others_design_favor(self, user_id):
        others_design_favor = []
        for user in self._user_list:
            if user[0] == user_id:
                continue
            others_design_favor.append((user[0], np.array(user[10:20])))
        return others_design_favor

    def get_user_character(self, user_id):
        for user in self._user_list:
            if user[0] == user_id:
                return (user[0], np.array(user[34:37]))

    def get_others_character(self, user_id):
        others_design_favor = []
        for user in self._user_list:
            if user[0] == user_id:
                continue
            others_design_favor.append((user[0], np.array(user[34:37])))
        return others_design_favor
