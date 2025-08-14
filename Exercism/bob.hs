import Data.Char (isLetter, isLower, isSpace)
import Data.Maybe (listToMaybe)
import Data.List (dropWhileEnd)

responseFor :: String -> String
responseFor xs
    | isQuestion && isYell = "Calm down, I know what I'm doing!"
    | isYell               = "Whoa, chill out!"
    | isQuestion           = "Sure."
    | isSilence            = "Fine. Be that way!"
    | otherwise            = "Whatever."
    where
        isQuestion = lastMay xs == Just '?'
        isYell     = any isLetter xs && all (not . isLower) (filter isLetter xs)
        isSilence  = all isSpace xs
        lastMay s  = listToMaybe (reverse (dropWhileEnd isSpace s))