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

print(reverso("guia8.py"))

