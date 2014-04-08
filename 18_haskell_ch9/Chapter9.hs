import System.IO

-- 1
pigLatin :: String -> String
pigLatin xs = if head xs `elem` "aeiou"
                 then xs ++ "way"
                 else tail xs ++ [head xs] ++ "ay"

-- 2
piggly :: IO ()
piggly = do
    hSetBuffering stdout LineBuffering  -- This is only needed by GHCI
    interact $ unlines . map (unwords . map (pigLatin) . words) . lines

-- 3


-- 4


-- 5
