from msg_to_do import msgToDoNet


#print (msgToDoNet)

#from tkinter import *
#from tkinter.ttk import Button, Canvas

from tkinter import *
from tkinter.ttk import Button
from math import sin, cos
pi = 3.14

root = Tk()
root.geometry("500x500")
root.title("MyStateViwer")

butns = {}

def add_next_state(state, x, y, a, b):
    global butns
    print(state, end=', \ta:')
    print(a, end=', \tb:')
    print(b, end=', \tx:')
    print(x, end=', \ty:')
    print(y, end='\n')
    i = ''
    if state in butns:
        i = 0
        while state+str(i) in butns:
            i+=1
    new_state = state+str(i)
    butns[new_state] = {
            'X':x,
            'Y':y,
            'button':Button(text=str(state))
        }
    for msg in msgToDoNet[state]:
        if (len(msgToDoNet[state][msg]['next_state'])>0):
            n = (b-a)/len(msgToDoNet[state][msg]['next_state'])
            l = a
        else:
            n=0
        for next_state in msgToDoNet[state][msg]['next_state']:
            add_next_state(next_state, 100+x, y, l, (b-a)/n+l)
            l+=n

def init():
    global butns
    add_next_state(state="None", x=200, y=200, a = 0, b=2*pi)
    for state in butns:
        print(state+": x="+str(butns[state]['X'])+" y="+str(butns[state]['Y']))
        butns[state]['button'].place(x=butns[state]['X'],y=butns[state]['X'])
    print(list(butns))

def remove():
    global dif_x, dif_y, butns
    '''
    for state in butns: 
        butns[state]['X']+=dif_x/100
        butns[state]['Y']+=dif_y/100
        butns[state]['button'].place(x=butns[state]['X'],y=butns[state]['X'])
    '''

pred_x, pred_y = 200, 200
def on_mouse_down(event):
    global dif_x, dif_y, pred_x, pred_y
    dif_x, dif_y = pred_x - event.x_root, pred_y - event.y_root
    pred_x, pred_y = event.x_root, event.y_root


def update_position(event):
    remove()


canvas = Canvas(root, bg='white', width=500, height=500)
canvas.pack()

Button(text='1').place(x= 10, y = 20)
Button(text='2').place(x=110, y = 20)
Button(text='3').place(x=210, y = 20)

canvas.bind('<ButtonPress-1>', on_mouse_down)
canvas.bind('<B1-Motion>', update_position)

init()

root.mainloop()