module Backend.Backend where

import Data.String
import System.Directory

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

fromFile :: FilePath -> IO Note
fromFile filename = do
    f <- readFile filename
    return (marshalNote f)

toFile :: FilePath -> Note -> IO ()
toFile filename note = do
    writeFile filename $ unmarshalNote note

loadNotes :: [FilePath] -> [IO Note]
loadNotes [] = []
loadNotes (x:[]) = [fromFile x]
loadNotes (x:xs) = fromFile x : loadNotes xs

loadDir :: FilePath -> IO [IO Note]
loadDir fp = do
    files <- getDirectoryContents fp 
    return (loadNotes files)
