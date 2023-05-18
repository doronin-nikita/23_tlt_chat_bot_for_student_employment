"""@package docstring
Файл отвечающий за вывод сведений о наличии обнавлений.
 
выполняется проверка файла версий на гите, и сравнивается с установленным файолом версий.
"""
import os

a = os.path.basename(__file__)
dir = os.path.abspath(__file__).replace(a, '')
os.chdir(dir)

import wget

print("проверка обнавлений ...")
print("получений новейшей версии на github ...")
try:
    os.remove("versions.ini")
except Exception as ex:
    print("при удалении файл versions.ini не был найден (это нормально)")
file = wget.download("https://github.com/doronin-nikita/23_tlt_chat_bot_for_student_employment/raw/main/RESULT/versions.ini")

import configparser as CfPs

versions = CfPs.ConfigParser()
versions.read("versions.ini")

version = config = CfPs.ConfigParser()
version.read("version.ini")

print("\nсравнение с текущей версией")
if (versions["current"]["version"]>version["current"]["version"]):
    print("найдена более новая версия")
    if ((os.name=='nt')and(versions["current"]["for_windows"]=="true"))or((os.name=='posix')and(versions["current"]["for_linux"]=="true")):
        print("!!! НОВАЯ ВЕРСИЯ СОВМЕСТИМА С ВАШЕЙ ОПЕРАЦИОННОЙ СИСТЕМОЙ !!!")
        print("скачать новую версию можно по ссылке: https://github.com/doronin-nikita/23_tlt_chat_bot_for_student_employment/blob/main/RESULT/")
    else:
        print("новая версия не совместима с вашей операционной системой")
else:
    print("установлена самая новая версия")