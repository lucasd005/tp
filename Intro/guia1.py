import math

#ej 1
def imprimir_hola_mundo():
    print ("Hola Mundo")

def imprimirunverso ():
    print ("gordo haskell")


def raizDe2():
    return round (2**0.5,ndigits=4)
  
def fact2()->int:
    return 2*1

def perimetro():
    return 2*(math.pi) 

#ej2

def imprimirsaludo(nombre:str):
    print ("hola " + nombre)

def raizcuadrada (numero:int):
    return math.sqrt(numero) 

def fahrenheitcel(f:float)->float:
    return ((f-32)*5)/9

def imprimir2veces(estribillo:str):
    return 2 * estribillo

def esmultiplo (x:int,y:int)->bool:
    return x % y == 0

def espar(x:int) ->bool:
    return esmultiplo (x,2) 

def cantdepi(comensal:int,pi:int)->int:
    return round((comensal*pi)/8+0.5,ndigits=0)
    
#ej 3

def algun0 (x:int,y:int) ->bool:
    return x == 0 or y == 0 

def ambos0 (x:int,y:int) -> bool:
    return x == 0 and y == 0 

def nombrelargo (nombre:str)->bool:
    return 3 <= len (nombre) <= 8 

def esbsiesto (x:int)->bool:
    return x % 400 == 0 or x % 4 == 0 and not x % 100 == 0

#ej 4

def pesopino(x:int)->int:
    i:int = 0
    kg:int = 0
    while i < 3 :
        kg += 300 
        i += 1
    while i >= 3 and i < x:
        kg += 200
        i += 1
    if i > x :
        return kg

def espesoutil (x:int)->bool:
    return 400 <= x and x<= 1000


def sirvepino (x:int)->bool:
    return espesoutil(pesopino(x))

#ej 5

def devolverdoblepar (x:int)->int:
    if x % 2 == 0:
        return x*2
    else:
        return x

def devolverpar (x:int)->int:
    if x % 2 == 0:
        return x*2
    else:
        return x + 1

def mult3y9 (x:int)-> int:
    if x % 9 == 0:
        return 3*x
    if x % 3 == 0:
        return 2*x
    return x

def lindoname(nombre:str) ->str:
    if len (nombre) >=5 :
        return ("Tu nombre tiene muchas Letras")
    return "Nombre de mierda"

def rango (x:int)->str:
    if x > 10 :
        print ("menor a 10" )
    if 10 <= x and x <= 20:
        print ("esta entre 10 y 20")
    print ("mayor a 20")

def jubilados (sexo:str,y:int)->str:
    if sexo == "M" and 18<= y and y < 65:
        print ("anda a laburar") 
    if sexo == "M" and 18<= y and y < 60:
        print ("anda a labuar")
    return ("vacaciones")

#ej 6

def numeros():
    i:int = 1
    while i<= 10:
        print (i)
        i += 1
    
def pares():
    i:int = 10
    while i<= 40:
        print (i)
        i += 2

def eco():
    i:int = 1
    while i <= 10:
        print ("eco")
        i += 1

def cohete(x:int): 
    while x > 0 :
        print (x)
        x -= 1
    print ("despegue")


def viajetiempo(añodepartida:int,añodellegada:int)-> int:
    while añodellegada <= añodepartida:
        print ("Viajó un año al pasado, estamos en el año:" + str(añodepartida))
        añodepartida -=1
    

#ej7
def numerosf():
    i:int = 10
    for n in range (i):
        print (n+1)
        n+=1 


def paresf():
    x:int = 10
    for i in range (15):
        print (x+2)
        i:int = 10
        x += 2
        i +=2

def ecof():
    i:int = 1
    for i in range (10):
        print ("eco")
        i += 1

def cohetef(x:int):
    i:int = 0 
    for i in range (x):
        print (x)
        x -= 1
    print ("despegue")

def viajetiempof(añodepartida:int,añodellegada:int)-> int:
    i = añodellegada
    for i in range (añodellegada,añodepartida + 1):
        añodellegada = añodellegada
        print ("Viajó un año al pasado, estamos en el año:" + str(añodepartida))
        añodepartida -= 1

viajetiempof(2000,1998)


