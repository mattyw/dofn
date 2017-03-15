module BackendTests where

import Test.HUnit

import Backend.Backend

test1 = TestCase (do
		assertEqual "3+1 is 4" 4 $ foobar 2)

tests = [TestLabel "test1" test1
	]
