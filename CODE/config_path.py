import configparser as CfPs
import os

a = os.path.basename(__file__)
dir = os.path.abspath(__file__).replace(a, '')

def get_config():
    #a1 = os.path.basename(__file__)
    #dir_h = os.path.abspath(__file__).replace(a1, '')
    config = CfPs.ConfigParser()
    config.read("settings.ini") #config.read("'"+dir_h+"settings.ini'")
    #print("'"+dir_h+"settings.ini'")
    #print(config.items())
    return config
    #user_host = config["DB settings"]["user_host"]
    #user_name = config["DB settings"]["user_name"]
    #user_password = config["DB settings"]["user_password"]
    #user_db = config["DB settings"]["user_db"]
    #user_db_charset = config["DB settings"]["user_db_charset"]