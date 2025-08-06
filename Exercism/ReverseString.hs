-- One way to reverse a string in Haskell is to use recursion.
-- although this is trash, because O(n^2) complexity
--O problema é que xs ++ [x] precisa percorrer toda a lista xs para adicionar x no final. Isso acontece repetidamente, resultando em um custo acumulado de O(1 + 2 + 3 + ... + n) = O(n²).
reverseString :: String -> String
reverseString [] = []
reverseString (x:xs) = reverseString xs ++ [x]

--Como melhorar? Para inverter uma lista de forma eficiente (O(n)), você pode usar acumulação e prepending (adicionar elementos no início da lista, que é O(1)).

reverseString' :: String -> String
reverseString' xs = reverseHelper xs []
  where
    reverseHelper [] acc = acc -- base case: se a lista estiver vazia, retorna o acumulador
    reverseHelper (x:xs) acc = reverseHelper xs (x:acc)