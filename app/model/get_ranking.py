#! /usr/bin/python
# -*- coding: utf-8 -*-

from get_data import GetData
from calc import Calc

def get_ranking(user_id):
    """
    ユーザidだけ渡して，おすすめユーザのidランキングを返す
    """

    gd = GetData()
    cl = Calc()


