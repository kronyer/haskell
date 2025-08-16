
-- O(n^2) recursive implementation of factorial
fat :: Integer -> Integer
fat n
    | n ==0 = 1
    | n > 0 = n * fat (n - 1)
    | otherwise = error "Negative number"

fatTail :: Integer -> Integer
fatTail n = fatAux n 1
  where
    fatAux 0 acc = acc
    fatAux k acc
      | k > 0     = fatAux (k - 1) (k * acc)
      | otherwise = error "Negative number"