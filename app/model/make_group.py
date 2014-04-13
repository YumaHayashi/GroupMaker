#! /usr/bin/python
# -*- coding: utf-8 -*-

import get_ranking
import sys
sys.path.append('../../libs')
import get_db
import numpy as np

def get_final_group(team_num=6):
    dbcon, dbcur = get_db.get_db()
    dbcur.execute('select * from users')
    user_list = dbcur.fetchall()

    # print user_list

    # team_num = 3
    people_num = len(user_list)

    ranking_info = []

    for i in range(people_num):
        # print 'user', i+1, ': '
        # print get_ranking.get_ranking(user_list, i+1)
        ranking_info.append(get_ranking.get_ranking(user_list, i+1))

    res = make_group(team_num, people_num, ranking_info)

    dbcur.close()
    dbcon.close()
    return res


def make_group(team_num, people_num, ranking_info):
    weight = range(people_num - 1, 0, -1)
    w1 = map(lambda x: zip(x, weight), ranking_info) # original ranking with inversed order score
    # w1 = [[(rank1, weight1), (rank2, weight2), ...], [...]]

    bidirectional_score = {}
    added_pairs = []
    for i, ks in enumerate(w1):
        id1 = i+1               # add 1 because of 0 origin
        for id2, val in ks:
            if set([id1, id2]) in added_pairs:
                bidirectional_score[(id2, id1)] += val
            else:
                added_pairs.append(set([id1, id2]))
                bidirectional_score.setdefault((id1, id2), 0)
                bidirectional_score[(id1, id2)] += val

    candidate = bidirectional_score.items()
    candidate.sort( cmp=lambda x, y: cmp(x[1], y[1]), reverse=True)

    # print 'sorted score:'
    # print candidate

    limit_member_num = np.ceil(people_num / float(team_num))
    final_group = []
    used = {i+1:False for i in range(people_num)} # {id: is_used, ...}
    for i, ((id1, id2), _) in enumerate(candidate):
        if not used[id1] and not used[id2]: # case both are not used
            final_group.append([id1, id2])
            used[id1] = True
            used[id2] = True

        elif used[id1] and not used[id2]: # case only id1 is used
            belonged_class = -1
            for class_num, contents in enumerate(final_group):
                if id1 in contents:
                    belonged_class = class_num
                    break
            if len(final_group[belonged_class]) < limit_member_num:
                final_group[belonged_class].append(id2)
                used[id2] = True

        elif used[id2] and not used[id1]: # case only id2 is used
            belonged_class = -1
            for class_num, contents in enumerate(final_group):
                if id2 in contents:
                    belonged_class = class_num
                    break
            if len(final_group[belonged_class]) < limit_member_num:
                final_group[belonged_class].append(id1)
                used[id1] = True

        else:                   # case both are used
            continue

    return final_group

def get_user_connection(team_num=6):
    dbcon, dbcur = get_db.get_db()
    dbcur.execute('select * from users')
    user_list = dbcur.fetchall()

    # print user_list

    # team_num = 3
    people_num = len(user_list)

    ranking_info = []

    for i in range(people_num):
        # print 'user', i+1, ': '
        # print get_ranking.get_ranking(user_list, i+1)
        ranking_info.append(get_ranking.get_ranking(user_list, i+1))

    weight = range(people_num - 1, 0, -1)
    w1 = map(lambda x: zip(x, weight), ranking_info) # original ranking with inversed order score
    # w1 = [[(rank1, weight1), (rank2, weight2), ...], [...]]

    bidirectional_score = {}
    added_pairs = []
    for i, ks in enumerate(w1):
        id1 = i+1               # add 1 because of 0 origin
        for id2, val in ks:
            if set([id1, id2]) in added_pairs:
                bidirectional_score[(id2, id1)] += val
            else:
                added_pairs.append(set([id1, id2]))
                bidirectional_score.setdefault((id1, id2), 0)
                bidirectional_score[(id1, id2)] += val

    candidate = bidirectional_score.items()
    candidate.sort( cmp=lambda x, y: cmp(x[1], y[1]), reverse=True)

    return candidate
