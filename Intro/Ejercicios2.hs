doubleMe x = x + x
-- ej 2
absoluto :: Int -> Int
absoluto a | a < 0 = -a
           | otherwise = a

maximoabsoluto :: Int -> Int -> Int
maximoabsoluto a b | absoluto(a)< absoluto(b) = absoluto(b)
                   | otherwise = absoluto(a)


maximo3 :: Int -> Int -> Int -> Int
maximo3 a b c | a>b && b>c = a
              | b>c = b
              |otherwise = c


algunoes0 :: Float -> Float -> Bool
algunoes0 a b | a == 0 = True
              | b == 0 = True
              |otherwise = False

ambos0 :: Float -> Float -> Bool
ambos0 a b = a==0 && b==0 


mismointervalo :: Float -> Float -> Bool
mismointervalo a b | a>=3 && b>=3 = True
                   | a<7 && b<7 = True
                   | a>=3 && b<7 = False
                   | a<7 && b>=3 = False
                   | otherwise = False


sumadistintos :: Int -> Int -> Int -> Int
sumadistintos a b c | a == b && b == c = 0
                    | a == b = c
                    | b == c = a
                    | a == c = b
                    |otherwise = a + b + c

esmultiplode :: Int -> Int -> Bool
esmultiplode a b | mod a b == 0 = True
                 | mod b a == 0 = True
                 | otherwise = False


digitosunidades :: Integer -> Integer
digitosunidades a = mod a 10 

digitosdecenas :: Integer -> Integer
digitosdecenas a = div(mod a 100) 10
--ej3
estanrelacionados :: Integer -> Integer -> Bool
estanrelacionados a b | a==0 = False
                  | b==0 = False
                  | mod (abs a) (abs b) == 0 = True
                  |otherwise = False
--ej4
productoint :: (Integer,Integer) -> (Integer,Integer) -> Integer
productoint (a,b) (c,d) = a*c + b*d 

todomenor :: (Float,Float) -> (Float,Float) -> Bool
todomenor (a,b) (c,d) = a<c && b<d 

distanciapuntos :: (Float,Float) -> (Float,Float) -> (Float,Float)
distanciapuntos (a,b) (c,d) = (a-c,b-d)


sumaterna :: (Float,Float,Float) -> Float 
sumaterna (a,b,c) = a + b + c 

sumarSoloMultiplos :: (Integer,Integer,Integer) -> Integer -> Integer 
sumarSoloMultiplos (a,b,c) d | mod a d == 0 && mod b d == 0 && mod c d == 0 = a + b + c
                             | mod a d == 0 && mod b d == 0 = a + b
                             | mod b d == 0 && mod c d == 0 = b + c
                             | mod a d == 0 && mod c d == 0 = a + c
                             | otherwise = 0

posPrimerPar :: (Int,Int,Int) -> Int
posPrimerPar (a,b,c) | mod a 2 == 0 = a
                     | mod b 2 == 0 = b
                     | mod c 2 == 0 = c
                     | otherwise = 4

crearPar :: x -> y -> (x,y)
crearPar x y = (x,y)

invertir :: (x,y) -> (y,x)
invertir (x,y) = (y,x)

--ej5
f :: Integer -> Integer 
f a | a <= 7 = a ^ 2
    | a > 7 = 2*a - 1

g :: Integer -> Integer
g a | mod a 2 == 0 = div a 2
    | otherwise = 3*a + 1

todosMenores :: (Integer,Integer,Integer) -> Bool
todosMenores (a,b,c) | f(a) > g(a) && f(b) > g(b) && f(c) > g(c) = True
                     | otherwise = False


--ej6
bisiesto :: Integer -> Bool
bisiesto a | mod a 400 == 0 = True
           | mod a 100 == 0 = False
           | mod a 4 == 0 = True
           | otherwise = False

--ej7
distanciaManhattan :: (Float,Float,Float) -> (Float,Float,Float) -> Float
distanciaManhattan (a,b,c) (x,y,z) = abs(a-x) + abs(b-y) + abs(c-z)

--ej8
comparar :: Integer -> Integer -> Integer
comparar a b | digitosunidades(a) + digitosdecenas(a) < digitosdecenas(b) + digitosunidades(b) = 1
             | digitosunidades(a) + digitosdecenas(a) > digitosdecenas(b) + digitosunidades(b) = -1
             | otherwise = 0

