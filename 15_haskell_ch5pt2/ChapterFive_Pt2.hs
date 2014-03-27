module ChapterFive_Pt2 where

-- .data
papers = [
    [["Test-Driven Learning: Intrinsic Integration of Testing into the CS/SE Curriculum"],
        ["Test-driven learning", "test-driven development","extreme programming", "pedagogy", "CS1"]],
    [["Process Improvement of Peer Code Review and Behavior Analysis of its Participants"],
        ["peer code review", "behavior analysis", "software quality assurance", 
            "computer science education", "software engineering"]],
    [["Computer Games as Motivation for Design Patterns)"],
        ["Design Patterns", "Games", "Pedagogy", "Java"]],
    [["Killer Killer Examples for Design Patterns"],
        ["Object-orientation", "Design Patterns"]],
    [["Test-First Java Concurrency for the Classroom"],
        ["CS education", "Java", "JUnit", "unit testing", "concurrent programming",
        "tools", "software engineering"]],
    [["Teaching Design Patterns in CS1: a Closed Laboratory Sequence based on the Game of Life"],
        ["Design Patterns", "Game of Life", "CS1", "Laboratory"]]   
    ]

paper = [["Computer Games as Motivation for Design Patterns)"],
           ["Design Patterns", "Games", "Pedagogy", "Java"]]

-- .text
-- 1
getPaperTitle :: [[String]] -> [String]
getPaperTitle [x, y] = x

-- 2
getPaperKeywords :: [[String]] -> [String]
getPaperKeywords [x, y] = y

-- 3
extractAllKeywords :: [[[String]]] -> [[String]]
extractAllKeywords = map getPaperKeywords

-- 4
keywordInList :: String -> [String] -> Bool
keywordInList = elem

-- 5
existsPaper :: String -> [[[String]]] -> [[String]]
existsPaper s xs = filter (keywordInList s) (extractAllKeywords xs)

-- 6
countPapers :: String -> [[[String]]] -> Int
countPapers s xs = length $ existsPaper s xs
