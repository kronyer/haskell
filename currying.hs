--currying 

-- All functions have a single parameter
-- functions of more than one, actually return a new fuction

-- ``prod 3 5`` is equivalent to ``(prod 3) 5``

prod :: Int -> Int -> Int
prod x y = x * y

--here the Int is the first parameter, then it returns a new function that takes the second Int parameter and this last function returns the product
prod' :: Int -> (Int -> Int)
prod' x y = x * y