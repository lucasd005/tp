--ej1
fibonacci :: Integer -> Integer
fibonacci a | a == 0 = 0
            | a == 1 = 1 
            |  otherwise = fibonacci(a-1) + fibonacci(a-2)

--ej2
parteentera :: Float -> Integer
parteentera a | abs(a) < 1  = 0
              | a > 0 = - parteentera (abs (a) - 1)
              | otherwise = parteentera(a-1) + 1

--ej3
-- especificacion : problema esdivisible (n,k:N) : B
-- Requiere (N >= k)
-- Asegura (res = True <->  n es divisble por k)
esdivisible :: Integer -> Integer -> Bool
esdivisible a b | b == 0 = False
                | (a >= b) = esdivisible (a-b) b
                | (a < b) && (a < 0) = False
                | (a == 0) = True



--ej4
sumaimpares :: Integer -> Integer
sumaimpares a | a == 1 = 1
              | mod a 2 == 0 = sumaimpares (a-1) + 2*a -1
              | otherwise = sumaimpares (a-1) + 2*a - 1


--ej5
mediofact :: Integer -> Integer 
mediofact a | a == 1 = 1 
            | a <= 0 = 1 
            | otherwise = mediofact (a-2) * a


--ej6
sumadigitos :: Integer -> Integer
sumadigitos a | a <= 0 = 0
              | otherwise = sumadigitos (div (a -mod a 10) 10 ) + mod a 10


--ej7
todosdigitosiguales :: Integer -> Bool
todosdigitosiguales a | a < 10 = True
                      | otherwise = mod a 10 == mod (div a 10) 10 && todosdigitosiguales(div a 10)

--ej8
iesimodigito :: Integer -> Integer -> Integer
iesimodigito a b | a < 0 && b < 1 = 0
                 | otherwise = mod (div a (10^(b - 1)) ) 10



cantdigitos :: Integer -> Integer
cantdigitos a | a < 10 = 1
              | otherwise = 1 + cantdigitos(div a 10)

     

--ej 9
esCapicua :: Integer -> Bool
esCapicua a = a == invertirNum a

invertirNum :: Integer -> Integer
invertirNum 0 = 0
invertirNum x = (mod x 10) * (10^((cantdigitos x) -1)) + invertirNum(div x 10)
           

 
--ej 10
sumatoriaA :: Integer -> Integer
sumatoriaA a | a == 0 = 1
             | otherwise = sumatoriaA (a-1) + 2^a 

sumatoriaB :: Integer -> Integer -> Integer
sumatoriaB a b | a == 0 = 0
               | b == 0 = 0
               | otherwise = sumatoriaB (a-1) b + b^a

sumatoriaC :: Integer -> Integer -> Integer
sumatoriaC a b| a == 0 = 0
              | b <= 0 = 0
              | otherwise = sumatoriaC (a-1) b + b^(2*a) + b^(2*a - 1)

sumatoriaD :: Integer -> Integer -> Integer
sumatoriaD a b | a == 0 = 0
               | b <= 0 = 0
               | otherwise = sumatoriaD (a-1) b + b^(2*a) + b^(2*a - 1)

--ej 11
eAprox :: Float -> Float
eAprox a | a == 0 = 1
         | otherwise = eAprox (a - 1) + ffactorial a



ffactorial :: Float -> Float
ffactorial a | a == 0 = 1
             | otherwise = ffactorial(a - 1)*(1/a)



--ej 12
raizde2Aprox :: Float -> Float
raizde2Aprox a | a == 1 = 1
               | otherwise = 1 + (1)/(1 + raizde2Aprox(a-1))
 


--ej 13
funcionrara :: Integer -> Integer ->Integer
funcionrara a b | a == 0 = 0
                | b == 0 = 1
                | a == 1 = 1
                | otherwise = suma2 a b + funcionrara (a-1) b 

suma2 :: Integer -> Integer -> Integer
suma2 a b | b == 0 = 1
          | otherwise = suma2 a (b-1) + a^b

--ej 14 
sumapotencias :: Integer -> Integer -> Integer -> Integer
sumapotencias a b c | a == 0 = 0
                    | b == 0 && c == 0  = 1
                    | otherwise =  sumapotencias a (b-1) (c-1) + a^ (b + c) + sumapotencias2 a b c + sumapotencias3 a b c


sumapotencias2 :: Integer -> Integer -> Integer -> Integer
sumapotencias2 a b c | b == 0 = a^c 
                     | otherwise = sumapotencias2 a (b-1) c + a^(b + c)

sumapotencias3 :: Integer -> Integer -> Integer -> Integer
sumapotencias3 a b c | c == 0 = a^b
                     | otherwise = sumapotencias3 a b (c-1) + a^(b + c)

--ej 15
sumaRacionales :: Float -> Float -> Float
sumaRacionales a b | a == 0 = 0
                   | otherwise = sumaRacionales (a-1) b + a /sumaR b

sumaR :: Float -> Float
sumaR a | a == 0 = 0
        | otherwise = sumaR(a - 1) + a

--ej 16
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


sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos a b  = sonCoprimosa a b 2 

sonCoprimosa :: Integer -> Integer -> Integer -> Bool
sonCoprimosa a b c | c == b = False
                   | mod a c == 0 && mod b c == 0 = True
                   | otherwise = sonCoprimosa a b (c + 1) 

nesimoPrimo :: Integer -> Integer
nesimoPrimo a = rnesimoPrimo a 2 

rnesimoPrimo :: Integer -> Integer -> Integer 
rnesimoPrimo a b | a == 0 =  (b - 1)
                 | menorDivisor b == b = rnesimoPrimo (a-1) (b+1)
                 | otherwise = rnesimoPrimo a (b+1) 

--ej 17
esfibonacci :: Integer -> Bool
esfibonacci a = cesfibonacci a 1 


cesfibonacci :: Integer -> Integer -> Bool
cesfibonacci a b | fibonacci b > a = False
                 | fibonacci b == a = True
                 | otherwise = cesfibonacci a (b + 1)

--ej 18

 
mayorDigitoPar :: Integer -> Integer 
mayorDigitoPar a | a < 10 = a
                 | mod a 2 /= 0 = mayorDigitoPar (div a 10)
                 | mod a 10 > mod (div a 10) 10 = mayorDigitoPar ((div a 10) - (mod (div a 10) 10) + (mod a 10))
                 | otherwise = mayorDigitoPar (div a 10)


--ej 19

esSumaInicialdePrimos :: Integer -> Bool
esSumaInicialdePrimos a = esSumaInicialdePrimosAux a 1 0

esSumaInicialdePrimosAux :: Integer -> Integer -> Integer -> Bool
esSumaInicialdePrimosAux a b c | a == c = True
                               | c > a = False
                               | otherwise = esSumaInicialdePrimosAux a (b+1) (c + nesimoPrimo b) 

--ej 20

--tomaValorMax :: Integer -> Integer -> Integer
--tomaValorMax a b |

--ej 21
pitagoras :: Integer -> Integer -> Integer -> Integer
pitagoras a b c | a == 0 || b == 0 || c == 0 = 0
                | b == (-1) = (pitagorasAux 1 b c 0)
                | otherwise = pitagorasAux a b c 0 + (pitagoras (a-1) b c) 



pitagorasAux :: Integer-> Integer -> Integer -> Integer -> Integer
pitagorasAux a b c d | b == (-1) = d
                     | a^2 + b^2 <= c^2 = pitagorasAux a (b-1) c (d+1)
                     | otherwise = pitagorasAux a (b-1) c d
-- :l Guia4.hs








