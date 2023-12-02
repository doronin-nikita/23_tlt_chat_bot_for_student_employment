msgToDoNet = {}
def disassemble(rows):
	result = ""
	for row in rows:
		for key, val in row.items():
			if (val!=None):
				result += str(key) + " " + str(val) + "\n"
		result += "\n"
	return result

def sart_do(write, id, connection, cursor):
    global key_board
    try:
        cursor.execute('INSERT студенты(id) VALUES (%s);', (id))
        connection.commit()
        write(txt='')
    except Exception as ex:
        pass
    cursor.execute('SELECT институт FROM студенты WHERE id=(%s);', (id))
    connection.commit()
    if (cursor.fetchall()[0]['институт'] is None):
        cursor.execute('update студенты set студенты.state = "NeedInst" where студенты.id = (%s);', (id))
        connection.commit()
        write(txt='пожалуйста укажите ваш институт', kb=0)
    else:
        cursor.execute('update студенты set студенты.state = "MainMenu" where студенты.id = (%s);', (id))
        connection.commit()
        write(txt='бот включен', kb=1)

def bot_off(write, id, connection, cursor):
    cursor.execute('update студенты set студенты.state = "None" where студенты.id = (%s);', (id))
    connection.commit()
    write(txt='бот отключен', kb=4)

def get_insts(write, id, connection, cursor):
    cursor.execute('SELECT название FROM институты;')
    connection.commit()
    msg = 'институты:\n'
    for s in cursor.fetchall():
        msg+=s['название']+'\n'
    write(txt=msg, kb=0)

def get_vakansii(write, id, connection, cursor):
    cursor.callproc('GetVakansi',(id,''))
    connection.commit()
    msg = disassemble(cursor.fetchall())
    cursor.execute('update студенты set студенты.state = "VakansiPlayer" where студенты.id = (%s);', (id))
    connection.commit()
    write(txt=msg, kb=2)

def next_vakansii(write, id, connection, cursor):
    cursor.callproc('NextVakansi',(id,''))
    connection.commit()
    msg = disassemble(cursor.fetchall())
    write(txt=msg, kb=2)

def go_main_menu(write, id, connection, cursor):
    cursor.execute('update студенты set студенты.state = "MainMenu" where студенты.id = (%s);', (id))
    connection.commit()
    write(txt='вы вернулись в главное меню', kb=1)

def other_insts(write, id, connection, cursor, msg):
    cursor.execute('SELECT название FROM институты;')
    connection.commit()
    for s in cursor.fetchall():
        if (msg==s['название'].lower()):
            cursor.execute('update студенты set студенты.институт = (%s) where студенты.id = (%s);', (s['название'],id))
            cursor.execute('update студенты set студенты.state = "MainMenu" where студенты.id = (%s);', (id))
            connection.commit()
            write(txt='установлен институт', kb=1)

def other_is_help(write, id, connection, cursor, msg):
    cursor.execute('SELECT state FROM студенты WHERE  id=(%s);', (id))
    connection.commit()
    state = cursor.fetchall()[0]['state']
    new_msg = 'возможные команды:\n'
    for s in msgToDoNet[state]:
        new_msg+=s+'\n'
    write(txt=new_msg, kb=None)

def clear_user(write, id, connection, cursor):
    cursor.execute(' DELETE FROM `ChatBotDataBase`.`студенты` WHERE (`id` = (%s));', (id))
    connection.commit()
    write(txt='вы удалены', kb=4)
     

msgToDoNet = {
    'None':{
        'start': {'proc':sart_do, 'next_state':['NeedInst','MainMenu', 'None_end1', 'None_end2']},
    },
    'MainMenu':{
        'вакансии':     {'proc':get_vakansii, 'next_state':['VakansiPlayer', 'MainMenu_end']},
        'организации':  {'proc':sart_do, 'next_state':[]},
        'сброс':        {'proc':clear_user, 'next_state':['None_end']},
        #'...':          {'proc':other_is_help, 'next_state':[]}
    },
    'NeedInst':{
        'отключить': {'proc':bot_off, 'next_state':['None_end']},
       # 'институты': {'proc':get_insts, 'next_state':[]},
       #'...':       {'proc':other_insts, 'next_state':['MainMenu_end']}
    },
        
    'VakansiPlayer':{
       'следующая':    {'proc':next_vakansii, 'next_state':[]},
       'главное меню': {'proc':go_main_menu, 'next_state':['MainMenu_end']}
    },
        
    ### для графики ###
         'None_end1':     {'None':{'proc':go_main_menu, 'next_state':[]}},
         'None_end2':     {'None':{'proc':go_main_menu, 'next_state':[]}},
        
    'None_end':     {'None':{'proc':go_main_menu, 'next_state':[]}},
    'MainMenu_end': {'None':{'proc':go_main_menu, 'next_state':[]}},
    'NeedInst_end': {'None':{'proc':go_main_menu, 'next_state':[]}},
    'NeedInst_end1': {'None':{'proc':go_main_menu, 'next_state':[]}},

        }

