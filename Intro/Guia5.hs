-- :l Guia5.hs
longitud ::(Eq t) => [t] -> Integer 
longitud [] = 0
longitud (x:xs) = longitud (tail (x:xs)) + 1

ultimo ::(Eq t) => [t] -> t
ultimo [x] = x
ultimo (x:xs) = ultimo (tail(x:xs))

principio :: [t] -> [t]
principio [x] = []
principio (x:xs) = [x] ++ principio (tail (x:xs))

reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = reverso (tail (x:xs)) ++ [x]

--ej 2
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece y (x:xs) | y == x = True
                   | otherwise = pertenece y xs

todosiguales :: (Eq t) => [t] -> Bool
todosiguales (x:xs) | (x:xs) == [x] = True
                    | x == head(xs) = todosiguales xs 
                    | otherwise = False

todosdistintos :: (Eq t) => [t] -> Bool
todosdistintos (x:xs) | (x:xs) == [x] = True 
                      | pertenece x xs == True = False
                      | otherwise = todosdistintos (tail(x:xs))

hayrepetidos :: (Eq t) => [t] -> Bool
hayrepetidos (x:xs) = not(todosdistintos (x:xs))

quitartodo :: (Eq t) => t -> [t] -> [t]
quitartodo _ [] = []
quitartodo a (x:xs) | a == x = quitartodo a xs
                    | otherwise = [x] ++ quitartodo a xs

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar a (x:xs) | a == x = xs
                | otherwise = [x] ++ quitar a xs


eliminarrepetidos :: (Eq t) => [t] -> [t] 
eliminarrepetidos [] = []
eliminarrepetidos (x:xs) | pertenece x (x:xs) == True = [x] ++ eliminarrepetidos (quitartodo x (x:xs))
                         | otherwise = [x] ++ eliminarrepetidos xs


mismoselementos1 :: (Eq t) => [t] -> [t] -> Bool
mismoselementos1 [] _ = True
mismoselementos1 _  [] = True
mismoselementos1 (x:xs) (y:ys) | pertenece x (y:ys) == False =  False 
                               | otherwise = mismoselementos1 xs (y:ys) 


mismoselementos :: (Eq t) => [t] -> [t] -> Bool
mismoselementos (x:xs) (y:ys) | mismoselementos1 (x:xs) (y:ys) == True = mismoselementos1 (y:ys) (x:xs)
                              | otherwise = False


capicua :: (Eq t) => [t] -> Bool
capicua (x:xs) = (x:xs) == reverso (x:xs)                         


--ej 3

problemasumatoria :: [Integer] -> Integer
problemasumatoria [x] = x
problemasumatoria (x:xs)= problemasumatoria xs + x


problemaproductoria :: [Integer] -> Integer
problemaproductoria [x] = x
problemaproductoria (x:xs)= problemaproductoria xs *x

maximo :: [Integer] -> Integer
maximo [y] = y
maximo (y:x:xs) | y >= x =  maximo (y:xs)
                | otherwise = maximo (x:xs)

sumarN :: Integer -> [Integer] -> [Integer]
sumarN a (x:xs) | (x:xs) == [x] = [x+a]
                | otherwise = [x+a] ++ sumarN a (xs) 

sumarelprimero :: [Integer] -> [Integer]
sumarelprimero (x:xs) = (auxsumar1 (x:xs) x)

auxsumar1 :: [Integer] -> Integer -> [Integer]
auxsumar1 (x:xs) a | (x:xs) == [x] = [x+a] 
auxsumar1 (x:xs) a | otherwise = [x+a] ++ auxsumar1 xs a  

sumarelultimo :: [Integer] -> [Integer]
sumarelultimo (x:xs) = reverso(auxsumar3 (reverso(x:xs))) 

auxsumar3 :: [Integer] -> [Integer]
auxsumar3 (x:xs) = (auxsumar2 (x:xs) x)

auxsumar2 :: [Integer] -> Integer -> [Integer]
auxsumar2 (x:xs) a | (x:xs) == [x] = [x+a] 
auxsumar2 (x:xs) a | otherwise = [x+a] ++ auxsumar2 xs a  

pares :: [Integer] -> [Integer]
pares (x:xs) = auxpares (x:xs) 2

auxpares :: [Integer] -> Integer -> [Integer]
auxpares [] _ = []
auxpares (x:xs) a | mod x a == 0 = [x] ++ auxpares xs a
                  | otherwise = auxpares xs a


multiplosden :: Integer -> [Integer] -> [Integer]
multiplosden a (x:xs) = auxpares (x:xs) a 

