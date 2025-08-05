import Text.Parsec.Token (GenTokenParser(operator))
func name :: input -> output

> factorial :: Integer -> Integer
> factorial 0 = 1
> factorial n = n * factorial (n - 1)


There is also automatic type inference in Haskell, so you can write functions without explicitly stating their types.
So we do not always need to define the headers

> double x = x + x
> double' x = x * 2


> doubleInt :: Integer -> Integer
> doubleInt x = x + x

> doubleFloat :: Double -> Double
> doubleFloat x = x + x


All primitive types starts with a capital letter.
Basic types:

Booleans:
Type: ``Bool``
Literals : ``True`` and ``False``
Operations:
``(&&) :: Boool -> Bool -> Bool``
``(||) :: Boool -> Bool -> Bool``
``not :: Bool -> Bool``

Examples:
\ not True == False
\ not False == True

\ True || False == True
\ True && False == False

\ (False || True) && True == True
\ not (not True) == True
\ not not True == ERROR, because the precedente is from the left, so not of not causes an error

Integers:
Type: ``Int`` - 64-bit signed integers
Type: ``Integer`` - Arbitrarily long

Literals: ``0, 1, 2, 3,, (-22), 2312312312 ...`` 
Always use () for negative numbers

Operations:
``(+) :: Num a => a -> a -> a``
``(-) :: Num a => a -> a -> a``
``(*) :: Num a => a -> a -> a``
``negate :: Num a => a -> a``
``div :: Integral a => a -> a -> a`` - integer division
``mod :: Integral a => a -> a -> a`` - modulus
``rem :: Integral a => a -> a -> a`` - remainder
``^ :: (Integral b, Num a) => a -> b -> a`` - exponentiation

Relational operators:
``(==) :: Eq a => a -> a -> Bool``
``(/=) :: Eq a => a -> a -> Bool`` - it's not !=
``(<) :: Ord a => a -> a -> Bool``
``(>) :: Ord a => a -> a -> Bool``
``(<=) :: Ord a => a -> a -> Bool``
``(>=) :: Ord a => a -> a -> Bool``

Examples:
\ 1 == 1 == True
\ 1 /= 2 == True
\ 1 < 2 == True
\ 1 > 2 == False
\ 3 + 4 * 5 == 23
\ (3 + 4) * 5 == 35
\ 3 + 1 /= 4 == False

\ div 11 2 == 5
\ mod 11 2 == 1
\ rem 11 2 == 1

But modulus /= remainder for negative numbers because it uses the Euclidean division modulo:
\ mod (-11) 2 == 1
\ rem (-11) 2 == -1

Real numbers:
Type: ``Float`` - single precision 32-bit
Type: ``Double`` - double precision 64-bit

Literals: ``0.0, 1.0, 2.0, 3.0, (-22.0), 2312312312.0, 3.14, 1e-9 ...``
note that 1e-9 is 1.0 * 10^(-9)

Operations
``(+) :: Num a => a -> a -> a``
``(-) :: Num a => a -> a -> a``
``(*) :: Num a => a -> a -> a``
``(/) :: Fractional a => a -> a -> a``
``** :: Floating a => a -> a -> a`` - exponentiation
``negate :: Num a => a -> a``

The relationals are the same

To convert from Integer to Float or Double, use:
``fromIntegral :: (Integral a, Num b) => a -> b``

To convert from Float to Integer, use:
``round :: (RealFrac a, Integral b) => a -> b`` - rounds to the nearest integer, if equidistant returns the even one
``ceiling :: (RealFrac a, Integral b) => a -> b`` - rounds up
``floor :: (RealFrac a, Integral b) => a -> b`` - rounds down

Characters:
Type: ``Char`` - Unicode characters
Literals: ``'a', 'b', 'c', '1', '2', '3', ' ', '\n', '\t', '\x03A9'`` - the last one is the Greek letter Omega

Relational operators:
``(==) :: Eq a => a -> a -> Bool``
``(/=) :: Eq a => a -> a -> Bool``
``(<) :: Ord a => a -> a -> Bool``
``(>) :: Ord a => a -> a -> Bool``
``(<=) :: Ord a => a -> a -> Bool``
``(>=) :: Ord a => a -> a -> Bool``

Conversion functions (import Data.Char):
``ord :: Char -> Int`` - gets the Unicode code point of the character
``chr :: Int -> Char`` - gets the character from the Unicode code point



Predefined functions:

When we have Integral a => a it means that the a must be of the type Integer | So it's a condition
``even :: Integral a => a -> Bool`` - checks if the number is even
``odd :: Integral a => a -> Bool`` - checks if the number is odd

The ord type, class is what makes possible ordenation
``min :: Ord a => a -> a -> a`` - gets the minimum of two values
``max :: Ord a => a -> a -> a`` - gets the maximum of two values

``gdc :: Integral a => a -> a -> a`` - greatest common divisor
``lcm :: Integral a => a -> a -> a`` - least common multiple

``abs :: Num a => a -> a`` - absolute value
``sqrt :: Floating a => a -> a`` - square root
``log :: Floating a => a -> a`` - natural logarithm
``exp :: Floating a => a -> a`` - e raised to the power of x
``sin, cos, tan :: Floating a => a -> a`` - trigonometric functions
