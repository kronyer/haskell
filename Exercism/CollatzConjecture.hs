
collatz :: Integer -> Maybe Integer
collatz n 
    | n <= 0 = Nothing
    | n == 1 = Just 0
    | even n    = fmap (+1) (collatz (n `div` 2))
    | otherwise = fmap (+1) (collatz (3 * n + 1))


collatz' :: Integer -> Integer
collatz' 1 = 0
collatz' n
    --Take any positive integer n
    | n <= 0    = error "n deve ser positivo"
    --f n is even, divide n by 2 to get n / 2, also add 1 to the count of steps
    | even n    = 1 + collatz' (n `div` 2)
    --If n is odd, multiply n by 3 and add 1 to get 3n + 1, also add 1 to the count of steps
    | otherwise = 1 + collatz' (3 * n + 1)