module BackendTests where

import Test.HUnit
-- import System.IO.Temp TODO Use this in testNoteFromFile

import Backend.Backend

stringNote :: String
stringNote = "example title\n\
\body of the note\n\
\which might span multiple\n\
\lines.\n\
\"

exampleNote :: Note
exampleNote = Note "example title" "body of the note\nwhich might span multiple\nlines.\n" []

noteFromFile :: Note
noteFromFile = Note "EXAMPLE NOTE" "this is a test note, used in some tests\nalso useful as an example of how a\nnote should look.\n" []

testMarshal = TestCase (do
		assertEqual "note is marshalled correctly" exampleNote $ marshalNote stringNote)

testUnMarshal = TestCase (do
		assertEqual "note is unmarshalled correctly" stringNote $ unmarshalNote exampleNote)

testNoteFromFile = TestCase (do
        readNote <- fromFile "testNote"
        assertEqual "note is read from file" noteFromFile readNote)

testNoteToFromFile = TestCase (do
        toFile "roundTrip" exampleNote
        readNote <- fromFile "roundTrip"
        assertEqual "note read from file same as note written" exampleNote readNote)

testDirToNotes = TestCase (do
        notes <- loadDir "testNotes"
        assertEqual "note read from file same as note written" [fromFile "testNotes/testNote1", fromFile "testNotes/testNote2"] notes)

tests = [TestLabel "test marshalling" testMarshal
        ,TestLabel "test unmarshalling" testUnMarshal
        ,TestLabel "test note from file" testNoteFromFile
        ,TestLabel "test note roundtrip to file" testNoteToFromFile
        ,TestLabel "test loading directory" testDirToNotes
	]
