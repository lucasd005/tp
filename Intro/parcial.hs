division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)


formulasInvalidas :: [(String,String)] -> Bool
formulasInvalidas [] = True
formulasInvalidas ((x,y):xs) = auxinv (x,y) xs

auxinv :: (String,String) -> [(String,String)] -> Bool
auxinv _       [] = False
auxinv (a,b) ((x,x1):xs)| pertenece (a,b)((x,x1):xs) == True = True
                        | otherwise = auxinv (x,x1) xs

pertenece :: (String,String) -> [(String,String)] -> Bool
pertenece  _ [] = False
pertenece (x,y) ((a,b):xs) | x == a  ||  y == a = True
                           | x == b  || y == b = True
                           | otherwise = pertenece (x,y) xs


porcentajedevotos :: String -> [(String,String)] -> [Int] -> Float
porcentajedevotos a  ((x,x1):xs) (y:ys) = auxvotos a ((x,x1):xs) (y:ys)

auxvotos :: String -> [(String,String)] -> [Int] -> Float
auxvotos a ((x,x1):xs) (y:ys)  = division (pertenece2 a ((x,x1):xs) (y:ys)) (votostotal (y:ys))

pertenece2 :: String -> [(String,String)] -> [Int] -> Int
pertenece2 _ [] _ = 0
pertenece2 a ((x,z):xs) (y:ys)   | a == z = y 
                                 | otherwise = pertenece2 a (xs) ys

votostotal :: [Int] -> Int
votostotal [] = 0
votostotal (x:xs) = votostotal xs + x


menosvotado :: [(String,String)] -> [Int] -> String
menosvotado ((x,x1):(a,b):xs) (y:ys)  = auxmen ((x,x1):(a,b):xs) (y:ys)

auxmen :: [(String,String)] -> [Int] -> String
auxmen  [(x,x1)]  _ = x
auxmen ((x,x1):(a,b):xs) (y:z:ys) | auxvotos (x1) ((x,x1):(a,b):xs) (y:z:ys) < auxvotos b ((x,x1):(a,b):xs) (y:z:ys) = auxmen ((x,x1):xs) (y:ys)
                                  | otherwise = auxmen ((a,b):xs) (z:ys)
 



atajaronSuplentes :: [(String,String)] -> [Int] -> Int -> Int
atajaronSuplentes ((x,x1):xs) (y:ys) z = z - auxsup ((x,x1):xs) (y:ys) 

auxsup :: [(String,String)] -> [Int] ->Int
auxsup  []   _ = 0
auxsup ((x,x1):xs) (y:ys) = y + auxsup xs ys


equiposValidos :: [(String,String)] ->  Bool
equiposValidos [] = True
equiposValidos ((x,x1):xs) = auxvalidos (x,x1) xs

auxvalidos :: (String,String) -> [(String,String)] -> Bool
auxvalidos _    [] = True
auxvalidos (x,x1) ((y,y1):ys) | arpert (x,x1) ((y,y1):ys)== True = False
                              | otherwise = auxvalidos (y,y1) ys 



arpert :: (String,String) -> [(String,String)] -> Bool
arpert  _    [] = False
arpert (x,x1) ((y,y1):ys) | x == y || x1 == y1 = True
                          | otherwise = arpert (x,x1) ys 


porcentajedegoles :: String -> [(String,String)] -> [Int] -> Float
porcentajedegoles a ((x,x1):xs) (y:ys) = division (auxpor a ((x,x1):xs) (y:ys)) (suma (y:ys)) * 100

auxpor ::  String -> [(String,String)] -> [Int] -> Int
auxpor _     []       _  = 0
auxpor a ((x,x1):xs) (y:ys) | a == x1 = y 
                            | otherwise = auxpor a xs ys 

suma :: [Int] -> Int
suma [x] = x 
suma (x:xs) = x + suma xs

vallamenosvencida :: [(String,String)] -> [Int] -> String
vallamenosvencida ((x,x1):xs) (y:ys) = auxven ((x,x1):xs) (y:ys)

auxven :: [(String,String)] -> [Int] -> String
auxven  [(x,x1)] _ = x
auxven ((x,x1):(z,z1):xs) (y:b:ys) | porcentajedegoles x1 ((x,x1):(z,z1):xs) (y:b:ys) > porcentajedegoles z1 ((x,x1):(z,z1):xs) (y:b:ys) = auxven ((z,z1):xs) (b:ys)   
                                   | otherwise = auxven ((x,x1):xs) (y:ys)

relacionesValidas :: [(String,String)] -> Bool
relacionesValidas [] = True 
relacionesValidas ((x,x1):xs) | x == x1 = False
                              | otherwise = auxrelacion (x,x1) xs 

auxrelacion :: (String,String) -> [(String,String)] -> Bool
auxrelacion  _     [] = True
auxrelacion (a,b) ((x,x1):xs) | pert (a,b) ((x,x1):xs) == True = False
                              | otherwise = auxrelacion (x,x1) xs

pert :: (String,String) -> [(String,String)] -> Bool
pert _ [] = False
pert (a,b) ((x,x1):xs) | a == b = True
                       | (a,b) == (x,x1) = True
                       | (b,a) == (x,x1) = True
                       | otherwise = pert (a,b) xs

personas :: [(String,String)] -> [String]
personas [] = []
personas ((x,x1):xs) = (pert1 (auxperson ((x,x1):xs) [] )) 


auxperson :: [(String,String)] -> [String] -> [String]
auxperson [] _ = []
auxperson ((x,x1):xs) v = [x] ++ [x1] ++ auxperson xs v 


rpert :: String -> [String] -> Bool
rpert _ [] = False
rpert a (x:xs) | a == x = True
               | otherwise = rpert a xs

pert1 :: [String] -> [String]
pert1 [] = []
pert1 [x] = [x]
pert1 (x:y:xs) | rpert x (y:xs) == True = pert1 (y:xs)
               | otherwise = [x] ++ pert1 (y:xs)



amigosDe :: String -> [(String,String)] -> [String]
amigosDe _ [] = []
amigosDe a ((x,y):xs) = auxam a ((x,y):xs) []

auxam :: String -> [(String,String)] -> [String] -> [String]
auxam _ [] v = []
auxam a ((x,x1):xs) v | a == x = [x1] ++ auxam a xs v
                      | a == x1 = [x] ++ auxam a xs v
                      | otherwise = auxam a xs v 


personaConMasAmigos :: [(String,String)] -> String
personaConMasAmigos [] = []
personaConMasAmigos ((x,x1):xs) = auxmore (auxperson ((x,x1):xs) []) ((x,x1):xs)

auxmore :: [String] -> [(String,String)] -> String
auxmore  [x] _ = x
auxmore (x:y:xs) ((a,b):ys)| longitud (amigosDe x ((a,b):ys) ) > longitud (amigosDe y ((a,b):ys)) = auxmore (x:xs) ((a,b):ys)
                           | otherwise = auxmore (y:xs) ((a,b):ys)
longitud :: [String] -> Int
longitud [] = 0 
longitud (x:xs) = 1 + longitud xs 



