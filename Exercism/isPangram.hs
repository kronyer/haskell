import Data.Char
isPangram :: String -> Bool
isPangram text =
      null missing
      where
        lowerText = map toLower text
        alphabet  = ['a'..'z']
        missing = [ch | ch <- alphabet, ch `notElem` lowerText]