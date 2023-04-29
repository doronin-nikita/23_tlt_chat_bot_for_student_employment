import pymysql.cursors
import config_path as CfPh
import sys
import os
import random
import vk_api
import keyboardlib as kbl
from vk_api.longpoll import VkLongPoll, VkEventType

#......................................................
####### Get Settings ##################################
#......................................................
config = CfPh.get_config()
user_host = config["DB settings"]["user_host"]
user_name = config["DB settings"]["user_name"]
user_password = config["DB settings"]["user_password"]
user_db = config["DB settings"]["user_db"]
user_db_charset = config["DB settings"]["user_db_charset"]
token = config["api"]["token"]

#......................................................
####### SEND FUNCTIONS ################################
#......................................................
def get_random_id():
   return random.getrandbits(31) * random.choice([-1, 1])

key_board = "0"
mykeyboard = kbl.key_boards[int(key_board)]()
def write_msg_to_user(user_id, text):
	

	vk = vk_api.VkApi(token=token)
	vk.method('messages.send', {'user_id': user_id,
                                'random_id': get_random_id(),
                                 'message': text,
                                 'attachment': None,
                                 'keyboard': mykeyboard})


#......................................................
####### AUTARISATION ##################################
#......................................................

#print ("Conecting...")
try:
	connection = pymysql.connect(
		host=user_host,
		user=user_name,
		password=user_password,
		db=user_db,
		charset=user_db_charset,
		cursorclass=pymysql.cursors.DictCursor
		)
	#print ("conected!")
except Exception as ex:
	#print("don't conected...")
	print(ex)

def disassemble(rows):
	result = ""
	for row in rows:
		for key, val in row.items():
			if (val!=None):
				result += str(key) + " " + str(val) + "\n"
		result += "\n"
	return result
		

#......................................................
####### WORK ##########################################
#......................................................

id = sys.argv[1]
text = sys.argv[2]

msg = "Каково-либо ответа, на данную комманду получено небыло, рекомендуем свериться с списком комманд"
b = False

try:
	if (text=="?"):
		msg = "Доступные команды:\n"
		for i in config["buttens"]:
			msg = msg + " * " + str(i) + "\n"
		for i in config["forced"]:
			msg = msg + " * " + str(i) + "\n"

	with connection.cursor() as cursor:
		cursor.callproc("GetByCompany", (id, text))
		tbl = cursor.fetchall()

		if not("null" in tbl[0]):
			msg = disassemble(tbl)
		else:
			func = "select "+config["signals"]["AddInfo"]+"(%s, %s) as second"
			proc = config["buttens"]["вакансии"]
			cursor.execute(func, (id, text))
			connection.commit()
			all_ok = cursor.fetchall()[0]["second"]
			if (text in config["forced"]):
				proc = config["forced"][text]
				cursor.callproc(proc, (id, text))
				msg = disassemble(cursor.fetchall())
			elif (all_ok == config["signals"]["OkSugnall"]):
				if text in config["buttens"]:
					proc = config["buttens"][text]
					cursor.callproc(proc, (id, text))
					msg = disassemble(cursor.fetchall())
			else:
				msg = all_ok
			cursor.callproc('GetKeyBoard', (id, text))
			key_board = cursor.fetchall()[0]["key_board"]
			b = key_board!=-1
			if (b):
				mykeyboard = kbl.key_boards[int(key_board)]()
			else:
				mykeyboard = kbl.key_boards[4]()
		connection.commit()
		cursor.close()

except Exception as ex:
	msg = "Достижение 'тестировщик' - вам удалось найти ошибку, просим вас подробно ее описать тех. поддержке"
	print("пользователь "+str(id)+" получил ошибку - ")
	print(ex)
	#отредактировать
if (b)or(text in config["forced"]):
	write_msg_to_user(id, str(msg))