module Chapter8 where

-- 1
greeting :: IO ()
greeting = do
    putStrLn "Enter your name as last, first"
    name <- getLine
    putStrLn $ "Hello" ++ (snd $ break (',' ==) name)
    putStrLn $ "Do you have any relatives named Joe " ++ (fst $ break (',' ==) name)

-- 2
reverseMe :: IO ()
reverseMe = do
    line <- getLine
    putStrLn $ unwords $ reverse $ words line

-- 3
sayHi :: IO ()
sayHi = do
    putStr "What is your name? "
    name <- getLine
    if name == "Bilbo" then
        putStrLn "So nice to meet you!"
    else
        putStr ""
    putStrLn "What's up?"

-- 4


-- 5
printDirection :: Char -> String
printDirection c
    | c == 'u'  = "UP"
    | c == 'd'  = "DOWN"
    | c == 'r'  = "LEFT"
    | c == 'l'  = "RIGHT"
    | otherwise = "NOWHERE"

--printDirections :: [Char] -> IO ()
--printDirections = do
    
