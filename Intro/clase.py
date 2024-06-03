from queue import Queue as Cola

from queue import LifoQueue as Pila

def pacientesurgentes(c:Cola[(int,str,str)])-> int:
    cant = 0
    list = []
    c2 = Cola()
    i = 0
    while not c.empty():
        d = (c.get())
        list.append (d)   
        c2.put(d)     
    while i < len(list):
        if ((list[i])[0][0]) <= 3:
            cant += 1
            i += 1
        else: 
            i += 1
    while not c2.empty():
        c.put(c2.get())
    return cant

def atencion(c:Cola[(str,int,bool,bool)])-> Cola[(str,int,bool,bool)]:
    list = []
    copia = Cola()
    i = 0
    while not c.empty():
        d = c.get()
        list.append (d)
        copia.put(d)
    while i < len (list):
        if (list[i][0][3]) == True and (list [i][0][2]) == True:
            c.put (list[i])
            list.pop (i)
        else:
            i += 1
    i = 0
    while i < len (list):
        if list [i][0][3] == True:
            c.put (list[i])
            list.pop (i)
        else:
            i += 1
    i = 0
    while i < len (list):
        if list [i][0][2] == True:
            c.put (list[i])
            list.pop (i)
        else:
            i += 1
    i = 0
    while i < len (list):
            c.put (list[i])
            list.pop (i)
            i += 1
    return leer (c)
#ej11
def ej11 (s:str)-> bool:
    p = Pila()
    i = (len(s)-1)
    while 0 <= i:
        if s[i] == "(" or s[i] == ")":
            p.put(s[i])
            i-=1
        else: 
            i -= 1
    i = 0
    j = 0
    while not p.empty ():
        d = p.get()
        if d == "(":
            i += 1
        if d == ")":
            j += 1
        if j > i:
            return False
    return True 

print (ej11(")(()"))
#NO
def colay ()-> Cola[(str,int,bool,bool)]:
    c=Cola()
    c.put([("j",2,False,True)])
    c.put([("l",3,True,False)])
    c.put([("l",1,True,True)])
    c.put([("K",4,False,False)])
    return c



import random

def azar(cant:int,desde:int,hasta:int)->Cola():
    c = Cola()
    i = cant
    while i > 0:
        d =random.randint (desde,hasta)
        c.put(d)
        i -= 1
    return leer (c)

def leer (c:Cola()):
   while not c.empty():
    print (c.get())
   
#print (atencion(colay()))

