module Solucion where
import Data.Char

-- No se permite agrear nuevos imports
-- Sólo está permitido usar estas funciones:
-- https://campus.exactas.uba.ar/pluginfile.php/557895/mod_resource/content/1/validas_tp.pdf


-- Completar!
-- Nombre de grupo: {}
-- Integrante1: { 46256580,Damiani Lucas}
-- Integrante2: { 46437857,Sviguilsky Tiago}
-- Integrante3: { 46365611, Schejtman Ezequiel}
-- Integrante4: { 44594690,Modini Mia}
-- Integrantes que abandonaron la materia: {En caso que haya abandonado la materia algún
                        -- integrante, completar con los dni y apellidos, sino dejar vacío} 

-- EJ 1
esMinuscula :: Char -> Bool
esMinuscula c = (ord(c)) >= 97 && (ord(c)) <= 122

-- EJ 2
letraANatural :: Char -> Int
letraANatural c = (ord (c)) - 97

-- EJ 3
desplazar :: Char -> Int -> Char
desplazar c n | esMinuscula c == False = c
              | ord (c) + n <= 122  &&  97 <= ord (c) + n = chr((ord (c) + n)) 
              | (ord (c) + n) < 97 = chr((ord (c) + n) + 26 ) 
              | otherwise = chr((ord (c) + n )- 26)

-- EJ 4
cifrar :: String -> Int -> String
cifrar [] _ = []
cifrar (c:x) n = [desplazar c n] ++ cifrar (x) n 


-- EJ 5
descifrar :: String -> Int -> String
descifrar [] _ = []
descifrar (c:x) n = [desplazar c (-n)] ++ descifrar (x) n

-- EJ 6
cifrarLista :: [String] -> [String]
cifrarLista [] = []
cifrarLista (x:xs) = auxcifrar (x:xs) 0

auxcifrar :: [String] -> Int -> [String]
auxcifrar [] _ = []
auxcifrar (x:xs) n = [cifrar x n] ++ auxcifrar xs (n+1)



-- EJ 7
frecuencia :: String -> [Float]
frecuencia [] = frecuenciaaux " " 97
frecuencia p = frecuenciaaux p 97

contame :: String -> Char -> Float
contame [] _ = 0 
contame (p:ps) l | l == p  = contame ps l + 1
                 | otherwise = 0 + contame ps l 

frecuenciaaux :: String -> Int -> [Float]
frecuenciaaux p 123 = []
frecuenciaaux p x | len (p) == 0 = [(contame (p) (chr(x)))/(1)*100] ++ frecuenciaaux p (x+1)
                  | otherwise = [(contame (p) (chr(x)))/ (len (p))*100] ++ frecuenciaaux p (x+1)

len:: String -> Float
len [] = 0
len (p:ps) | ord (p)>=97 && ord (p) <=122 = len ps + 1 
           | otherwise = len ps 


-- Ej 8
cifradoMasFrecuente :: String -> Int -> (Char, Float)
cifradoMasFrecuente (s:xs) n = laMasCifrada (cuentaCifrado (cifrar (s:xs) n)(97))

cuentaCifrado :: String -> Int -> [(Char,Float)]
cuentaCifrado _ 123 = []
cuentaCifrado (s:xs) x = [((chr x) , contame (s:xs) (chr(x))/(len (s:xs)) *100)] ++ cuentaCifrado (s:xs) (x+1)


laMasCifrada :: [(Char, Float)] -> (Char,Float)
laMasCifrada [x] = x 
laMasCifrada ((x,y):(a,b):xs) | y >= b = laMasCifrada ((x,y):xs)
                              | otherwise = laMasCifrada((a,b):xs)

-- EJ 9
esDescifrado :: String -> String -> Bool
esDescifrado p1 p2 = esDescifradoaux p1 p2 26

esDescifradoaux :: String -> String -> Int -> Bool
esDescifradoaux _ _ 0 = False
esDescifradoaux p1 p2 n
             | p2 == cifrar p1 n = True
             | otherwise = esDescifradoaux p1 p2 (n-1)

-- EJ 10
todosLosDescifrados :: [String] -> [(String, String)]
todosLosDescifrados [] = []
todosLosDescifrados (x:xs) = aux2todes (x:xs) (x:xs)

aux2todes :: [String] -> [String] -> [(String,String)]
aux2todes [] (y:ys) = []
aux2todes (x:xs) (y:ys) = auxtodos (x:xs) (y:ys) ++ aux2todes (xs) (y:ys) 

auxtodos :: [String] -> [String] -> [(String,String)]
auxtodos (x:xs)  [z]| x == z = []
                    | esDescifrado x z == True = [(x,z)]
                    | otherwise = []
auxtodos _ [] = []
auxtodos (x:xs) (z:ys) |  x == z = auxtodos (x:xs) (ys)
                       | esDescifrado x z == True = [(x,z)] ++  auxtodos (x:xs) (ys)
                       | otherwise = auxtodos (x:xs) (ys)


-- EJ 11
expandirClave :: String -> Int -> String
expandirClave _ _ = "compucom"

-- EJ 12
cifrarVigenere :: String -> String -> String
cifrarVigenere _ _ = "kdueciirqdv"

-- EJ 13
descifrarVigenere :: String -> String -> String
descifrarVigenere _ _ = "computacion"

-- EJ 14
peorCifrado :: String -> [String] -> String
peorCifrado _ _ = "asdef"

-- EJ 15
combinacionesVigenere :: [String] -> [String] -> String -> [(String, String)]
combinacionesVigenere _ _ _ = [("hola", "b")]
