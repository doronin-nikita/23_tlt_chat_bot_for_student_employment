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
        n = len(msgToDoNet[state][msg]['next_state'])
        
        if n>0:
            h = 500/n
        else:
            h =0
        x0 = (-h)*(n/3)
        for next_state in msgToDoNet[state][msg]['next_state']:
            canvas.create_line(x+50, y+25, x+x0+50, y+125)

            add_next_state(next_state,  x+x0, y+100, 1, 1+n)
            x0+=h

def init():
    global butns
    add_next_state(state="None", x=200, y=200, a = 0.25*pi, b=0.75*pi)
    for state in butns:
        print(state+": x="+str(butns[state]['X'])+" y="+str(butns[state]['Y']))
        butns[state]['button'].place(x=butns[state]['X'],y=butns[state]['Y'])
    print(list(butns))

def remove():
    global dif_x, dif_y, butns
    
    for state in butns: 
        butns[state]['X']-=dif_x/10
        butns[state]['Y']-=dif_y/10
        butns[state]['button'].place(x=butns[state]['X'],y=butns[state]['Y'])
    

pred_x, pred_y = 200, 200
def on_mouse_down(event):
    global dif_x, dif_y, pred_x, pred_y
    pred_x, pred_y = event.x_root, event.y_root


def update_position(event):
    global dif_x, dif_y, pred_x, pred_y
    dif_x, dif_y = pred_x - event.x_root, pred_y - event.y_root
    pred_x, pred_y = event.x_root, event.y_root
    remove()


canvas = Canvas(root, bg='white', width=500, height=500)
canvas.pack()

canvas.bind('<ButtonPress-1>', on_mouse_down)
canvas.bind('<B1-Motion>', update_position)

init()

root.mainloop()