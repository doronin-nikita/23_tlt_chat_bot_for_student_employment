from msg_to_do import msgToDoNet


#print (msgToDoNet)

#from tkinter import *
#from tkinter.ttk import Button, Canvas

from tkinter import *
from tkinter.ttk import Button
from math import sin, cos
pi = 3.14

root = Tk()
root.geometry("900x500")
root.title("MyStateViwer")

butns = {}
lns = []

def add_next_state(state, x, y, w):
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
    n = 0
    for msg in msgToDoNet[state]:
        n += len(msgToDoNet[state][msg]['next_state'])
    if n>0:
        h = w/n
    else:
        h =0
    x0 = (-h)*(n/3)
    for msg in msgToDoNet[state]:
        for next_state in msgToDoNet[state][msg]['next_state']:
            lns.append(
                {
                    'X0':x+50,
                    'Y0':y+25,
                    'X' :x+x0+50,
                    'Y' :y+125,
                    'line': canvas.create_line(x+50, y+25, x+x0+50, y+125)
                }
                
            )
            add_next_state(next_state,  x+x0,y+100 , w -120)
            x0+=h*2

def init():
    global butns
    add_next_state(state="None", x=200, y=200, w = 300)
    for state in butns:
        print(state+": x="+str(butns[state]['X'])+" y="+str(butns[state]['Y']))
        butns[state]['button'].place(x=butns[state]['X'],y=butns[state]['Y'])
    print(list(butns))

def remove():
    global dif_x, dif_y, butns
    for ln in lns:
        canvas.delete(ln['line'])
        ln['X0']-=dif_x/10
        ln['Y0']-=dif_y/10
        ln['X' ]-=dif_x/10
        ln['Y' ]-=dif_y/10
        ln['line']=canvas.create_line(ln['X0'], ln['Y0'], ln['X'], ln['Y'])
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


canvas = Canvas(root, bg='white', width=900, height=500)
canvas.pack()

canvas.bind('<ButtonPress-1>', on_mouse_down)
canvas.bind('<B1-Motion>', update_position)

init()

root.mainloop()