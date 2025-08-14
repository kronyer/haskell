-- Lists (linked lists) are structured types that contains a sequence of elements, all of the same type

-- [t] denotes the type of lists of type t

-- [] denotes an empty list
-- [1,2,3] is a list of integers :: [Int]
-- ["a", "b", "c"] is a list of strings :: [String]
-- ["a", "b", "c"] is a list of characters :: [Char]
-- [(1, "one"), (2, "two")] is a list of tuples :: [(Int, String)]
-- [[1], [2, 3]] is a list of lists :: [[Int]]
-- [1..10] is a list of integers from 1 to 10 :: [Int]
-- [1, 3 .. 10] is a list of odd integers from 1 to 10 :: [Int]


-- List constructor
-- (:) is the list constructor, it adds an element to the front of a list
-- Example: 1 : [2, 3] results in [1, 2, 3]
-- The empty list is denoted by []
-- Example: 1 : [] results in [1]

-- [] :: [a] 
-- (:) :: a -> [a] -> [a]


-- The notation [14, 21, 24] is syntactic sugar for 14 : (21 : (24 : []))

-- so if l1 = 3 : 2 : 1 : [], then the construction time is O(n) where n is the length of the list
-- and the access time is O(1) for the first element, O(n) for the second element, and O(n) for the last element
-- and with we add an element to the front of the list with (:), the time complexity is O(1)


-- Using patterns to decompose lists
-- Example:

sumTest :: [Int] -> Int
sumTest [] = 0
sumTest (x:xs) = x + sumTest xs
-- the point here is to show that we can decompose a list into its head (the first element) and tail (the rest of the list)

sumTest' :: [Int] -> Int
sumTest' xs = foldr (+) 0 xs

sumTest'' :: [Int] -> Int
sumTest'' = foldr (+) 0

sumTest''' :: [Int] -> Int
sumTest''' = sum

-- Also it's possible to use more patterns
-- Example:
-- x:xs matches [1,2,3,4] because x = 1 and xs = [2,3,4]
-- x:y:xs matches [1,2,3,4] because x = 1, y = 2 and xs = [3,4]
-- x:y:xs matches [1,2] because x = 1, y = 2 and xs = []
-- x:xs does not match [] because there is no head element and : and [] are different constructors
--(:) constrói listas não vazias
--[] constrói listas vazias


--Pattern matching in other scenarios

--Para qualquer tipo a, desde que a seja uma instância da classe de tipos Num
sumLocal :: Num a => [a] -> a
sumLocal list =
    case list of
        [] -> 0
        (x:xs) -> x + sumLocal xs

divIMod :: (Ord b, Num a, Num b) => b -> b -> (a, b)
divIMod n m 
    | n < m = (0, n)
    | otherwise = (q + 1, r)
    where
        (q, r) = divIMod (n - m) m

firstAndSecond :: [b] -> (b, b)
firstAndSecond list =
    --O let first:second:rest = list desempacota a lista em três partes
    let first:second:rest = list
    in (first, second)
