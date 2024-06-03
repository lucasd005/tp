def cantdelin(nom:str)-> int:
    f = open (nom)
    lineas:list[str] = f.readlines()
    f.close()
    cant:int = len(lineas)
    return cant


def clonarsincom (nom:str):
    f=open(nom)
    sincom =[]
    for linea in f.readlines ():
        for caracter in linea:
            if not caracter == " ":
                if not caracter == "#": 
                    sincom.append (linea)
                break
    res = open ("sin com" + nom,"w")
    res.writelines(sincom)
    res.close
    f.close

def existepal (palabra:str,nom:str)-> bool:
    f = open (nom)
    lineas:list[str] = f.readlines()
    i = 0
    while i < len(lineas):
        if palabra in lineas[i]:
            return True
        else: i += 1
    return False

def cantdeap (p:str,nom:str)-> int:
    f = open (nom)
    lineas:list[str] = f.readlines()
    i = 0
    j = 0
    while i < len(lineas):
        if p in lineas[i]:
            j += 1
            i += 1
        else: i += 1
    return j
#arreglar

def reverso (nom:str):
    f=open(nom)
    lineas:list[str] = f.readlines()
    rev = []
    i = 0
    while i < len (lineas):
        rev.insert (0,lineas [i])
        i+=1
    res = open ("reverso","w")
    res.writelines(rev)
    res.close
    f.close

def agregarfrasefin(nom:str,fra:str):
    i = 0
    f= open(nom)
    lineas:list[str] = f.readlines()
    same=[]
    while i < len (lineas):
        same.append (lineas [i])
        i += 1
    f.close
    j= open(nom,"w")
    same.append (fra)
    j.writelines (same)
    j.close

def agregarfraseprin (nom:str,fra:str):
    i = 0
    f = open(nom)
    lineas:list[str] = f.readlines()
    same=[] 
    same.append (fra+ "\n")
    while i < len (lineas):
        same.append (lineas [i])
        i += 1
    f.close
    j= open(nom,"w")
    j.writelines (same)
    j.close


def listarpal (nom:str)->str:
    f = open (nom,"rb")
    lineas = f.readlines ()
    i = 0
    j =0
    pal = []
    while i < len(lineas):
        if not (lineas [i][j] < "z" and lineas [i][j] > "a") or (lineas [i][j] < "Z" and lineas [i][j] > "A" ) or (lineas [i][j]== " " ) or ( lineas [i][j] == "-") :
            i += 1
        else: j += 1
        if j == len (lineas [i][j]):
            j = 0
            i += 1
            pal.append (lineas [i])


def promedioporestudiante (notas:str,promedios:str):
    f = open (notas)
    g = open (promedios)
    lineasn = f.readlines()
    lineasp = g.readlines()
    j = 0
    prom = []
    while j < len (lineasn) :
        promedioest(notas,notas[j])

    

#usar split
def promedioest (nom:str,alu:str):
    f = open (nom)
    lineas = f.readlines ()
    notas = 0
    suma = 0
    cant = 0
    for linea in lineas:
        if linea [0] == alu :
            notas = float(linea [3])
            suma += notas
            cant += 1
    return suma / cant


#PILAS
from queue import LifoQueue as Pila
import random
def generarnazar ( cant:int,desde:int,hasta:int)->Pila[int]:
    p = Pila()
    while cant > 0 :
        p.put (random.randint (desde,hasta))
        cant -= 1
    return devolp (p)


def devolp (p:Pila):
    long:int = 0
    while not p.empty():
        print(p.get())
        long += 1
    print(f"Longitud final de la pila : {long}")

def buscarmax (p:Pila[int])->int:
    i:list[int] = []
    while not p.empty():   
        i.append (p.get())
    while len (i) > 1:
        if i[0] > i[1]:
            i.pop (1)
        else: i.pop (0)
    return i [0]           

