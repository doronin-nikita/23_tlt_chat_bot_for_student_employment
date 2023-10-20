'''
@brief Точка входа для работы бота, здесь задаются параметры с которыми будет запушено ядро бота
'''
from configparser import ConfigParser
from os import path, execv
import sys
from pymysql import connect, cursors
from bot_core import Core

### Чтение конфигурации ###
print('чтение конфигурации ...')
config = ConfigParser()
if (path.isfile('settings.ini')):
    config.read('settings.ini')
    print('конфигурация считана')
else:
    print('не существует файла конфигурации\nпосле заполнения будет создан новый файл конфигурации')
    config['database'] = {'host':'127.0.0.1', 'dbName':'database', 'name':'root', 'password':'', 'token':''}

pswd = ''
### Редоктирование конфигурации ###
def redact_config():
    print('редактирование конфигурации ...')
    input_str=str(input(f'введите host (ip-адресс) сервера базы данных({config["database"]["host"]}) : '))
    if (len(input_str)>0):
        config["database"]["host"] = input_str
    print(f'выбран host : {config["database"]["host"]}')

    input_str=str(input(f'введите имя базы данных({config["database"]["dbName"]}) : '))
    if (len(input_str)>0):
        config["database"]["dbName"] = input_str
    print(f'выбрана база данных : {config["database"]["dbName"]}')

    input_str=str(input(f'введите имя пользователя базы данных({config["database"]["name"]}) : '))
    if (len(input_str)>0):
        config["database"]["name"] = input_str
    print(f'выбрана пользователь : {config["database"]["name"]}')
    global pswd
    pswd = str(input(f'введите пороль пользователя {config["database"]["name"]} : '))
    if (len(pswd)==0):
        pswd=config["database"]["password"]
    print('редактирование конфигурации завершено')

def save_config():
    print('сохранение конфигурации ...')
    with open('settings.ini', 'w') as configfile:
        config.write(configfile)
    print('конфигурация сохранена')

### Тест подключения к базе данных
def db_connection_test():
    print('тест подключения к базе данных ...')
    try:
        connection = connect(
            host=config["database"]["host"],
            user=config["database"]["name"],
            password=pswd,
            db=config["database"]['dbName'],
            charset='utf8mb4',
            cursorclass=cursors.DictCursor
            )
        connection.cursor().close()
        print ("подключено!")
    except Exception as ex:
        print(pswd)
        print("подключение не удалось...")
        print(ex)

def run_client():
    print('подключение к базе данных ...')
    redact_config()
    db_connection_test()
    save_config()
    core = Core(pswd, kwargs=config)
    core.run_listening()

try:
    run_client()
except Exception as ex:
    print(ex)
    execv(sys.argv[0], sys.argv)


