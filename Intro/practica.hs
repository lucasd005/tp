relacionesValidas :: [(String,String)] -> Bool
relacionesValidas [] = True
relacionesValidas ((x,x1):xs) = auxrelaciones (x,x1) xs

pertenecep :: (String, String) -> [(String, String)] -> Bool
pertenecep _ [] = False
pertenecep (a,b) ((c,d):ys) | (a,b) == (c,d) = True
                            | (a,b) == (d,c) = True 
                            | otherwise = pertenecep (a,b) ys

auxrelaciones :: (String,String) -> [(String,String)] -> Bool
auxrelaciones _ [(y,y1)] = True
auxrealciones (x,x1) ((y,y1):ys) | pertenecep (x,x1) ((y,y1):ys) == True = False
                                 | otherwise = auxrelaciones (y,y1) ys



personas :: [(String,String)] -> [String]
personas  ((x,x1):xs) = auxpersona (aplanar ((x,x1):xs) [])

auxpersona :: [String] -> [String]
auxpersona    [] = []
auxpersona    [x] =[x]
auxpersona  (x:y:ys) | pertenece2 x (y:ys) == True = [x] ++ auxpersona (sacarp x (y:ys)) 
                     | otherwise = [x] ++ auxpersona (y:ys)

aplanar :: [(String,String)] -> [String] -> [String]
aplanar     []      vacia = []
aplanar ((x,x1):xs) vacia = [x] ++ [x1] ++ aplanar xs []

pertenece2 :: String -> [String] -> Bool
pertenece2 _   [] = False
pertenece2 x (y:ys) | x == y = True
                    | otherwise = pertenece2 x ys

sacarp :: String -> [String] -> [String]
sacarp _    []  = []  
sacarp x (y:ys) | x == y = sacarp y ys 
                | otherwise = [x] ++ sacarp y ys

amigosDe :: String -> [(String, String)] -> [String]
amigosDe x ((y,y1):ys) = auxamigos x ((y,y1):ys)

auxamigos :: String -> [(String,String)] -> [String]
auxamigos x [] = []
auxamigos x ((y,y1):ys) | x == y = [y1] ++ auxamigos x ys
                        | x == y1 = [y] ++ auxamigos x ys 
                        | otherwise = auxamigos x ys

masamigos :: [(String,String)] -> String
masamigos ((x,y):xs) = (auxmas(aplanar ((x,y):xs) []) ((x,y):xs))  

longitud :: [String] -> Integer
longitud [] = 0
longitud (x:xs) = longitud xs + 1


auxmas :: [String] -> [(String,String)] -> String
auxmas [x] _ = x 
auxmas (x:y:xs) ((a,b):ys) | longitud (amigosDe x ((a,b):ys)) >= longitud (amigosDe y ((a,b):ys)) = auxmas (x:xs) ((a,b):ys)
                           | otherwise = auxmas (y:xs) ((a,b):ys)