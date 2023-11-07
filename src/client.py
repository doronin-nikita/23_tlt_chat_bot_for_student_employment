"""! @brief Файл отвечает за запуск бота и формирование его конфигурации"""
##
# @mainpage Чат-бот вк по трудоустройству студентов. Документация к коду
#
# @section description_main Описание
# В этом документе можно ознакомится с описанием всех значимых элементов кода
# <a href="namespaces.html">Package List</a>
#
# @section notes_main Примечания
# - Без премичаний
#
##
# @file client.py
#
# @brief Файл отвечает за запуск бота и формирование его конфигурации.
#
# @section client Описание
# Порядок выполнение оприраций:
# 1. Генерация файла конфигурации в диалоге с клиентом
# 2. Тест подключения к серверу базы данных
# 3. Запуск объекта чат-бота
#
# @section libraries_main Libraries/Modules
# - os library
# - sys library
# - configparser library
# - pymysql library
# - bot_core module (local)
# 

# Imports
from configparser import ConfigParser
from os import path, execv
import sys
from pymysql import connect, cursors
from bot_core import Core

print('чтение конфигурации ...')
# Global Constants
## Обьект хранящий словарь сформированной и формируемой в результате конфигурации чат бота
config = ConfigParser()
## Строка в которой будет временно хранится пароль пользователя
pswd = ''


if (path.isfile('settings.ini')):
    config.read('settings.ini')
    print('конфигурация считана')
else:
    print('не существует файла конфигурации\nпосле заполнения будет создан новый файл конфигурации')
    config['database'] = {'host':'127.0.0.1', 'dbName':'database', 'name':'root', 'password':'', 'token':''}

def redact_config():
    """!@brief Метод вызываемый для редактирования временной конфигурации
    """
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
    """!@brief Метод вызываемый для записи временной конфигурации в файл
    """
    print('сохранение конфигурации ...')
    with open('settings.ini', 'w') as configfile:
        config.write(configfile)
    print('конфигурация сохранена')

def db_connection_test():
    """!@brief Метод вызываемый для проверки подключения к базе данных по заданной конфигурации
    """
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
    """!@brief Метод запуска бота.
    Отсюда вызывается методы:
    - редактирования временногй конфигурации (redact_config)
    - проверки подключения к базе данных (db_connection_test)
    - сохранения конфигурации (save_config)
    Помимо этого здесь создается обьект ядра чат-бота с заданными параметрами и запускается в прослушивание
    """
    print('подключение к базе данных ...')
    redact_config()
    db_connection_test()
    save_config()
    core = Core(pswd, kwargs=config)
    core.run_listening()

# блок повторного запуска клиента чат бота с заданными параметрами
try:
    run_client()
except Exception as ex:
    print(ex)
    execv(sys.argv[0], sys.argv)


