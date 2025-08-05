<h1>FunctionalDependencies</h1>

in haskell functions are pure, because they only return results calculated relative to their parameters.Applicative
* They do not have side-effects
* They do not modify the parameters
* They do not modify the memory
* They do not modify the I/O
* They do always return the same result for the same parameters

Functions always stats with lowercase

First we declare the header of the function, which is the type signature. (optional, thanks to the automatic type inference)
Then we define the function with its parameters and the result.


Ex.1
This function says that it expects a Number, and it define that it must be a number, and take a number and return a number.
Num type is like a generic type, so it can be used with any number type, like Int, Float, Double, etc
The => symbol is the same as where in generics c#
T Double<T>(T x) where T : INumber


> double :: Num a => a -> a
> double x = x + x

Ex.2
this function says that it expects two integers and return an integer

> perimeter :: Int -> Int -> Int  
> perimeter width height = 2 * (width + height)

> perimeter' :: Int -> Int -> Int
> perimeter' width height = double (width + height)

Ex.3
This functions says that it expects an Integer and return an Integer
It is a recursive function, which means it calls itself with a different parameter until it reaches the base case.

> factorial :: Integer -> Integer
> factorial n = if n == 0 then 1 --base case
> else n * factorial (n-1) --recursive case