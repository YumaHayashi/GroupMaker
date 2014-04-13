#! /usr/bin/python
# -*- coding: utf-8 -*-

from get_data import GetData
from calc import Calc

def get_ranking(user_list, user_id):
    """
    ユーザidだけ渡して，おすすめユーザのidランキングを返す
    """

    gd = GetData(user_list)
    cl = Calc()

    rank1 = cl.make_skill_level_ranking(gd.get_user_skill_level(user_id), gd.get_others_skill_level(user_id))

    rank2 = cl.make_skill_type_ranking(gd.get_user_skill_type(user_id), gd.get_others_skill_type(user_id))

    rank3 = cl.make_design_favorite_ranking(gd.get_user_design_favor(user_id), gd.get_others_design_favor(user_id))

    rank4 = cl.make_character_ranking(gd.get_user_character(user_id), gd.get_others_character(user_id))

    final_ranking = cl.final_ranking(rank1, rank2, rank3, rank4)

    return final_ranking

