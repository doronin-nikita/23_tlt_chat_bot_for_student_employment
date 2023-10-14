from threading import Thread
from vk_api import VkApi
from keyboardlib import key_boards
from vk_api.longpoll import VkLongPoll, VkEventType
from random import getrandbits, choice
from pymysql import connect, cursors
from msg_to_do import msgToDoNet
def get_random_id():
   return getrandbits(31) * choice([-1, 1])




def write_msg_to_user(user_id, text, token, key_board):
    vk = VkApi(token=token)
    if (key_board is not None):
        mykeyboard = key_boards[int(key_board)]()
    vk.method('messages.send', {'user_id': user_id,
                                'random_id': get_random_id(),
                                 'message': text,
                                 'attachment': None,
                                 'keyboard': mykeyboard})


class Core:
    def __init__(self, pswd, kwargs):
        self.config = kwargs
        self.password = pswd

    def handler(self, id, msg):
        connection = connect(
            host=self.config["database"]["host"],
            user=self.config["database"]["name"],
            password=self.password,
            db=self.config["database"]['dbName'],
            charset='utf8mb4',
            cursorclass=cursors.DictCursor
            )
        with connection.cursor() as cursor:
            cursor.execute('SELECT state FROM студенты WHERE  id=(%s);', (id))
            connection.commit()
            wt=lambda txt, kb: write_msg_to_user(user_id=id, token=self.config['database']['token'], text=txt, key_board=kb)
            state = cursor.fetchall()
            if (len(state)>0):
                state = state[0]['state']
            else:
                state = 'None'
            try:
                has_way = False
                for msg_ in msgToDoNet[str(state)]:
                    has_way = (msg_==msg)or(has_way)
                if (has_way):
                    msgToDoNet[str(state)][msg](write=wt, id=id, connection=connection, cursor=cursor)
                else:
                    msgToDoNet[str(state)]['...'](write=wt, id=id, connection=connection, cursor=cursor, msg=msg)
            except Exception as ex:
                print(str(id)+': получил ошбку:', end='')
                print(ex)
            cursor.close()

    def run_listening(self):
        print('запуск прослушивания ...')
        try:
            vk = VkApi(token=self.config['database']['token'])
            longpoll = VkLongPoll(vk)
            print("прослушивание запущено")
            for event in longpoll.listen():
                if event.type == VkEventType.MESSAGE_NEW:
                    if event.to_me:
                        Thread(target=self.handler, args=(event.user_id, event.text.lower())).start()
        except Exception as ex:
            print("exeption",end='')
            print(ex)
            self.run_listening()
