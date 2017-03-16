module BackendTests where

import Test.HUnit

import Backend.Backend

stringNote :: String
stringNote = "example title\n\
\body of the note\n\
\which might span multiple\n\
\lines.\n\
\"

exampleNote :: Note
exampleNote = Note "example title" "body of the note\nwhich might span multiple\nlines.\n" []

testMarshal = TestCase (do
		assertEqual "note is marshalled correctly" exampleNote $ marshalNote stringNote)

testUnMarshal = TestCase (do
		assertEqual "note is unmarshalled correctly" stringNote $ unmarshalNote exampleNote)

tests = [TestLabel "test marshalling" testMarshal
        ,TestLabel "test unmarshalling" testUnMarshal
	]
