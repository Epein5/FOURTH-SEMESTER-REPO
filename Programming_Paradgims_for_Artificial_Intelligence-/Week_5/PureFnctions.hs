calculatePower :: Integer -> Integer -> Integer
calculatePower _ 0 = 1
calculatePower base exp
    | exp > 0 = base * calculatePower base (exp - 1)
    | otherwise = error "Exponent must be non-negative"

pureCalculatePower :: Integer -> Integer -> Integer
pureCalculatePower base exp = calculatePower base exp

main :: IO ()
main = do
    putStrLn "Calculating power:"
    putStrLn "Enter the base:"
    base <- readLn
    putStrLn "Enter the exponent:"
    exp <- readLn
    let result = pureCalculatePower base exp
    putStrLn $ "Result: " ++ show result
