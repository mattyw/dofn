module Backend.Backend where

import Data.String

data Note = 
    Note { title :: String
         , body :: String
         , tags :: [String] }
         deriving (Show, Eq)
	
marshalNote :: String -> Note
marshalNote = newNote . lines

newNote :: [String] -> Note
newNote [] = error "empty string"
newNote (x:[]) = Note x x []
newNote (x:xs) = Note x (unlines xs) []

unmarshalNote :: Note -> String
unmarshalNote (Note t b _) = t ++ "\n" ++ b
