import math



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
    

def algun0 (x:int,y:int) ->bool:
    return x == 0 or y == 0 

def ambos0 (x:int,y:int) -> bool:
    return x == 0 and y == 0 

def nombrelargo (nombre:str)->bool:
    return 3 <= len (nombre) <= 8 

def esbsiesto (x:int)->bool:
    return x % 400 == 0 or x % 4 == 0 and not x % 100 == 0


print (esbsiesto (1996))














