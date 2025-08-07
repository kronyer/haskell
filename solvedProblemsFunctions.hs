
absValue :: Int -> Int
absValue x
    | x < 0 = -x
    | otherwise = x

power :: Int -> Int -> Int
power x y
    | x == 0 = 1
    | otherwise = x ^ y
        

power' :: Int -> Int -> Int
power' _ 0 = 1
power' x n = x ^ n