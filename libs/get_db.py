#! /usr/bin/python
# -*- coding: utf-8 -*-

import mysql.connector
import config

def get_db():
	dbcon = mysql.connector.connect(database=config.db, user=config.user, password=config.passwd, host=config.host)
	dbcur = dbcon.cursor()
	return dbcon, dbcur
