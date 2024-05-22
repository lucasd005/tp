import Data.Char
expandirClave :: String -> Int -> String
expandirClave (x:xs) y = expandirClaveaux (x:xs) (x:xs) y 


expandirClaveaux :: String -> String -> Int -> String
expandirClaveaux _ _ 0 = []
expandirClaveaux [] (y:ys) z = expandirClaveaux (y:ys) (y:ys) z
expandirClaveaux (x:xs) (y:ys) z| length(x:xs) /= 0 = [x] ++ expandirClaveaux xs (y:ys) (z-1)
                                | otherwise = expandirClaveaux (y:ys) (y:ys) z

cifrarVigenere :: String -> String -> String
cifrarVigenere (x:xs) (y:ys) = aux2 (x:xs) (cifrarVigenereaux (x:xs) (y:ys)) 


cifrarVigenereaux :: String -> String -> String
cifrarVigenereaux (x:xs) (y:ys) = expandirClave (y:ys) (length(x:xs))

aux2 :: String -> String -> String
aux2 [] _ = []
aux2 _ [] = []
aux2 (x:xs) (y:ys) = desplazar x ((ord y) - 97) : aux2 (xs) (ys) 


desplazar :: Char -> Int -> Char
desplazar c n | ord (c) + n <= 122  &&  97 <= ord (c) + n = chr((ord (c) + n)) 
              | (ord (c) + n) < 97 = chr((ord (c) + n) + 26 ) 
              | otherwise = chr((ord (c) + n )- 26)







