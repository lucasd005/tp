def elrep (s):
    i = 0
    j = 1
    n = ""
    while i < len (s):
        if j >= (len (s)):
            n += s[i]
            i += 1
            j = 1 + i
        if s[i] == s[j]:
            i += 1
            j -= j+i
        else:
            j+=1
    return n
#inout??

def notas (notas:list[int]):
    i:int = 0
    j:int = 0
    condicion:str = "aprobado"
    while i < len (notas):
        if notas [i] < 4:
            condicion = "desaprobado"
            return condicion
        if notas [i] >= 4:
            j += (notas [i] / (len(notas)))
            i += 1
    if j >= 7:
        condicion = "promocion"
    return condicion

def listo ()->list[str]:
    j:list[str] = []
    nombre:str = input ("nombre\n")
    while nombre != "listo":
        j.append (nombre)
        nombre = input("nombre\n")
    return j

def SUBE ():
    eleccion:str = input ("C,R,X")
    historial:list[tuple ["str",int]] = []
    cuanto:str = input ("cuanto?")
    while eleccion != "X":
        if eleccion == "C":
            historial.append ("C",cuanto)
        if eleccion == "R":
            historial.append ("R",cuanto)
    return historial





print(SUBE())