def estabienbal (f:str)-> bool:
    i = 0
    f = sacare(f)
    while i < len (f):
        if (f[i] == "*" or f[i] == "+" or f [i] == "-" or f [i] == "/") and f [i+1] == ")":
            return False
        if f[i] == "(" and not (f[i+1] > "0" or f[i+1] < "9" or f[i+1] != 1) :
            return False
        else: 
            i += 1        
    return conp (f)

def conp (f:str)->bool:
    i = 0
    j = 0
    l = 0
    while i < len (f):
        if f[i] == "(":
            j += 1
            i += 1
        if f[i] == ")":
            l += 1
            i += 1
        else:
            i+=1
    if j != l:
        return False
    return True
    

def sacare(f:str)->str:
    j = ""
    i = 0
    while i < len (f):
        if f[i] == " ":
            i += 1
        else: 
            j += (f[i])
            i += 1
    return j 

def pilab ()->Pila [int]:
    p = Pila()
    p.put(1)
    p.put(3)
    p.put(2)
    return (p.get(0)) + (p.get(0))

def evaluarexpresion(s:str) -> float:
    p = Pila()
    i = (len(s)-1)
    while  0 <= i:
        if s[i] > "0" and s[i] <"9":
            p.put(float(s[i]))
            i-=1
        else:
            i -= 1
    return cuenta(p,s)

def cuenta(p:Pila[float],s:str)-> float:
    i = 0
    j = 0
    encontre:bool = False
    while encontre == False:
        if s[i] == "+":
            j += ((p.get ())+ (p.get()))
            i += 1
            encontre = True
        if s[i] == "-":
            j += ((p.get ()) - (p.get()))
            i += 1
            encontre = True
        if s[i]== "*":
            j += ((p.get ()) * (p.get()))
            i += 1
            encontre = True
        if s[i] == "/":
            j += ((p.get ())/(p.get()))
            i += 1
            encontre = True
        else:
            i += 1
    while not p.empty():
        while i < len (s):
            if s[i] == "+":
                j += p.get ()
            if s[i] == "-":
                j -= p.get()
            if s[i]== "*":
                j *= p.get ()
            if s[i] == "/":
                j /= p.get()
            else:
                i += 1
    return j

#COLAS

from queue import Queue as Cola

def generarnazarc( cant:int,desde:int,hasta:int)->Cola[int]:
    c = Cola()
    while cant > 0 :
        c.put (random.randint (desde,hasta))
        cant -= 1
    return devolpc (c)

def devolpc (c:Cola):
    long:int = 0
    while not c.empty():
        print(c.get())
        long += 1
    print(f"Longitud final de la cola : {long}")


def buscamax (c:Cola[int])->int:
    j = []
    while not c.empty():
        j.append (c.get())
    while len (j) != 1:
        if j[0] < j[1]:
            j.pop(0)
        else:
            j.pop(1)
    return j[0]


def cola()-> Cola[int]:
    c = Cola()
    c.put(1)
    c.put(2)
    c.put(3)
    return c

def aux(j:list[int])->Cola[int]:
    c = Cola()
    while len (j) < 0:
        c.put (j[0])
        j.pop (0)
    return c

def bingo ():
    p = list(range (100))
    j = []
    while len(j) < 100:
        c = random.randint(0,len (p)-1)
        j.append (p[c])
        p.pop (c)
    return aux(j)

def jugarbingo ()->int:
    return real (carton(),bingo())

def real(carton :list[int],bolillero:Cola[int])->int:
    i = 0
    while len (carton) > 0:
        if (pertenece(carton,)) == False:
            bolillero.get()
            i += 1
        else: 
            carton.pop(pertenece(carton,bolillero.get()))
            i += 1
    return i

def pertenece(s:list[int],x:int):
    i = 0
    j = 0
    while i< len (s):
        if x != s[i]:
            j += 1
            i += 1
        else: return j
    return False

def carton():
    p = list (range (100))
    j = []
    while len(j) < 12:
        c = random.randint(0,len (p)-1)
        j.append (p[c])
        p.pop (c)
    return j


print(jugarbingo())


