absValue :: Int -> Int
absValue x
    | x < 0 = -x
    | otherwise = x

-- guarded version
power :: Int -> Int -> Int
power x y
    | x == 0 = 1
    | otherwise = x ^ y
        
--Pattern matching version
power' :: Int -> Int -> Int
power' _ 0 = 1
power' x n = x ^ n

--guarded version with recursion
power'' :: Int -> (Int -> Int)
power'' _ 0 = 1 --base
power'' x p 
    | even p = n * n
    | otherwise = x * n * n
    where -- local definition
        n = power'' x (p `div` 2) -- infix call, it means the same as div p 2

isPrime :: Int -> Bool
isPrime n
    | n < 2 = False
    -- no otherwise checo se é nullo a lista: de x, tal que x é todo o numero de 2 até a raiz quadrada de n, e n é divisível por x. Portanto, se a lista for vazia, não há nenhum divisor entre ele e a sua raiz quadrada, logo é primo
    | otherwise = null [x | x <- [2..sqrtN], n `mod` x == 0]
    where
        sqrtN = floor . sqrt . fromIntegral $ n


-- this another function O(n) is not the best way to check if a number is prime, but it is a good example of recursion
isPrime' :: Int -> Bool
-- two base cases
isPrime' 0 = False
isPrime' 1 = False

--here it checks recursively if the number has a divisor
-- it is a tail recursion, because the last operation is the recursive call
-- it checks  until it finds a divisor or reaches 1
isPrime' x = hasDivisor(x-1)
    where 
        hasDivisor :: Int -> Bool
        hasDivisor 1 = False -- 1 não é divisor de nenhum número
            --hot switch?
        hasDivisor n = x `mod` n == 0 || hasDivisor (n-1)


fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

fibonacci' :: Int -> Int
fibonacci' x
    | x == 0 = 0
    | x == 1 = 1
    | otherwise = fibonacci (x-1) + fibonacci (x-2)


