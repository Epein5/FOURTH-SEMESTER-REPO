import Data.Char (toLower)

isPalindrome :: String -> Bool
isPalindrome [] = True
isPalindrome [_] = True
isPalindrome str =
    let normalizedStr = filter (/= ' ') (map toLower str)  -- Normalize: remove spaces and convert to lowercase
    in normalizedStr == reverse normalizedStr

main :: IO ()
main = do
    putStrLn "Enter a string to check if it's a palindrome:"
    input <- getLine
    let result = if isPalindrome input
                    then "It's a palindrome!"
                    else "It's not a palindrome."
    putStrLn result
