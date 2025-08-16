-- head and last

-- head :: [a] -> a
-- head [] = error "Empty list"
-- head (x:xs) = x

-- last :: [a] -> a
-- last [] = error "Empty list"
-- last [x] = x
-- last (_:xs) = last xs

-- so head [1, 2, 3] results in 1
-- and last [1, 2, 3] results in 3



-- Tail and init
-- tail :: [a] -> [a]
-- tail [] = error "Empty list"
-- tail (_:xs) = xs

-- init :: [a] -> [a]
-- init is the list without the last element


-- tail [1, 2, 3] results in [2, 3]
-- and init [1, 2, 3] results in [1, 2]


-- reverse :: [a] -> [a]
-- reverse [1,2,3,4] = [4,3,2,1]


-- length :: [a] -> Int
-- length "abc" = 3
-- length [1,2,3] = 3

--null :: [a] -> Bool
-- null [] = True
-- null (_:_) = False
-- null [1, 2, 3] results in False


--elem :: Eq a => a -> [a] -> Bool
-- elem 1 [1, 2, 3] results in True
-- elem 4 [1, 2, 3] results in False

-- (!!) :: [a] -> Int -> a
-- (xs !! n) returns the nth element of the list xs, where n is zero-based index
-- Example: [1, 2, 3] !! 0 results in 1


-- (++) :: [a] -> [a] -> [a]
-- (++) [1, 2] [3, 4] results in [1, 2, 3, 4]
-- is the concatenation operator for lists