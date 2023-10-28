from msg_to_do import msgToDoNet


#print (msgToDoNet)

#from tkinter import *
#from tkinter.ttk import Button, Canvas

from tkinter import Tk, Canvas, Label, Toplevel, Entry, INSERT, Text, Frame, Scrollbar, BOTH, BOTTOM, LEFT, VERTICAL, RIGHT, ALL, X, Y
from tkinter.ttk import Button
from inspect import getsource
from math import sin, cos
pi = 3.14

root = Tk()
root.geometry("900x500")
root.title("MyStateViwer")

butns = {}
lns = []
lbls = []

def sub_window(state):
    T = Toplevel()
    T.geometry("600x400")
    T.title(state)

    main_frame = Frame(T)
    main_frame.pack(fill=BOTH,expand=1)
    sec = Frame(main_frame)
    sec.pack(fill=X,side=BOTTOM)
    my_canvas = Canvas(main_frame)
    my_canvas.pack(side=LEFT,fill=BOTH,expand=1)
    y_scrollbar = Scrollbar(main_frame,orient=VERTICAL,command=my_canvas.yview)
    y_scrollbar.pack(side=RIGHT,fill=Y)
    my_canvas.configure(yscrollcommand=y_scrollbar.set)
    my_canvas.bind("<Configure>",lambda e: my_canvas.config(scrollregion= my_canvas.bbox(ALL)))
    second_frame = Frame(my_canvas)
    my_canvas.create_window((0,0),window= second_frame, anchor="nw")

    current_row = 1
    for msg in msgToDoNet[state]:
        Label(T, text="msg:").grid(row=current_row, column=0, in_=second_frame)
        msg_name= Entry(T, bg="#9BC2E6")
        msg_name.insert(INSERT, msg)
        msg_name.grid(row=current_row, column=1,columnspan=2, in_=second_frame)
        current_row+=1
        Label(T, text="proc:").grid(row=current_row, column=0,columnspan=2, in_=second_frame)
        current_row+=1
        msg_name= Text(T,width=70, height=10)
        msg_name.insert(INSERT, getsource(msgToDoNet[state][msg]['proc']))
        msg_name.grid(row=current_row,rowspan=2, column=0,columnspan=2, in_=second_frame)
        current_row+=4

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
            'button':Button(text=str(state), command=lambda st=state: sub_window(st))
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
            lbls.append(
                {
                    'X':(x+x+x0+100)/2 - 25,
                    'Y':(y+y+150)/2 - 25,
                    'lbl':Label(text=msg, bg='azure')

                }
            )
            add_next_state(next_state,  x+x0,y+100 , w -120)
            x0+=h*2

def init():
    global butns
    add_next_state(state="None", x=200, y=200, w = 300)
    for state in butns:
        butns[state]['button'].place(x=butns[state]['X'],y=butns[state]['Y'])
    for lbl in lbls:
        lbl['lbl'].place(x=lbl['X'],y=lbl['Y'])


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
    for lbl in lbls:
        lbl['X']-=dif_x/10
        lbl['Y']-=dif_y/10
        lbl['lbl'].place(x=lbl['X'],y=lbl['Y'])

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