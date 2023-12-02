from msg_to_do import msgToDoNet


#print (msgToDoNet)

#from tkinter import *
#from tkinter.ttk import Button, Canvas

from tkinter import Tk, Canvas, Label, Toplevel, Entry, INSERT, Text, Frame, Scrollbar, BOTH, BOTTOM, LEFT, VERTICAL, RIGHT, ALL, X, Y
from tkinter.ttk import Button
from inspect import getsource
import inspect

from math import sin, cos
pi = 3.14

root = Tk()
root.geometry("900x500")
root.title("MyStateViwer")

lvls = {1: 1}
lvls_name = {1: ["None"]}
lvl_iter = 1
butns = {}
lns = []
lbls = []
height = 500
width = 900



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

def add_next_state(state, x, y, w):   # x, y, w
    """
    global butns
    i = ''
    if state in butns:
        i = 0
        while state+str(i) in butns:
            i += 1
    new_state = state+str(i)
    butns[new_state] = {
            'X': x,
            'Y': y,
            'button': Button(text=str(state), command=lambda st=state: sub_window(st))
        }
    n = 0
    for msg in msgToDoNet[state]:
        n += len(msgToDoNet[state][msg]['next_state'])
    if n > 0:
        h = w/n
    else:
        h = 0
    x0 = -h * (n/3)
    for msg in msgToDoNet[state]:
        for next_state in msgToDoNet[state][msg]['next_state']:
            lns.append(
                {
                    'X0': x+25,
                    'Y0': y+25,
                    'X' : x+x0+50,
                    'Y' : y+125,
                    'line': canvas.create_line(x+50, y+25, x+x0+50, y+125) #x+x0+50
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

"""
def find_bottom(mas):
    global lvl_iter, lvls, lvls_name
    next_states = []
    for key in msgToDoNet[mas]:
        lvl_iter = len(inspect.getouterframes(inspect.currentframe())) - 1
        if not msgToDoNet[mas][key]['next_state']:
            if lvl_iter + 1 not in lvls:
                lvls[lvl_iter + 1] = 0
            else:
                lvls[lvl_iter + 1] += 0
        else:
            if (lvl_iter + 1) not in lvls.keys():
                 lvls[lvl_iter + 1] = len(msgToDoNet[mas][key]['next_state'])
            else:
                 lvls[lvl_iter + 1] += len(msgToDoNet[mas][key]['next_state'])
        if lvls[lvl_iter + 1] != 0 and not (not msgToDoNet[mas][key]['next_state']):
            if lvl_iter + 1 not in lvls_name.keys():
                lvls_name[lvl_iter + 1] = msgToDoNet[mas][key]['next_state']
            else:
                test = True
                for x in msgToDoNet[mas][key]['next_state']:
                    if x in lvls_name[lvl_iter + 1]:
                        test = False
                        lvls[lvl_iter + 1] -= 1
                if test:
                    lvls_name[lvl_iter + 1] = lvls_name[lvl_iter + 1] + msgToDoNet[mas][key]['next_state']
            for i in range(len(msgToDoNet[mas][key]['next_state'])):
                if not msgToDoNet[mas][key]['next_state']:
                    continue
                else:
                    next_states.append(msgToDoNet[mas][key]['next_state'][i])
            for i in range(len(next_states)):
                find_bottom(next_states[i])
        else:
            continue


def make_tree():
    global height, butns, width
    cur_height = 0
    for i in lvls.keys():
        cur_width = (lvls[i] + 1)
        cur_w = 0
        cur_height += height/len(lvls.keys())
        for j in range(lvls[i]):
            cur_w += width/cur_width
            butns[str(i) + str(j)] = {
                'X': cur_w,
                'Y': cur_height,
                'button': Button(text=str(lvls_name[i][j]), command=lambda st=lvls_name[i][j]: sub_window(st))
            }
    for i in lvls.keys():
        iter_2 = 0
        for j in lvls_name[i]:
            iter_1 = 0
            for msg in msgToDoNet[j]:
                for next_state in msgToDoNet[j][msg]['next_state']:
                    lns.append(
                        {
                            'X0': butns[str(i) + str(iter_2)]['X'],
                            'Y0': butns[str(i) + str(iter_2)]['Y'],
                            'X':  butns[str(i + 1) + str(iter_1)]['X'],
                            'Y':  butns[str(i + 1) + str(iter_1)]['Y'],
                            'line': canvas.create_line(butns[str(i) + str(iter_2)]['X'], butns[str(i) + str(iter_2)]['Y'],
                                             butns[str(i + 1) + str(iter_1)]['X'], butns[str(i + 1) + str(iter_1)]['Y'])
                        }
                    )
                    iter_1 += 1
            iter_2 += 1

def init():
    add_next_state(state="None", x=200, y=200, w=300)

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

find_bottom("None")
for i in lvls.keys():
    if lvls[i] == 0:
        del lvls[i]
        break


make_tree()
init()


root.mainloop()
