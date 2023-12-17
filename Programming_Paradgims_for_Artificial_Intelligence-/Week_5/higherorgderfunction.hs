a :: Integer
a = 1

b :: Integer
b = 2

c :: Integer
c = 3

funcA :: Integer -> Integer -> Integer
funcA x y = x + y

funcB :: Integer -> Integer -> Integer
funcB x y = x + y

funcC :: (Integer -> Integer -> Integer) -> (Integer -> Integer -> Integer) -> Integer
funcC f g = f a b + g b c

result :: Integer
result = funcC funcA funcB

main :: IO ()
main = do
  putStrLn $ "Result: " ++ show result
