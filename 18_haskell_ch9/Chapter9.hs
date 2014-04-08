import System.IO
import Data.Char

-- 1
pigLatin :: String -> String
pigLatin xs = if head xs `elem` "aeiou"
                 then xs ++ "way"
                 else tail xs ++ [head xs] ++ "ay"

-- 2
piggly :: IO ()
piggly = do
    hSetBuffering stdout LineBuffering  -- This is only needed by GHCI
    interact $ unlines . map (unwords . map pigLatin . words) . lines

-- 3
caesar :: Int -> Char -> Char
caesar x y
    | adj <= z && adj >= a = chr adj
    | i <= z && i >= a     = 
    | otherwise = 
    where adj  = y + ord x
          z    = ord 'z'
          a    = ord 'a'
          capZ = ord 'Z'
          capA = ord 'A'

-- 4
encrypt :: Int -> IO ()
encrypt x = do
    hSetBuffering stdout LineBuffering  -- This is only needed by GHCI
    interact $ map $ caesar x

-- 5

