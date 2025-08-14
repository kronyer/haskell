import Data.List
import Data.Ord


--Example of tuple
myTuple :: (Int, Char, Bool)
myTuple = (3, 'z', False)

-- Nested tuples
nestedTuple :: ((Int, Char), Bool)
nestedTuple = ((5, 'a'), True)


-- Tuples uses
mostFrequentCharacter :: String -> (Char, Int)
mostFrequentCharacter str =
    (head character, length character)
    where
        character = maximumBy (comparing length) (group (sort str))

mostFrequentCharacter' :: String -> (Char, Int)
mostFrequentCharacter' str =
    maximumBy (comparing Prelude.snd) [(head g, length g) | g <- group (sort str)]

timeDecomposition :: Int -> (Int, Int, Int)
timeDecomposition seconds = (hours, minutes, remainingSeconds)
  where
    hours = seconds `div` 3600
    minutes = (seconds `mod` 3600) `div` 60
    remainingSeconds = seconds `mod` 60

-- Accessing tuple elements -- already built-in Prelude functions
-- fst :: (a, b) -> a
-- fst (x, _) = x

-- snd :: (a, b) -> b
-- snd (_, y) = y

--also it's esy to create
first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z



-- Decomposition of Tuples into patterns

--Ugly:
distance :: (Float, Float) -> (Float, Float) -> Float
distance point1 point2 =
    sqrt ((fst point2 - fst point1) ^ 2 + (snd point2 - snd point1) ^ 2)

-- Better: we can decompose the tuple into patterns
distance' :: (Float, Float) -> (Float, Float) -> Float
distance' (x1, y1) (x2, y2) =
    sqrt ((x2 - x1) ^ 2 + (y2 - y1) ^ 2)


distance'' :: (Float, Float) -> (Float, Float) -> Float
distance'' p1 p2 = sqrt (sqr dx + sqr dy)
    where
        (x1, x2) = p1
        (y1, y2) = p2
        dx = x2 - x1
        dy = y2 - y1
        sqr x = x * x


-- The empty tuple - with only one possible value, the empty data
-- similar to void in other languages
emptyTuple :: ()
emptyTuple = ()
