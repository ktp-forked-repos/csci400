-- 1
pigLatin :: String -> String
pigLatin xs = if head xs `elem` "aeiou"
                 then xs ++ "way"
                 else tail xs ++ [head xs] ++ "ay"

-- 2


-- 3


-- 4


-- 5
