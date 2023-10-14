from threading import Thread
from time import sleep


def t0():
    print(0)

def task(t,msg):
    sleep(t)
    print(msg)
    

t1 = Thread(target=task, args=(10,'2'))
t2 = Thread(target=task, args=(1 ,'1'))
t1.start()
t2.start()

for i in range(0,10):
    Thread(target=task, args=(10-i,10-i)).start()