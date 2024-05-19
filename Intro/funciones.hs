esPar :: Int -> Bool
esPar 0 = True
esPar n = not (esPar (n-1))