ordenar :: [Integer] -> [Integer]
ordenar (y:x:xs) = auxordenar (y:x:xs)

auxordenar :: [Integer] -> [Integer]
auxordenar [x] = [x]
auxordenar [y] = [y]
auxordenar (y:x:xs)  | maximo (y:x:xs) == y = auxordenar (x:xs) ++ [y]
                     | maximo (y:x:xs) == x = auxordenar (y:xs) ++[x]
                     | y <= x = auxordenar ((y:xs) ++ [x])
                     | y > x = auxordenar ((x:xs) ++ [y])


--ej 4


sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (x:xs)   | x == ' ' && pertenece x (x:xs) = [x] ++ sacarBlancosRepetidos(quitartodo (' ') (xs))
                               | otherwise = [x] ++ sacarBlancosRepetidos xs

contarpalabras :: [Char] -> Integer
contarpalabras (x:xs) = auxcontar (sacar1 (x:xs))


auxcontar :: [Char] -> Integer
auxcontar [] = 1
auxcontar (x:xs)| x == ' ' = auxcontar (xs) + 1
                | otherwise = auxcontar (xs)

sacarB :: [Char] -> [Char] 
sacarB [] = []
sacarB [' '] = []
sacarB (x:y:xs) | x == ' ' && y /= ' ' = [x] ++ [y] ++ sacarB xs 
                | x == ' ' && y == x = sacarB (x:xs)
                | x /= ' ' && y == ' ' = [x] ++ sacarB (y:xs)
                | otherwise = [x] ++ [y] ++ sacarB xs 

sacar1 :: [Char] -> [Char]
sacar1 (x:xs)| (x:xs) == (' ':xs) = sacarB xs
             | otherwise = sacarB (x:xs)  


palabras :: [Char] -> [[Char]]
palabras [] = []
palabras (x:xs) = auxpal2 (sacar1(x:xs)) []

auxpal2 :: [Char] -> [Char] -> [[Char]]
auxpal2 [] palabra = [palabra]
auxpal2 (x:xs) palabra | x /= ' ' = auxpal2 xs (palabra ++ [x])
                       | otherwise = [palabra] ++ (auxpal2 xs [])


palabramaslarga :: [Char] -> [Char]
palabramaslarga (x:xs) = palabramaslarga1 (palabras(x:xs)) 

palabramaslarga1 :: [[Char]] -> [Char]
palabramaslarga1 [x] = x
palabramaslarga1 (x:y:xs)| longitud (x) >= longitud (y) = palabramaslarga1 ([x] ++ xs)
                         | otherwise = palabramaslarga1 ([y] ++ xs)


aplanar :: [[Char]] -> [Char]
aplanar  [] = []
aplanar (x:xs) = x ++ aplanar xs

aplanarconb :: [[Char]] -> [Char]
aplanarconb [] = []
aplanarconb (x:xs) = x ++ [' '] ++ aplanarconb xs 

aplanarconn :: [[Char]] -> Integer -> [Char]
aplanarconn [] _ = []
aplanarconn (x:xs)  n | n == 0 = aplanar (x:xs)
                      | otherwise = x ++ [' '] ++ aplanarconn xs (n-1)

--ej5 
sumacum :: (Num t) => [t] -> [t]
sumacum [x] = [x]
sumacum (x:y:xs) = [x] ++ sumacum (y+x:xs) 


descomponerenprimos :: [Integer] -> [[Integer]]
descomponerenprimos (x:xs) = auxpri (x:xs) []

auxpri :: [Integer] ->[Integer] -> [[Integer]]
auxpri [] numero = []
auxpri (x:xs) numero = [descompon x] ++ auxpri xs (numero) 

descompon :: Integer -> [Integer]
descompon x | x == 2 = [2]
            | esPrimo(div x (menorDivisor x)) == True = [menorDivisor x ] ++ [div x (menorDivisor(x))]
            | otherwise = [menorDivisor x ] ++ descompon (div x 2)
 
menorDivisor :: Integer -> Integer 
menorDivisor a = rmenorDivizor a 2

rmenorDivizor :: Integer -> Integer -> Integer
rmenorDivizor a b | b == a = a
                  | mod a b == 0 = b
                  | otherwise = rmenorDivizor a (b + 1) 

esPrimo :: Integer -> Bool
esPrimo a = resPrimo a 2

resPrimo :: Integer -> Integer -> Bool
resPrimo a b | b == a = True
             | mod a b == 0 = False
             | otherwise = resPrimo a (b + 1)



