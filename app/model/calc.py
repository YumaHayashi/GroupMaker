#! /usr/bin/python
# -*- coding: utf-8 -*-

import get_db
import numpy as np

def cos_sim(vec1, vec2):
    """
    コサイン類似の計算
    """
    numerator = np.dot(vec1, vec2)
    denominator = np.linalg.norm(vec1) * np.linalg.norm(vec2)
    if denominator == 0:
        return 0
    else:
        return numerator / float(denominator)

class Calc(object):
    """
    ユーザにおすすめで表示する他のユーザを決定するための計算モジュール
    """
    def __init__(self):
        pass

    def make_skill_level_ranking(self, user, others):
        """
        プログラミングスキルの近い人が上位になるようなランキング
        param: user = (id, vec), others = [(id, vec), ...]
        return: ランク済みユーザidのリスト
        """
        sim = []
        for i, vec in others:
            cs = cos_sim(user[1], vec)
            sim.append((i, cs))
        sim.sort( cmp=lambda x, y: cmp(x[1], y[1]) )
        return map(lambda x: x[0], sim)


    def make_skill_type_ranking(self, user, others):
        """
        マネジメント，プログラミング，デザインで自分の苦手なものを得意とする人が上位になるようなランキング
        param: user = (id, vec), others = [(id, vec), ...]
        return: ランク済みユーザidのリスト
        """
        sim = []
        for i, vec in others:
            cs = cos_sim(user[1], vec)
            sim.append((i, cs))
        sim.sort( cmp=lambda x, y: cmp(x[1], y[1]), reverse=True )
        return map(lambda x: x[0], sim)

    def make_design_favorite_ranking(self, user, others):
        """
        デザインの好みが似ている人を上位とするランキング
        param: user = (id, vec), others = [(id, vec), ...]
        return: ランク済みユーザidのリスト
        """
        sim = []
        for i, vec in others:
            cs = cos_sim(user[1], vec)
            sim.append((i, cs))
        sim.sort( cmp=lambda x, y: cmp(x[1], y[1]))
        return map(lambda x: x[0], sim)

    def make_character_ranking(self, user, others):
        """
        性格の似ている人を上位とするランキング
        param: user = (id, vec), others = [(id, vec), ...]
        return: ランク済みユーザidのリスト
        """
        sim = []
        for i, vec in others:
            cs = cos_sim(user[1], vec)
            sim.append((i, cs))
        sim.sort( cmp=lambda x, y: cmp(x[1], y[1]))
        return map(lambda x: x[0], sim)

    def final_ranking(self, rank1, rank2, rank3, rank4):
        """
        make_skill_level_ranking, make_skill_type_ranking, make_design_favorite_ranking, make_skill_level_rankingの4つから生成されたランキングから，最終的な統合ランキングを生成
        return: ランク済みユーザidのリスト
        """
        id_list = sorted(rank1)
        total_rank = {i:0 for i in id_list}
        for i in range(len(rank1)):
            total_rank[rank1[i]] += (1.0 / (i + 1.0))
            total_rank[rank2[i]] += (1.0 / (i + 1.0))
            total_rank[rank3[i]] += (1.0 / (i + 1.0))
            total_rank[rank4[i]] += (1.0 / (i + 1.0))
        total_rank.sort( cmp=lambda x, y: cmp(x[1], y[1]), reverse=True)
        return map(lambda x: x[0], total_rank)
