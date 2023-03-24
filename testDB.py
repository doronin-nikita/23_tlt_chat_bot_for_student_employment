import pymysql.cursors 
import configparser as CfPs
import sys
import os

#......................................................
####### Get Settings ##################################
#......................................................
config = CfPs.ConfigParser()
config.read("settings.ini")
user_host = config["DB settings"]["user_host"]
user_name = config["DB settings"]["user_name"]
user_password = config["DB settings"]["user_password"]
user_db = config["DB settings"]["user_db"]
user_db_charset = config["DB settings"]["user_db_charset"]

#......................................................
####### AUTARISATION ##################################
#......................................................

#
print ("Conecting...")
try:
	connection = pymysql.connect(
		host=user_host,
		user=user_name,
		password=user_password,                             
		db=user_db,
		charset=user_db_charset,
		cursorclass=pymysql.cursors.DictCursor
		) 
	print ("conected!")
except Exception as ex:
	print("don't conected...")
	print(ex)