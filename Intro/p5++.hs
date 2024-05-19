type Punto2D = (Float,Float)

productoint :: Punto2D -> Punto2D -> Float
productoint (a,b) (c,d) = (a*c) + b*d

todomenor :: Punto2D -> Punto2D -> Bool
todomenor (a,b) (c,d) = a<c && b<d 


type Cordenada = (Float, Float)

crearPar :: Float -> Float -> Cordenada
crearPar a b = (a,b)

--ej 2 

type Año = Integer
type EsBisiesto = Bool

bisiesto :: Año -> EsBisiesto
bisiesto a | mod a 400 == 0 = True
           | mod a 100 == 0 = False
           | mod a 4 == 0 = True
           | otherwise = False


--ej 3
type Cordenada3D = (Float,Float,Float)

distanciaManhattan :: Cordenada3D -> Cordenada3D -> Float 
distanciaManhattan (a,b,c) (x,y,z) = abs (a-x) + abs (b-y) + abs (c-z)


--ej 4

type Texto = [Char]
type Nombre = Texto
type Telefono = Texto
type Contacto = (Nombre, Telefono)
type ContactosTel = [Contacto]


enLosContactos :: Nombre -> ContactosTel -> Bool
enLosContactos _  [] = False
enLosContactos a ((x,x1):xs) | a == x = True
                             | otherwise = enLosContactos a xs



agregarContacto :: Contacto -> ContactosTel -> ContactosTel
agregarContacto (a,b) ((x,x1):xs) | pertenece (a,b) ((x,x1):xs) == True = ((x,x1):xs)
                                  | otherwise =  [(a,b)] ++ ((x,x1):xs)

pertenece :: Contacto -> ContactosTel -> Bool
pertenece _ [] = False
pertenece (a,b) ((x,x1):xs) | (a,b) == (x,x1) = True
                            | otherwise = pertenece (a,b) xs




auxelim :: Nombre -> ContactosTel -> ContactosTel
auxelim _ [] = []
auxelim a ((x,x1):xs) | pertenece1 a (x,x1) == True = xs
                      | otherwise = [(x,x1)] ++ auxelim a xs

pertenece1 :: Nombre -> Contacto -> Bool
pertenece1 a (x,y) | a == x = True
                   | otherwise = False


--Ej 5

type Identificacion = Integer
type Ubicacion = Texto
type Estado = (Disponibilidad, Ubicacion)
type Locker = (Identificacion, Estado)
type MapaDeLockers = [Locker]
data Disponibilidad = Libre | Ocupado deriving (Eq, Show)

existeElLocker :: Identificacion -> MapaDeLockers-> Bool
existeElLocker _  [] = False
existeElLocker  a ((x,x1):xs) | a == x = True
                              | otherwise = existeElLocker a xs 

ubicacionDelLocker :: Identificacion -> MapaDeLockers -> Ubicacion
ubicacionDelLocker a  (((x,(x1,x2)):xs)) | a == x = x2
                                         | otherwise = ubicacionDelLocker a xs


estaDisponibleelLocker :: Identificacion -> MapaDeLockers -> Bool
estaDisponibleelLocker _ [] = False
estaDisponibleelLocker a (((x,(x1,x2)):xs)) | a == x && x1 == Libre = True
                                            | otherwise = estaDisponibleelLocker a xs

ocuparLocker :: Identificacion -> MapaDeLockers -> MapaDeLockers
ocuparLocker a (((x,(x1,x2)):xs)) | a == x && x1 == Libre = cambioEpico (((x,(x1,x2)):xs))
                                  | otherwise = ocuparLocker a (((x,(x1,x2)):xs))

cambioEpico :: MapaDeLockers -> MapaDeLockers
cambioEpico (((x,(x1,x2)):xs)) = (((x,(Ocupado,x2)):xs))

